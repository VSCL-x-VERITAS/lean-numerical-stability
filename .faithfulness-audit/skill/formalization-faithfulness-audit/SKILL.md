---
name: formalization-faithfulness-audit
description: Run reproducible, multi-agent audits of Lean theorem statements against selected results in books, papers, or other immutable source documents. Use when asked to check whether a formal target faithfully represents its configured source claim, including blind translation, imported-definition coverage, direct and round-trip judging, adjudication, and hash-bound audit artifacts.
---

# Audit a Lean Formalization Against Its Source

Audit propositions only. Do not edit Lean targets, imported definitions, task
metadata, source documents, or proofs. Write only inside the configured audit
output directory.

## Locate the framework

Starting at the repository root, find `.faithfulness-audit/audit.config.json`.
If it is absent, read `.faithfulness-audit/START_HERE.md` or the extracted
package's `START_HERE.md` and complete setup before attempting an audit. If the
framework is installed under another path, use the path named by the user. Read
these files before running any role:

- `.faithfulness-audit/METHODOLOGY.md`;
- `.faithfulness-audit/prompts/*.md`;
- `.faithfulness-audit/schemas/*.json`;
- the selected task's `audit-task.json`.

Treat the methodology as canonical. This skill supplies orchestration.

## Preserve audit provenance

Run preparation without `--force` first:

```bash
python3 .faithfulness-audit/scripts/prepare_audit.py TASK-ID
python3 .faithfulness-audit/scripts/validate_audit.py TASK-ID --phase prepared
```

Reuse a valid prepared or completed bundle. Use `--force` only when the user
requests a fresh audit or a controlled input changed. Forced preparation must
archive prior artifacts rather than delete them.

## Enforce role isolation

Use fresh internal agents with inherited conversation disabled
(`fork_context: false`, or the equivalent isolation option). Do not pin a model
unless the user asks; record the model returned by the agent runtime when that
information is available.

Only the orchestrator writes files. Agents return bare JSON. Validate every
role output before another role consumes it. Retry malformed output with a new
stateless agent, never by continuing the invalid role's conversation.

After every role finishes, record runtime provenance. Use the exact model,
reasoning effort, and agent ID reported by the runtime; use a null field plus a
note when the runtime does not expose one:

```bash
python3 .faithfulness-audit/scripts/record_agent_run.py TASK-ID ROLE \
  --model MODEL --reasoning-effort EFFORT --agent-id AGENT-ID
```

### Blind translator

Supply only:

1. `prompts/blind_translation.md`;
2. `schemas/blind_translation.schema.json`;
3. the SHA-256 of `inputs/blind_review_packet.md`;
4. the complete packet inline.

Explicitly prohibit tools, filesystem inspection, task identity, source
identity, source text, target source, proof, metadata, prior outputs, and
conversation history.

## Single-task schedule

1. Prepare and validate the task.
2. Spawn a source-contract extractor and blind translator concurrently.
3. Write their JSON to `agent_outputs/source_contract.json` and
   `agent_outputs/blind_translation.json`; validate both.
4. Spawn direct and round-trip judges concurrently. The direct judge receives
   the source locator, source contract, semantic checklist, and complete direct
   review packet. The round-trip judge receives the source locator, source
   contract, semantic checklist, and blind translation, but no Lean material.
5. Write and validate `direct_judge.json` and `roundtrip_judge.json`.
6. Check whether adjudication is required:

```bash
python3 .faithfulness-audit/scripts/finalize_audit.py TASK-ID --check-adjudication
```

Exit code `3` means a fresh adjudicator is required. Give it the exact trigger
reasons, primary source, complete direct and blind dossiers, source contract,
blind translation, and both judgments. Validate `adjudicator.json`.

7. Finalize and validate:

```bash
python3 .faithfulness-audit/scripts/finalize_audit.py TASK-ID
python3 .faithfulness-audit/scripts/validate_audit.py TASK-ID --phase complete
```

## Source-batch schedule

For tasks sharing one source file and `source_group`, prepare the group:

```bash
python3 .faithfulness-audit/scripts/prepare_batch_audit.py GROUP-ID
```

Spawn one batch source-contract agent and one blind translator per task in
parallel. Validate and split the batch source output with:

```bash
python3 .faithfulness-audit/scripts/split_batch_source_contract.py \
  /path/to/batch_source_contract.json
```

Continue with independent direct and round-trip judges per task. Exact
declaration meanings may be reused only through
`apply_dependency_reuse.py`; reuse is SHA-256 bound and never copies a
task-specific faithfulness decision.

Record the shared batch-source agent run in every task-local `agent_runs.json`
using the same reported agent ID and model. To reuse an already validated
declaration ledger:

```bash
python3 .faithfulness-audit/scripts/apply_dependency_reuse.py TARGET-ID \
  --source SOURCE-ID --role direct
```

## Decision rules

Every judge decides both implication directions. Use only:

- `faithful-equivalent`: both directions hold;
- `faithful-stronger`: Lean implies the source but not conversely, and the
  difference is genuine nonvacuous strength;
- `not-faithful-weaker`: the source implies Lean but Lean does not imply it;
- `not-faithful-different`: neither direction holds;
- `undetermined`: at least one direction remains unclear.

Additional hypotheses or a smaller domain are reduced applicability, not a
stronger theorem. Optional semantic checks may be `not-applicable`; explain why
and do not reject a task merely because a domain-specific check does not apply.

## Finish cleanly

Sanity-check that every dependency and semantic-check ID occurs exactly once,
all hashes still match, accepted classifications are only equivalent or
genuinely stronger, and the report identifies consequential differences. State
which model ran each role, or explicitly state that the runtime did not expose
it. State that benchmark inputs were not changed. Commit or push only when
explicitly requested.
