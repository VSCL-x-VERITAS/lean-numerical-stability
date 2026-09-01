# Higham Chapter 14 / Gauss--Jordan migration queue

Status: completed after review and validation on 2026-09-01. The exact 42-row
route is recorded in
[`higham14-gauss-jordan.tsv`](higham14-gauss-jordan.tsv); implementation must not
add, remove, or retarget a row without a new review boundary.

## Frozen scope and baseline

The pre-wave architecture checks pass at 2,588 production modules, 244
unclassified modules, 9 mixed-module exceptions, 104 missing module docstrings,
164 noncanonical modules, 21 declaration-bearing umbrellas, and zero unsorted
aggregate import blocks. The compatibility contract has 503 forwarding modules
and 851 canonical targets.

The queue is exactly the 38 currently unclassified/noncanonical
`NumStability.Algorithms.Ch14*` paths plus the four directly coupled,
unclassified `GaussJordan`, `GaussJordanPivoting`, `MatrixInversion`, and
`MatrixInversionMethod2BInstance` paths. Six already-canonicalized Chapter 14
compatibility paths (`Ch14HymanDeterminant`, `Ch14Problem1413Boundary`, the three
`Ch14Schulz*` paths, and `Ch14SourceCorrections`) are explicitly excluded.
Chapter 15, Chapter 21, Chapter 28, LeVeque/PDE, audits, gates, ledgers, and
immutable source inputs are outside this wave.

## Ownership review

Eighteen queued files still own declarations; twenty-four are proof-free source
locators. The W08 split already placed the reusable Gauss--Jordan and matrix
inversion cores under `NumStability.Algorithms.LinearSystems.GaussJordan` and
`NumStability.Algorithms.MatrixInversion.*`. Consequently, every remaining
declaration is a Higham Chapter 14 endpoint, derivation, asymptotic bridge, or
source-facing bound. Those owners move to the semantic
`NumStability.Source.Higham.Chapter14` destinations frozen in the TSV.

`GaussJordan` and `MatrixInversion` are compositionally mixed historical
surfaces: each imports reusable algorithm owners but retains only source-facing
declarations. Their residual declarations move to the queued source owners,
which import the already-canonical reusable cores. No production module receives
the primary tier `mixed`; every new owner is `source`, and every old path becomes
`compatibility`.

## Compatibility and evidence contract

All 42 old paths become exact one-import, declaration-free wrappers. Production
consumers are retargeted to canonical routes. Each TSV row receives an isolated
canonical-only test and an isolated old-only test checking the representative
declaration, collected by route-pure family umbrellas. Canonical Chapter 14 and
algorithm aggregates must expose the moved owners with sorted imports.

Closure requires declaration preservation against the frozen historical files,
42 exact wrappers, 42 canonical targets, 84 isolated route tests, no production
old-path imports, focused owner and family builds, canonical-only and old-only
umbrella builds, compatibility/layout checks, the layout self-test, aggregate
sorting checks, and `git diff --check`.

## Execution record

All 42 frozen routes were implemented without retargeting: 18 declaration
owners moved unchanged and 24 declaration-free locators collapsed to exact
one-import wrappers. The wave added 84 isolated leaf tests (42 canonical-only
and 42 old-only), two route-pure test umbrellas, and the required sorted source
aggregates. Production consumers no longer import any queued historical path.

The first layout scan identified a structural issue outside the queue rows: the
new `Method2B.TwoBlockDerivation` child made the pre-existing declaration-owning
`Problem02.TriangularInversion.Method2B` module an umbrella. Its declarations
were therefore extracted unchanged to `Method2B.Core`; the existing `Method2B`
path is now a declaration-free family aggregate. No layout exception was added.

Final counters are 2,607 production modules, 202 unclassified modules, 9 mixed
exceptions, 104 missing module docstrings, 126 noncanonical modules, 20
declaration-bearing umbrellas, and zero unsorted aggregate import blocks. The
compatibility inventory is 545 forwarding modules with 893 canonical targets.
Relative to the frozen baseline, that is +19 production modules, -42
unclassified modules, -38 noncanonical modules, -1 declaration-bearing
umbrella, +42 wrappers, and +42 targets; the other counters are unchanged.

The Chapter 14 production aggregate, canonical-only route umbrella, and
old-only route umbrella build successfully. Compatibility, layout, the layout
self-test, Python checker compilation, the exact queue/static audit, and
`git diff --check` all pass.
