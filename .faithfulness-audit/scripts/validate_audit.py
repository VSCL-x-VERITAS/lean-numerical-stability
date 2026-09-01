#!/usr/bin/env python3
"""Validate prepared or completed faithfulness-audit artifacts."""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Any

try:
    from .common import (
        ACCEPTED_CLASSIFICATIONS,
        AUDIT_ROOT,
        AUDIT_SCHEMA_VERSION,
        AuditError,
        file_record,
        implication_classification,
        load_config,
        load_json,
        load_semantic_checks,
        load_task,
        repository_root,
        resolve_under,
        sha256_file,
        sha256_text,
    )
    from .prepare_audit import audit_setup_paths
    from .schema_validate import validate_schema
except ImportError:
    from common import (  # type: ignore
        ACCEPTED_CLASSIFICATIONS,
        AUDIT_ROOT,
        AUDIT_SCHEMA_VERSION,
        AuditError,
        file_record,
        implication_classification,
        load_config,
        load_json,
        load_semantic_checks,
        load_task,
        repository_root,
        resolve_under,
        sha256_file,
        sha256_text,
    )
    from prepare_audit import audit_setup_paths  # type: ignore
    from schema_validate import validate_schema  # type: ignore


class AuditValidationError(AuditError):
    """Raised when audit invariants fail."""


def require(condition: bool, message: str, errors: list[str]) -> None:
    if not condition:
        errors.append(message)


def repository_path(relative: str, config: dict[str, Any]) -> Path:
    return resolve_under(repository_root(config), relative, label="recorded path")


def check_recorded_file(
    record: Any, label: str, config: dict[str, Any], errors: list[str]
) -> Path | None:
    if not isinstance(record, dict):
        errors.append(f"{label}: expected file record")
        return None
    path_text = record.get("path")
    expected_hash = record.get("sha256")
    if not isinstance(path_text, str) or not isinstance(expected_hash, str):
        errors.append(f"{label}: incomplete path/hash record")
        return None
    try:
        path = repository_path(path_text, config)
    except AuditError as error:
        errors.append(f"{label}: {error}")
        return None
    if not path.is_file():
        errors.append(f"{label}: missing file {path_text}")
        return None
    require(sha256_file(path) == expected_hash, f"{label}: SHA-256 mismatch for {path_text}", errors)
    return path


def dependency_ids(manifest: dict[str, Any], errors: list[str]) -> list[str]:
    records = manifest.get("dependencies")
    if not isinstance(records, list) or not records:
        errors.append("manifest: dependencies must be nonempty")
        return []
    result: list[str] = []
    for index, record in enumerate(records, start=1):
        expected = f"D{index:03d}"
        if not isinstance(record, dict):
            errors.append(f"manifest: dependency {index} is not an object")
            continue
        require(record.get("id") == expected, f"manifest: expected {expected}", errors)
        require(record.get("role") in {"local", "external-frontier"}, f"{expected}: invalid role", errors)
        for key in ("name", "blind_name", "owner_module", "kind", "semantic_sha256"):
            require(isinstance(record.get(key), str) and bool(record.get(key)), f"{expected}: missing {key}", errors)
        require(
            isinstance(record.get("semantic_sha256"), str)
            and re.fullmatch(r"[0-9a-f]{64}", record["semantic_sha256"]) is not None,
            f"{expected}: invalid semantic hash",
            errors,
        )
        result.append(expected)
    return result


