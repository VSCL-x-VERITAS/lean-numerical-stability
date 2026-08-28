#!/usr/bin/env python3
"""Prepare reproducible source and Lean dossiers for one configured task."""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

try:
    from .common import (
        AUDIT_ROOT,
        AUDIT_SCHEMA_VERSION,
        AuditError,
        file_record,
        load_config,
        load_semantic_checks,
        load_task,
        repository_relative,
        repository_root,
        sha256_file,
        sha256_text,
        write_json,
    )
except ImportError:
    from common import (  # type: ignore
        AUDIT_ROOT,
        AUDIT_SCHEMA_VERSION,
        AuditError,
        file_record,
        load_config,
        load_semantic_checks,
        load_task,
        repository_relative,
        repository_root,
        sha256_file,
        sha256_text,
        write_json,
    )


SCRIPT_DIR = Path(__file__).resolve().parent
DOSSIER_HELPER = SCRIPT_DIR / "declaration_dossier.lean"


class PreparationError(AuditError):
    """Raised when exact audit inputs cannot be prepared."""


def direct_imports(source: str) -> list[str]:
    imports: list[str] = []
    for line in source.splitlines():
        code = line.split("--", 1)[0]
        match = re.match(r"^\s*import\s+(.+?)\s*$", code)
        if not match:
            continue
        modules = match.group(1).split()
        if not modules or any(re.fullmatch(r"[A-Za-z0-9_'.]+", module) is None for module in modules):
            raise PreparationError(f"unsupported Lean import syntax: {line.strip()}")
        imports.extend(modules)
    return imports


def local_module_source(module: str, config: dict[str, Any]) -> Path | None:
    relative = Path(module.replace(".", "/") + ".lean")
    for root in config["_module_source_roots"]:
        candidate = root / relative
        if candidate.is_file():
            return candidate.resolve()
    return None


def collect_local_imports(
    target_source: str, config: dict[str, Any]
) -> tuple[list[str], dict[str, list[str]], set[str]]:
    order: list[str] = []
    graph: dict[str, list[str]] = {"AuditTarget": direct_imports(target_source)}
    external: set[str] = set()
    visiting: set[str] = set()
    visited: set[str] = set()

    def visit(module: str) -> None:
        if module in visited:
            return
        if module in visiting:
            raise PreparationError(f"cycle in local import graph at {module}")
        source_path = local_module_source(module, config)
        if source_path is None:
            external.add(module)
            return
        visiting.add(module)
        imports = direct_imports(source_path.read_text(encoding="utf-8"))
        graph[module] = imports
        for imported in imports:
            visit(imported)
        visiting.remove(module)
        visited.add(module)
        order.append(module)

    for module in graph["AuditTarget"]:
        visit(module)
    return order, graph, external


def declaration_source(source: str, full_name: str) -> str:
    short_name = full_name.rsplit(".", 1)[-1]
    name_pattern = rf"(?:[A-Za-z0-9_'.]+\.)?{re.escape(short_name)}"
    start = re.search(
        rf"(?m)^\s*(?:(?:private|protected|noncomputable)\s+)*(?:theorem|lemma)\s+{name_pattern}\b",
        source,
    )
    if start is None:
        raise PreparationError(
            f"cannot find theorem or lemma source declaration for {full_name}"
        )
    proof = re.search(r":=\s*(?:by\b)?", source[start.start() :])
    if proof is None:
        raise PreparationError(
            f"cannot find ':=' proof boundary for {full_name}; use a dedicated target declaration"
        )
    end = start.start() + proof.start()
    return source[start.start() : end].strip()


def run_checked(
    command: list[str], config: dict[str, Any], *, env: dict[str, str] | None = None
) -> str:
    completed = subprocess.run(
        command,
        cwd=repository_root(config),
        env=env,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
    )
    if completed.returncode != 0:
        rendered = " ".join(command)
        raise PreparationError(
            f"command failed ({completed.returncode}): {rendered}\n{completed.stdout}"
        )
    return completed.stdout


def lean_environment(build_root: Path) -> dict[str, str]:
    environment = os.environ.copy()
    existing = environment.get("LEAN_PATH", "")
    environment["LEAN_PATH"] = str(build_root) + ((":" + existing) if existing else "")
    return environment


def compile_module(
    source: Path,
    output: Path,
    environment: dict[str, str],
    build_root: Path,
    config: dict[str, Any],
) -> None:
    output.parent.mkdir(parents=True, exist_ok=True)
    command = [
        *config["lean"]["command"],
        "--root",
        str(build_root),
        "-o",
        str(output),
        str(source),
    ]
    run_checked(command, config, env=environment)


