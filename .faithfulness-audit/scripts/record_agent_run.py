#!/usr/bin/env python3
"""Record runtime provenance for one stateless audit-agent invocation."""

from __future__ import annotations

import argparse
import sys
from datetime import datetime, timezone
from pathlib import Path

try:
    from .common import AUDIT_SCHEMA_VERSION, AuditError, load_config, load_json, load_task, write_json
except ImportError:
    from common import AUDIT_SCHEMA_VERSION, AuditError, load_config, load_json, load_task, write_json  # type: ignore


ROLES = {
    "source-contract",
    "batch-source-contract",
    "blind-translation",
    "direct-judge",
    "roundtrip-judge",
    "adjudicator",
}


def record(
    task_ref: str,
    role: str,
    *,
    model: str | None,
    reasoning_effort: str | None,
    agent_id: str | None,
    runtime: str,
    started_at: str | None,
    completed_at: str | None,
    notes: str | None,
) -> Path:
    if role not in ROLES:
        raise AuditError(f"invalid agent role: {role}")
    config = load_config()
    task = load_task(task_ref, config)
    output = task["_output_path"] / "agent_outputs" / "agent_runs.json"
    if output.is_file():
        value = load_json(output)
        if value.get("schema_version") != AUDIT_SCHEMA_VERSION or value.get("task_id") != task["task_id"]:
            raise AuditError("existing agent_runs.json belongs to a different audit")
    else:
        value = {"schema_version": AUDIT_SCHEMA_VERSION, "task_id": task["task_id"], "runs": []}
    runs = value.get("runs")
    if not isinstance(runs, list):
        raise AuditError("agent_runs.json has an invalid runs field")
    now = datetime.now(timezone.utc).isoformat()
    runs.append(
        {
            "role": role,
            "model": model,
            "reasoning_effort": reasoning_effort,
            "agent_id": agent_id,
            "runtime": runtime,
            "started_at_utc": started_at,
            "completed_at_utc": completed_at or now,
            "notes": notes,
        }
    )
    write_json(output, value)
    return output


def make_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task")
    parser.add_argument("role", choices=sorted(ROLES))
    parser.add_argument("--model", help="exact model identifier reported by the runtime")
    parser.add_argument("--reasoning-effort")
    parser.add_argument("--agent-id")
    parser.add_argument("--runtime", default="Codex internal agent")
    parser.add_argument("--started-at")
    parser.add_argument("--completed-at")
    parser.add_argument("--notes")
    return parser


def main() -> int:
    args = make_parser().parse_args()
    try:
        path = record(
            args.task,
            args.role,
            model=args.model,
            reasoning_effort=args.reasoning_effort,
            agent_id=args.agent_id,
            runtime=args.runtime,
            started_at=args.started_at,
            completed_at=args.completed_at,
            notes=args.notes,
        )
    except (OSError, AuditError) as error:
        print(f"agent provenance error: {error}", file=sys.stderr)
        return 2
    print(path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
