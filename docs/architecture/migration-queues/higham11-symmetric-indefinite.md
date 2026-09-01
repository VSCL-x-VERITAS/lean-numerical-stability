# Higham Chapter 11 symmetric-indefinite migration queue

Status: completed as one compatibility-preserving migration wave on
2026-09-01. The reviewed exact 32-row old-to-canonical map is
[`higham11-symmetric-indefinite.tsv`](higham11-symmetric-indefinite.tsv).

## Selection evidence

The current layout baseline contains 261 noncanonical and 309 unclassified
production modules. The reviewed noncanonical partition has three leading
candidate families: Chapter 14 matrix inversion has 38 modules but only 16
declaration owners and retains private-name split blockers; Chapter 28 Ginibre
has 36 declaration owners but depends on a mixed Chapter 28 base outside the
candidate; Chapter 11 symmetric-indefinite factorization has 32 declaration
owners and is dependency-coherent. It is therefore the largest safe bounded
family under the 50-owner limit.

The 32 owner modules have 106 direct imports within the batch and only 33
outside production consumers: the complete Chapter 11 source umbrella and 32
existing import-only `NumStability.Algorithms.Cholesky.Higham11*`
compatibility wrappers. They contain 661 non-private and 126 private
definition/theorem-like declarations. The entire subgraph moves together, so
private implementation names never cross a newly introduced module boundary.
All owners are already classified `source`; none contributes to the 309
unclassified modules.

## Canonical ownership

The target hierarchy separates four mathematical strands below
`Chapter11.SymmetricIndefinite`: Bunch pivoting, Bunch--Kaufman pivoting, rook
pivoting, and skew-symmetric pivoting. Rounded Bunch--Kaufman execution forms a
subfamily of its own. The two modules that combine Chapter 9 perturbation bounds
with Chapter 11 block LDLT execution move to
`CrossChapter.Chapter09To11`. Public paths avoid the historical repeated
`Higham11` locator and the proof-progress words `Actual`, `Bridge`, `Closure`,
and `Terminal`.

Every declaration keeps its existing namespace and name. Canonical owner
leaves have role `source`; the seven new family entry points have role
`aggregate`; the 32 historical owner paths become exact one-import
`compatibility` wrappers. The existing 32 Algorithms/Cholesky wrappers remain
compatibility paths and are retargeted directly to the new owners.

## Import, aggregate, and test contract

Production imports inside the batch and all 33 outside consumers must name the
canonical owners. `Chapter11`, `CrossChapter`, `SymmetricIndefinite`, `Bunch`,
`BunchKaufman`, `BunchKaufman.Rounded`, `Rook`, `SkewSymmetric`, and
`Chapter09To11` expose sorted canonical imports only. The Chapter 11 umbrella
continues to expose the two cross-chapter declarations to preserve its prior
surface.

Each row receives three isolated smoke modules: a canonical-only import, an
old-source-only import, and an old-Algorithms-only import that each `#check` the
representative declaration in the TSV. Three test umbrellas collect the 32
canonical tests, 32 old-source tests, and 32 old-Algorithms tests without
mixing import routes.

## Execution record

The wave moved 32 declaration-owning modules without changing their declaration
namespaces or names, installed 32 exact old-source wrappers, retargeted the 32
pre-existing Algorithms wrappers directly to canonical owners, and added seven
production aggregates. It added 96 isolated leaf tests and three test
umbrellas.

The wave-local module delta is `+39`: 32 compatibility wrappers plus seven
aggregates. The shared post-wave scan reports 2,508 modules because one
unrelated LeVeque source leaf was added concurrently. Architectural debt changed
as follows: noncanonical `261 -> 229` (`-32`), unclassified `309 -> 309`, mixed
`9 -> 9`, missing module docs `117 -> 117`, declaration-bearing umbrellas
`21 -> 21`, and unsorted aggregate imports `0 -> 0`. The compatibility checker
changed from 406 forwarding modules and 754 targets to 438 forwarding modules
and 786 targets (`+32` each).

Focused builds passed for the canonical family, cross-chapter family, all three
isolated test umbrellas, the complete Chapter 11 umbrella, and the complete
CrossChapter umbrella. `check_layout.py`, `check_compatibility.py`, and both
self-tests passed. Exact queue validation confirmed 32 unique rows, 32
canonical owners, 64 direct compatibility wrappers, and 96 isolated witness
tests; aggregate sorting and the final diff check also passed.

One inherited edge remains explicitly deferred: canonical
`BunchKaufman.PivotSelection` still imports
`NumStability.Algorithms.Sylvester.Higham16QuasiRoundedSolve` for
`fl_solve2x2_backward_error_componentwise`. That dependency preceded this wave
and belongs to a future Chapter 16/Sylvester migration; this wave neither
introduced nor widened it.