def unescape_field(value: str) -> str:
    output: list[str] = []
    index = 0
    while index < len(value):
        if value[index] != "\\" or index + 1 >= len(value):
            output.append(value[index])
            index += 1
            continue
        marker = value[index + 1]
        output.append({"n": "\n", "r": "\r", "t": "\t", "\\": "\\"}.get(marker, marker))
        index += 2
    return "".join(output)


def dependency_fingerprint(dependency: dict[str, Any]) -> str:
    semantic_fields = {
        key: dependency.get(key, "")
        for key in (
            "role",
            "name",
            "owner_module",
            "kind",
            "type_readable",
            "type_explicit",
            "body_readable",
        )
    }
    return sha256_text(
        json.dumps(semantic_fields, sort_keys=True, ensure_ascii=True, separators=(",", ":"))
    )


def parse_lean_report(output: str) -> dict[str, Any]:
    target_readable = ""
    target_explicit = ""
    environment_modules: list[str] = []
    dependencies: list[dict[str, Any]] = []
    edges: list[dict[str, str]] = []
    for raw_line in output.splitlines():
        fields = [unescape_field(field) for field in raw_line.split("\t")]
        if not fields:
            continue
        if fields[0] == "target-readable" and len(fields) == 2:
            target_readable = fields[1]
        elif fields[0] == "target-explicit" and len(fields) == 2:
            target_explicit = fields[1]
        elif fields[0] == "environment-module" and len(fields) == 2:
            environment_modules.append(fields[1])
        elif fields[0] == "dependency" and len(fields) == 9:
            dependencies.append(
                {
                    "role": fields[1],
                    "name": fields[2],
                    "owner_module": fields[3],
                    "distance": int(fields[4]),
                    "kind": fields[5],
                    "type_readable": fields[6],
                    "type_explicit": fields[7],
                    "body_readable": fields[8],
                }
            )
        elif fields[0] == "edge" and len(fields) == 4:
            edges.append({"parent": fields[1], "child": fields[2], "origin": fields[3]})
    if not target_readable or not target_explicit or not dependencies:
        raise PreparationError("Lean dossier helper returned an incomplete report")
    for index, dependency in enumerate(dependencies, start=1):
        dependency["id"] = f"D{index:03d}"
        dependency["semantic_sha256"] = dependency_fingerprint(dependency)
    return {
        "target_type_readable": target_readable,
        "target_type_explicit": target_explicit,
        "environment_modules": environment_modules,
        "dependencies": dependencies,
        "edges": edges,
    }


def build_semantic_report(
    target_path: Path,
    declaration: str,
    local_order: list[str],
    config: dict[str, Any],
) -> dict[str, Any]:
    with tempfile.TemporaryDirectory(prefix="formalization-faithfulness-") as temporary:
        build_root = Path(temporary)
        environment = lean_environment(build_root)
        for module in local_order:
            source = local_module_source(module, config)
            if source is None:
                raise PreparationError(f"local module disappeared during preparation: {module}")
            staged = build_root / (module.replace(".", "/") + ".lean")
            staged.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, staged)
            compile_module(staged, staged.with_suffix(".olean"), environment, build_root, config)

        staged_target = build_root / "AuditTarget.lean"
        shutil.copy2(target_path, staged_target)
        compile_module(
            staged_target,
            build_root / "AuditTarget.olean",
            environment,
            build_root,
            config,
        )

        local_modules_file = build_root / "local-modules.txt"
        local_modules_file.write_text(
            "\n".join(["AuditTarget", *local_order]) + "\n", encoding="utf-8"
        )
        output = run_checked(
            [
                *config["lean"]["command"],
                "--run",
                str(DOSSIER_HELPER),
                "AuditTarget",
                declaration,
                str(local_modules_file),
            ],
            config,
            env=environment,
        )
        return parse_lean_report(output)


def fenced(value: str, language: str = "lean") -> str:
    return f"```{language}\n{value.rstrip()}\n```"


def dependency_section(dependency: dict[str, Any], *, explicit: bool) -> str:
    lines = [
        f"### {dependency['id']}: `{dependency['name']}`",
        "",
        f"- Role: `{dependency['role']}`",
        f"- Owner module: `{dependency['owner_module']}`",
        f"- Declaration kind: `{dependency['kind']}`",
        f"- Distance from target type: `{dependency['distance']}`",
        f"- Semantic SHA-256: `{dependency['semantic_sha256']}`",
        "",
        "Type:",
        "",
        fenced(dependency["type_readable"]),
    ]
    if explicit:
        lines.extend(["", "Fully explicit type:", "", fenced(dependency["type_explicit"])])
    if dependency["body_readable"]:
        lines.extend(
            [
                "",
                "Definition body (one-level semantic boundary):",
                "",
                fenced(dependency["body_readable"]),
            ]
        )
    return "\n".join(lines)


