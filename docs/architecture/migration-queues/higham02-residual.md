# Higham Chapter 2 residual migration queue

Status: frozen before declaration movement on 2026-09-01. The exact twelve-row
queue is [`higham02-residual.tsv`](higham02-residual.tsv).

## Selection boundary

The live pre-wave layout baseline is 33 unclassified modules, 27 noncanonical
modules, 9 mixed modules, 79 modules missing module documentation, 20
declaration-bearing umbrellas, and 0 unsorted aggregates. The queue is exactly
the twelve remaining Chapter-2-named modules listed in the TSV. All twelve are
clean at `d602405cdd2a25915e5ba09dfd542886f4f9e2fa`; their frozen SHA-256 hashes,
LOC, object counts, consumers, canonical owners, routes, and compatibility
imports are recorded in the TSV.

The queue contains 31,592 lines and 1,331 named objects: 1,119 public theorems,
208 private theorems, and four private definitions. Each retained private-user
closure moves atomically. In particular, all 1,114 objects in
`NumStability.Analysis.Problem2_10` move together; its widely shared private
rounding helpers are not split or promoted.

## Ownership and compatibility

All twelve closures are Higham source correspondence. Reusable floating-point
foundations remain at their existing semantic Analysis and FloatingPoint
paths. Every historical path becomes a declaration-free wrapper around the
documented family route. `Problem2_12`, `Problem2_14`, and `Problem2_27` retain
the extra canonical predecessor route recorded in the TSV so their historical
transitive import surfaces remain available.

Production consumers use canonical routes. The critical
`WilkinsonAttainability` consumer switches to
`NumStability.Source.Higham.Chapter02.Problem10.DivisionRoundTrip.All`, which
combines the existing `Basic` declarations with the moved midpoint theorem.

## Exclusions and completion contract

No LeVeque Chapter 1 file, gate, faithfulness audit, ledger,
`.faithfulness-audit`, `module-audit.json`, or `unit-index.json` is in scope.
Completion requires twelve canonical source owners, twelve sorted `All`
routes, twelve exact compatibility wrappers, canonical-only and old-only tests,
an exhaustive 1,119-name canonical audit, zero production imports of the old
paths, compatibility and layout closure, and exact counter and changed-path
reporting. Expected relative layout debt is unclassified `-12` and
noncanonical `-12`, with all other recorded debt counters unchanged.

## Implementation record

Status: source, static, and compiler complete on 2026-09-03. The exhaustive
canonical audit compiled successfully in a 2,902-job focused build.

All twelve historical modules are documented import-only wrappers, and all
twelve canonical owners preserve the frozen named-command sequence exactly:
1,119 public theorems, 208 private theorems, and four private definitions. The
twelve declaration-free `All` routes import their existing `Basic` leaf and
their new declaration owner. Production source contains no import of a queued
historical path.

The source-anchored public-name inventory is
[`higham02-residual-public-names.tsv`](higham02-residual-public-names.tsv).
It contains one row for every public named command, including its historical
owner, checkpoint line, command kind, and fully qualified name. The canonical
compiler audit
`NumStabilityTest.Import.Canonical.HighamChapter02Residual.AllPublicNames`
imports only the twelve family routes and issues exactly 1,119 fully qualified
`#check` commands. `tools/architecture/check_higham02_residual.py` regenerates
both artifacts from checkpoint
`5e14756a1e6b7c0f99968f0e3e5f52702ff03f49` and verifies:

- all twelve checkpoint blob hashes, LOC counts, and per-owner public/private
  command counts against the frozen queue;
- exact visibility, kind, fully qualified name, and order at each canonical
  owner;
- exact, sorted, command-free family routes and exact command-free wrappers;
- absence of production imports of the twelve historical paths;
- exact compatibility tiers for the wrappers and exact aggregate tiers for
  the twelve `All` routes; and
- byte-for-byte currency of the inventory and compiler audit, their exact
  1,119-name coverage, and case-folded test import ordering.

The attributable layout delta remains the frozen contract: production modules
`+24`, unclassified modules `-12`, and noncanonical modules `-12`; mixed,
missing-documentation, declaration-bearing-umbrella, and unsorted-aggregate
debt are unchanged. Global counter totals are intentionally deferred to the
post-concurrency integration scan.

The source-only gate is green with:

```text
python -B tools/architecture/check_higham02_residual.py
```

The completed validation sequence is:

```text
lake build NumStabilityTest.Import.Canonical.HighamChapter02Residual.AllPublicNames
lake build NumStabilityTest.Import.Canonical.HighamChapter02Residual NumStabilityTest.Reorganization.W12
python -B tools/architecture/check_compatibility.py
python -B tools/architecture/check_layout.py --self-test
python -B tools/architecture/check_layout.py
git diff --check
```

To reproduce the two generated audit artifacts after an intentional queue or
checkpoint change, run:

```text
python -B tools/architecture/check_higham02_residual.py --update-artifacts
```

## Exact scoped changed-path inventory

The wave changes exactly 76 paths, recoverable without a Git-wide heuristic:

- 12 historical wrappers, 12 canonical owners, and 12 family routes: the
  `old_module`, `canonical_module`, and `family_route` columns of the frozen
  TSV, translated to Lean paths;
- the Chapter 2 aggregate:
  `NumStability/Source/Higham/Chapter02.lean`;
- four directly retargeted production consumers:
  `NumStability/Analysis.lean`,
  `NumStability/Algorithms/WilkinsonAttainability.lean`,
  `NumStability/Analysis/Problem2_26.lean`, and
  `NumStability/Source/Higham/Chapter27/SoftwareEnvironment.lean`;
- 14 canonical test paths: the 13 files under
  `NumStabilityTest/Import/Canonical/HighamChapter02Residual/` and their
  `NumStabilityTest/Import/Canonical/HighamChapter02Residual.lean` umbrella;
- 13 old-only test paths: the twelve matching Chapter 2 leaves under
  `NumStabilityTest/Reorganization/W12/Compatibility/` and their
  `NumStabilityTest/Reorganization/W12.lean` umbrella;
- the root test aggregate `NumStabilityTest.lean`; and
- seven architecture/audit paths: this report, `higham02-residual.tsv`,
  `higham02-residual-public-names.tsv`, `docs/architecture/COMPATIBILITY.md`,
  `docs/architecture/layout-exceptions.json`, `docs/architecture/tiers.json`,
  and `tools/architecture/check_higham02_residual.py`.
