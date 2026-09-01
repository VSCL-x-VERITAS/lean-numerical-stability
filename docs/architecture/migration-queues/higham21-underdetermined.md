# Higham Chapter 21 underdetermined-systems migration queue

Status: completed as one compatibility-preserving migration wave on
2026-09-01. The exact 26-row old-to-canonical map was reviewed and frozen
before edits, then implemented without mapping changes. It is recorded in
[`higham21-underdetermined.tsv`](higham21-underdetermined.tsv).

## Selection and dependency boundary

The pre-wave layout scan reports 2,508 production modules, 229 noncanonical
modules, and 309 unclassified modules. The Chapter 21 underdetermined family is
exactly 26 declaration-owning locator leaves plus the declaration-free
`NumStability.Algorithms.Underdetermined.Higham21` umbrella. All imports among
the 26 owners remain inside this queue. Its only production consumers outside
the family are the Algorithms umbrella, the Higham 20 prose compatibility
surface, and least-squares conditioning. The owner graph therefore moves as a
single dependency-contained source family.

The queue deliberately excludes the three already-canonicalized compatibility
paths `Higham21Condition`, `Higham21RowwiseMeasure`, and
`Higham21Theorem21_3Attainment`; their canonical owners already live below
`NumStability.Source.Higham.Chapter21`. It also excludes the reusable
underdetermined-solve substrate, which retains its existing ownership.

## Projector-norm extraction

`Higham21ProjectorNorm` is the one mixed architectural edge in the family. Its
generic projector-complement norm results belong to the reusable owner
`NumStability.Analysis.Perturbation.LeastSquares.ProjectorComplementNorm`.
The Higham equation adapters belong to the queued source owner
`NumStability.Source.Higham.Chapter21.ProjectorComplementNorm`. The source
owner imports and re-exports the reusable core, so the historical path can be
an exact one-import wrapper without losing any public declaration. The
least-squares conditioning consumer is retargeted to the reusable core; the
Higham 20 compatibility consumer is retargeted to the source adapter.

This split changes ownership only. Every declaration retains its existing
namespace and name. The reusable theorem is proved directly from the existing
least-squares/Wedin substrate so the reusable owner does not import a source
chapter.

## Canonical hierarchy and compatibility contract

The target hierarchy groups Theorem 21.1 perturbation results, Equation 21.11
results, semi-normal-equation analysis, Givens analysis, and modified
Gram--Schmidt analysis under semantic family umbrellas. All queued leaves have
role `source`; the reusable projector core has role `reusable`; new family
entry points have role `aggregate`; all 26 historical leaves and the historical
family umbrella have role `compatibility`.

Every old leaf becomes an exact one-import wrapper to its unique canonical
owner, and the old family umbrella becomes an exact one-import wrapper to the
canonical Chapter 21 umbrella. Production consumers and canonical owners name
canonical imports only. Imports in every changed aggregate remain sorted.

## Required evidence

Each TSV row receives an isolated canonical-only test and an isolated old-only
test that checks the representative declaration. The extracted reusable core
receives its own canonical-only import test. Two family test umbrellas collect
the 26 source-canonical and 26 compatibility tests without mixing import
routes.

Completion requires focused builds for the reusable core, canonical Chapter 21
family, both isolated test umbrellas, and the relevant production aggregates;
the compatibility and layout checks plus the layout scanner self-test; exact
queue, wrapper, witness, and aggregate-sort static checks; and a final scoped
diff review. No LeVeque, PDE, audit, gate, ledger, or immutable source file
belongs to this queue.

## Execution record

The wave created 26 canonical source owners, five semantic source aggregates,
and one reusable projector-complement owner. It converted the 26 historical
owners and the historical family umbrella into exact import-only wrappers.
Each queued route has one canonical-only and one old-only test; the reusable
extraction has an additional canonical-only test, and two route-pure test
umbrellas collect the 52 per-row witnesses.

Normalized to the frozen pre-wave snapshot, production modules increased from
2,508 to 2,540 (`+32`), unclassified modules decreased from 309 to 282 (`-27`),
noncanonical modules decreased from 229 to 202 (`-27`), and missing module
docstrings decreased from 117 to 104 (`-13`). Mixed modules remained 9,
declaration-bearing umbrellas remained 21, and unsorted import blocks remained
zero. The compatibility contract increased from 438 wrappers and 786 targets
to 465 wrappers and 813 targets (`+27` each).

Focused reusable/source builds, the canonical Chapter 21 aggregate, the
historical family aggregate, both isolated route umbrellas, and the relevant
least-squares aggregate passed. The exact queue/static check verified 26 unique
rows, 26 one-import wrappers, 26 canonical owners, 52 route-pure tests,
preserved declarations, and sorted changed family aggregates. The layout
scanner self-test and final diff whitespace check also passed. Global layout
and compatibility counters are interpreted separately from this normalized
record because a concurrent Higham Chapter 28 Ginibre migration was adding
modules and compatibility routes at the same time.
