from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path


KIT_ROOT = Path(__file__).resolve().parents[1]
SCRIPT_DIR = KIT_ROOT / "scripts"
sys.path.insert(0, str(SCRIPT_DIR))

from apply_dependency_reuse import dossier_sections
from common import (
    ACCEPTED_CLASSIFICATIONS,
    AUDIT_SCHEMA_VERSION,
    implication_classification,
    load_json,
)
from prepare_audit import declaration_source, dependency_fingerprint, direct_imports
from schema_validate import validate_schema
from validate_audit import output_requires_adjudication


def write_mock_outputs(audit_dir: Path, model: str = "test-model") -> None:
    """Write structurally valid equivalent outputs for integration testing only."""
    manifest = load_json(audit_dir / "manifest.json")
    outputs = audit_dir / "agent_outputs"
    outputs.mkdir(parents=True, exist_ok=True)
    source = {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "role": "source-contract",
        "task_id": manifest["task_id"],
        "source_sha256": manifest["source"]["sha256"],
        "source_evidence": [
            {
                "location": "integration fixture",
                "anchor": "fixture",
                "observation": "Synthetic source contract used only to test plumbing.",
            }
        ],
        "statement": {
            "binders": [],
            "hypotheses": [],
            "conclusions": ["Synthetic conclusion."],
            "definitions_and_conventions": [],
            "implicit_context": [],
            "semantic_facets": [],
        },
        "undebatable_constraints": ["Synthetic integration fixture only."],
        "ambiguities": [],
        "contract_plain_english": "Synthetic source contract used only to test finalization.",
    }
    blind_coverage = [
        {
            "id": dependency["id"],
            "name": dependency["blind_name"],
            "meaning": "Synthetic dependency meaning.",
            "effect_on_target": "Synthetic dependency effect.",
            "status": "understood",
        }
        for dependency in manifest["dependencies"]
    ]
    blind = {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "role": "blind-translation",
        "dossier_sha256": manifest["inputs"]["blind_review_packet"]["sha256"],
        "dependency_coverage": blind_coverage,
        "translation": {
            "binders": [],
            "hypotheses": [],
            "conclusions": ["Synthetic conclusion."],
            "mathematical_definitions": [],
            "proposition_plain_english": "Synthetic translated proposition.",
        },
        "restrictions_and_vacuity_risks": [],
        "ambiguities": [],
    }
    direct_coverage = [
        {
            "id": dependency["id"],
            "name": dependency["name"],
            "interpretation": "Synthetic dependency interpretation.",
            "effect_on_target": "Synthetic dependency effect.",
            "source_match": "Synthetic source match.",
            "status": "pass",
        }
        for dependency in manifest["dependencies"]
    ]
    direct_checks = [
        {
            "id": check["id"],
            "status": "pass",
            "source_evidence": "Synthetic source evidence.",
            "lean_evidence": "Synthetic Lean evidence.",
            "reasoning": "Synthetic checklist reasoning.",
        }
        for check in manifest["semantic_checks"]
    ]
    direct = {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "role": "direct-judge",
        "task_id": manifest["task_id"],
        "source_sha256": manifest["source"]["sha256"],
        "dossier_sha256": manifest["inputs"]["direct_review_packet"]["sha256"],
        "dependency_coverage": direct_coverage,
        "semantic_checklist": direct_checks,
        "implications": {
            "lean_implies_source": {"verdict": "yes", "reasoning": "Synthetic equivalence."},
            "source_implies_lean": {"verdict": "yes", "reasoning": "Synthetic equivalence."},
        },
        "classification": "faithful-equivalent",
        "accepted": True,
        "requires_adjudication": False,
        "findings": [],
        "rationale": "Synthetic equivalent result used only for integration testing.",
    }
    roundtrip_checks = [
        {
            "id": check["id"],
            "status": "pass",
            "source_evidence": "Synthetic source evidence.",
            "translation_evidence": "Synthetic translation evidence.",
            "reasoning": "Synthetic checklist reasoning.",
        }
        for check in manifest["semantic_checks"]
    ]
    roundtrip = {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "role": "roundtrip-judge",
        "task_id": manifest["task_id"],
        "source_sha256": manifest["source"]["sha256"],
        "blind_translation_sha256": "",
        "semantic_checklist": roundtrip_checks,
        "implications": {
            "translation_implies_source": {"verdict": "yes", "reasoning": "Synthetic equivalence."},
            "source_implies_translation": {"verdict": "yes", "reasoning": "Synthetic equivalence."},
        },
        "classification": "faithful-equivalent",
        "accepted": True,
        "requires_adjudication": False,
        "findings": [],
        "rationale": "Synthetic equivalent result used only for integration testing.",
    }
    for name, value in (
        ("source_contract.json", source),
        ("blind_translation.json", blind),
        ("direct_judge.json", direct),
    ):
        (outputs / name).write_text(json.dumps(value, indent=2) + "\n", encoding="utf-8")
    import hashlib

    roundtrip["blind_translation_sha256"] = hashlib.sha256(
        (outputs / "blind_translation.json").read_bytes()
    ).hexdigest()
    (outputs / "roundtrip_judge.json").write_text(
        json.dumps(roundtrip, indent=2) + "\n", encoding="utf-8"
    )
    runs = {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "task_id": manifest["task_id"],
        "runs": [
            {
                "role": role,
                "model": model,
                "reasoning_effort": "test",
                "agent_id": f"test-{role}",
                "runtime": "unit-test fixture",
                "started_at_utc": None,
                "completed_at_utc": "2026-01-01T00:00:00+00:00",
                "notes": "Synthetic provenance.",
            }
            for role in (
                "source-contract",
                "blind-translation",
                "direct-judge",
                "roundtrip-judge",
            )
        ],
    }
    (outputs / "agent_runs.json").write_text(
        json.dumps(runs, indent=2) + "\n", encoding="utf-8"
    )


