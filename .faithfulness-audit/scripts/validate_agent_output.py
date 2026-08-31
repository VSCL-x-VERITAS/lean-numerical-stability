#!/usr/bin/env python3
"""Validate one stateless role output against schema and prepared evidence."""

from __future__ import annotations

import argparse
import sys
from pathlib import Path
from typing import Any

try:
    from .common import (
        ACCEPTED_CLASSIFICATIONS,
        AUDIT_ROOT,
        AUDIT_SCHEMA_VERSION,
        AuditError,
        implication_classification,
        load_config,
        load_json,
        load_task,
        sha256_file,
    )
    from .schema_validate import validate_schema
except ImportError:
    from common import (  # type: ignore
        ACCEPTED_CLASSIFICATIONS,
        AUDIT_ROOT,
        AUDIT_SCHEMA_VERSION,
        AuditError,
        implication_classification,
        load_config,
        load_json,
        load_task,
        sha256_file,
    )
    from schema_validate import validate_schema  # type: ignore


ROLE_FILES = {
    "source-contract": ("source_contract.json", "source_contract.schema.json"),
    "blind-translation": ("blind_translation.json", "blind_translation.schema.json"),
    "direct-judge": ("direct_judge.json", "direct_judge.schema.json"),
    "roundtrip-judge": ("roundtrip_judge.json", "roundtrip_judge.schema.json"),
    "adjudicator": ("adjudicator.json", "adjudicator.schema.json"),
}


class AgentOutputError(AuditError):
    """Raised when an agent output is malformed or inconsistent."""


def require(condition: bool, message: str, errors: list[str]) -> None:
    if not condition:
        errors.append(message)


def expected_ids(manifest: dict[str, Any], key: str) -> list[str]:
    records = manifest.get(key, [])
    return [str(record.get("id")) for record in records if isinstance(record, dict)]


def coverage_ids(
    output: dict[str, Any], field: str, expected: list[str], label: str, errors: list[str]
) -> None:
    records = output.get(field)
    if not isinstance(records, list):
        errors.append(f"{label}: {field} must be an array")
        return
    actual = [record.get("id") for record in records if isinstance(record, dict)]
    require(actual == expected, f"{label}: {field} IDs/order differ; expected {expected}, got {actual}", errors)


def implication_verdicts(output: dict[str, Any], role: str) -> tuple[str, str] | None:
    implications = output.get("implications")
    if not isinstance(implications, dict):
        return None
    keys = (
        ("translation_implies_source", "source_implies_translation")
        if role == "roundtrip-judge"
        else ("lean_implies_source", "source_implies_lean")
    )
    values: list[str] = []
    for key in keys:
        record = implications.get(key)
        if not isinstance(record, dict) or not isinstance(record.get("verdict"), str):
            return None
        values.append(record["verdict"])
    return values[0], values[1]


def validate_classification(output: dict[str, Any], role: str, errors: list[str]) -> None:
    classification = output.get("classification")
    accepted = output.get("accepted")
    require(
        accepted == (classification in ACCEPTED_CLASSIFICATIONS),
        f"{role}: accepted flag contradicts classification",
        errors,
    )
    verdicts = implication_verdicts(output, role)
    if verdicts is None:
        errors.append(f"{role}: implication records are incomplete")
        return
    try:
        expected = implication_classification(*verdicts)
    except AuditError as error:
        errors.append(f"{role}: {error}")
        return
    require(
        classification == expected,
        f"{role}: classification {classification!r} contradicts implication verdicts {verdicts}",
        errors,
    )


def unresolved_items(output: dict[str, Any]) -> list[str]:
    unresolved: list[str] = []
    for field in ("dependency_coverage", "semantic_checklist"):
        records = output.get(field, [])
        if isinstance(records, list):
            for record in records:
                if isinstance(record, dict) and record.get("status") == "unclear":
                    unresolved.append(f"{field}:{record.get('id')}")
    verdicts = implication_verdicts(output, str(output.get("role")))
    if verdicts is not None and "unclear" in verdicts:
        unresolved.append("implications")
    return unresolved


def validate_reuse_records(
    manifest: dict[str, Any],
    audit_dir: Path,
    role: str,
    output: dict[str, Any],
    errors: list[str],
) -> None:
    cache_path = audit_dir / "inputs" / f"dependency_reuse_{role}.json"
    cache_entries: dict[str, dict[str, Any]] = {}
    if cache_path.is_file():
        cache = load_json(cache_path)
        cache_entries = {
            str(entry.get("target_dependency_id")): entry
            for entry in cache.get("entries", [])
            if isinstance(entry, dict)
        }
    records = {
        str(record.get("id")): record
        for record in output.get("dependency_coverage", [])
        if isinstance(record, dict)
    }
    for item_id, entry in cache_entries.items():
        record = records.get(item_id)
        require(record is not None, f"{role}: missing reused dependency {item_id}", errors)
        if record is not None:
            require(
                record.get("reuse_sha256") == entry.get("reuse_sha256"),
                f"{role}: reuse hash mismatch for {item_id}",
                errors,
            )
    for item_id, record in records.items():
        if "reuse_sha256" in record:
            require(item_id in cache_entries, f"{role}: unrecorded dependency reuse for {item_id}", errors)


