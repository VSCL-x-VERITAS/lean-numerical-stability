# Higham Chapter 28 real-Ginibre migration queue

Status: reviewed and frozen before implementation on 2026-09-01; implemented
and focused-green on 2026-09-01. The exact 38-row ownership map is
[`higham28-real-ginibre.tsv`](higham28-real-ginibre.tsv).

## Selection and dependency boundary

The frozen family consists of exactly 36 declaration-owning historical
`Higham28Ginibre*` modules (15,002 lines, 686 non-private declaration-like
commands, and 44 private declaration-like commands) plus the two directly
imported mixed foundations `Higham28Probability` and `Higham28Asymptotics`.
The pre-wave reviewed debt baseline contains 282 unclassified modules, 202
noncanonical modules, and 9 mixed modules. All 36 Ginibre owners occur in both
the unclassified and noncanonical sets.

All dependencies among the 36 Ginibre owners move together. Their only
production consumers outside the family are the historical Algorithms
aggregate and `Higham28GaussianQRHaar`, which imports the density owner. The
family also depends on the unclassified Gaussian direction/orthogonal support;
those inherited dependencies are outside this queue and remain source-side
edges, not dependencies of either reusable extraction.

## Ownership decision

The 36 Ginibre owners form the source-correspondence proof of Higham Chapter
28's real-Ginibre expected-real-eigenvalue result. Their module documentation,
recurrence factors, finite-formula conclusion, and Corollary 3.1 normalization
make the chain source-specific even where individual lemmas are broadly useful.
They move without declaration renames below the semantic
`NumStability.Source.Higham.Chapter28.RealGinibre` hierarchy.

`Higham28Probability` is mixed. Its real-Ginibre measure, eigenvalue count,
expected count, and normalization theorem move to reusable probability analysis
at `NumStability.Analysis.Probability.RandomMatrices.RealGinibre`. The printed
expected-count limit, iid-uniform Perron statement, and Stewart-law compatibility
surface move to three source adapters. The declaration-free
`Chapter28.ProbabilityStatements` aggregate preserves their combined discovery
surface.

`Higham28Asymptotics` is mixed. The unconditional Stirling and central-binomial
development moves to reusable `Analysis.Asymptotics.CentralBinomial`; the
literal Chapter 28 Hilbert, Pascal, shifted-Hilbert, and second-difference
statement surfaces move to `Source.Higham.Chapter28.AsymptoticStatements`.
The declaration-free `Chapter28.Asymptotics` aggregate preserves the combined
surface. The Ginibre closed-form owner receives its actual direct Mathlib
Stirling import instead of depending on the unrelated mixed historical module.

## Compatibility, aggregate, and test contract

Every historical owner remains as a declaration-free compatibility wrapper.
The 36 Ginibre wrappers import one canonical owner each; the two mixed wrappers
import their declaration-free canonical aggregate. Production consumers name
canonical paths. `Source.Higham.Chapter28.RealGinibre`, `ProbabilityStatements`,
`Asymptotics`, and the reusable `Analysis.Probability.RandomMatrices` aggregate
contain documentation and sorted imports only.

Every TSV row receives a canonical-only and an old-only smoke module. Each
isolated test imports exactly one route and checks the representative
declaration recorded in the queue. Separate canonical and compatibility test
umbrellas collect the 38 witnesses without mixing routes.

## Required validation

Completion requires isolated builds of all canonical owners and both witness
umbrellas; builds of the real-Ginibre, Chapter 28, reusable Analysis,
Algorithms, Source, All, and test aggregates; compatibility and layout checks
plus their self-tests; exact queue/wrapper/witness static validation; aggregate
sorting; and a scoped changed-path review. No LeVeque, gate, faithfulness,
ledger, HDP/Vershynin, Higham21, or Chapter 11 file belongs to this queue.

## Completion record

All 38 queued owners now have exact import-only wrappers, and all 42 canonical
declaration-owner files preserve the historical declaration names. The two
mixed owners became two reusable leaves and four source-facing leaves, with
six new declaration-free family aggregates. Static validation found 38 unique
old paths, 38 unique compatibility targets, zero malformed wrappers, 38
canonical-only tests, 38 old-only tests, and no production import of a queued
legacy path.

The debt delta attributable to this frozen queue is:

| measure | before | after | delta |
| --- | ---: | ---: | ---: |
| unclassified modules | 282 | 244 | -38 |
| noncanonical modules | 202 | 164 | -38 |
| mixed modules | 9 | 9 | 0 |
| missing module documentation | 104 | 104 | 0 |
| declaration-bearing umbrellas | 21 | 21 | 0 |
| unsorted aggregate imports | 0 | 0 | 0 |

The focused build of `Source.Higham.Chapter28`, the 38-test canonical witness
umbrella, and the 38-test compatibility witness umbrella completed successfully
in 3,441 jobs. The reusable `Analysis.Asymptotics` and
`Analysis.Probability` aggregates completed successfully in 2,962 jobs.
`check_compatibility.py` passed at the wave boundary with 503 wrappers and 851
canonical targets, and the layout scanner self-test passed. A current layout
scan reported the Ginibre counters above and no Chapter 28 error; its only
errors were from the concurrently open Higham Chapter 14 wave, whose parent
lane owns the final post-concurrency repository-wide rescan.

The scoped inventory contains exactly 178 changed paths and passes
`git diff --check`. It is recoverable without heuristics from the
TSV: its 38 `old_module` cells name every modified wrapper and its semicolon-
separated `canonical_declaration_owners` cells name all 42 new declaration
owners. The remaining exact paths are:

- aggregates: `NumStability/Analysis/Asymptotics.lean`,
  `NumStability/Analysis/Probability.lean`,
  `NumStability/Analysis/Probability/RandomMatrices.lean`,
  `NumStability/Source/Higham/Chapter28.lean`, and the Chapter 28
  `Asymptotics.lean`, `PositiveMatrices.lean`, `ProbabilityStatements.lean`,
  `RealGinibre.lean`, and `Theorem01.lean` aggregates;
- production consumers: `NumStability/Algorithms.lean` and the four
  `Higham28Contracts.lean`, `Higham28GaussianQRHaar.lean`,
  `Higham28HilbertAsymptotic.lean`, and `Higham28ShiftedHilbert.lean` leaves;
- tests: the 38 files under
  `NumStabilityTest/Import/Canonical/Source/Higham/Chapter28/RealGinibre/`, the
  38 files under
  `NumStabilityTest/Import/Compatibility/Algorithms/TestMatrices/Higham28RealGinibre/`,
  their `RealGinibreWave.lean` and `Higham28RealGinibre.lean` umbrellas, and
  `NumStabilityTest.lean`;
- policy evidence: this Markdown file, its sibling TSV,
  `docs/architecture/tiers.json`, `layout-exceptions.json`, and
  `COMPATIBILITY.md`.