def write_mock_batch_source_contract(audit_dir: Path, output: Path) -> None:
    """Write a structurally valid variable-size batch source response."""
    import hashlib

    locator_path = audit_dir / "inputs" / "batch_source_locator.json"
    locator = load_json(locator_path)
    batch = {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "role": "batch-source-contract",
        "source_group": locator["source_group"],
        "source_sha256": locator["source_sha256"],
        "source_locator_sha256": hashlib.sha256(locator_path.read_bytes()).hexdigest(),
        "task_ids": locator["task_ids"],
        "contracts": [
            {
                "task_id": task_id,
                "source_evidence": [
                    {
                        "location": "integration fixture",
                        "anchor": "fixture",
                        "observation": "Synthetic batch contract.",
                    }
                ],
                "statement": {
                    "binders": [],
                    "hypotheses": [],
                    "conclusions": ["Synthetic conclusion."],
                    "definitions_and_conventions": [],
                    "implicit_context": [],
                    "semantic_facets": [],
                },
                "undebatable_constraints": ["Synthetic integration fixture only."],
                "ambiguities": [],
                "contract_plain_english": f"Synthetic contract for {task_id}.",
            }
            for task_id in locator["task_ids"]
        ],
    }
    output.write_text(json.dumps(batch, indent=2) + "\n", encoding="utf-8")