def validate_dependency_reuse(
    task_ref: str,
    manifest: dict[str, Any],
    input_paths: dict[str, Path],
    errors: list[str],
) -> None:
    reuse = manifest.get("dependency_reuse")
    if reuse is None:
        return
    if not isinstance(reuse, dict):
        errors.append("manifest: dependency_reuse must be an object")
        return
    config = load_config()
    task = load_task(task_ref, config)
    dependency_by_id = {
        item.get("id"): item
        for item in manifest.get("dependencies", [])
        if isinstance(item, dict)
    }
    for role, filename in (("direct", "direct_judge.json"), ("blind", "blind_translation.json")):
        count = reuse.get(f"{role}_count")
        if count is None:
            continue
        require(isinstance(count, int) and count >= 0, f"reuse {role}: invalid count", errors)
        cache_path = input_paths.get(f"dependency_reuse_{role}")
        require(cache_path is not None, f"reuse {role}: missing cache input", errors)
        if cache_path is None:
            continue
        cache = load_json(cache_path)
        require(cache.get("schema_version") == AUDIT_SCHEMA_VERSION, f"reuse {role}: wrong schema", errors)
        require(cache.get("role") == f"{role}-dependency-reuse", f"reuse {role}: wrong role", errors)
        require(cache.get("task_id") == task["task_id"], f"reuse {role}: target task mismatch", errors)
        source_task_id = reuse.get(f"{role}_source_task_id")
        require(cache.get("source_task_id") == source_task_id, f"reuse {role}: source task mismatch", errors)
        entries = cache.get("entries")
        require(isinstance(entries, list), f"reuse {role}: entries must be a list", errors)
        if not isinstance(entries, list):
            continue
        require(len(entries) == count, f"reuse {role}: count mismatch", errors)
        try:
            source_task = load_task(str(source_task_id), config)
            source_output = source_task["_output_path"] / "agent_outputs" / filename
        except AuditError as error:
            errors.append(f"reuse {role}: {error}")
            continue
        require(source_output.is_file(), f"reuse {role}: missing source role output", errors)
        if not source_output.is_file():
            continue
        source_hash = sha256_file(source_output)
        require(cache.get("source_output_sha256") == source_hash, f"reuse {role}: source output hash changed", errors)
        require(reuse.get(f"{role}_source_output_sha256") == source_hash, f"reuse {role}: manifest source hash differs", errors)
        seen: set[str] = set()
        for entry in entries:
            if not isinstance(entry, dict):
                errors.append(f"reuse {role}: non-object entry")
                continue
            item_id = entry.get("target_dependency_id")
            require(item_id not in seen, f"reuse {role}: duplicate target dependency {item_id}", errors)
            seen.add(str(item_id))
            dependency = dependency_by_id.get(item_id)
            require(dependency is not None, f"reuse {role}: unknown target dependency {item_id}", errors)
            if dependency is not None:
                require(entry.get("semantic_sha256") == dependency.get("semantic_sha256"), f"reuse {role}: semantic hash differs for {item_id}", errors)
            provenance = {key: value for key, value in entry.items() if key != "reuse_sha256"}
            expected_hash = sha256_text(
                json.dumps(provenance, sort_keys=True, ensure_ascii=True, separators=(",", ":"))
            )
            require(entry.get("reuse_sha256") == expected_hash, f"reuse {role}: invalid reuse hash for {item_id}", errors)


def output_requires_adjudication(
    source: dict[str, Any],
    blind: dict[str, Any],
    direct: dict[str, Any],
    roundtrip: dict[str, Any],
) -> list[str]:
    reasons: list[str] = []

    def add(reason: str) -> None:
        if reason not in reasons:
            reasons.append(reason)

    if direct.get("classification") != roundtrip.get("classification"):
        add("judge classifications differ")
    if direct.get("requires_adjudication") is True:
        add("direct judge requested adjudication")
    if roundtrip.get("requires_adjudication") is True:
        add("round-trip judge requested adjudication")
    if direct.get("classification") == "undetermined":
        add("direct judge classification is undetermined")
    if roundtrip.get("classification") == "undetermined":
        add("round-trip judge classification is undetermined")

    for label, output, fields in (
        ("blind translator", blind, ("dependency_coverage",)),
        ("direct judge", direct, ("dependency_coverage", "semantic_checklist")),
        ("round-trip judge", roundtrip, ("semantic_checklist",)),
    ):
        for field in fields:
            records = output.get(field, [])
            if not isinstance(records, list):
                continue
            for record in records:
                if isinstance(record, dict) and record.get("status") == "unclear":
                    add(f"{label} left {field} item {record.get('id')} unclear")

    for label, output in (("direct judge", direct), ("round-trip judge", roundtrip)):
        implications = output.get("implications", {})
        if isinstance(implications, dict):
            for key, value in implications.items():
                if isinstance(value, dict) and value.get("verdict") == "unclear":
                    add(f"{label} left implication {key} unclear")
    return reasons