def blind_names(dependencies: list[dict[str, Any]]) -> dict[str, str]:
    local = [dependency for dependency in dependencies if dependency["role"] == "local"]
    return {
        dependency["name"]: f"LocalDef{index:03d}"
        for index, dependency in enumerate(local, start=1)
    }


def replace_names(value: str, replacements: dict[str, str]) -> str:
    for original in sorted(replacements, key=len, reverse=True):
        value = value.replace(original, replacements[original])
    return value


def blind_dependency(
    dependency: dict[str, Any],
    name_replacements: dict[str, str],
    module_replacements: dict[str, str],
) -> dict[str, Any]:
    rendered = dict(dependency)
    rendered["name"] = name_replacements.get(dependency["name"], dependency["name"])
    rendered["owner_module"] = module_replacements.get(
        dependency["owner_module"], dependency["owner_module"]
    )
    for key in ("type_readable", "type_explicit", "body_readable"):
        rendered[key] = replace_names(dependency[key], name_replacements)
    return rendered


def make_direct_dossier(
    task_id: str,
    declaration_header: str,
    semantic: dict[str, Any],
    local_order: list[str],
    graph: dict[str, list[str]],
    config: dict[str, Any],
    *,
    include_complete_sources: bool,
) -> str:
    lines = [
        f"# Declaration dossier for {task_id}",
        "",
        "This dossier describes the theorem statement only. Its proof is excluded.",
        "Interpret every dependency from its supplied declaration; names are not definitions.",
        "",
        "## Proof-free source declaration",
        "",
        fenced(declaration_header),
        "",
        "## Elaborated target type",
        "",
        fenced(semantic["target_type_readable"]),
        "",
        "## Fully explicit elaborated target type",
        "",
        fenced(semantic["target_type_explicit"]),
        "",
        "## Local import graph",
        "",
        f"- `AuditTarget` imports: {', '.join(f'`{item}`' for item in graph['AuditTarget']) or 'none'}",
    ]
    for module in local_order:
        imports = graph.get(module, [])
        rendered = ", ".join(f"`{item}`" for item in imports) if imports else "none"
        lines.append(f"- `{module}` imports: {rendered}")
    lines.extend(
        [
            "",
            "## Semantic dependency inventory",
            "",
            "`local` declarations are followed recursively through types and bodies. "
            "`external-frontier` declarations mark the one-level library trust boundary.",
            "",
        ]
    )
    for dependency in semantic["dependencies"]:
        lines.extend([dependency_section(dependency, explicit=True), ""])
    if include_complete_sources:
        lines.extend(["## Complete local imported sources", ""])
        for module in local_order:
            source_path = local_module_source(module, config)
            assert source_path is not None
            lines.extend(
                [
                    f"### `{module}`",
                    "",
                    f"Path: `{repository_relative(source_path, config)}`",
                    f"SHA-256: `{sha256_file(source_path)}`",
                    "",
                    fenced(source_path.read_text(encoding="utf-8")),
                    "",
                ]
            )
    return "\n".join(lines).rstrip() + "\n"


def make_blind_dossier(semantic: dict[str, Any]) -> str:
    names = blind_names(semantic["dependencies"])
    local_modules = sorted(
        {
            dependency["owner_module"]
            for dependency in semantic["dependencies"]
            if dependency["role"] == "local"
        }
    )
    modules = {module: f"LocalImport{index:03d}" for index, module in enumerate(local_modules, 1)}
    lines = [
        "# Blind Lean declaration dossier",
        "",
        "Translate only the mathematical proposition below. Source identity, task metadata,",
        "theorem name, source declaration, proof, and repository commentary are excluded.",
        "Do not use tools or inspect filesystem content.",
        "",
        "## Elaborated target type",
        "",
        fenced(replace_names(semantic["target_type_readable"], names)),
        "",
        "## Fully explicit elaborated target type",
        "",
        fenced(replace_names(semantic["target_type_explicit"], names)),
        "",
        "## Complete semantic dependency inventory",
        "",
        "Return exactly one coverage record for every dependency ID, in order.",
        "",
    ]
    for dependency in semantic["dependencies"]:
        lines.extend(
            [dependency_section(blind_dependency(dependency, names, modules), explicit=False), ""]
        )
    return "\n".join(lines).rstrip() + "\n"


