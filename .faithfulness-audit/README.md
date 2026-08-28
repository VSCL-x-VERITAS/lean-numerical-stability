# Formalization Faithfulness Audit Kit

For a handoff to another researcher or agent, begin with `START_HERE.md`. It
contains a paste-ready prompt and the complete setup order.

This package audits whether a Lean theorem statement represents a selected
claim from an immutable source document. It separates kernel correctness from
statement faithfulness: Lean may accept a theorem that omits hypotheses,
conclusions, algorithmic meaning, or other essential source semantics.

The package is source-agnostic. A source may be a book, paper, report, or other
local immutable document. Task IDs, repository layout, source groups, and
domain-specific checks are configurable. The implementation is Lean-specific
because it uses Lean's environment to inspect elaborated theorem types and the
semantic closure of imported declarations.

## What is included

```text
formalization-faithfulness-audit-kit/
  VERSION
  START_HERE.md
  PROMPT_FOR_AGENT.txt
  README.md
  METHODOLOGY.md
  REFERENCES.md
  audit.config.example.json
  audit-task.example.json
  checks/
  prompts/
  schemas/
  scripts/
  skill/formalization-faithfulness-audit/
  tests/
```

The skill orchestrates fresh agents. The methodology defines the evidence and
classification policy. The scripts prepare hash-bound evidence, inspect Lean
declarations, validate role outputs, adjudicate disagreements, and render final
reports.

## Methodological origin

The protocol adapts and extends Section 3.2.1, "Semantic Correctness," from
Theodore Meek, Siyuan Ge, Di Qiu Xiang, Simon Chess, and Vasily Ilin,
"Formalizing Numerical Analysis: An Agent Pipeline and Quality Audit Beyond
Kernel Acceptance," arXiv:2606.14000v1 [cs.AI], 2026. See `REFERENCES.md` for
the exact relationship, extensions, citation wording, and BibTeX.

## Prerequisites

- A working Lean 4/Lake repository.
- Python 3.10 or newer; the scripts use only the standard library.
- A local copy of every authoritative source document.
- Codex with stateless internal-agent support for automated multi-agent runs.
  Without it, the role prompts can be run in separate clean sessions, but the
  operator must preserve the same input boundaries manually.

## Install in another repository

From the target repository root:

```bash
cp -R /path/to/formalization-faithfulness-audit-kit .faithfulness-audit
cp .faithfulness-audit/audit.config.example.json \
  .faithfulness-audit/audit.config.json
python3 .faithfulness-audit/scripts/install_skill.py
python3 .faithfulness-audit/scripts/check_setup.py
```

Before customizing the copied files, verify the distributed package:

```bash
cd .faithfulness-audit
shasum -a 256 -c SHA256SUMS
cd ..
```

Edit `.faithfulness-audit/audit.config.json`:

- `repository_root` is relative to `.faithfulness-audit`;
- `task_metadata_glob` locates task metadata files;
- `lean.module_source_roots` lists directories where a Lean module name maps to
  `Module/Name.lean`;
- `semantic_check_files` selects the core checklist and any domain profiles;
- `lean.environment_files` lists files that fingerprint the Lean environment.

The default configuration assumes `.faithfulness-audit` is directly under the
repository root and local Lean modules can be resolved from that root.

## Define a task

Copy `audit-task.example.json` beside a target and fill in:

- a repository-unique `task_id`;
- the target Lean file and fully qualified declaration name;
- the source file, exact SHA-256, edition/version, and cited locations;
- an audit output directory;
- an optional non-authoritative context file;
- an optional `source_group` for batched extraction.

Calculate a source hash with:

```bash
shasum -a 256 path/to/source.pdf
```

The source file and target must remain under the configured repository root.
Use paths relative to that root.

## Run one audit

In Codex, ask:

```text
Use $formalization-faithfulness-audit to audit CH03-THM07.
```

The deterministic preparation command is:

```bash
python3 .faithfulness-audit/scripts/prepare_audit.py CH03-THM07
```

The skill then runs isolated source extraction, blind translation, direct
judgment, round-trip judgment, conditional adjudication, finalization, and
complete validation. Results are written only under the task's configured
`audit_output` directory.

## Run a source batch

Give related tasks the same `source_group` and source hash. Then ask Codex to
audit that source group, or prepare it directly:

```bash
python3 .faithfulness-audit/scripts/prepare_batch_audit.py chapter-03
```

Batch mode reads the shared source context once while preserving separate blind
translations, judges, decisions, and result folders for every task.

## Record judge models

After each stateless role returns, record the exact runtime metadata reported by
Codex:

```bash
python3 .faithfulness-audit/scripts/record_agent_run.py CH03-THM07 \
  direct-judge --model MODEL-ID --reasoning-effort EFFORT \
  --agent-id AGENT-ID
```

Repeat for source extraction, blind translation, round-trip judgment, and any
adjudication. For a shared batch-source agent, record the same run in every
affected task. When the runtime does not expose a field, omit that option and
use `--notes` to state that it was unavailable; the generated JSON records null
rather than guessing.

## Output layout

```text
faithfulness/
  manifest.json
  inputs/
    source_locator.json
    declaration_dossier.md
    direct_review_packet.md
    blind_review_packet.md
    dependency_inventory.json
    blind_dependency_inventory.json
  agent_outputs/
    agent_runs.json
    source_contract.json
    blind_translation.json
    direct_judge.json
    roundtrip_judge.json
    adjudicator.json          # only when triggered
  decision.json
  report.md
  history/                    # archived prior runs
```

## Adapting the checklist

Always retain `checks/core.json`. Add domain profiles only when relevant. This
package includes examples for general mathematics, numerical analysis, and
floating-point computation. A check may be `not-applicable`; this requires a
reason but does not reject the task. Acceptance is determined by the two
implication directions and nonvacuity, not by forcing every optional topic onto
every theorem.

To add a profile, create a JSON file containing unique check IDs and add its
path to `semantic_check_files`. Preparation hashes the selected files, so a
checklist change intentionally invalidates previous prepared inputs.

## Reproducibility boundaries

- The source document, target, metadata, local Lean imports, selected checks,
  prompts, schemas, scripts, toolchain, and Lake manifest are SHA-256 bound.
- The target proof is excluded; the proposition is inspected through Lean's
  elaborated environment.
- A blind translator never sees source identity or repository context.
- `agent_runs.json` records the model, reasoning effort, runtime, and agent ID
  for every role when the runtime exposes them; unavailable fields remain
  explicitly null rather than being guessed.
- Agent output is evidence, not kernel certification. The final report records
  unresolved uncertainty instead of forcing agreement.
- A changed theorem or relevant imported definition requires a fresh audit.
  Changes to unrelated execution settings do not alter an existing statement
  audit.

## Files to give another researcher

Give the entire kit, not only `SKILL.md`. The skill depends on the methodology,
prompts, schemas, check profiles, and scripts. After copying it into their
repository, they should preserve the directory as `.faithfulness-audit` and
commit it together with task metadata, while deciding separately whether audit
result folders belong in version control. They can start by sending their agent
the single prompt in `PROMPT_FOR_AGENT.txt`; `START_HERE.md` routes the agent
through every required instruction and validation step.
