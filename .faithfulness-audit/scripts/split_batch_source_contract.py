#!/usr/bin/env python3
"""Validate and split a batch source-contract response into task-local outputs."""

from __future__ import annotations

import argparse
import shutil
import sys
from pathlib import Path

try:
    from .common import AUDIT_ROOT, AUDIT_SCHEMA_VERSION, AuditError, load_config, load_json, load_task, sha256_file, write_json
    from .schema_validate import validate_schema
    from .validate_agent_output import validate_role
    from .validate_audit import validate_prepared
except ImportError:
    from common import AUDIT_ROOT, AUDIT_SCHEMA_VERSION, AuditError, load_config, load_json, load_task, sha256_file, write_json  # type: ignore
    from schema_validate import validate_schema  # type: ignore
    from validate_agent_output import validate_role  # type: ignore
    from validate_audit import validate_prepared  # type: ignore


class SplitError(AuditError):
    """Raised when batch source evidence cannot be assigned exactly."""


def split_contract(input_path: Path) -> list[Path]:
    batch = load_json(input_path)
    schema = load_json(AUDIT_ROOT / "schemas" / "batch_source_contract.schema.json")
    errors = validate_schema(batch, schema, label="batch-source-contract")
    if errors:
        raise SplitError("\n".join(errors))
    task_ids = batch["task_ids"]
    contracts = batch["contracts"]
    contract_ids = [contract.get("task_id") for contract in contracts]
    if contract_ids != task_ids:
        raise SplitError("contracts must use the exact task order from task_ids")

    config = load_config()
    manifests: dict[str, dict] = {}
    tasks: dict[str, dict] = {}
    for task_id in task_ids:
        task = load_task(task_id, config)
        manifest, manifest_errors = validate_prepared(task_id)
        if manifest_errors:
            raise SplitError(f"{task_id}: prepared audit is invalid:\n" + "\n".join(manifest_errors))
        source_batch = manifest.get("source_batch")
        if not isinstance(source_batch, dict):
            raise SplitError(f"{task_id}: manifest has no source_batch")
        if source_batch.get("source_group") != batch["source_group"]:
            raise SplitError(f"{task_id}: source group mismatch")
        if source_batch.get("task_ids") != task_ids:
            raise SplitError(f"{task_id}: batch task order mismatch")
        locator_record = source_batch.get("source_locator", {})
        if locator_record.get("sha256") != batch["source_locator_sha256"]:
            raise SplitError(f"{task_id}: source locator hash mismatch")
        if manifest.get("source", {}).get("sha256") != batch["source_sha256"]:
            raise SplitError(f"{task_id}: source hash mismatch")
        manifests[task_id] = manifest
        tasks[task_id] = task

    batch_hash = sha256_file(input_path)
    outputs: list[Path] = []
    for contract in contracts:
        task_id = contract["task_id"]
        output_dir = tasks[task_id]["_output_path"] / "agent_outputs"
        output_dir.mkdir(parents=True, exist_ok=True)
        batch_output = output_dir / "batch_source_contract.json"
        if input_path.resolve() != batch_output.resolve():
            shutil.copy2(input_path, batch_output)
        source_output = output_dir / "source_contract.json"
        write_json(
            source_output,
            {
                "schema_version": AUDIT_SCHEMA_VERSION,
                "role": "source-contract",
                "task_id": task_id,
                "source_sha256": batch["source_sha256"],
                "batch_source_contract_sha256": batch_hash,
                "source_evidence": contract["source_evidence"],
                "statement": contract["statement"],
                "undebatable_constraints": contract["undebatable_constraints"],
                "ambiguities": contract["ambiguities"],
                "contract_plain_english": contract["contract_plain_english"],
            },
        )
        validate_role(task_id, "source-contract")
        outputs.append(source_output)
    return outputs


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    return parser


def main() -> int:
    args = make_parser().parse_args()
    try:
        outputs = split_contract(args.input.resolve())
    except (OSError, AuditError, ValueError) as error:
        print(f"batch source split error: {error}", file=sys.stderr)
        return 2
    for output in outputs:
        print(output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
