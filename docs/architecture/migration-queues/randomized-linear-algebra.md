# Randomized linear algebra migration queue

Status: frozen on 2026-09-01 before production edits. The exact machine-readable
queue is [`randomized-linear-algebra.tsv`](randomized-linear-algebra.tsv).

## Fresh selection boundary

The authoritative pre-wave layout scan reports 2,699 production modules, 130
unclassified modules, 9 mixed modules, 80 modules missing module documentation,
59 noncanonical modules, 20 declaration-bearing umbrellas, and 0 unsorted
aggregate imports. Intersecting the unclassified inventory with the coherent
RandNLA family selects exactly 18 historical paths: one import-only aggregate
and 17 declaration owners totaling 103,723 lines. No noncanonical row is in the
family.

The source files are byte-identical to the compiler-audited C0006 checkpoint.
That declaration/SCC audit selects 3,354 compiler declarations: 2,322 reusable,
807 Drineas--Mahoney source correspondence, and 225 commands in reverse closure
of three genuine-private probability helpers. There are 3,351 public and three
private compiler declarations. The family import graph is dependency-closed,
acyclic, and has exactly the external consumers recorded in the TSV.

This evidence rejects a mechanical 18-file rename: 16 physical leaves are
mixed, `UniformRowSamplingMGF` is reusable, and `RandNLA` is an aggregate. The
frozen route instead uses the previously compiler-checked declaration and typed
SCC boundaries. The 225 reverse-closure commands move with their private seeds
into the nearest source endpoint, so every historical path can become a
declaration-free compatibility wrapper. Public declaration names and namespaces
remain unchanged; private generated names are allowed to change with their new
owning modules.

## Frozen semantic hierarchy

Reusable declarations move below
`NumStability.Algorithms.RandomizedLinearAlgebra` into 19 reviewed semantic
owners:

- concentration: hit-count bounds, elementwise spectral transfer, and four
  trace moment-generating-function modules;
- least-squares sketching: objective and row-sampling typed SCCs;
- low-rank approximation: rank-factorization and column-sketch SCCs;
- exact randomized preconditioning transforms and uniform-row composition;
- elementwise, row-norm, leverage-score, and uniform-row sampling owners.

Source correspondence moves below
`NumStability.Source.DrineasMahoney.RandNLA2016` into 18 exact Algorithm 1--3
and Equation 2, 4--9 endpoint owners. Only
`Equation08.LeastSquaresSketch.Endpoints` may retain the direct
`NumStability.Source.Higham.Chapter20.Theorem03.QRSolve` dependency; no reusable
target may reach `NumStability.Source` transitively.

The historical leaf wrappers import the exact canonical target set needed to
re-export their former public surface. The historical family aggregate imports
the reusable and source family umbrellas. Canonical family and source
aggregates contain documentation and imports only.

## Required execution closure

All 18 legacy paths must end as declaration-free compatibility modules.
Production consumers must import canonical owners, except isolated legacy-route
tests. The six external `LowRankApprox` consumers are retargeted according to
their actual declaration use. The three historical `Analysis.LiebTrace`
dependencies are replaced by the exact already-canonical W06 leaves.

Every historical owner receives an isolated canonical-only test and an isolated
legacy-only test, plus focused reusable-family and complete source-route
umbrellas. The tier and compatibility manifests, exact aggregates, layout debt
lists, and compatibility totals are updated only after this freeze.

Completion requires focused canonical-owner builds, reusable/source family
aggregate builds, isolated canonical and legacy route builds, compatibility
contract, layout self-test and current scan, JSON parsing, static queue audit,
public-name preservation audit, and `git diff --check`.

## Exclusions

No LeVeque Chapter 1 file, gate, faithfulness audit, ledger,
`.faithfulness-audit`, `module-audit.json`, or `unit-index.json` is in scope.
No other unclassified or noncanonical family is added to this wave. Existing
Higham Chapter 20 and matrix-inversion owners are consumers only and are not
moved.

## Completed execution

Status: completed on 2026-09-01 at the exact frozen family boundary.

