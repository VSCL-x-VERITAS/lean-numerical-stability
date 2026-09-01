# Higham Chapter 15 and tridiagonal migration queue

Status: completed on 2026-09-01 from the queue frozen before declaration
movement. The exact 27-row ownership map is
[`higham15-tridiagonal.tsv`](higham15-tridiagonal.tsv).

## Fresh selection boundary

The green pre-wave layout scan reports 2,651 production modules, 168
unclassified modules, 9 mixed modules, 94 modules missing module documentation,
92 noncanonical modules, 20 declaration-bearing umbrellas, and 0 unsorted
aggregate imports. Intersecting the current unclassified/noncanonical debt with
the Higham Chapter 15, condition-estimation, and Chapter-15 tridiagonal families
selects 24 declaration owners. A dependency audit adds the three directly
coupled, still-unclassified `PNormPowerMethod*` foundations, producing this
exact 27-owner, 17,260-line queue.

The already-classified reusable `LU.Tridiagonal`, `LU.TridiagonalCond`, and
`LU.TridiagonalRecurrence` modules remain in place. The already-canonical
`HighamChapter15Ch7PracticalBoundBridge` compatibility route is excluded.
There is no declaration or import coupling from this queue to the mathematical
Chapter 14 Method 2B development, so no Chapter 14 path enters the wave.
LeVeque Chapter 1, HDP/Vershynin, gates, audits, faithfulness artifacts, and
ledgers are outside scope.

## Reviewed ownership

Five cohesive algorithm foundations become reusable semantic owners below
`NumStability.Algorithms.NormEstimation`: the one-norm power method, classical
estimators, and the square/general-real/rectangular p-norm iteration chain. The
remaining 22 owners are consumed only by the Chapter 15 proof graph and encode
the book's numbered algorithms, theorem closures, corrections, discrepancies,
or problems; they therefore move under `NumStability.Source.Higham.Chapter15`.
The generic-looking Boyd support is structurally interleaved with and solely
consumed by that source-correspondence chain, so the fresh review does not
publish it as a freestanding reusable API or create a mixed canonical owner.

## Required closure

Declarations must move without renaming to the exact canonical owners in the
TSV. Every historical path must become a declaration-free, exact one-target
wrapper. Production consumers must use canonical imports. One canonical-only
and one legacy-only smoke leaf per queue row must check the recorded
representative declaration, with route-pure umbrellas for focused builds.
Reusable, Chapter 15, Boyd, Problem 06, and tridiagonal family aggregates must
be declaration-free, sorted, and reachable from the exact root entry points.

Completion requires focused canonical and compatibility builds, compatibility
validation, the layout placeholder self-test, a current layout scan, a global
`git diff --check`, zero production imports of queued historical paths, and an
exact before/after debt and changed-path inventory.

## Completion record

All 27 declaration owners now live at the TSV's canonical paths without any
public declaration rename. The 27 historical files are exact one-target,
declaration-free wrappers. The static queue audit reports 27 canonical owners,
27 exact wrappers, 27 canonical-only test leaves, 27 legacy-only test leaves,
zero production imports of queued historical paths, zero stale layout-debt
rows, and zero tier mismatches. The compatibility contract passes at 606
forwarding modules and 954 direct canonical targets.

| Layout counter | Before | After | Delta |
| --- | ---: | ---: | ---: |
| production modules | 2,651 | 2,688 | +37 |
| unclassified modules | 168 | 141 | -27 |
| mixed modules | 9 | 9 | 0 |
| missing module documentation | 94 | 80 | -14 |
| noncanonical modules | 92 | 70 | -22 |
| declaration-bearing umbrellas | 20 | 20 | 0 |
| unsorted aggregate imports | 0 | 0 | 0 |

Queued canonical declaration ownership improved from 0 of 27 owners to 27 of
27; queued declarations remaining at historical paths fell from 27 owners to
0. No scope expansion was required.

The final focused build completed successfully in 3,591 jobs:

```text
lake build NumStability.Algorithms.NormEstimation NumStability.Source.Higham.Chapter15 NumStabilityTest.Import.Canonical.Higham15Tridiagonal NumStabilityTest.Import.Compatibility.Algorithms.Higham15Tridiagonal
```

The remaining green commands were:

