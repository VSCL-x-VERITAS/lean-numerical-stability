# NumStability

[![Lean CI](https://github.com/VSCL-x-VERITAS/lean-numerical-stability/actions/workflows/lean_action_ci.yml/badge.svg?branch=main)](https://github.com/VSCL-x-VERITAS/lean-numerical-stability/actions/workflows/lean_action_ci.yml)
[![Lean](https://img.shields.io/badge/Lean-4.29.0--rc3-blue)](lean-toolchain)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

NumStability is a Lean 4 library for machine-checked numerical analysis. It
contains reusable mathematics for floating-point error analysis, numerical
stability, matrix algorithms, finite-volume methods, hyperbolic partial
differential equations, and high-dimensional probability, together with
source-correspondence modules for results from books and papers.

> **Active development repository:**
> [`VSCL-x-VERITAS/lean-numerical-stability`](https://github.com/VSCL-x-VERITAS/lean-numerical-stability).
> The [`AlexGeorgantzas` repository](https://github.com/AlexGeorgantzas/lean-numerical-stability)
> is the upstream project history; new development, branches, and issues for
> this continuation should target the VSCL-x-VERITAS repository.

The principal source developments currently cover:

- all 28 chapters of Nicholas J. Higham's *Accuracy and Stability of Numerical
  Algorithms* (2nd ed.), within a selected audited scope;
- Chapter 1 of Randall J. LeVeque's *Finite Volume Methods for Hyperbolic
  Problems*, backed by reusable PDE and finite-volume foundations;
- Chapters 1, 2, and 5 of Roman Vershynin's *High-Dimensional Probability*,
  backed by reusable scalar-probability and concentration modules; and
- a randomized numerical linear algebra case study based on work by Petros
  Drineas and Michael W. Mahoney.

Source coverage is deliberately not described as “the whole book.” Audits
distinguish formalized claims, corrected discrepancies, claims ready for more
work, and statements that are too narrative or underspecified to formalize
faithfully.

## Current repository status

The source-only figures below were generated on 2026-09-04 from the integrated
code tree at `1ff124d06a9a127bd956edf40280c4d7c6436737` with the repository-owned
strict baseline generator. This README-only update does not change the Lean
source tree.

| Metric | Current result |
|---|---:|
| Production Lean modules | **3,198** |
| Nonblank Lean source lines | **1,474,872** |
| Direct imports | **31,987** (20,049 internal; 11,938 external) |
| Import cycles / unresolved project imports | **0 / 0** |
| Classified modules | **3,198 / 3,198 (100%)** |
| Modules with module documentation | **3,198 / 3,198 (100%)** |
| Aggregate / compatibility modules | **443 / 797** |
| Reusable / source / internal / upstream modules | **593 / 1,355 / 5 / 5** |
| Mixed or unclassified modules | **0** |
| Forbidden reusable-to-source import paths | **0** |

The executable tier manifest is
[`docs/architecture/tiers.json`](docs/architecture/tiers.json). The current
compatibility map contains 797 forwarding modules, 1,713 unique canonical
targets, and 2,449 forwarding edges; production code has no imports of the
historical paths. The placeholder gate finds no `sorry`, `admit`, or unreviewed
project axiom declaration. Five attributed upstream modules and 137
Apache-2.0-marked production files are covered by the provenance gate.

The bounded 2026-08 repository-reorganization phase is accepted at checkpoint
[`C0008`](docs/architecture/phases/2026-08-repository-reorganization-completion/checkpoints/C0008-gates.md),
whose evidence commit is `897557779a2102aa0e23b0b2f63edeb35b06bc68`.
Current `main` contains later work, including the LeVeque, MatrixPowers,
PolynomialEvaluation, Higham Chapter 2, and high-dimensional-probability
developments. Bounded-phase completion is recorded; repository-wide completion
is not claimed. See the
[`active phase registry`](docs/architecture/phases/2026-08-repository-reorganization-completion/README.md)
and [`architecture process`](docs/architecture/PROCESS.md) for the distinction.

### CI status

The current source graph passes the layout, tier, placeholder, compatibility,
provenance, and strict source-baseline checks. The exact `main` run for
`1ff124d06` passed that architecture stage and then reached the workflow's
180-minute limit during the full build. The three immediately preceding
checkpoint runs completed the full `NumStability NumStabilityTest` build and
`lake test`, but stopped at the warning ratchet: the captured tree emits 248
diagnostics across 52 files, versus 12 reviewed fingerprints in
[`warnings.json`](docs/architecture/warnings.json). The remaining 236
fingerprints include 38 `linter.style.nameCheck` diagnostics. The reviewed
warning baseline has not been expanded automatically, and the lint-baseline
step remains pending behind that gate.

The badge above reflects the live GitHub Actions state. A green build should
not be inferred from the absence of `sorry` or from a passing structural scan.

## Floating-point model

The core library uses an
[abstract real-arithmetic model](NumStability/FloatingPoint/Model.lean), not a
concrete IEEE-754 implementation. An `FPModel` supplies a nonnegative unit
roundoff `u` and rounded addition, subtraction, multiplication, division, and
square root. For the binary operations, the central relative-error law is

```text
fl(x ◦ y) = (x ◦ y)(1 + δ),    |δ| ≤ u.
```

Division carries a nonzero-denominator condition, square root a
nonnegative-input condition, and the model assumes `fl_add 0 x = x`.
Individual theorems state additional guards, such as bounds ensuring that
`γ(n)` is defined.

Results are parameterized by this model. The exact-arithmetic instance
`FPModel.exactWithUnitRoundoff` is useful for proving that an overly strong
claim cannot follow from the abstract assumptions alone. Exact algebra and
matrix norms come from Mathlib. New APIs use Mathlib's `Matrix` and norm
interfaces directly; older function-shaped matrix APIs remain available
through compatibility wrappers.

## Formalized source areas

### Higham: numerical stability

All 28 Higham chapter rows are terminal under the selected audit rules. In the
table, **Closed** means compiled at source strength, **Discrepancy** means the
printed claim has a compiled counterexample and a faithful correction, and
**Defer** records an imprecise source statement or external citation rather
than a Lean proof hole. Detailed evidence lives in the
[`source_coverage` ledgers](docs/source_coverage/) and the
[`PDF-first audit`](docs/source_coverage/AUDIT_ch01-28_PDF_FIRST_2026-07-21.md).

| Ch. | Topic | Audit result |
|---:|---|---|
| 1 | Principles of finite precision | Closed |
| 2 | Floating-point arithmetic | Closed |
| 3 | Basics (dot products, `γ(n)`) | Closed |
| 4 | Summation | Closed |
| 5 | Polynomials and Horner's method | Closed |
| 6 | Norms | Discrepancy |
| 7 | Perturbation theory for linear systems | Discrepancy |
| 8 | Triangular systems | Discrepancy · Defer |
| 9 | LU factorization and linear equations | Closed |
| 10 | Cholesky factorization | Discrepancy |
| 11 | Symmetric indefinite and skew-symmetric systems | Discrepancy |
| 12 | Iterative refinement | Closed · Defer |
| 13 | Block LU factorization | Closed |
| 14 | Matrix inversion | Closed · Discrepancy · Defer |
| 15 | Condition-number estimation | Discrepancy · Defer |
| 16 | The Sylvester equation | Closed · Defer |
| 17 | Stationary iterative methods | Closed |
| 18 | Matrix powers | Closed · Defer |
| 19 | QR factorization | Closed · Discrepancy · Defer |
| 20 | The least-squares problem | Discrepancy · Defer |
| 21 | Underdetermined systems | Discrepancy |
| 22 | Vandermonde systems | Discrepancy |
| 23 | Fast matrix multiplication | Closed · Defer |
| 24 | The FFT and applications | Closed |
| 25 | Nonlinear systems and Newton's method | Discrepancy · Defer |
| 26 | Automatic error analysis | Discrepancy · Defer |
| 27 | Software issues in floating point | Discrepancy · Defer |
| 28 | A gallery of test matrices | Discrepancy · Defer |

### LeVeque: hyperbolic PDEs and finite-volume methods

Fifteen reusable modules under
[`NumStability/Analysis/PartialDifferentialEquations/`](NumStability/Analysis/PartialDifferentialEquations/)
provide conservation-law residuals, constant-coefficient systems,
hyperbolicity, eigenmode waves, scalar advection, linear acoustics, integral
conservation, finite-volume cell averages and flux differences, Riemann data,
Riemann-interface adapters, and operator splitting.

The 30-module LeVeque source surface begins at
[`NumStability.Source.LeVeque`](NumStability/Source/LeVeque.lean); its
[`Chapter01` subtree](NumStability/Source/LeVeque/) connects those foundations
to Chapter 1 equations and constructions. The machine-readable
[`Chapter 1 gate`](gates/leveque-finite-volume/chapter-01.json) and its
[`audit artifacts`](gates/leveque-finite-volume/artifacts/) record source
inventory, declaration and axiom checks, focused builds, organization checks,
and per-claim faithfulness decisions. Book and workflow limitations are kept
under [`ledgers/leveque-finite-volume/`](ledgers/leveque-finite-volume/).

### Vershynin: high-dimensional probability

[`NumStability.HDP`](NumStability/HDP.lean) is the current high-dimensional
probability entry point. Its semantic layer covers probability preliminaries,
limit theorems, independent sums, Hoeffding and Chernoff bounds, random-graph
degree laws, sub-Gaussian and sub-exponential variables, and metric-measure
concentration.

[`NumStability.Source.Vershynin`](NumStability/Source/Vershynin.lean) exposes
checked source contracts and frozen signatures for selected material in
Chapters 1, 2, and 5 of *High-Dimensional Probability*. Historical
`NumStability.HDP.Contracts` and `NumStability.HDP.ContractSignatures` paths
remain supported through the compatibility map.

### Drineas–Mahoney: randomized numerical linear algebra

The RandNLA case study separates reusable algorithms and analysis under
[`NumStability/Algorithms/RandomizedLinearAlgebra/`](NumStability/Algorithms/RandomizedLinearAlgebra/)
from source correspondence under
[`NumStability/Source/DrineasMahoney/RandNLA2016/`](NumStability/Source/DrineasMahoney/RandNLA2016/).
It covers sampling, matrix concentration, low-rank approximation,
least-squares sketching, and randomized preconditioning. Historical
`NumStability.Algorithms.RandNLA` imports remain available as compatibility
paths.

## Building

Install Git and [elan](https://github.com/leanprover/elan), then clone the
active repository:

```bash
git clone https://github.com/VSCL-x-VERITAS/lean-numerical-stability.git
cd lean-numerical-stability
lake exe cache get
lake build NumStability NumStabilityTest
lake test
```

The project pins Lean `4.29.0-rc3` in [`lean-toolchain`](lean-toolchain) and
Mathlib revision `e8ea1afc32790ce1d4e1a4e45cc412ba9388716b` in
[`lakefile.toml`](lakefile.toml).

To build one module, pass its Lean module name to Lake, for example:

```bash
lake build NumStability.FloatingPoint.Model
lake build NumStability.HDP.Scalar.SubGaussian
lake build NumStability.Source.LeVeque
```

## Key entry points

Choose the narrowest import that supplies the declarations you need.

| Import | Purpose |
|---|---|
| `NumStability.Core` | Small reusable foundation for the floating-point model and core error analysis |
| `NumStability.FloatingPoint` | Reusable floating-point foundations and IEEE-facing utilities |
| `NumStability.Analysis` | Broad historical analysis discovery surface; prefer a narrower family import |
| `NumStability.Algorithms` | Broad historical algorithm discovery surface; prefer a canonical family import |
| `NumStability.HDP` | High-dimensional-probability semantics, contracts, and signatures |
| `NumStability.Source` | Complete canonical umbrella for book- and paper-specific correspondence |
| `NumStability.Source.Higham` | Higham correspondence for Chapters 1–28 and cross-chapter bridges |
| `NumStability.Source.LeVeque` | LeVeque Chapter 1 correspondence |
| `NumStability.Source.Vershynin` | Vershynin Chapters 1, 2, and 5 source contracts |
| `NumStability.Analysis.PartialDifferentialEquations.FiniteVolume.FluxDifference` | Narrow reusable finite-volume update and conservation results |
| `NumStability.All` | Complete supported library surface |
| `NumStability` | Historical compatibility entry point forwarding to `NumStability.All` |

See [`ARCHITECTURE.md`](ARCHITECTURE.md) for API tiers and dependency rules.
Historical imports and their canonical destinations are documented in
[`docs/architecture/COMPATIBILITY.md`](docs/architecture/COMPATIBILITY.md).

## Use as a dependency

The inherited `v0.1.0` tag predates the current LeVeque and HDP work. Use the
tag for the original release surface:

```toml
[[require]]
name = "numStability"
git = "https://github.com/VSCL-x-VERITAS/lean-numerical-stability"
rev = "v0.1.0"
```

Use `rev = "main"` when you intentionally want the current development tree.
A minimal reusable import is:

```lean
import NumStability.FloatingPoint.Model

open NumStability

#check FPModel
#check FPModel.exactWithUnitRoundoff
```

## Repository layout

The map emphasizes supported entry points and semantic boundaries rather than
listing every theorem leaf.

```text
NumStability.lean                         historical complete-tree entry point
NumStability/
├── Core.lean                            small reusable foundation
├── All.lean                             complete supported tree
├── FloatingPoint.lean                   floating-point umbrella
├── FloatingPoint/                       model, operation laws, FMA, and IEEE utilities
├── Analysis.lean                        broad historical analysis aggregate
├── Analysis/
│   ├── Error/, Conditioning/, Perturbation/
│   ├── MatrixNorms/, SingularValues/, Probability/
│   └── PartialDifferentialEquations/    reusable PDE and finite-volume foundations
├── Algorithms.lean                      broad historical algorithm aggregate
├── Algorithms/
│   ├── Arithmetic/, Summation/, PolynomialEvaluation/
│   ├── LinearSystems/, MatrixEquations/, MatrixPowers/
│   └── RandomizedLinearAlgebra/
├── HDP.lean                              high-dimensional-probability entry point
├── HDP/                                  scalar probability, concentration, and old contract paths
├── Source.lean                           canonical source-correspondence entry point
├── Source/
│   ├── Higham/                           Chapters 1–28 and cross-chapter correspondence
│   ├── LeVeque/                          finite-volume methods, Chapter 1
│   ├── Vershynin/                        high-dimensional probability, Chapters 1, 2, and 5
│   └── DrineasMahoney/RandNLA2016/       randomized linear algebra case study
├── Higham.lean and Higham/               historical Higham compatibility paths
└── Upstream/Lindemann/                   attributed Mathlib adaptation and backports

NumStabilityTest.lean                     complete test-library entry point
NumStabilityTest/
├── Import/
│   ├── Canonical/                        canonical and entry-point smoke tests
│   └── Compatibility/                    forwarding-path regression tests
├── Reorganization/                       migration and declaration-placement tests
└── Worker/                               focused proof-audit and integration suites

gates/                                    machine-readable formalization gates and evidence
ledgers/                                  source/workflow issues, limitations, and inconsistencies
docs/                                     architecture, source coverage, audits, and benchmarks
tools/                                    architecture checks and benchmark tooling
examples/                                 representative Lean lookup examples
experiments/                              C/Python reproductions of selected source examples
```

## Verification and contribution

For a source-only architecture check, run:

```bash
python tools/architecture/check_layout.py
python tools/architecture/check_tiers.py
python tools/architecture/check_placeholders.py
python tools/architecture/check_compatibility.py
python tools/architecture/check_provenance.py
python tools/architecture/generate_baseline.py --skip-declarations --strict-source --output-dir benchmark-results/architecture --name source-check
```

CI additionally runs the phase and checker self-tests, builds both Lean
libraries, runs the literal `lake test` driver, and checks the reviewed warning
and lint baselines. [`CONTRIBUTING.md`](CONTRIBUTING.md) explains placement,
compatibility, testing, and licensing requirements. Architecture changes follow
[`docs/architecture/PROCESS.md`](docs/architecture/PROCESS.md).

## Documentation

- [`docs/README.md`](docs/README.md) maps current policy and retained evidence.
- [`ARCHITECTURE.md`](ARCHITECTURE.md) defines API tiers, dependency direction,
  and supported entry points.
- [`docs/architecture/NAMING.md`](docs/architecture/NAMING.md) defines canonical
  module names and placement.
- [`docs/architecture/COMPATIBILITY.md`](docs/architecture/COMPATIBILITY.md)
  records every supported historical import path.
- [`docs/source_coverage/`](docs/source_coverage/) contains Higham's concise
  chapter ledgers and PDF-first audits.
- [`CHANGELOG.md`](CHANGELOG.md) records release-facing changes.

## References

- N. J. Higham, *Accuracy and Stability of Numerical Algorithms*, 2nd ed.,
  SIAM, 2002.
- R. J. LeVeque, *Finite Volume Methods for Hyperbolic Problems*, Cambridge
  University Press, 2002.
- R. Vershynin, *High-Dimensional Probability: An Introduction with
  Applications in Data Science*, Cambridge University Press.
- P. Drineas and M. W. Mahoney,
  [“RandNLA: Randomized Numerical Linear Algebra”](https://dl.acm.org/doi/10.1145/2842602),
  *Communications of the ACM* 59(6), 80–90, 2016.

## License and citation

Except where an individual file states otherwise, NumStability is licensed
under the [MIT License](LICENSE). Files carrying an Apache-2.0 notice are
licensed under the [Apache License, Version 2.0](LICENSES/Apache-2.0.txt).
Third-party attribution is recorded in
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md), and citation metadata is
available in [`CITATION.cff`](CITATION.cff).
