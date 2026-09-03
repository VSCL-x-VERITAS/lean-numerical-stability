#!/usr/bin/env python3
"""Verify the frozen Higham Chapter 2 residual migration and name audit.

The checker is deliberately source-only: it reads the twelve historical blobs
from the immutable pre-migration checkpoint, compares their named commands with
the current canonical owners, and verifies the tracked public-name inventory
and canonical-only Lean ``#check`` audit.  It never invokes Lean or Lake.
"""

from __future__ import annotations

import argparse
import bisect
import csv
import hashlib
import io
import json
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Sequence

from generate_baseline import IMPORT_RE, module_name, remove_lean_comments, source_paths


ROOT = Path(__file__).resolve().parents[2]
CHECKPOINT = "5e14756a1e6b7c0f99968f0e3e5f52702ff03f49"
QUEUE_PATH = ROOT / "docs" / "architecture" / "migration-queues" / "higham02-residual.tsv"
INVENTORY_PATH = (
    ROOT
    / "docs"
    / "architecture"
    / "migration-queues"
    / "higham02-residual-public-names.tsv"
)
AUDIT_PATH = (
    ROOT
    / "NumStabilityTest"
    / "Import"
    / "Canonical"
    / "HighamChapter02Residual"
    / "AllPublicNames.lean"
)
AUDIT_MODULE = "NumStabilityTest.Import.Canonical.HighamChapter02Residual.AllPublicNames"
AUDIT_UMBRELLA_PATH = (
    ROOT / "NumStabilityTest" / "Import" / "Canonical" / "HighamChapter02Residual.lean"
)
ROOT_TEST_PATH = ROOT / "NumStabilityTest.lean"
TIERS_PATH = ROOT / "docs" / "architecture" / "tiers.json"

EXPECTED_ROWS = 12
EXPECTED_PUBLIC = 1119
EXPECTED_PRIVATE = 212

COMMAND_KINDS = (
    "def",
    "theorem",
    "lemma",
    "abbrev",
    "opaque",
    "axiom",
    "inductive",
    "structure",
    "class",
    "instance",
)
COMMAND_KIND_PATTERN = "|".join(COMMAND_KINDS)
COMMAND_START_RE = re.compile(
    rf"(?m)^[ \t]*(?:private[ \t]+)?(?:{COMMAND_KIND_PATTERN})\b"
)
NAMED_COMMAND_RE = re.compile(
    rf"(?m)^[ \t]*(?P<private>private[ \t]+)?"
    rf"(?P<kind>{COMMAND_KIND_PATTERN})\b[ \t\r\n]+"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_'.]*)"
)
NAMESPACE_RE = re.compile(r"namespace[ \t]+([A-Za-z_][A-Za-z0-9_'.]*)[ \t]*")
SECTION_RE = re.compile(
    r"(?:(?:noncomputable|scoped)[ \t]+)?section(?:[ \t]+[A-Za-z_][A-Za-z0-9_']*)?[ \t]*"
)
END_RE = re.compile(r"end(?:[ \t]+[A-Za-z_][A-Za-z0-9_'.]*)?[ \t]*")
IMPORT_LINE_RE = re.compile(
    r"(?m)^[ \t]*(?:(?:public|private|meta)\s+)*import[ \t]+[^\r\n]+(?:\r?\n|$)"
)
CHECK_LINE_RE = re.compile(
    r"(?m)^[ \t]*#check[ \t]+@(?P<name>[A-Za-z_][A-Za-z0-9_'.]*)[ \t]*(?:\r?\n|$)"
)


class AuditError(RuntimeError):
    """A configuration or immutable-source error that prevents the audit."""


@dataclass(frozen=True)
class QueueRow:
    old_module: str
    canonical_module: str
    family_route: str
    loc: int
    public_objects: int
    private_objects: int
    sha256: str
    wrapper_imports: tuple[str, ...]


@dataclass(frozen=True)
class NamedCommand:
    private: bool
    kind: str
    name: str
    line: int

    def identity(self) -> tuple[bool, str, str]:
        return self.private, self.kind, self.name


def sort_key(value: str) -> tuple[str, str]:
    return value.casefold(), value


def module_path(module: str) -> Path:
    return ROOT / Path(*module.split(".")).with_suffix(".lean")