```text
python tools/architecture/check_compatibility.py
python tools/architecture/check_layout.py --self-test
python tools/architecture/check_layout.py
git diff --check
```

## Exact scoped changed-path inventory

The wave changes exactly 176 paths:

- 27 historical wrappers: the TSV `old_module` column translated to Lean file
  paths.
- 27 canonical declaration owners: the TSV `canonical_module` column
  translated to Lean file paths.
- 54 isolated test leaves: one file for each of the 27 TSV historical
  basenames under each of
  `NumStabilityTest/Import/Canonical/Higham15Tridiagonal/` and
  `NumStabilityTest/Import/Compatibility/Algorithms/Higham15Tridiagonal/`.
- Two test umbrellas:
  `NumStabilityTest/Import/Canonical/Higham15Tridiagonal.lean` and
  `NumStabilityTest/Import/Compatibility/Algorithms/Higham15Tridiagonal.lean`.
- Twelve declaration-free family aggregates:
  `NumStability/Algorithms/NormEstimation.lean`,
  `NumStability/Algorithms/NormEstimation/OneNorm/All.lean`,
  `NumStability/Algorithms/NormEstimation/PNorm.lean`,
  `NumStability/Source/Higham/Chapter15.lean`,
  `NumStability/Source/Higham/Chapter15/Algorithm01.lean`,
  `NumStability/Source/Higham/Chapter15/Algorithm01/Boyd.lean`,
  `NumStability/Source/Higham/Chapter15/Problem04.lean`,
  `NumStability/Source/Higham/Chapter15/Problem06.lean`,
  `NumStability/Source/Higham/Chapter15/Section03.lean`,
  `NumStability/Source/Higham/Chapter15/Section06.lean`,
  `NumStability/Source/Higham/Chapter15/Section06/TridiagonalConditioning.lean`,
  and `NumStability/Source/Higham/Chapter15/Theorem06.lean`.
- Two additional root integrations: `NumStability/Source/Higham.lean` and
  `NumStabilityTest.lean`.
- Five queue/architecture paths: this file, the TSV,
  `docs/architecture/COMPATIBILITY.md`,
  `docs/architecture/layout-exceptions.json`, and
  `docs/architecture/tiers.json`.
- The following exact 47 production consumers, retargeted from
  `NumStability.Algorithms.CondEstimation` to the canonical family route:

```text
NumStability/Algorithms.lean
NumStability/Algorithms/NormEstimation/OneNorm/GeneralIndex.lean
NumStability/Algorithms/Sylvester/Higham16NormEstimator.lean
NumStability/Analysis/ConditionEstimatorLowerBound.lean
NumStability/Analysis/Conditioning/LinearSystems/InversePerturbation.lean
NumStability/Analysis/Conditioning/LinearSystems/PerronFrobenius.lean
NumStability/Analysis/Conditioning/LinearSystems/SubordinatePerturbation.lean
NumStability/Analysis/HighamChapter7.lean
NumStability/Source/Higham/Chapter06/Theorem05/DistanceToSingularity/Chapter07Equation26.lean
NumStability/Source/Higham/Chapter07/Corollary06/LinearSystemsConditioning/Basic.lean
NumStability/Source/Higham/Chapter07/Corollary06/LinearSystemsConditioning/Results.lean
NumStability/Source/Higham/Chapter07/Equation25/InverseConditioning/ExactPerturbation.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/ComputedResidual.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/ConditionNumbers.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Equation05.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Equation32.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Equation33.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/ForwardErrorKernels.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Lemma09.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem01.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem02.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem04.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem05.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem06Columnwise.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem06Rowwise.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem07.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem08RectangularBackwardError.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem09Exact.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem09Linearized.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem10Bauer/Part01.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem10Bauer/Part02.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem10Bauer/Part03.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem10OneNorm.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem13SparseResidual.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Problem15Hadamard.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/RowScaling.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem02.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem04.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem05/Part01.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem05/Part02.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem05/Part03.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem05/Part04.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem05/Part05.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem05/Part06.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem07FrobeniusScaling.lean
NumStability/Source/Higham/Chapter07/LinearSystemsConditioning/Theorem08Aliases.lean
NumStability/Source/Higham/CrossChapter/PracticalConditionBound.lean
```
