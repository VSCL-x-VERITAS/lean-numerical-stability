#!/usr/bin/env python3
"""Compact a review packet using hash-identical validated declaration meanings."""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Any

try:
    from .common import (
        AUDIT_SCHEMA_VERSION,
        AuditError,
        file_record,
        load_config,
        load_json,
        load_task,
        sha256_file,
        sha256_text,
        write_json,
    )
    from .validate_agent_output import validate_role
    from .validate_audit import validate_prepared
except ImportError:
    from common import (  # type: ignore
        AUDIT_SCHEMA_VERSION,
        AuditError,
        file_record,
        load_config,
        load_json,
        load_task,
        sha256_file,
        sha256_text,
        write_json,
    )
    from validate_agent_output import validate_role  # type: ignore
    from validate_audit import validate_prepared  # type: ignore


class ReuseError(AuditError):
    """Raised when declaration meaning cannot be reused safely."""


def dossier_sections(text: str) -> tuple[str, dict[str, str]]:
    matches = list(re.finditer(r"(?m)^### (D[0-9]{3}):", text))
    if not matches:
        raise ReuseError("review packet has no dependency sections")
    prefix = text[: matches[0].start()]
    sections: dict[str, str] = {}
    for index, match in enumerate(matches):
        end = matches[index + 1].start() if index + 1 < len(matches) else len(text)
        sections[match.group(1)] = text[match.start() : end]
    return prefix, sections


def canonical_hash(value: dict[str, Any]) -> str:
    return sha256_text(json.dumps(value, sort_keys=True, ensure_ascii=True, separators=(",", ":")))


def reusable_record(record: dict[str, Any], role: str) -> tuple[str, str] | None:
    if role == "direct":
        interpretation = record.get("interpretation")
        if record.get("status") not in {"pass", "not-applicable"} or not isinstance(interpretation, str):
            return None
        return "interpretation", interpretation
    meaning = record.get("meaning")
    if record.get("status") != "understood" or not isinstance(meaning, str):
        return None
    return "meaning", meaning


def compact_section(dependency: dict[str, Any], entry: dict[str, Any], role: str) -> str:
    name = dependency["name"] if role == "direct" else dependency["blind_name"]
    field = "interpretation" if role == "direct" else "meaning"
    task_instruction = (
        "Independently determine this declaration's effect on the current target and "
        "whether that effect matches the selected source result."
        if role == "direct"
        else "Independently determine this declaration's effect on the current proposition."
    )
    return (
        f"### {dependency['id']}: `{name}`\n\n"
        f"- Role: `{dependency['role']}`\n"
        f"- Owner module: `{dependency['owner_module']}`\n"
        f"- Declaration kind: `{dependency['kind']}`\n"
        f"- Distance from target type: `{dependency['distance']}`\n"
        f"- Semantic SHA-256: `{dependency['semantic_sha256']}`\n\n"
        "Hash-verified prior declaration review:\n\n"
        f"- Reuse SHA-256: `{entry['reuse_sha256']}`\n"
        f"- Reviewed {field}: {entry[field]}\n\n"
        f"{task_instruction}\n\n"
    )


def apply_reuse(target_ref: str, source_ref: str, role: str) -> Path:
    if role not in {"direct", "blind"}:
        raise ReuseError("role must be direct or blind")
    config = load_config()
    target = load_task(target_ref, config)
    source = load_task(source_ref, config)
    if target["task_id"] == source["task_id"]:
        raise ReuseError("source and target task must differ")
    target_manifest, target_errors = validate_prepared(target_ref)
    source_manifest, source_errors = validate_prepared(source_ref)
    if target_errors or source_errors:
        raise ReuseError("prepared validation failed:\n" + "\n".join([*target_errors, *source_errors]))

    role_name = "direct-judge" if role == "direct" else "blind-translation"
    validate_role(source_ref, role_name)
    source_filename = "direct_judge.json" if role == "direct" else "blind_translation.json"
    source_output_path = source["_output_path"] / "agent_outputs" / source_filename
    source_output = load_json(source_output_path)
    source_records = {
        record.get("id"): record
        for record in source_output.get("dependency_coverage", [])
        if isinstance(record, dict)
    }
    source_by_semantic: dict[str, tuple[dict[str, Any], dict[str, Any]]] = {}
    for dependency in source_manifest.get("dependencies", []):
        if not isinstance(dependency, dict):
            continue
        record = source_records.get(dependency.get("id"))
        if isinstance(record, dict) and reusable_record(record, role) is not None:
            source_by_semantic.setdefault(dependency["semantic_sha256"], (dependency, record))

    entries: list[dict[str, Any]] = []
    for dependency in target_manifest.get("dependencies", []):
        if not isinstance(dependency, dict):
            continue
        source_pair = source_by_semantic.get(dependency.get("semantic_sha256"))
        if source_pair is None:
            continue
        source_dependency, source_record = source_pair
        reviewed = reusable_record(source_record, role)
        assert reviewed is not None
        field, text = reviewed
        provenance = {
            "target_dependency_id": dependency["id"],
            "semantic_sha256": dependency["semantic_sha256"],
            "source_task_id": source["task_id"],
            "source_dependency_id": source_dependency["id"],
            "source_output_sha256": sha256_file(source_output_path),
            field: text,
        }
        entries.append({**provenance, "reuse_sha256": canonical_hash(provenance)})

    target_output: Path = target["_output_path"]
    packet_name = "direct_review_packet.md" if role == "direct" else "blind_review_packet.md"
    packet_path = target_output / "inputs" / packet_name
    prefix, sections = dossier_sections(packet_path.read_text(encoding="utf-8"))
    entry_by_id = {entry["target_dependency_id"]: entry for entry in entries}
    dependency_by_id = {
        dependency["id"]: dependency
        for dependency in target_manifest.get("dependencies", [])
        if isinstance(dependency, dict)
    }
    rendered = [prefix]
    for item_id, section in sections.items():
        entry = entry_by_id.get(item_id)
        dependency = dependency_by_id.get(item_id)
        rendered.append(
            compact_section(dependency, entry, role)
            if entry is not None and dependency is not None
            else section
        )
    packet_path.write_text("".join(rendered).rstrip() + "\n", encoding="utf-8")

    cache_path = target_output / "inputs" / f"dependency_reuse_{role}.json"
    write_json(
        cache_path,
        {
            "schema_version": AUDIT_SCHEMA_VERSION,
            "role": f"{role}-dependency-reuse",
            "task_id": target["task_id"],
            "source_task_id": source["task_id"],
            "source_output_sha256": sha256_file(source_output_path),
            "entries": entries,
        },
    )
    manifest_path = target_output / "manifest.json"
    manifest = load_json(manifest_path)
    manifest["inputs"][packet_name.removesuffix(".md")] = file_record(packet_path, config)
    manifest["inputs"][f"dependency_reuse_{role}"] = file_record(cache_path, config)
    reuse = manifest.setdefault("dependency_reuse", {})
    reuse[f"{role}_source_task_id"] = source["task_id"]
    reuse[f"{role}_count"] = len(entries)
    reuse[f"{role}_source_output_sha256"] = sha256_file(source_output_path)
    write_json(manifest_path, manifest)
    return cache_path


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("target")
    parser.add_argument("--source", required=True)
    parser.add_argument("--role", choices=("direct", "blind"), required=True)
    return parser


def main() -> int:
    args = make_parser().parse_args()
    try:
        path = apply_reuse(args.target, args.source, args.role)
    except (OSError, AuditError, ValueError) as error:
        print(f"dependency reuse error: {error}", file=sys.stderr)
        return 2
    print(path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