def validate_prepared(task_ref: str) -> tuple[dict[str, Any], list[str]]:
    config = load_config()
    task = load_task(task_ref, config)
    audit_dir: Path = task["_output_path"]
    manifest_path = audit_dir / "manifest.json"
    errors: list[str] = []
    if not manifest_path.is_file():
        return {}, [f"missing manifest: {manifest_path}"]
    manifest = load_json(manifest_path)

    require(manifest.get("schema_version") == AUDIT_SCHEMA_VERSION, "manifest: wrong schema version", errors)
    require(manifest.get("task_id") == task["task_id"], "manifest: task ID mismatch", errors)
    require(manifest.get("status") in {"prepared", "completed"}, "manifest: invalid status", errors)

    target_path = check_recorded_file(manifest.get("target"), "target", config, errors)
    require(target_path == task["_target_path"], "target: path differs from task metadata", errors)
    require(
        isinstance(manifest.get("target"), dict)
        and manifest["target"].get("declaration") == task["target"]["declaration"],
        "target: declaration differs from task metadata",
        errors,
    )
    metadata_path = check_recorded_file(manifest.get("task_metadata"), "task metadata", config, errors)
    require(metadata_path == task["_metadata_path"], "task metadata: path mismatch", errors)
    require(
        isinstance(manifest.get("task_metadata"), dict)
        and manifest["task_metadata"].get("semantic_evidence") is False,
        "task metadata must not be semantic evidence",
        errors,
    )
    source_path = check_recorded_file(manifest.get("source"), "source", config, errors)
    require(source_path == task["_source_path"], "source: path differs from task metadata", errors)
    require(
        isinstance(manifest.get("source"), dict)
        and manifest["source"].get("sha256") == task["source"]["sha256"],
        "source: hash differs from task metadata",
        errors,
    )

    expected_context = task["_context"]
    if expected_context is None:
        require(manifest.get("context") is None, "context: unexpected manifest record", errors)
    else:
        context_path = check_recorded_file(manifest.get("context"), "context", config, errors)
        require(context_path == expected_context["_path"], "context: path mismatch", errors)
        require(
            isinstance(manifest.get("context"), dict)
            and manifest["context"].get("semantic_evidence") is False,
            "context must not be semantic evidence",
            errors,
        )

    checks, check_paths = load_semantic_checks(config)
    require(manifest.get("semantic_checks") == checks, "manifest: semantic checklist changed", errors)
    expected_setup = [file_record(path, config) for path in audit_setup_paths(config, check_paths)]
    require(manifest.get("audit_setup") == expected_setup, "manifest: audit setup paths or hashes changed", errors)
    expected_environment = [file_record(path, config) for path in config["_environment_paths"]]
    require(manifest.get("lean_environment") == expected_environment, "manifest: Lean environment changed", errors)

    for index, record in enumerate(manifest.get("local_import_sources", []), start=1):
        check_recorded_file(record, f"local import {index}", config, errors)

    ids = dependency_ids(manifest, errors)
    inputs = manifest.get("inputs")
    input_paths: dict[str, Path] = {}
    if not isinstance(inputs, dict):
        errors.append("manifest: inputs must be an object")
    else:
        required_inputs = {
            "declaration_dossier",
            "direct_review_packet",
            "blind_dossier",
            "blind_review_packet",
            "source_locator",
            "dependency_inventory",
            "blind_dependency_inventory",
        }
        require(required_inputs <= set(inputs), f"manifest: missing inputs {sorted(required_inputs - set(inputs))}", errors)
        for label, record in inputs.items():
            path = check_recorded_file(record, f"input {label}", config, errors)
            if path is not None:
                input_paths[label] = path

    source_locator_path = input_paths.get("source_locator")
    if source_locator_path is not None:
        locator = load_json(source_locator_path)
        require(locator.get("schema_version") == AUDIT_SCHEMA_VERSION, "source locator: wrong schema", errors)
        require(locator.get("task_id") == task["task_id"], "source locator: task ID mismatch", errors)
        require(locator.get("source_sha256") == task["source"]["sha256"], "source locator: source hash mismatch", errors)
        require(locator.get("source_locations") == task["source"]["locations"], "source locator: locations changed", errors)

    direct_inventory_path = input_paths.get("dependency_inventory")
    blind_inventory_path = input_paths.get("blind_dependency_inventory")
    if direct_inventory_path is not None:
        inventory = load_json(direct_inventory_path)
        records = inventory.get("dependencies")
        require(inventory.get("schema_version") == AUDIT_SCHEMA_VERSION, "dependency inventory: wrong schema", errors)
        require(isinstance(records, list), "dependency inventory: dependencies must be a list", errors)
        if isinstance(records, list):
            require([item.get("id") for item in records if isinstance(item, dict)] == ids, "dependency inventory: IDs differ", errors)
            manifest_by_id = {item.get("id"): item for item in manifest.get("dependencies", []) if isinstance(item, dict)}
            for record in records:
                if isinstance(record, dict):
                    summary = manifest_by_id.get(record.get("id"), {})
                    for key in ("role", "name", "owner_module", "kind", "semantic_sha256"):
                        require(record.get(key) == summary.get(key), f"dependency inventory: {record.get('id')} {key} differs", errors)
    if blind_inventory_path is not None:
        inventory = load_json(blind_inventory_path)
        records = inventory.get("dependencies")
        require(inventory.get("schema_version") == AUDIT_SCHEMA_VERSION, "blind inventory: wrong schema", errors)
        if isinstance(records, list):
            require([item.get("id") for item in records if isinstance(item, dict)] == ids, "blind inventory: IDs differ", errors)
            expected_names = [item.get("blind_name") for item in manifest.get("dependencies", []) if isinstance(item, dict)]
            actual_names = [item.get("name") for item in records if isinstance(item, dict)]
            require(actual_names == expected_names, "blind inventory: anonymized names differ", errors)
        else:
            errors.append("blind inventory: dependencies must be a list")
    validate_dependency_reuse(task_ref, manifest, input_paths, errors)
    return manifest, errors