def validate_role(task_ref: str, role: str) -> Path:
    if role not in ROLE_FILES:
        raise AgentOutputError(f"unknown role {role!r}")
    config = load_config()
    task = load_task(task_ref, config)
    audit_dir: Path = task["_output_path"]
    manifest_path = audit_dir / "manifest.json"
    if not manifest_path.is_file():
        raise AgentOutputError(f"missing prepared manifest: {manifest_path}")
    manifest = load_json(manifest_path)
    if manifest.get("schema_version") != AUDIT_SCHEMA_VERSION or manifest.get("task_id") != task["task_id"]:
        raise AgentOutputError("manifest schema or task ID mismatch")

    filename, schema_name = ROLE_FILES[role]
    output_path = audit_dir / "agent_outputs" / filename
    if not output_path.is_file():
        raise AgentOutputError(f"missing {role} output: {output_path}")
    output = load_json(output_path)
    schema = load_json(AUDIT_ROOT / "schemas" / schema_name)
    errors = validate_schema(output, schema, label=role)

    dependency_ids = expected_ids(manifest, "dependencies")
    semantic_ids = expected_ids(manifest, "semantic_checks")
    source_hash = manifest.get("source", {}).get("sha256")
    task_id = task["task_id"]

    if role == "source-contract":
        require(output.get("task_id") == task_id, "source-contract: task_id mismatch", errors)
        require(output.get("source_sha256") == source_hash, "source-contract: source hash mismatch", errors)
        batch = manifest.get("source_batch")
        if isinstance(batch, dict):
            batch_output = audit_dir / "agent_outputs" / "batch_source_contract.json"
            require(batch_output.is_file(), "source-contract: missing batch source output", errors)
            if batch_output.is_file():
                require(
                    output.get("batch_source_contract_sha256") == sha256_file(batch_output),
                    "source-contract: batch provenance hash mismatch",
                    errors,
                )
    elif role == "blind-translation":
        expected_hash = manifest.get("inputs", {}).get("blind_review_packet", {}).get("sha256")
        require(output.get("dossier_sha256") == expected_hash, "blind-translation: dossier hash mismatch", errors)
        coverage_ids(output, "dependency_coverage", dependency_ids, role, errors)
        blind_names = [
            record.get("blind_name") for record in manifest.get("dependencies", []) if isinstance(record, dict)
        ]
        actual_names = [
            record.get("name") for record in output.get("dependency_coverage", []) if isinstance(record, dict)
        ]
        require(actual_names == blind_names, "blind-translation: dependency names/order mismatch", errors)
        validate_reuse_records(manifest, audit_dir, "blind", output, errors)
    elif role == "direct-judge":
        require(output.get("task_id") == task_id, "direct-judge: task_id mismatch", errors)
        require(output.get("source_sha256") == source_hash, "direct-judge: source hash mismatch", errors)
        expected_hash = manifest.get("inputs", {}).get("direct_review_packet", {}).get("sha256")
        require(output.get("dossier_sha256") == expected_hash, "direct-judge: dossier hash mismatch", errors)
        coverage_ids(output, "dependency_coverage", dependency_ids, role, errors)
        coverage_ids(output, "semantic_checklist", semantic_ids, role, errors)
        actual_names = [
            record.get("name") for record in output.get("dependency_coverage", []) if isinstance(record, dict)
        ]
        expected_names = [
            record.get("name") for record in manifest.get("dependencies", []) if isinstance(record, dict)
        ]
        require(actual_names == expected_names, "direct-judge: dependency names/order mismatch", errors)
        validate_reuse_records(manifest, audit_dir, "direct", output, errors)
        validate_classification(output, role, errors)
        unresolved = unresolved_items(output)
        if unresolved:
            require(output.get("requires_adjudication") is True, f"direct-judge: unresolved items require adjudication: {unresolved}", errors)
    elif role == "roundtrip-judge":
        require(output.get("task_id") == task_id, "roundtrip-judge: task_id mismatch", errors)
        require(output.get("source_sha256") == source_hash, "roundtrip-judge: source hash mismatch", errors)
        blind_path = audit_dir / "agent_outputs" / "blind_translation.json"
        require(blind_path.is_file(), "roundtrip-judge: missing blind translation", errors)
        if blind_path.is_file():
            require(
                output.get("blind_translation_sha256") == sha256_file(blind_path),
                "roundtrip-judge: blind translation hash mismatch",
                errors,
            )
        coverage_ids(output, "semantic_checklist", semantic_ids, role, errors)
        validate_classification(output, role, errors)
        unresolved = unresolved_items(output)
        if unresolved:
            require(output.get("requires_adjudication") is True, f"roundtrip-judge: unresolved items require adjudication: {unresolved}", errors)
    elif role == "adjudicator":
        require(output.get("task_id") == task_id, "adjudicator: task_id mismatch", errors)
        validate_classification(output, role, errors)

    if errors:
        raise AgentOutputError("\n".join(errors))
    return output_path


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", help="task ID or path to audit-task.json")
    parser.add_argument("role", choices=sorted(ROLE_FILES))
    return parser


def main() -> int:
    args = make_parser().parse_args()
    try:
        output = validate_role(args.task, args.role)
    except (OSError, AuditError, ValueError) as error:
        print(f"agent output validation error:\n{error}", file=sys.stderr)
        return 2
    print(output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