The 18 historical paths are declaration-free compatibility wrappers over 19
reusable owners, 27 source owners, and three declaration-free family
aggregates. The 3,351 frozen public compiler declarations remain present under
their unchanged names. There are 18 isolated canonical-only and 18 isolated
legacy-only route leaves. Production contains no import of an historical
`NumStability.Algorithms.RandNLA*` path, reusable owners contain no source
import, and new source owners contain no reverse legacy import.

| Counter | Frozen baseline | Completed | Delta |
| --- | ---: | ---: | ---: |
| production modules | 2,699 | 2,748 | +49 |
| unclassified modules | 130 | 112 | -18 |
| mixed modules | 9 | 9 | 0 |
| missing module documentation | 80 | 79 | -1 |
| noncanonical modules | 59 | 59 | 0 |
| declaration-bearing umbrellas | 20 | 20 | 0 |
| unsorted aggregate imports | 0 | 0 | 0 |
| compatibility wrappers | 617 | 635 | +18 |
| direct compatibility targets | 965 | 1,015 | +50 |

The compatibility-target delta consists of 48 imports in the new wrappers and
two additional direct targets introduced when the existing
`Algorithms.LeastSquares.LSQRSolve` compatibility surface was retargeted away
from the historical low-rank wrapper.

The following required commands passed:

- `lake build NumStability.Algorithms.RandomizedLinearAlgebra`
- `lake build NumStability.Source.DrineasMahoney.RandNLA2016`
- `lake build NumStabilityTest.Import.Canonical.RandomizedLinearAlgebra NumStabilityTest.Import.Compatibility.Algorithms.RandNLA`
- `python tools/architecture/check_compatibility.py`
- `python tools/architecture/check_layout.py --self-test`
- `python tools/architecture/check_layout.py`
- `python -m py_compile tools/architecture/check_layout.py tools/architecture/check_compatibility.py`
- JSON parsing of `tiers.json` and `layout-exceptions.json`
- the 18-row/103,723-LOC static queue and dependency-direction audit
- a Lean compiler-environment audit of all 3,351 public names in the immutable
  W11 declaration-route table
- `git diff --check`

## Exact changed-path inventory

This wave changes exactly 119 repository paths:

