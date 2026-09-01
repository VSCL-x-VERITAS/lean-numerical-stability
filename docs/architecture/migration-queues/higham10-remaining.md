# Remaining Higham Chapter 10 migration queue

Status: completed on 2026-09-01 from the queue frozen before declaration
movement. This exact 11-row ownership map is
[`higham10-remaining.tsv`](higham10-remaining.tsv).

## Fresh selection boundary

The green pre-wave layout scan reports 2,688 production modules, 141
unclassified modules, 9 mixed modules, 80 modules missing module documentation,
70 noncanonical modules, 20 declaration-bearing umbrellas, and 0 unsorted
aggregate imports. Intersecting the current unclassified and noncanonical debt
with Higham Chapter 10 selects exactly 11 retained declaration owners totaling
8,243 lines. The family is dependency-closed once its already-canonical Chapter
10 leaves and three directly coupled route modules are treated as consumers to
retarget, not owners to migrate.

The queue is the retained private-declaration closure left by W03: ten narrow
source-result owners plus the chapter-wide endpoint owner. W03 already extracted
the reusable Cholesky, perturbation, matrix-norm, scaled-stage, Kahan-matrix, and
certificate foundations. Fresh dependency and consumer review therefore
classifies every retained owner as source correspondence. The generic-looking
support declarations still in `HighamChapter10` are interleaved with and only
serve the source-numbered endpoint graph; publishing a second reusable owner
would expose book-local proof support rather than a stable reusable API.

## Exact semantic routing

| Historical owner | Canonical source owner | LOC | Dependency role |
| --- | --- | ---: | --- |
| `Algorithms.HighamChapter10` | `Source.Higham.Chapter10.Endpoints` | 2,326 | root endpoint graph; migrate first |
| `Algorithms.Ch10ActualSourceClosure` | `Source.Higham.Chapter10.Theorem06.RoundedCholesky.ScaledForwardError` | 92 | consumes chapter endpoints |
| `Algorithms.Ch10ComplexPositiveDefiniteSourceClosure` | `Source.Higham.Chapter10.Equation30.ComplexPositiveDefinite.ErrorBounds` | 2,384 | consumes chapter endpoints |
| `Algorithms.Ch10KahanSharpnessSource` | `Source.Higham.Chapter10.Lemma13.KahanSharpness.TailNormBounds` | 264 | consumes chapter endpoints |
| `Algorithms.Ch10PivotedPSDSourceClosure` | `Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.StoppingErrorBounds` | 316 | consumes chapter endpoints |
| `Algorithms.Ch10Theorem108Componentwise` | `Source.Higham.Chapter10.Theorem08.ComponentwisePerturbation.ComponentwiseBounds` | 573 | independent source branch |
| `Algorithms.Ch10Theorem108Source` | `Source.Higham.Chapter10.Theorem08.NormwiseDiscrepancy.FactorUniqueness` | 36 | consumes chapter endpoints |
| `Algorithms.Cholesky.Higham1014SourceError` | `Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.RankSensitiveError` | 755 | migrate before Schur asymptotics |
| `Algorithms.Cholesky.Higham1014Equation1022` | `Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.SchurAsymptotics` | 846 | consumes rank-sensitive error and chapter endpoints |
| `Algorithms.Cholesky.Higham1029Source` | `Source.Higham.Chapter10.Section04.PositiveDefiniteSymmetricPart.LUGrowth` | 209 | migrate before Mathias condition bounds |
| `Algorithms.Cholesky.HighamMathiasSource` | `Source.Higham.Chapter10.Equation29.Mathias.ConditionBounds` | 442 | consumes LU growth |

The TSV freezes the complete direct-import lists, observed downstream consumer
counts, representative declarations, actions, rationales, and exclusions.

## Required closure

Every declaration moves without renaming to its exact canonical owner. Each
historical file becomes a declaration-free wrapper importing exactly one
canonical target. Production consumers and the directly coupled existing
compatibility routes must import canonical owners. Each queue row receives an
isolated canonical-only leaf and an isolated legacy-only leaf, with route-pure
family umbrellas for focused compilation. Exact source-family and root
aggregates, tier rules, compatibility rows, and layout debt lists must be
updated only after this freeze.

Completion requires focused owner, aggregate, canonical-route, legacy-route,
compatibility-contract, layout-self-test, current-layout, JSON, and global diff
checks, followed by exact before/after counters and changed-path inventory.

## Exclusions

