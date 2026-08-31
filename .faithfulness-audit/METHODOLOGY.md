# Formalization faithfulness audit methodology

## 1. Purpose

This protocol determines whether a fixed Lean proposition represents a result
selected from an authoritative source. It does not judge proof elegance or
repair formalizations. Kernel acceptance proves that a term inhabits the Lean
type; it does not prove that the type says what the source says.

The audited objects are:

1. the selected source claim in its inherited context;
2. the elaborated Lean proposition;
3. every definition that contributes semantic meaning to that proposition.

### 1.1 Methodological origin and extensions

This protocol adapts the semantic-correctness audit in Section 3.2.1 of
Theodore Meek, Siyuan Ge, Di Qiu Xiang, Simon Chess, and Vasily Ilin,
"Formalizing Numerical Analysis: An Agent Pipeline and Quality Audit Beyond
Kernel Acceptance," arXiv:2606.14000v1 [cs.AI], 2026
(<https://arxiv.org/abs/2606.14000>). In particular, it retains direct
source-versus-Lean judgment, blind back-translation, round-trip judgment, and
separate evaluation of both implication directions.

This package is an independent extension rather than an exact reproduction of
the paper's experiments. It adds recursive imported-definition coverage,
immutable source contracts, configurable semantic checklists, hash-bound
evidence, conditional adjudication, detailed runtime provenance, and
machine-readable per-task history. `REFERENCES.md` records the exact
relationship and suggested citation.

## 2. Classification policy

Every judge answers two questions separately:

1. Does the Lean proposition imply the source result under the source context?
2. Does the source result imply the Lean proposition?

| Lean implies source | Source implies Lean | Classification |
|---|---|---|
| yes | yes | `faithful-equivalent` |
| yes | no | `faithful-stronger` only for genuine nonvacuous strength |
| no | yes | `not-faithful-weaker` |
| no | no | `not-faithful-different` |
| unclear | any | `undetermined` |

Accepted classifications are `faithful-equivalent` and
`faithful-stronger`. Additional hypotheses, restricted types, missing cases,
or impossible premises reduce applicability; they are not stronger results.
A harmless definitional reformulation can remain equivalent. A specialization
must be described explicitly and assessed against what the benchmark claims to
measure.

## 3. Evidence hierarchy

The authoritative evidence is the exact source file and exact Lean environment.
Task metadata locates evidence but is not itself proof of source meaning. A
context note or informal paraphrase is an object to check, not authority. The
Lean proof is excluded because the audit concerns the proposition.

Preparation verifies and records:

- source, target, task metadata, and optional context hashes;
- selected prompts, schemas, scripts, and semantic-check profiles;
- Lean toolchain and package-manifest hashes when configured;
- compilation of the unchanged target and local imports;
- readable and fully explicit elaborated target types;
- recursive semantic dependencies and their source modules.

## 4. Declaration coverage

A role must not infer meaning from a declaration name. The generated dossier
contains:

1. the proof-free source header when extractable;
2. Lean's readable elaborated target type;
3. Lean's fully explicit target type, exposing implicit arguments, instances,
   coercions, and notation;
4. recursive types and bodies of declarations owned by configured local
   modules;
5. the one-level external semantic frontier where traversal stops;
6. exact hashes and complete source text for local imported modules in the
   full dossier.

Each dependency receives a stable task-local ID and a semantic SHA-256. The
hash excludes graph distance and task-local ID but includes declaration role,
name, owner, kind, type, explicit type, and one-level body. Every translating or
direct-judging role accounts for each dependency exactly once.

## 5. Independent roles

Every role runs in a fresh stateless agent. Only the orchestrator writes files.
Invalid JSON is retried with another fresh role, not repaired through follow-up
conversation. The orchestrator records each role's runtime, exact model,
reasoning effort, agent ID, and timestamps in `agent_runs.json`. A runtime field
that is not exposed is recorded as null with an explanatory note; model identity
must never be inferred from a default or conversation setting.

### 5.1 Source-contract extractor

Receives only the immutable source, source locator, prompt, and schema. It reads
the selected passage, enclosing result, definitions, standing assumptions, and
cross-references. It receives no Lean material or informal target paraphrase.

### 5.2 Blind translator

Receives an anonymized elaborated Lean dossier inline, its hash, prompt, and
schema. It receives no source identity, task ID, target source, proof,
filesystem, tools, prior output, or conversation history. It reconstructs the
mathematical proposition and records restrictions, vacuity risks, and
ambiguities.

### 5.3 Direct judge

Receives the primary source, source contract, exact Lean review packet,
dependency ledger, and semantic checklist. It independently checks the source
and every declaration dependency before deciding both implication directions.

### 5.4 Round-trip judge

Receives the primary source, source contract, blind translation, and semantic
checklist, but no Lean or direct judgment. It tests whether the independently
reconstructed proposition matches the source.

### 5.5 Adjudicator

Runs only when judges disagree, an implication is unclear, a dependency or
semantic check remains unclear, or a judge explicitly requests adjudication.
It receives the exact trigger reasons and complete primary evidence. It
resolves items individually; it does not vote or average model opinions.

## 6. Semantic checklist

The core checklist applies to any mathematical statement. Domain profiles add
checks for specialized semantics such as algorithms, norms, floating-point
models, or asymptotic truncation. Each judge returns `pass`, `fail`, `unclear`,
or `not-applicable` with evidence and reasoning.

Not every check must be applicable. `not-applicable` is valid when explained;
for example, a closed algebraic identity need not be linked to an algorithm.
An applicable failed check is substantive evidence that must be reconciled with
the implication decision. An unresolved `unclear` check triggers adjudication.

## 7. Source batches and reuse

Tasks sharing one immutable source and `source_group` may use a single batch
source extractor. The batch output contains one independent contract per task
and is hash-bound before splitting into task-local files. Blind translators and
all judges remain task-local.

An interpretation of a Lean dependency may be reused only if its semantic hash
exactly matches a validated earlier interpretation. Reuse covers declaration
meaning only. The new judge must still determine its effect on the new target
and whether that effect matches the selected source claim.

## 8. Finalization

The orchestrator validates schemas, coverage order, hashes, implication and
classification consistency, adjudication triggers, and acceptance policy. It
writes `decision.json`, renders `report.md`, and marks the manifest completed
only after complete-phase validation passes.

An audit never edits its inputs. A changed target, selected source, task
metadata, relevant imported definition, checklist, prompt, schema, or audit
script invalidates the recorded hashes and requires a new run. Prior artifacts
are archived rather than deleted.

## 9. Interpretation and limitations

Agreement among agents is not a formal proof of semantic equivalence. The
protocol strengthens evidence through independent information paths, complete
dependency accounting, primary-source citation, implication analysis, and
deterministic provenance. Remaining ambiguity is reported as `undetermined`.

Source defects require a separate policy decision. A corrected-source theorem
may be useful, but it should not silently be counted as faithful to a false or
incomplete printed statement. Record source validity separately and define any
exclusion from corpus-level statistics transparently.
