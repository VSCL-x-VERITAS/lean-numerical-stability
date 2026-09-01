# Higham Chapter 16 Sylvester migration queue

Status: frozen on 2026-09-01 before production edits. The machine-readable
authority is [`sylvester-higham16.tsv`](sylvester-higham16.tsv).

## Exact selection boundary

The current `layout-exceptions.json` baseline contains exactly 28 unclassified
modules whose names match `NumStability.Algorithms.Sylvester.*`, totaling
54,009 physical lines. Exactly 25 of those paths are also noncanonical. No
mixed-module, missing-module-documentation, declaration-bearing-umbrella, or
unsorted-aggregate exception row is in the family.

The W05/W06 compiler route evidence and a fresh comment-aware command audit
agree on the retained declaration surface: 805 compiler declarations in 12
owners, comprising 755 public declarations and 50 private declarations in
their reverse closure. The remaining 16 historical paths are already
declaration-free import shims. The 28-owner import graph is acyclic. Its only
non-aggregate production consumers are `Analysis.InverseOpNorm2`, two Higham
Chapter 11 source leaves, and four Higham Chapter 16 source leaves.

## Frozen semantic route

W05 and W06 already extracted the graph-free reusable mathematics and numbered
source correspondence from these physical owners. This wave therefore moves
each remaining typed private/reverse closure as an atomic semantic unit. The
seven declarations in `Higham16QuasiRoundedSolve` are source-independent
rounded 2-by-2 and block-back-substitution mathematics and move to
`Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart`.
The other 798 compiler declarations are Chapter 16 or cross-chapter source
closures and move to exact `Source.Higham.Chapter16` endpoints. This preserves
the private dependency and ambient-instance boundaries that caused W05/W06 to
retain them without leaving declarations on historical paths.

Every one of the 28 historical paths becomes an exact declaration-free
compatibility wrapper. Internal historical imports are expanded to canonical
target sets, production consumers are retargeted, and public namespaces and
declaration names remain unchanged. Private generated names may change with
their owning module and are not part of the public compatibility contract.

The wave adds a focused reusable route through the existing
`Algorithms.MatrixEquations.Sylvester` aggregates, a focused Chapter 16 source
umbrella, 28 isolated canonical-only leaves, and 28 isolated legacy-only
leaves. Shared manifests and counters are updated only after this freeze.

## Required completion evidence

Completion requires serialized focused builds of the reusable Sylvester
aggregate, the Chapter 16 source umbrella, the canonical-only import umbrella,
and the legacy-only import umbrella. It also requires the compatibility
contract, layout self-test and current scan, JSON parsing, a static 28-row and
54,009-LOC queue audit, a compiler-environment audit of all 755 public retained
names, and `git diff --check`.

## Exclusions

No path outside the 28 historical owners, their directly necessary semantic
destinations, production consumers, aggregates, isolated route tests, shared
manifests, and these queue documents is added to the wave. LeVeque Chapter 1,
gates, audits, ledgers, `.faithfulness-audit`, `module-audit.json`, and
`unit-index.json` are explicitly excluded.
