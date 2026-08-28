#!/usr/bin/env python3
"""Validate framework configuration and discover auditable tasks."""

from __future__ import annotations

import sys

try:
    from .common import AuditError, discover_tasks, load_config, load_semantic_checks, validate_task_metadata
except ImportError:
    from common import AuditError, discover_tasks, load_config, load_semantic_checks, validate_task_metadata  # type: ignore


def main() -> int:
    try:
        config = load_config()
        checks, paths = load_semantic_checks(config)
        tasks = discover_tasks(config)
        for path, task in tasks.values():
            validate_task_metadata(path, task, config)
        for path in config["_environment_paths"]:
            if not path.is_file():
                raise AuditError(f"missing configured environment file: {path}")
    except (OSError, AuditError) as error:
        print(f"setup error: {error}", file=sys.stderr)
        return 2
    print(f"configuration: {config['_config_path']}")
    print(f"repository: {config['_repository_root']}")
    print(f"tasks: {len(tasks)}")
    print(f"semantic checks: {len(checks)} from {len(paths)} profile(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