def validate_complete(task_ref: str, manifest: dict[str, Any], errors: list[str]) -> None:
    config = load_config()
    task = load_task(task_ref, config)
    audit_dir: Path = task["_output_path"]
    try:
        from .validate_agent_output import validate_role
    except ImportError:
        from validate_agent_output import validate_role  # type: ignore

    for role in ("source-contract", "blind-translation", "direct-judge", "roundtrip-judge"):
        try:
            validate_role(task_ref, role)
        except AuditError as error:
            errors.append(f"{role}: {error}")

    output_dir = audit_dir / "agent_outputs"
    required_paths = {
        "source_contract": output_dir / "source_contract.json",
        "blind_translation": output_dir / "blind_translation.json",
        "direct_judge": output_dir / "direct_judge.json",
        "roundtrip_judge": output_dir / "roundtrip_judge.json",
    }
    if not all(path.is_file() for path in required_paths.values()):
        return
    source = load_json(required_paths["source_contract"])
    blind = load_json(required_paths["blind_translation"])
    direct = load_json(required_paths["direct_judge"])
    roundtrip = load_json(required_paths["roundtrip_judge"])
    reasons = output_requires_adjudication(source, blind, direct, roundtrip)
    adjudicator_path = output_dir / "adjudicator.json"
    adjudicator = None
    if reasons:
        require(adjudicator_path.is_file(), "complete audit: adjudicator is required", errors)
        if adjudicator_path.is_file():
            try:
                validate_role(task_ref, "adjudicator")
                adjudicator = load_json(adjudicator_path)
                require(set(adjudicator.get("trigger", [])) == set(reasons), "adjudicator: trigger reasons differ", errors)
            except AuditError as error:
                errors.append(f"adjudicator: {error}")
    else:
        require(not adjudicator_path.exists(), "complete audit: unexpected adjudicator", errors)

    decision_path = audit_dir / "decision.json"
    report_path = audit_dir / "report.md"
    require(decision_path.is_file(), "complete audit: missing decision.json", errors)
    require(report_path.is_file(), "complete audit: missing report.md", errors)
    if not decision_path.is_file():
        return
    decision = load_json(decision_path)
    decision_schema = load_json(AUDIT_ROOT / "schemas" / "decision.schema.json")
    errors.extend(validate_schema(decision, decision_schema, label="decision"))
    final = adjudicator if adjudicator is not None else direct
    require(decision.get("task_id") == task["task_id"], "decision: task ID mismatch", errors)
    require(decision.get("adjudicated") == bool(reasons), "decision: adjudicated flag mismatch", errors)
    require(decision.get("adjudication_reasons") == reasons, "decision: adjudication reasons differ", errors)
    require(decision.get("classification") == final.get("classification"), "decision: final classification differs", errors)
    require(
        decision.get("accepted") == (decision.get("classification") in ACCEPTED_CLASSIFICATIONS),
        "decision: accepted flag mismatch",
        errors,
    )
    require(
        decision.get("judge_classifications")
        == {"direct": direct.get("classification"), "roundtrip": roundtrip.get("classification")},
        "decision: judge classification record differs",
        errors,
    )

    require(manifest.get("status") == "completed", "manifest: complete phase requires completed status", errors)
    outputs = manifest.get("outputs")
    if not isinstance(outputs, dict):
        errors.append("manifest: completed audit has no outputs")
        return
    expected = {**required_paths, "decision": decision_path, "report": report_path}
    if adjudicator_path.is_file():
        expected["adjudicator"] = adjudicator_path
    batch_path = output_dir / "batch_source_contract.json"
    if isinstance(manifest.get("source_batch"), dict):
        expected["batch_source_contract"] = batch_path
    agent_runs_path = output_dir / "agent_runs.json"
    require(agent_runs_path.is_file(), "complete audit: missing agent_runs.json", errors)
    if agent_runs_path.is_file():
        agent_runs = load_json(agent_runs_path)
        agent_runs_schema = load_json(AUDIT_ROOT / "schemas" / "agent_runs.schema.json")
        errors.extend(validate_schema(agent_runs, agent_runs_schema, label="agent-runs"))
        require(agent_runs.get("task_id") == task["task_id"], "agent-runs: task ID mismatch", errors)
        roles = {
            run.get("role")
            for run in agent_runs.get("runs", [])
            if isinstance(run, dict)
        }
        required_roles = {"blind-translation", "direct-judge", "roundtrip-judge"}
        required_roles.add(
            "batch-source-contract"
            if isinstance(manifest.get("source_batch"), dict)
            else "source-contract"
        )
        if reasons:
            required_roles.add("adjudicator")
        require(required_roles <= roles, f"agent-runs: missing roles {sorted(required_roles - roles)}", errors)
        expected["agent_runs"] = agent_runs_path
    require(set(outputs) == set(expected), "manifest: output labels differ", errors)
    for label, path in expected.items():
        checked = check_recorded_file(outputs.get(label), f"output {label}", config, errors)
        require(checked == path.resolve(), f"output {label}: path mismatch", errors)
    if report_path.is_file():
        require("{{" not in report_path.read_text(encoding="utf-8"), "report: unresolved template marker", errors)


def validate(task_ref: str, phase: str) -> dict[str, Any]:
    manifest, errors = validate_prepared(task_ref)
    if phase == "complete" and manifest:
        validate_complete(task_ref, manifest, errors)
    if errors:
        raise AuditValidationError("\n".join(errors))
    return manifest


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", help="task ID or path to audit-task.json")
    parser.add_argument("--phase", choices=("prepared", "complete"), default="prepared")
    return parser


def main() -> int:
    args = make_parser().parse_args()
    try:
        manifest = validate(args.task, args.phase)
    except (OSError, AuditError, ValueError) as error:
        print(f"audit validation error:\n{error}", file=sys.stderr)
        return 2
    print(f"{manifest['task_id']}: {args.phase} artifacts valid")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
