"""Shared configuration, hashing, and classification helpers."""

from __future__ import annotations

import hashlib
import json
import os
import re
from pathlib import Path
from typing import Any


AUDIT_SCHEMA_VERSION = "formalization-faithfulness-1"
CONFIG_SCHEMA_VERSION = "formalization-faithfulness-config-1"
TASK_SCHEMA_VERSION = "formalization-faithfulness-task-1"
CHECKS_SCHEMA_VERSION = "formalization-faithfulness-checks-1"

TASK_ID_RE = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._:-]{0,127}$")
CHECK_ID_RE = re.compile(r"^[A-Z][A-Z0-9_-]{1,15}$")
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")

CLASSIFICATIONS = (
    "faithful-equivalent",
    "faithful-stronger",
    "not-faithful-weaker",
    "not-faithful-different",
    "undetermined",
)
ACCEPTED_CLASSIFICATIONS = {"faithful-equivalent", "faithful-stronger"}

SCRIPT_DIR = Path(__file__).resolve().parent
AUDIT_ROOT = SCRIPT_DIR.parent


class AuditError(RuntimeError):
    """Raised when framework inputs violate the repository contract."""


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def sha256_text(value: str) -> str:
    return hashlib.sha256(value.encode("utf-8")).hexdigest()


def load_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise AuditError(f"cannot read JSON {path}: {error}") from error
    if not isinstance(value, dict):
        raise AuditError(f"expected a JSON object in {path}")
    return value


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(
        json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n",
        encoding="utf-8",
    )
    temporary.replace(path)


def config_path() -> Path:
    configured = os.environ.get("FAITHFULNESS_AUDIT_CONFIG")
    return Path(configured).expanduser().resolve() if configured else AUDIT_ROOT / "audit.config.json"


def resolve_under(root: Path, value: str, *, label: str) -> Path:
    candidate = (root / value).resolve() if not Path(value).is_absolute() else Path(value).resolve()
    try:
        candidate.relative_to(root.resolve())
    except ValueError as error:
        raise AuditError(f"{label} escapes configured repository root: {value}") from error
    return candidate


def load_config(path: Path | None = None) -> dict[str, Any]:
    path = (path or config_path()).resolve()
    config = load_json(path)
    if config.get("schema_version") != CONFIG_SCHEMA_VERSION:
        raise AuditError(f"unsupported configuration schema in {path}")

    repository_text = config.get("repository_root")
    if not isinstance(repository_text, str) or not repository_text:
        raise AuditError("configuration requires repository_root")
    repository_root = (AUDIT_ROOT / repository_text).resolve()
    if not repository_root.is_dir():
        raise AuditError(f"repository_root is not a directory: {repository_root}")

    task_glob = config.get("task_metadata_glob")
    if not isinstance(task_glob, str) or not task_glob:
        raise AuditError("configuration requires task_metadata_glob")

    check_files = config.get("semantic_check_files")
    if not isinstance(check_files, list) or not check_files or not all(isinstance(item, str) for item in check_files):
        raise AuditError("semantic_check_files must be a nonempty string list")

    lean = config.get("lean")
    if not isinstance(lean, dict):
        raise AuditError("configuration requires a lean object")
    command = lean.get("command")
    roots = lean.get("module_source_roots")
    environment_files = lean.get("environment_files")
    if not isinstance(command, list) or not command or not all(isinstance(item, str) and item for item in command):
        raise AuditError("lean.command must be a nonempty string list")
    if not isinstance(roots, list) or not roots or not all(isinstance(item, str) and item for item in roots):
        raise AuditError("lean.module_source_roots must be a nonempty string list")
    if not isinstance(environment_files, list) or not all(isinstance(item, str) and item for item in environment_files):
        raise AuditError("lean.environment_files must be a string list")

    return {
        **config,
        "_config_path": path,
        "_repository_root": repository_root,
        "_module_source_roots": [resolve_under(repository_root, item, label="module source root") for item in roots],
        "_environment_paths": [resolve_under(repository_root, item, label="environment file") for item in environment_files],
        "_check_paths": [(AUDIT_ROOT / item).resolve() for item in check_files],
    }


def repository_root(config: dict[str, Any]) -> Path:
    value = config.get("_repository_root")
    if not isinstance(value, Path):
        raise AuditError("configuration has not been loaded through load_config")
    return value


def repository_relative(path: Path, config: dict[str, Any]) -> str:
    try:
        return path.resolve().relative_to(repository_root(config)).as_posix()
    except ValueError as error:
        raise AuditError(f"path is outside repository: {path}") from error


def discover_tasks(config: dict[str, Any]) -> dict[str, tuple[Path, dict[str, Any]]]:
    root = repository_root(config)
    found: dict[str, tuple[Path, dict[str, Any]]] = {}
    for path in sorted(root.glob(str(config["task_metadata_glob"]))):
        if not path.is_file():
            continue
        task = load_json(path)
        task_id = task.get("task_id")
        if not isinstance(task_id, str) or TASK_ID_RE.fullmatch(task_id) is None:
            raise AuditError(f"invalid task_id in {path}: {task_id!r}")
        if task_id in found:
            raise AuditError(f"duplicate task_id {task_id!r}: {found[task_id][0]} and {path}")
        found[task_id] = (path.resolve(), task)
    return found