- `docs/architecture/COMPATIBILITY.md`
- `docs/architecture/layout-exceptions.json`
- `docs/architecture/migration-queues/randomized-linear-algebra.md`
- `docs/architecture/migration-queues/randomized-linear-algebra.tsv`
- `docs/architecture/tiers.json`
- `NumStability/Algorithms.lean`
- `NumStability/Algorithms/LeastSquares/LSQRSolve.lean`
- `NumStability/Algorithms/LinearSystems/LeastSquares/Equality/Basic.lean`
- `NumStability/Algorithms/LinearSystems/LeastSquares/GramBasis.lean`
- `NumStability/Algorithms/LinearSystems/QR/GramSchmidtPolar.lean`
- `NumStability/Algorithms/RandNLA.lean`
- `NumStability/Algorithms/RandNLA/ElementwiseSampling.lean`
- `NumStability/Algorithms/RandNLA/ElementwiseSpectral.lean`
- `NumStability/Algorithms/RandNLA/ElementwiseTraceMGF.lean`
- `NumStability/Algorithms/RandNLA/HitCountConcentration.lean`
- `NumStability/Algorithms/RandNLA/LeastSquaresSketch.lean`
- `NumStability/Algorithms/RandNLA/LowRankApprox.lean`
- `NumStability/Algorithms/RandNLA/Preconditioning.lean`
- `NumStability/Algorithms/RandNLA/RowSampling.lean`
- `NumStability/Algorithms/RandNLA/RowSamplingGram.lean`
- `NumStability/Algorithms/RandNLA/RowSamplingLeverage.lean`
- `NumStability/Algorithms/RandNLA/RowSamplingLeverageComputedBasis.lean`
- `NumStability/Algorithms/RandNLA/RowSamplingLeverageMGF.lean`
- `NumStability/Algorithms/RandNLA/RowSamplingTraceMGF.lean`
- `NumStability/Algorithms/RandNLA/UniformRowSampling.lean`
- `NumStability/Algorithms/RandNLA/UniformRowSamplingComposition.lean`
- `NumStability/Algorithms/RandNLA/UniformRowSamplingFP.lean`
- `NumStability/Algorithms/RandNLA/UniformRowSamplingMGF.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Concentration/HitCounts/Bounds.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Concentration/SpectralTransfer/Elementwise.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Concentration/TraceMGF/Elementwise.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Concentration/TraceMGF/LeverageScore.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Concentration/TraceMGF/RowNorm.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Concentration/TraceMGF/UniformRows.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/LeastSquaresSketching/Objectives/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/LeastSquaresSketching/RowSampling/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/LowRankApproximation/ColumnSketches/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/LowRankApproximation/RankFactorizations/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Preconditioning/ExactTransforms/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Preconditioning/ExactTransforms/UniformRowComposition.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Sampling/Elementwise/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Sampling/LeverageScore/ComputedBasis.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Sampling/LeverageScore/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Sampling/RowNorm/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Sampling/RowNorm/Gram.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Sampling/UniformRows/Core.lean`
- `NumStability/Algorithms/RandomizedLinearAlgebra/Sampling/UniformRows/FloatingPoint.lean`
- `NumStability/Analysis/Perturbation/LeastSquares/GramBasis.lean`
- `NumStability/Source.lean`
- `NumStability/Source/DrineasMahoney.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm01/ElementwiseSampling/HitCountConcentration.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm01/ElementwiseSampling/Sampling.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm01/ElementwiseSampling/TraceMGF.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm01/ElementwiseSampling/TwoPointMass.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm02/RowSampling/Endpoints.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm03/RandomProjectionPreconditioning/CountSketchProbability.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm03/RandomProjectionPreconditioning/FloatingPoint.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm03/RandomProjectionPreconditioning/FloatingPointProbability.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm03/RandomProjectionPreconditioning/Preconditioning.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm03/RandomProjectionPreconditioning/UniformRowComposition.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm03/RandomProjectionPreconditioning/UniformRowJointEvent.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm03/RandomProjectionPreconditioning/UniformRowProbability.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Algorithm03/RandomProjectionPreconditioning/UniformRows.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation02/SpectralApproximation/ElementwiseSpectral.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation02/SpectralApproximation/FiniteSampleBounds.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation04/RowSamplingProbability/Normalization.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation05/GramApproximation/Bounds.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation05/GramApproximation/FiniteSampleBounds.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation06/LeverageProbability/Normalization.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation07/SubspaceEmbedding/ComputedBasis.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation07/SubspaceEmbedding/FiniteSampleLeverage.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation07/SubspaceEmbedding/Leverage.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation07/SubspaceEmbedding/LeverageTraceMGF.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation07/SubspaceEmbedding/RowNormTraceMGF.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation08/LeastSquaresSketch/Endpoints.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation08/LeastSquaresSketch/FiniteSampleBounds.lean`
- `NumStability/Source/DrineasMahoney/RandNLA2016/Equation09/LowRankApproximation/Endpoints.lean`
- `NumStability/Source/Higham/Chapter20/Theorem03/QRSolve.lean`
- `NumStabilityTest.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/Aggregate.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/ElementwiseSampling.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/ElementwiseSpectral.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/ElementwiseTraceMGF.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/HitCountConcentration.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/LeastSquaresSketch.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/LowRankApprox.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/Preconditioning.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/RowSampling.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/RowSamplingGram.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/RowSamplingLeverage.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/RowSamplingLeverageComputedBasis.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/RowSamplingLeverageMGF.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/RowSamplingTraceMGF.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/UniformRowSampling.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/UniformRowSamplingComposition.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/UniformRowSamplingFP.lean`
- `NumStabilityTest/Import/Canonical/RandomizedLinearAlgebra/UniformRowSamplingMGF.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/Aggregate.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/ElementwiseSampling.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/ElementwiseSpectral.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/ElementwiseTraceMGF.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/HitCountConcentration.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/LeastSquaresSketch.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/LowRankApprox.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/Preconditioning.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/RowSampling.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/RowSamplingGram.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/RowSamplingLeverage.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/RowSamplingLeverageComputedBasis.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/RowSamplingLeverageMGF.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/RowSamplingTraceMGF.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/UniformRowSampling.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/UniformRowSamplingComposition.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/UniformRowSamplingFP.lean`
- `NumStabilityTest/Import/Compatibility/Algorithms/RandNLA/UniformRowSamplingMGF.lean`
