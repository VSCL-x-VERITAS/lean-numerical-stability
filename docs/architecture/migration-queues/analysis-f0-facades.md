# Analysis F0 compatibility-facade queue

Status: completed on 2026-09-01 against the post-MatrixPowers baseline.

The exact frozen 20-row queue is
[`analysis-f0-facades.tsv`](analysis-f0-facades.tsv). Every queued historical
file was already declaration-free; this wave therefore moves no declaration.
It replaces facade-to-facade dependencies with exact semantic imports,
retargets all 39 audited production edges, classifies the 20 paths as
compatibility, and retains every historical import.

## Frozen boundary

- Included: the 20 `NumStability.Analysis` facades in the TSV, their exact 88
  canonical/source import targets, 39 direct production consumer edges,
  isolated canonical-only and legacy-only tests, aggregates, tiers, layout
  exceptions, and compatibility documentation.
- Excluded: the declaration-bearing Berger/numerical-radius F1 family and the
  separate `NumStability.Analysis.PseudospectralResolvent` F2 classification
  wave. No declaration owner, LeVeque Chapter 1 artifact, gate, audit, or ledger
  is in scope.

## Counter contract

The frozen post-MatrixPowers baseline is 61 unclassified modules, 33
noncanonical modules, 9 mixed modules, 79 modules missing module docs, 20
declaration-bearing umbrellas, and 0 unsorted aggregates. This wave removes
exactly 20 unclassified exceptions and the single noncanonical
`CStarMatrixBridge` exception. Expected closure is therefore 41 / 32 / 9 / 79
/ 20 / 0 in the same order.

## Compatibility contract

Each historical file contains only its pre-existing Mathlib prerequisites,
the exact project imports recorded by its TSV row and `COMPATIBILITY.md`, and
comments/module documentation. The permanent F0 canonical and compatibility
test umbrellas import all 20 routes independently. Because the queued paths
own zero public or private declarations, preserving their exact import surface
preserves every public name without a rename or ownership transfer.