class FrameworkTests(unittest.TestCase):
    def test_implication_classification(self) -> None:
        self.assertEqual(implication_classification("yes", "yes"), "faithful-equivalent")
        self.assertEqual(implication_classification("yes", "no"), "faithful-stronger")
        self.assertEqual(implication_classification("no", "yes"), "not-faithful-weaker")
        self.assertEqual(implication_classification("no", "no"), "not-faithful-different")
        self.assertEqual(implication_classification("unclear", "yes"), "undetermined")
        self.assertEqual(ACCEPTED_CLASSIFICATIONS, {"faithful-equivalent", "faithful-stronger"})

    def test_import_parser(self) -> None:
        source = "import Local.Core Local.Extra -- both local\n-- import Ignored.Module\nnamespace Example\n"
        self.assertEqual(direct_imports(source), ["Local.Core", "Local.Extra"])

    def test_declaration_extraction_excludes_proof(self) -> None:
        source = "namespace Example\nlemma result (n : Nat) : n = n := by\n  rfl\nend Example\n"
        extracted = declaration_source(source, "Example.result")
        self.assertIn("lemma result", extracted)
        self.assertNotIn("rfl", extracted)
        self.assertNotIn(":=", extracted)

    def test_dependency_fingerprint_ignores_local_id_and_distance(self) -> None:
        base = {
            "id": "D001",
            "distance": 1,
            "role": "local",
            "name": "Example.value",
            "owner_module": "Example.Core",
            "kind": "def",
            "type_readable": "Nat",
            "type_explicit": "Nat",
            "body_readable": "1",
        }
        moved = {**base, "id": "D099", "distance": 8}
        changed = {**base, "body_readable": "2"}
        self.assertEqual(dependency_fingerprint(base), dependency_fingerprint(moved))
        self.assertNotEqual(dependency_fingerprint(base), dependency_fingerprint(changed))

    def test_dossier_sections_are_exact(self) -> None:
        prefix, sections = dossier_sections(
            "# Packet\n\n### D001: `A`\n\nfirst\n\n### D002: `B`\n\nsecond\n"
        )
        self.assertEqual(prefix, "# Packet\n\n")
        self.assertEqual(list(sections), ["D001", "D002"])
        self.assertNotIn("D002", sections["D001"])

    def test_source_ambiguity_alone_does_not_trigger_adjudication(self) -> None:
        source = {"ambiguities": [{"issue": "notation"}]}
        blind = {"ambiguities": ["binder"], "dependency_coverage": []}
        direct = {
            "classification": "faithful-equivalent",
            "requires_adjudication": False,
            "dependency_coverage": [],
            "semantic_checklist": [],
            "implications": {},
        }
        roundtrip = {
            "classification": "faithful-equivalent",
            "requires_adjudication": False,
            "semantic_checklist": [],
            "implications": {},
        }
        self.assertEqual(output_requires_adjudication(source, blind, direct, roundtrip), [])

    def test_disagreement_triggers_adjudication(self) -> None:
        source = {"ambiguities": []}
        blind = {"dependency_coverage": []}
        direct = {
            "classification": "faithful-equivalent",
            "requires_adjudication": False,
            "dependency_coverage": [],
            "semantic_checklist": [],
            "implications": {},
        }
        roundtrip = {
            "classification": "not-faithful-weaker",
            "requires_adjudication": False,
            "semantic_checklist": [],
            "implications": {},
        }
        self.assertIn(
            "judge classifications differ",
            output_requires_adjudication(source, blind, direct, roundtrip),
        )

    def test_all_json_files_parse(self) -> None:
        files = [
            *KIT_ROOT.glob("*.json"),
            *(KIT_ROOT / "checks").glob("*.json"),
            *(KIT_ROOT / "schemas").glob("*.json"),
        ]
        for path in files:
            json.loads(path.read_text(encoding="utf-8"))

    def test_schema_validator_rejects_extra_properties(self) -> None:
        schema = {
            "type": "object",
            "additionalProperties": False,
            "required": ["name"],
            "properties": {"name": {"type": "string", "minLength": 1}},
        }
        self.assertEqual(validate_schema({"name": "valid"}, schema), [])
        self.assertTrue(validate_schema({"name": "valid", "extra": True}, schema))

    def test_skill_has_no_scaffold_markers(self) -> None:
        skill = KIT_ROOT / "skill" / "formalization-faithfulness-audit" / "SKILL.md"
        text = skill.read_text(encoding="utf-8")
        self.assertNotIn("TODO", text)
        self.assertIn("fork_context: false", text)
        self.assertIn("not-applicable", text)

    def test_researcher_handoff_is_self_contained(self) -> None:
        required = {
            "START_HERE.md",
            "PROMPT_FOR_AGENT.txt",
            "README.md",
            "METHODOLOGY.md",
            "REFERENCES.md",
            "audit.config.example.json",
            "audit-task.example.json",
        }
        self.assertFalse([name for name in required if not (KIT_ROOT / name).is_file()])
        start = (KIT_ROOT / "START_HERE.md").read_text(encoding="utf-8")
        for name in required - {"START_HERE.md"}:
            self.assertIn(name, start)
        references = (KIT_ROOT / "REFERENCES.md").read_text(encoding="utf-8")
        self.assertIn("https://arxiv.org/abs/2606.14000", references)


if __name__ == "__main__":
    unittest.main()
