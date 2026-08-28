#!/usr/bin/env python3
"""Prepare every task in one configured source group."""

from __future__ import annotations

import argparse
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

try:
    from .common import (
        AUDIT_SCHEMA_VERSION,
        AuditError,
        discover_tasks,
        file_record,
        load_config,
        load_json,
        validate_task_metadata,
        write_json,
    )
    from .prepare_audit import prepare
except ImportError:
    from common import (  # type: ignore
        AUDIT_SCHEMA_VERSION,
        AuditError,
        discover_tasks,
        file_record,
        load_config,
        load_json,
        validate_task_metadata,
        write_json,
    )
    from prepare_audit import prepare  # type: ignore


class BatchPreparationError(AuditError):
    """Raised when a source group cannot be prepared consistently."""


def group_tasks(group: str) -> list[dict]:
    config = load_config()
    tasks = [
        validate_task_metadata(path, task, config)
        for path, task in discover_tasks(config).values()
        if task.get("source_group") == group
    ]
    tasks.sort(key=lambda item: item["task_id"])
    if not tasks:
        raise BatchPreparationError(f"no tasks use source_group {group!r}")
    source_pairs = {(task["source"]["path"], task["source"]["sha256"]) for task in tasks}
    if len(source_pairs) != 1:
        raise BatchPreparationError(
            f"source_group {group!r} refers to more than one source path/hash"
        )
    return tasks


def prepare_batch(group: str, *, force: bool = False, jobs: int | None = None) -> list[Path]:
    config = load_config()
    tasks = group_tasks(group)
    worker_count = jobs or min(len(tasks), 8)
    outputs: dict[str, Path] = {}
    failures: list[str] = []
    with ThreadPoolExecutor(max_workers=worker_count) as executor:
        future_by_id = {
            executor.submit(prepare, task["task_id"], force=force): task["task_id"]
            for task in tasks
        }
        for future in as_completed(future_by_id):
            task_id = future_by_id[future]
            try:
                outputs[task_id] = future.result()
            except Exception as error:
                failures.append(f"{task_id}: {error}")
    if failures:
        raise BatchPreparationError("batch preparation failed:\n" + "\n".join(failures))

    first = tasks[0]
    locator = {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "source_group": group,
        "source_path": first["source"]["path"],
        "source_sha256": first["source"]["sha256"],
        "source_version": first["source"].get("version"),
        "task_ids": [task["task_id"] for task in tasks],
        "tasks": [
            {
                "task_id": task["task_id"],
                "source_locations": task["source"]["locations"],
            }
            for task in tasks
        ],
        "evidence_policy": (
            "Use only the immutable source and surrounding source context. "
            "Do not inspect Lean targets, metadata paraphrases, or context notes."
        ),
    }
    ordered_outputs: list[Path] = []
    for task in tasks:
        output = outputs[task["task_id"]]
        locator_path = output / "inputs" / "batch_source_locator.json"
        write_json(locator_path, locator)
        manifest_path = output / "manifest.json"
        manifest = load_json(manifest_path)
        manifest["source_batch"] = {
            "source_group": group,
            "task_ids": locator["task_ids"],
            "source_locator": file_record(locator_path, config),
        }
        manifest["inputs"]["batch_source_locator"] = file_record(locator_path, config)
        write_json(manifest_path, manifest)
        ordered_outputs.append(output)
    return ordered_outputs


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source_group")
    parser.add_argument("--force", action="store_true")
    parser.add_argument("--jobs", type=int)
    return parser


def main() -> int:
    args = make_parser().parse_args()
    try:
        outputs = prepare_batch(args.source_group, force=args.force, jobs=args.jobs)
    except (OSError, AuditError, ValueError) as error:
        print(f"batch preparation error: {error}", file=sys.stderr)
        return 2
    for output in outputs:
        print(output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