def write_dependency_inventories(
    inputs_dir: Path, semantic: dict[str, Any]
) -> tuple[Path, Path]:
    direct_path = inputs_dir / "dependency_inventory.json"
    blind_path = inputs_dir / "blind_dependency_inventory.json"
    names = blind_names(semantic["dependencies"])
    local_modules = sorted(
        {
            dependency["owner_module"]
            for dependency in semantic["dependencies"]
            if dependency["role"] == "local"
        }
    )
    modules = {module: f"LocalImport{index:03d}" for index, module in enumerate(local_modules, 1)}
    write_json(
        direct_path,
        {"schema_version": AUDIT_SCHEMA_VERSION, "dependencies": semantic["dependencies"]},
    )
    write_json(
        blind_path,
        {
            "schema_version": AUDIT_SCHEMA_VERSION,
            "dependencies": [
                blind_dependency(dependency, names, modules)
                for dependency in semantic["dependencies"]
            ],
        },
    )
    return direct_path, blind_path


def archive_existing_output(output_dir: Path) -> Path | None:
    children = [child for child in output_dir.iterdir() if child.name != "history"]
    if not children:
        return None
    history = output_dir / "history"
    timestamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    archive = history / timestamp
    suffix = 1
    while archive.exists():
        archive = history / f"{timestamp}-{suffix}"
        suffix += 1
    archive.mkdir(parents=True)
    for child in children:
        shutil.move(str(child), archive / child.name)
    return archive


def audit_setup_paths(config: dict[str, Any], check_paths: list[Path]) -> list[Path]:
    fixed = [
        AUDIT_ROOT / "VERSION",
        AUDIT_ROOT / "METHODOLOGY.md",
        AUDIT_ROOT / "templates" / "report.md",
        AUDIT_ROOT / "skill" / "formalization-faithfulness-audit" / "SKILL.md",
        AUDIT_ROOT / "skill" / "formalization-faithfulness-audit" / "agents" / "openai.yaml",
        config["_config_path"],
    ]
    discovered = [
        *sorted((AUDIT_ROOT / "prompts").glob("*.md")),
        *sorted((AUDIT_ROOT / "schemas").glob("*.json")),
        *sorted(path for path in SCRIPT_DIR.glob("*.py") if path.name != "__init__.py"),
        DOSSIER_HELPER,
        *check_paths,
    ]
    paths: list[Path] = []
    seen: set[Path] = set()
    for path in [*fixed, *discovered]:
        resolved = path.resolve()
        if resolved not in seen:
            paths.append(resolved)
            seen.add(resolved)
    missing = [path for path in paths if not path.is_file()]
    if missing:
        raise PreparationError("missing audit setup files: " + ", ".join(map(str, missing)))
    return paths