def validate_task_metadata(path: Path, task: dict[str, Any], config: dict[str, Any]) -> dict[str, Any]:
    if task.get("schema_version") != TASK_SCHEMA_VERSION:
        raise AuditError(f"unsupported task schema in {path}")
    task_id = task.get("task_id")
    if not isinstance(task_id, str) or TASK_ID_RE.fullmatch(task_id) is None:
        raise AuditError(f"invalid task_id in {path}: {task_id!r}")

    target = task.get("target")
    source = task.get("source")
    output_text = task.get("audit_output")
    if not isinstance(target, dict) or not isinstance(source, dict):
        raise AuditError(f"{task_id}: target and source must be objects")
    if not isinstance(output_text, str) or not output_text:
        raise AuditError(f"{task_id}: audit_output is required")

    target_text = target.get("path")
    declaration = target.get("declaration")
    source_text = source.get("path")
    source_hash = source.get("sha256")
    locations = source.get("locations")
    if not isinstance(target_text, str) or not isinstance(declaration, str) or not declaration:
        raise AuditError(f"{task_id}: target path and declaration are required")
    if not isinstance(source_text, str) or not isinstance(source_hash, str) or SHA256_RE.fullmatch(source_hash) is None:
        raise AuditError(f"{task_id}: source path and exact SHA-256 are required")
    if not isinstance(locations, list) or not locations:
        raise AuditError(f"{task_id}: source.locations must be nonempty")
    for index, location in enumerate(locations, start=1):
        if not isinstance(location, dict) or not all(isinstance(location.get(key), str) and location.get(key) for key in ("location", "anchor")):
            raise AuditError(f"{task_id}: invalid source location {index}")

    root = repository_root(config)
    target_path = resolve_under(root, target_text, label=f"{task_id} target")
    source_path = resolve_under(root, source_text, label=f"{task_id} source")
    output_path = resolve_under(root, output_text, label=f"{task_id} audit output")
    if not target_path.is_file():
        raise AuditError(f"{task_id}: missing target {target_path}")
    if not source_path.is_file():
        raise AuditError(f"{task_id}: missing source {source_path}")

    context_record: dict[str, Any] | None = None
    context = task.get("context")
    if context is not None:
        if not isinstance(context, dict) or not isinstance(context.get("path"), str):
            raise AuditError(f"{task_id}: context must contain a path")
        if context.get("semantic_evidence") is not False:
            raise AuditError(f"{task_id}: context.semantic_evidence must be false")
        context_path = resolve_under(root, context["path"], label=f"{task_id} context")
        if not context_path.is_file():
            raise AuditError(f"{task_id}: missing context {context_path}")
        context_record = {**context, "_path": context_path}

    source_group = task.get("source_group")
    if source_group is not None and (not isinstance(source_group, str) or not source_group):
        raise AuditError(f"{task_id}: source_group must be a nonempty string")

    return {
        **task,
        "_metadata_path": path.resolve(),
        "_target_path": target_path,
        "_source_path": source_path,
        "_output_path": output_path,
        "_context": context_record,
    }


def load_task(task_ref: str, config: dict[str, Any] | None = None) -> dict[str, Any]:
    config = config or load_config()
    candidate = Path(task_ref).expanduser()
    if candidate.is_file():
        path = candidate.resolve()
        task = load_json(path)
    else:
        tasks = discover_tasks(config)
        if task_ref not in tasks:
            available = ", ".join(sorted(tasks)) or "none"
            raise AuditError(f"unknown task {task_ref!r}; available tasks: {available}")
        path, task = tasks[task_ref]
    return validate_task_metadata(path, task, config)


def task_paths(task_ref: str, config: dict[str, Any] | None = None) -> tuple[dict[str, Any], Path]:
    task = load_task(task_ref, config)
    return task, task["_output_path"]


def load_semantic_checks(config: dict[str, Any]) -> tuple[list[dict[str, str]], list[Path]]:
    checks: list[dict[str, str]] = []
    seen: set[str] = set()
    paths = config.get("_check_paths")
    if not isinstance(paths, list):
        raise AuditError("configuration check paths are unavailable")
    for path in paths:
        if not isinstance(path, Path) or not path.is_file():
            raise AuditError(f"missing semantic check file: {path}")
        profile = load_json(path)
        if profile.get("schema_version") != CHECKS_SCHEMA_VERSION:
            raise AuditError(f"unsupported semantic-check schema in {path}")
        records = profile.get("checks")
        if not isinstance(records, list) or not records:
            raise AuditError(f"semantic-check profile has no checks: {path}")
        for record in records:
            if not isinstance(record, dict):
                raise AuditError(f"non-object semantic check in {path}")
            item_id = record.get("id")
            name = record.get("name")
            requirement = record.get("requirement")
            if not isinstance(item_id, str) or CHECK_ID_RE.fullmatch(item_id) is None:
                raise AuditError(f"invalid semantic check ID in {path}: {item_id!r}")
            if item_id in seen:
                raise AuditError(f"duplicate semantic check ID {item_id}")
            if not isinstance(name, str) or not name or not isinstance(requirement, str) or not requirement:
                raise AuditError(f"incomplete semantic check {item_id} in {path}")
            seen.add(item_id)
            checks.append({"id": item_id, "name": name, "requirement": requirement})
    return checks, paths


def implication_classification(first: str, second: str) -> str:
    if "unclear" in (first, second):
        return "undetermined"
    try:
        return {
            ("yes", "yes"): "faithful-equivalent",
            ("yes", "no"): "faithful-stronger",
            ("no", "yes"): "not-faithful-weaker",
            ("no", "no"): "not-faithful-different",
        }[(first, second)]
    except KeyError as error:
        raise AuditError(f"invalid implication verdicts: {first!r}, {second!r}") from error


def file_record(path: Path, config: dict[str, Any]) -> dict[str, str]:
    return {"path": repository_relative(path, config), "sha256": sha256_file(path)}