def relative(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def read_queue() -> list[QueueRow]:
    try:
        with QUEUE_PATH.open(encoding="utf-8", newline="") as stream:
            records = list(csv.DictReader(stream, delimiter="\t"))
    except OSError as error:
        raise AuditError(f"cannot read queue {relative(QUEUE_PATH)}: {error}") from error

    required = {
        "wave",
        "role",
        "old_module",
        "canonical_module",
        "family_route",
        "loc",
        "public_objects",
        "private_objects",
        "sha256",
        "wrapper_imports",
    }
    if not records or not required.issubset(records[0]):
        raise AuditError(f"malformed queue header: {relative(QUEUE_PATH)}")

    rows: list[QueueRow] = []
    try:
        for record in records:
            if record["wave"] != "Higham02Residual" or record["role"] != "source":
                raise AuditError(
                    f"unexpected wave/role for {record['old_module']}: "
                    f"{record['wave']!r}/{record['role']!r}"
                )
            wrapper_imports = tuple(
                item.strip()
                for item in record["wrapper_imports"].split(";")
                if item.strip()
            )
            rows.append(
                QueueRow(
                    old_module=record["old_module"],
                    canonical_module=record["canonical_module"],
                    family_route=record["family_route"],
                    loc=int(record["loc"]),
                    public_objects=int(record["public_objects"]),
                    private_objects=int(record["private_objects"]),
                    sha256=record["sha256"].upper(),
                    wrapper_imports=wrapper_imports,
                )
            )
    except (KeyError, TypeError, ValueError) as error:
        raise AuditError(f"malformed queue row: {error}") from error

    if len(rows) != EXPECTED_ROWS:
        raise AuditError(f"queue has {len(rows)} rows; expected {EXPECTED_ROWS}")
    for label, values in (
        ("historical module", [row.old_module for row in rows]),
        ("canonical owner", [row.canonical_module for row in rows]),
        ("family route", [row.family_route for row in rows]),
    ):
        duplicates = sorted({value for value in values if values.count(value) > 1})
        if duplicates:
            raise AuditError(f"duplicate {label}(s): {', '.join(duplicates)}")
    return rows


def checkpoint_blob(module: str) -> bytes:
    path = Path(*module.split(".")).with_suffix(".lean").as_posix()
    try:
        completed = subprocess.run(
            ("git", "show", f"{CHECKPOINT}:{path}"),
            cwd=ROOT,
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
    except FileNotFoundError as error:
        raise AuditError("required executable not found: git") from error
    except subprocess.CalledProcessError as error:
        details = error.stderr.decode("utf-8", errors="replace").strip()
        raise AuditError(f"cannot read {module} at {CHECKPOINT}: {details}") from error
    return completed.stdout


def namespace_prefixes(text: str) -> tuple[list[int], list[tuple[str, ...]]]:
    """Return line offsets and the namespace active at the start of each line."""

    offsets: list[int] = []
    prefixes: list[tuple[str, ...]] = []
    scopes: list[tuple[str, int]] = []
    namespace: list[str] = []
    offset = 0
    for line in text.splitlines(keepends=True):
        offsets.append(offset)
        prefixes.append(tuple(namespace))
        stripped = line.strip()
        namespace_match = NAMESPACE_RE.fullmatch(stripped)
        if namespace_match:
            components = namespace_match.group(1).split(".")
            namespace.extend(components)
            scopes.append(("namespace", len(components)))
        elif SECTION_RE.fullmatch(stripped):
            scopes.append(("section", 0))
        elif END_RE.fullmatch(stripped):
            if not scopes:
                raise AuditError(f"unmatched `end` on line {len(offsets)}")
            scope, component_count = scopes.pop()
            if scope == "namespace":
                del namespace[-component_count:]
        offset += len(line)
    if not offsets:
        offsets.append(0)
        prefixes.append(())
    if scopes:
        raise AuditError(f"{len(scopes)} unclosed namespace/section scope(s)")
    return offsets, prefixes


def parse_named_commands(raw: bytes, *, source: str) -> list[NamedCommand]:
    text = raw.decode("utf-8-sig", errors="strict").replace("\r\n", "\n").replace("\r", "\n")
    cleaned = remove_lean_comments(text)
    starts = list(COMMAND_START_RE.finditer(cleaned))
    matches = list(NAMED_COMMAND_RE.finditer(cleaned))
    if len(starts) != len(matches):
        named_offsets = {match.start() for match in matches}
        missing_lines = [
            cleaned.count("\n", 0, match.start()) + 1
            for match in starts
            if match.start() not in named_offsets
        ]
        raise AuditError(
            f"{source}: parsed {len(matches)} names for {len(starts)} named-command starts; "
            f"unparsed command line(s): {missing_lines}"
        )

    try:
        offsets, prefixes = namespace_prefixes(cleaned)
    except AuditError as error:
        raise AuditError(f"{source}: {error}") from error

    commands: list[NamedCommand] = []
    for match in matches:
        line_index = bisect.bisect_right(offsets, match.start()) - 1
        short_name = match.group("name")
        if short_name.startswith("_root_."):
            full_name = short_name.removeprefix("_root_.")
        else:
            parts = (*prefixes[line_index], short_name)
            full_name = ".".join(part for part in parts if part)
        commands.append(
            NamedCommand(
                private=match.group("private") is not None,
                kind=match.group("kind"),
                name=full_name,
                line=line_index + 1,
            )
        )
    return commands


def read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8-sig", errors="strict").replace("\r\n", "\n").replace("\r", "\n")
    except OSError as error:
        raise AuditError(f"cannot read {relative(path)}: {error}") from error


def project_imports(path: Path) -> tuple[str, ...]:
    text = remove_lean_comments(read_text(path))
    return tuple(
        imported for imported in IMPORT_RE.findall(text) if imported.startswith("NumStability.")
    )


def import_only(path: Path) -> bool:
    text = remove_lean_comments(read_text(path))
    return not IMPORT_LINE_RE.sub("", text).strip()


def frozen_commands(
    rows: Sequence[QueueRow], failures: list[str]
) -> dict[str, list[NamedCommand]]:
    result: dict[str, list[NamedCommand]] = {}
    for row in rows:
        try:
            raw = checkpoint_blob(row.old_module)
            digest = hashlib.sha256(raw).hexdigest().upper()
            if digest != row.sha256:
                failures.append(
                    f"{row.old_module}: checkpoint SHA-256 {digest}, queue {row.sha256}"
                )
            line_count = len(raw.decode("utf-8-sig", errors="strict").splitlines())
            if line_count != row.loc:
                failures.append(
                    f"{row.old_module}: checkpoint LOC {line_count}, queue {row.loc}"
                )
            commands = parse_named_commands(raw, source=f"{CHECKPOINT}:{row.old_module}")
        except (AuditError, UnicodeError) as error:
            failures.append(str(error))
            continue
        public_count = sum(not command.private for command in commands)
        private_count = sum(command.private for command in commands)
        if (public_count, private_count) != (row.public_objects, row.private_objects):
            failures.append(
                f"{row.old_module}: checkpoint command counts "
                f"{public_count} public + {private_count} private, queue "
                f"{row.public_objects} public + {row.private_objects} private"
            )
        result[row.old_module] = commands
    return result


def public_commands(
    rows: Sequence[QueueRow], frozen: dict[str, list[NamedCommand]]
) -> list[tuple[QueueRow, NamedCommand]]:
    return [
        (row, command)
        for row in rows
        for command in frozen.get(row.old_module, [])
        if not command.private
    ]


def render_inventory(entries: Sequence[tuple[QueueRow, NamedCommand]]) -> str:
    stream = io.StringIO(newline="")
    writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
    writer.writerow(("old_module", "source_line", "command_kind", "fully_qualified_name"))
    for row, command in entries:
        writer.writerow((row.old_module, command.line, command.kind, command.name))
    return stream.getvalue()


def render_lean_audit(
    rows: Sequence[QueueRow], entries: Sequence[tuple[QueueRow, NamedCommand]]
) -> str:
    routes = sorted((row.family_route for row in rows), key=sort_key)
    names = sorted((command.name for _, command in entries), key=sort_key)
    lines = [
        *(f"import {route}" for route in routes),
        "",
        "/-!",
        "# Exhaustive canonical audit for the Higham Chapter 2 residual wave",
        "",
        "These checks cover all 1,119 public named commands frozen at checkpoint",
        f"`{CHECKPOINT}`. Only the twelve canonical family routes are imported.",
        "The source-anchored inventory and static verifier live beside the migration queue.",
        "-/",
        "",
        *(f"#check @{name}" for name in names),
        "",
    ]
    return "\n".join(lines)


def update_artifacts(inventory: str, audit: str) -> None:
    INVENTORY_PATH.parent.mkdir(parents=True, exist_ok=True)
    AUDIT_PATH.parent.mkdir(parents=True, exist_ok=True)
    INVENTORY_PATH.write_text(inventory, encoding="utf-8", newline="\n")
    AUDIT_PATH.write_text(audit, encoding="utf-8", newline="\n")
    print(relative(INVENTORY_PATH))
    print(relative(AUDIT_PATH))


def compare_owner(row: QueueRow, expected: Sequence[NamedCommand], failures: list[str]) -> None:
    path = module_path(row.canonical_module)
    if not path.is_file():
        failures.append(f"missing canonical owner: {row.canonical_module}")
        return
    try:
        actual = parse_named_commands(path.read_bytes(), source=relative(path))
    except (AuditError, OSError, UnicodeError) as error:
        failures.append(str(error))
        return
    expected_identities = [command.identity() for command in expected]
    actual_identities = [command.identity() for command in actual]
    if actual_identities != expected_identities:
        expected_set = set(expected_identities)
        actual_set = set(actual_identities)
        missing = sorted(expected_set - actual_set, key=lambda item: sort_key(item[2]))
        extra = sorted(actual_set - expected_set, key=lambda item: sort_key(item[2]))
        if missing:
            failures.append(
                f"{row.canonical_module}: missing frozen commands: "
                + ", ".join(item[2] for item in missing[:10])
            )
        if extra:
            failures.append(
                f"{row.canonical_module}: extra named commands: "
                + ", ".join(item[2] for item in extra[:10])
            )
        if not missing and not extra:
            failures.append(f"{row.canonical_module}: frozen command order changed")


def verify_routes_and_wrappers(rows: Sequence[QueueRow], failures: list[str]) -> None:
    for row in rows:
        route_path = module_path(row.family_route)
        if not route_path.is_file():
            failures.append(f"missing family route: {row.family_route}")
        else:
            expected_route_imports = tuple(
                sorted(
                    (
                        row.family_route.removesuffix(".All") + ".Basic",
                        row.canonical_module,
                    ),
                    key=sort_key,
                )
            )
            actual_route_imports = project_imports(route_path)
            if actual_route_imports != expected_route_imports:
                failures.append(
                    f"{row.family_route}: imports {actual_route_imports!r}, "
                    f"expected {expected_route_imports!r}"
                )
            if not import_only(route_path):
                failures.append(f"{row.family_route}: route contains Lean commands")

        wrapper_path = module_path(row.old_module)
        if not wrapper_path.is_file():
            failures.append(f"missing historical wrapper: {row.old_module}")
        else:
            actual_wrapper_imports = project_imports(wrapper_path)
            if actual_wrapper_imports != row.wrapper_imports:
                failures.append(
                    f"{row.old_module}: imports {actual_wrapper_imports!r}, "
                    f"queue records {row.wrapper_imports!r}"
                )
            if not import_only(wrapper_path):
                failures.append(f"{row.old_module}: wrapper contains Lean commands")


def verify_no_production_legacy_imports(
    rows: Sequence[QueueRow], failures: list[str]
) -> None:
    historical = {row.old_module for row in rows}
    for path in source_paths(ROOT):
        name = module_name(path.relative_to(ROOT))
        if name in historical:
            continue
        try:
            imports = IMPORT_RE.findall(remove_lean_comments(read_text(path)))
        except AuditError as error:
            failures.append(str(error))
            continue
        for imported in imports:
            if imported in historical:
                failures.append(f"{name}: production import uses historical path {imported}")


def verify_tiers(rows: Sequence[QueueRow], failures: list[str]) -> None:
    try:
        manifest = json.loads(read_text(TIERS_PATH))
        exact = manifest["exact"]
    except (AuditError, json.JSONDecodeError, KeyError, TypeError) as error:
        failures.append(f"cannot read tier manifest {relative(TIERS_PATH)}: {error}")
        return
    for row in rows:
        if exact.get(row.old_module) != "compatibility":
            failures.append(
                f"{row.old_module}: exact tier is {exact.get(row.old_module)!r}, expected 'compatibility'"
            )
        if exact.get(row.family_route) != "aggregate":
            failures.append(
                f"{row.family_route}: exact tier is {exact.get(row.family_route)!r}, expected 'aggregate'"
            )


def verify_artifacts(
    rows: Sequence[QueueRow],
    expected_inventory: str,
    expected_audit: str,
    expected_names: Sequence[str],
    failures: list[str],
) -> None:
    for path, expected in (
        (INVENTORY_PATH, expected_inventory),
        (AUDIT_PATH, expected_audit),
    ):
        if not path.is_file():
            failures.append(f"missing generated audit artifact: {relative(path)}")
            continue
        try:
            actual = read_text(path)
        except AuditError as error:
            failures.append(str(error))
            continue
        if actual != expected:
            failures.append(
                f"stale generated audit artifact: {relative(path)} "
                "(run checker with --update-artifacts)"
            )

    if AUDIT_PATH.is_file():
        cleaned = remove_lean_comments(read_text(AUDIT_PATH))
        audit_imports = tuple(IMPORT_RE.findall(cleaned))
        expected_routes = tuple(sorted((row.family_route for row in rows), key=sort_key))
        if audit_imports != expected_routes:
            failures.append(
                f"{relative(AUDIT_PATH)}: imports {audit_imports!r}, expected the twelve routes"
            )
        checks = tuple(match.group("name") for match in CHECK_LINE_RE.finditer(cleaned))
        if checks != tuple(expected_names):
            failures.append(
                f"{relative(AUDIT_PATH)}: has {len(checks)} ordered exact #checks; "
                f"expected {len(expected_names)}"
            )
        remaining = IMPORT_LINE_RE.sub("", cleaned)
        remaining = CHECK_LINE_RE.sub("", remaining).strip()
        if remaining:
            failures.append(f"{relative(AUDIT_PATH)}: contains commands other than exact #checks")


def verify_test_import_order(failures: list[str]) -> None:
    if not AUDIT_UMBRELLA_PATH.is_file():
        failures.append(f"missing canonical test umbrella: {relative(AUDIT_UMBRELLA_PATH)}")
    else:
        imports = tuple(IMPORT_RE.findall(remove_lean_comments(read_text(AUDIT_UMBRELLA_PATH))))
        if AUDIT_MODULE not in imports:
            failures.append(
                f"{relative(AUDIT_UMBRELLA_PATH)}: does not import {AUDIT_MODULE}"
            )
        if imports != tuple(sorted(set(imports), key=sort_key)):
            failures.append(f"{relative(AUDIT_UMBRELLA_PATH)}: imports are not unique/casefold-sorted")

    try:
        root_imports = tuple(IMPORT_RE.findall(remove_lean_comments(read_text(ROOT_TEST_PATH))))
    except AuditError as error:
        failures.append(str(error))
        return
    if root_imports != tuple(sorted(set(root_imports), key=sort_key)):
        failures.append(f"{relative(ROOT_TEST_PATH)}: imports are not unique/casefold-sorted")


def parse_args(argv: Sequence[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--update-artifacts",
        action="store_true",
        help="rewrite the deterministic TSV inventory and Lean #check audit",
    )
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = parse_args(argv or sys.argv[1:])
    try:
        rows = read_queue()
    except AuditError as error:
        print(f"error: {error}", file=sys.stderr)
        return 2

    failures: list[str] = []
    frozen = frozen_commands(rows, failures)
    entries = public_commands(rows, frozen)
    public_count = len(entries)
    private_count = sum(
        command.private for commands in frozen.values() for command in commands
    )
    if public_count != EXPECTED_PUBLIC:
        failures.append(f"frozen public command total {public_count}, expected {EXPECTED_PUBLIC}")
    if private_count != EXPECTED_PRIVATE:
        failures.append(f"frozen private command total {private_count}, expected {EXPECTED_PRIVATE}")
    names = [command.name for _, command in entries]
    duplicates = sorted({name for name in names if names.count(name) > 1}, key=sort_key)
    if duplicates:
        failures.append("duplicate frozen public names: " + ", ".join(duplicates[:10]))

    inventory = render_inventory(entries)
    audit = render_lean_audit(rows, entries)
    expected_names = sorted(names, key=sort_key)
    if args.update_artifacts:
        if failures:
            for failure in failures:
                print(f"error: {failure}", file=sys.stderr)
            return 1
        update_artifacts(inventory, audit)

    for row in rows:
        if row.old_module in frozen:
            compare_owner(row, frozen[row.old_module], failures)
    verify_routes_and_wrappers(rows, failures)
    verify_no_production_legacy_imports(rows, failures)
    verify_tiers(rows, failures)
    verify_artifacts(rows, inventory, audit, expected_names, failures)
    verify_test_import_order(failures)

    if failures:
        for failure in failures:
            print(f"error: {failure}", file=sys.stderr)
        return 1
    print(
        "Higham Chapter 2 residual audit passed: "
        f"{len(rows)} owners, {public_count} public + {private_count} private commands, "
        f"{len(rows)} routes, {len(rows)} wrappers, {len(expected_names)} canonical #checks"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
