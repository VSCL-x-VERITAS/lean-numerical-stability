"""Small JSON Schema validator for the schema subset used by this kit."""

from __future__ import annotations

import json
import re
from typing import Any


def _type_matches(value: Any, expected: str) -> bool:
    return {
        "object": isinstance(value, dict),
        "array": isinstance(value, list),
        "string": isinstance(value, str),
        "integer": isinstance(value, int) and not isinstance(value, bool),
        "number": isinstance(value, (int, float)) and not isinstance(value, bool),
        "boolean": isinstance(value, bool),
        "null": value is None,
    }.get(expected, False)


def _resolve_ref(root: dict[str, Any], reference: str) -> dict[str, Any]:
    if not reference.startswith("#/"):
        raise ValueError(f"only local JSON Schema references are supported: {reference}")
    value: Any = root
    for segment in reference[2:].split("/"):
        segment = segment.replace("~1", "/").replace("~0", "~")
        value = value[segment]
    if not isinstance(value, dict):
        raise ValueError(f"schema reference is not an object: {reference}")
    return value


def _validate(
    value: Any,
    schema: dict[str, Any],
    root: dict[str, Any],
    path: str,
) -> list[str]:
    if "$ref" in schema:
        return _validate(value, _resolve_ref(root, str(schema["$ref"])), root, path)

    if "oneOf" in schema:
        branches = schema["oneOf"]
        results = [_validate(value, branch, root, path) for branch in branches]
        passing = [errors for errors in results if not errors]
        if len(passing) == 1:
            return []
        if not passing:
            shortest = min(results, key=len)
            return [f"{path}: matches no oneOf branch", *shortest]
        return [f"{path}: matches more than one oneOf branch"]

    errors: list[str] = []
    expected_type = schema.get("type")
    if expected_type is not None:
        expected = expected_type if isinstance(expected_type, list) else [expected_type]
        if not any(isinstance(item, str) and _type_matches(value, item) for item in expected):
            return [f"{path}: expected type {expected_type!r}, got {type(value).__name__}"]

    if "const" in schema and value != schema["const"]:
        errors.append(f"{path}: expected constant {schema['const']!r}, got {value!r}")
    if "enum" in schema and value not in schema["enum"]:
        errors.append(f"{path}: value {value!r} is outside enum")

    if isinstance(value, str):
        minimum = schema.get("minLength")
        if isinstance(minimum, int) and len(value) < minimum:
            errors.append(f"{path}: string is shorter than {minimum}")
        pattern = schema.get("pattern")
        if isinstance(pattern, str) and re.search(pattern, value) is None:
            errors.append(f"{path}: string does not match {pattern!r}")

    if isinstance(value, list):
        minimum = schema.get("minItems")
        maximum = schema.get("maxItems")
        if isinstance(minimum, int) and len(value) < minimum:
            errors.append(f"{path}: array has fewer than {minimum} items")
        if isinstance(maximum, int) and len(value) > maximum:
            errors.append(f"{path}: array has more than {maximum} items")
        if schema.get("uniqueItems") is True:
            rendered = [json.dumps(item, sort_keys=True, ensure_ascii=True) for item in value]
            if len(rendered) != len(set(rendered)):
                errors.append(f"{path}: array items are not unique")
        item_schema = schema.get("items")
        if isinstance(item_schema, dict):
            for index, item in enumerate(value):
                errors.extend(_validate(item, item_schema, root, f"{path}[{index}]"))

    if isinstance(value, dict):
        required = schema.get("required", [])
        if isinstance(required, list):
            for key in required:
                if key not in value:
                    errors.append(f"{path}: missing required property {key!r}")
        properties = schema.get("properties", {})
        if isinstance(properties, dict):
            for key, property_schema in properties.items():
                if key in value and isinstance(property_schema, dict):
                    errors.extend(_validate(value[key], property_schema, root, f"{path}.{key}"))
            if schema.get("additionalProperties") is False:
                unexpected = sorted(set(value) - set(properties))
                for key in unexpected:
                    errors.append(f"{path}: unexpected property {key!r}")

    return errors


def validate_schema(value: Any, schema: dict[str, Any], *, label: str = "$") -> list[str]:
    return _validate(value, schema, schema, label)