def prepare(task_ref: str, *, force: bool = False) -> Path:
    config = load_config()
    task = load_task(task_ref, config)
    task_id = task["task_id"]
    target_path: Path = task["_target_path"]
    source_path: Path = task["_source_path"]
    output_dir: Path = task["_output_path"]

    actual_source_hash = sha256_file(source_path)
    expected_source_hash = task["source"]["sha256"]
    if actual_source_hash != expected_source_hash:
        raise PreparationError(
            f"{task_id}: source hash mismatch; expected {expected_source_hash}, got {actual_source_hash}"
        )

    existing: list[Path] = []
    if output_dir.exists():
        existing = [
            path
            for path in output_dir.rglob("*")
            if path.is_file() and "history" not in path.relative_to(output_dir).parts
        ]
    if existing and not force:
        raise PreparationError(
            f"{task_id}: audit output exists at {output_dir}; validate and reuse it, or use --force"
        )

    checks, check_paths = load_semantic_checks(config)
    for path in config["_environment_paths"]:
        if not path.is_file():
            raise PreparationError(f"missing configured Lean environment file: {path}")

    target_source = target_path.read_text(encoding="utf-8")
    declaration = task["target"]["declaration"]
    header = declaration_source(target_source, declaration)
    local_order, graph, external_imports = collect_local_imports(target_source, config)
    semantic = build_semantic_report(target_path, declaration, local_order, config)
    blind_by_actual = blind_names(semantic["dependencies"])
    for dependency in semantic["dependencies"]:
        dependency["blind_name"] = blind_by_actual.get(dependency["name"], dependency["name"])

    if existing and force:
        archive_existing_output(output_dir)
    inputs_dir = output_dir / "inputs"
    outputs_dir = output_dir / "agent_outputs"
    inputs_dir.mkdir(parents=True, exist_ok=True)
    outputs_dir.mkdir(parents=True, exist_ok=True)

    declaration_dossier = inputs_dir / "declaration_dossier.md"
    direct_review_packet = inputs_dir / "direct_review_packet.md"
    blind_dossier = inputs_dir / "blind_dossier.md"
    blind_review_packet = inputs_dir / "blind_review_packet.md"
    declaration_dossier.write_text(
        make_direct_dossier(
            task_id, header, semantic, local_order, graph, config, include_complete_sources=True
        ),
        encoding="utf-8",
    )
    direct_review_packet.write_text(
        make_direct_dossier(
            task_id, header, semantic, local_order, graph, config, include_complete_sources=False
        ),
        encoding="utf-8",
    )
    blind_text = make_blind_dossier(semantic)
    blind_dossier.write_text(blind_text, encoding="utf-8")
    blind_review_packet.write_text(blind_text, encoding="utf-8")
    direct_inventory, blind_inventory = write_dependency_inventories(inputs_dir, semantic)

    source_locator_path = inputs_dir / "source_locator.json"
    write_json(
        source_locator_path,
        {
            "schema_version": AUDIT_SCHEMA_VERSION,
            "task_id": task_id,
            "source_path": repository_relative(source_path, config),
            "source_sha256": actual_source_hash,
            "source_version": task["source"].get("version"),
            "source_locations": task["source"]["locations"],
            "evidence_policy": (
                "Use the immutable source and surrounding source context as authority. "
                "Do not use context notes or task metadata paraphrases as semantic evidence."
            ),
        },
    )

    local_sources = []
    for module in local_order:
        source = local_module_source(module, config)
        assert source is not None
        local_sources.append(
            {
                "module": module,
                **file_record(source, config),
                "direct_imports": graph.get(module, []),
            }
        )

    context_record = None
    if task["_context"] is not None:
        context_path = task["_context"]["_path"]
        context_record = {**file_record(context_path, config), "semantic_evidence": False}

    manifest = {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "task_id": task_id,
        "status": "prepared",
        "prepared_at_utc": datetime.now(timezone.utc).isoformat(),
        "target": {
            **file_record(target_path, config),
            "declaration": declaration,
        },
        "task_metadata": {
            **file_record(task["_metadata_path"], config),
            "semantic_evidence": False,
        },
        "context": context_record,
        "source": {
            **file_record(source_path, config),
            "version": task["source"].get("version"),
            "locations": task["source"]["locations"],
            "source_group": task.get("source_group"),
        },
        "audit_setup": [file_record(path, config) for path in audit_setup_paths(config, check_paths)],
        "lean_environment": [file_record(path, config) for path in config["_environment_paths"]],
        "local_import_sources": local_sources,
        "direct_external_imports": sorted(external_imports),
        "compiled_environment": {
            "module_count": len(semantic["environment_modules"]),
            "sorted_module_names_sha256": sha256_text(
                "\n".join(semantic["environment_modules"]) + "\n"
            ),
        },
        "dependencies": [
            {
                key: dependency[key]
                for key in (
                    "id",
                    "role",
                    "name",
                    "blind_name",
                    "owner_module",
                    "distance",
                    "kind",
                    "semantic_sha256",
                )
            }
            for dependency in semantic["dependencies"]
        ],
        "dependency_edges": semantic["edges"],
        "semantic_checks": checks,
        "inputs": {
            "declaration_dossier": file_record(declaration_dossier, config),
            "direct_review_packet": file_record(direct_review_packet, config),
            "blind_dossier": file_record(blind_dossier, config),
            "blind_review_packet": file_record(blind_review_packet, config),
            "source_locator": file_record(source_locator_path, config),
            "dependency_inventory": file_record(direct_inventory, config),
            "blind_dependency_inventory": file_record(blind_inventory, config),
        },
        "blindness": {
            "allowed_input": "inputs/blind_review_packet.md supplied inline",
            "forbidden": [
                "conversation history",
                "filesystem or tool access",
                "source document or identity",
                "task identity or metadata",
                "context notes",
                "target source and theorem proof",
                "other agent outputs",
            ],
        },
    }
    write_json(output_dir / "manifest.json", manifest)
    return output_dir


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", help="task ID or path to audit-task.json")
    parser.add_argument(
        "--force", action="store_true", help="archive and replace existing audit artifacts"
    )
    return parser


def main() -> int:
    args = make_parser().parse_args()
    try:
        output = prepare(args.task, force=args.force)
        config = load_config()
    except (OSError, AuditError, subprocess.SubprocessError, ValueError) as error:
        print(f"faithfulness preparation error: {error}", file=sys.stderr)
        return 2
    print(repository_relative(output, config))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