No LeVeque Chapter 1 file, gate, faithfulness audit, ledger,
`.faithfulness-audit`, `module-audit.json`, or `unit-index.json` is in scope.
No Chapter 9 or Chapter 20 declaration owner moves; those modules are retargeted
only if they directly import a queued historical path. No additional Chapter 10
owner is required for dependency closure.

## Completion record

All 11 declaration owners now live at their frozen canonical source paths and
all 11 historical paths are exact one-target, declaration-free wrappers. The
static queue audit reports 11 canonical owners, 11 wrappers, 11 canonical-only
leaves, 11 legacy-only leaves, zero production imports of a queued historical
path, zero stale layout-debt rows, and zero tier mismatches. A baseline-to-owner
name audit verifies that all 99 public declaration names remain present.

The compatibility contract passes at 617 forwarding modules and 965 direct
canonical targets. The focused owner build completed in 3,492 jobs. The
Chapter 10 aggregate, directly retargeted Chapter 20 consumer, canonical route,
and legacy route build completed in 3,675 jobs. An optional broad-root build was
stopped cleanly after the required Chapter 10 sub-aggregates had compiled and
the scheduler expanded into unrelated Chapter 16 work; the narrow required
targets subsequently completed green.

| Layout counter | Before | After | Delta |
| --- | ---: | ---: | ---: |
| production modules | 2,688 | 2,699 | +11 |
| unclassified modules | 141 | 130 | -11 |
| mixed modules | 9 | 9 | 0 |
| missing module documentation | 80 | 80 | 0 |
| noncanonical modules | 70 | 59 | -11 |
| declaration-bearing umbrellas | 20 | 20 | 0 |
| unsorted aggregate imports | 0 | 0 | 0 |

Queued canonical declaration ownership improved from 0 of 11 owners to 11 of
11; declaration ownership remaining at historical paths fell from 11 owners to
0. No scope expansion was required.

The green validation commands were:

```text
python C:/Users/qed_s/.codex/skills/organize-lean-formalization/scripts/audit_lean_layout.py --repo . --source-root NumStability --prefix NumStability --fail-on none
lake build NumStability.Source.Higham.Chapter10.Endpoints NumStability.Source.Higham.Chapter10.Theorem06.RoundedCholesky.ScaledForwardError NumStability.Source.Higham.Chapter10.Equation30.ComplexPositiveDefinite.ErrorBounds NumStability.Source.Higham.Chapter10.Lemma13.KahanSharpness.TailNormBounds NumStability.Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.StoppingErrorBounds NumStability.Source.Higham.Chapter10.Theorem08.ComponentwisePerturbation.ComponentwiseBounds NumStability.Source.Higham.Chapter10.Theorem08.NormwiseDiscrepancy.FactorUniqueness NumStability.Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.RankSensitiveError NumStability.Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.SchurAsymptotics NumStability.Source.Higham.Chapter10.Section04.PositiveDefiniteSymmetricPart.LUGrowth NumStability.Source.Higham.Chapter10.Equation29.Mathias.ConditionBounds
lake build NumStability.Source.Higham.Chapter10 NumStability.Algorithms.LeastSquares.Higham20Remaining NumStabilityTest.Import.Canonical.Higham10Remaining NumStabilityTest.Import.Compatibility.Algorithms.Higham10Remaining
python tools/architecture/check_compatibility.py
python tools/architecture/check_layout.py --self-test
python tools/architecture/check_layout.py
python -m py_compile tools/architecture/check_layout.py tools/architecture/check_compatibility.py
git diff --check
```

The JSON parse check covered `tiers.json` and `layout-exceptions.json`; the
PowerShell TSV audit checked the frozen row/LOC totals, owner and wrapper paths,
exact one-target imports, declaration-free wrappers, representative
declarations, isolated leaves, and compatibility tiers. A separate baseline
comparison checked all 99 public declaration names.

## Exact changed-path inventory

Canonical declaration owners and family aggregates:

```text
NumStability/Source/Higham/Chapter10.lean
NumStability/Source/Higham/Chapter10/Endpoints.lean
NumStability/Source/Higham/Chapter10/Equation29/Mathias.lean
NumStability/Source/Higham/Chapter10/Equation29/Mathias/ConditionBounds.lean
NumStability/Source/Higham/Chapter10/Equation30/ComplexPositiveDefinite.lean
NumStability/Source/Higham/Chapter10/Equation30/ComplexPositiveDefinite/ErrorBounds.lean
NumStability/Source/Higham/Chapter10/Lemma13/KahanSharpness.lean
NumStability/Source/Higham/Chapter10/Lemma13/KahanSharpness/TailNormBounds.lean
NumStability/Source/Higham/Chapter10/Section04/PositiveDefiniteSymmetricPart.lean
NumStability/Source/Higham/Chapter10/Section04/PositiveDefiniteSymmetricPart/LUGrowth.lean
NumStability/Source/Higham/Chapter10/Theorem06/RoundedCholesky.lean
NumStability/Source/Higham/Chapter10/Theorem06/RoundedCholesky/ScaledForwardError.lean
NumStability/Source/Higham/Chapter10/Theorem08/ComponentwisePerturbation.lean
NumStability/Source/Higham/Chapter10/Theorem08/ComponentwisePerturbation/ComponentwiseBounds.lean
NumStability/Source/Higham/Chapter10/Theorem08/NormwiseDiscrepancy.lean
NumStability/Source/Higham/Chapter10/Theorem08/NormwiseDiscrepancy/FactorUniqueness.lean
NumStability/Source/Higham/Chapter10/Theorem14/CompletePivotedPSD.lean
NumStability/Source/Higham/Chapter10/Theorem14/CompletePivotedPSD/RankSensitiveError.lean
NumStability/Source/Higham/Chapter10/Theorem14/CompletePivotedPSD/SchurAsymptotics.lean
NumStability/Source/Higham/Chapter10/Theorem14/CompletePivotedPSD/StoppingErrorBounds.lean
```

Historical wrappers and directly retargeted production routes:

```text
NumStability/Algorithms.lean
NumStability/Algorithms/Ch10ActualSourceClosure.lean
NumStability/Algorithms/Ch10Ch14Lemma66Op2Bridge.lean
NumStability/Algorithms/Ch10ComplexPositiveDefiniteSourceClosure.lean
NumStability/Algorithms/Ch10KahanSharpness.lean
NumStability/Algorithms/Ch10KahanSharpnessSource.lean
NumStability/Algorithms/Ch10Lemma1011Source.lean
NumStability/Algorithms/Ch10PivotedPSDSourceClosure.lean
NumStability/Algorithms/Ch10Theorem108Componentwise.lean
NumStability/Algorithms/Ch10Theorem108Source.lean
NumStability/Algorithms/Cholesky/Higham1014Equation1022.lean
NumStability/Algorithms/Cholesky/Higham1014SourceError.lean
NumStability/Algorithms/Cholesky/Higham1029Source.lean
NumStability/Algorithms/Cholesky/HighamMathiasFirstBreakdown.lean
NumStability/Algorithms/Cholesky/HighamMathiasSource.lean
NumStability/Algorithms/HighamChapter10.lean
NumStability/Algorithms/LeastSquares/Higham20Remaining.lean
NumStability/Source/Higham/Chapter10/Theorem07.lean
```

Canonical-only and legacy-only route tests:

```text
NumStabilityTest.lean
NumStabilityTest/Import/Canonical/Higham10Remaining.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Ch10ActualSourceClosure.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Ch10ComplexPositiveDefiniteSourceClosure.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Ch10KahanSharpnessSource.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Ch10PivotedPSDSourceClosure.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Ch10Theorem108Componentwise.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Ch10Theorem108Source.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Higham1014Equation1022.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Higham1014SourceError.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/Higham1029Source.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/HighamChapter10.lean
NumStabilityTest/Import/Canonical/Higham10Remaining/HighamMathiasSource.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Ch10ActualSourceClosure.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Ch10ComplexPositiveDefiniteSourceClosure.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Ch10KahanSharpnessSource.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Ch10PivotedPSDSourceClosure.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Ch10Theorem108Componentwise.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Ch10Theorem108Source.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Higham1014Equation1022.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Higham1014SourceError.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/Higham1029Source.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/HighamChapter10.lean
NumStabilityTest/Import/Compatibility/Algorithms/Higham10Remaining/HighamMathiasSource.lean
NumStabilityTest/Import/Compatibility/Algorithms/LeastSquares/CanonicalDependencies.lean
```

Architecture manifests and frozen queue:

```text
docs/architecture/COMPATIBILITY.md
docs/architecture/layout-exceptions.json
docs/architecture/migration-queues/higham10-remaining.md
docs/architecture/migration-queues/higham10-remaining.tsv
docs/architecture/tiers.json
```
