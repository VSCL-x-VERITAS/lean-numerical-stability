# Higham Chapter 28 non-Ginibre test-matrix migration queue

Status: completed on 2026-09-01 from the reviewed queue frozen before
implementation. The exact 34-row ownership map is
[`higham28-test-matrices.tsv`](higham28-test-matrices.tsv).

## Fresh selection boundary

After the 38-owner real-Ginibre wave, a fresh intersection of the reviewed
unclassified and noncanonical baselines contains exactly 34 remaining modules
whose names begin `NumStability.Algorithms.TestMatrices.Higham28`. The two sets
are identical. Already canonicalized Ginibre, Gaussian absolute-moment, Haar
uniqueness, and Equation 28.2 compatibility paths are excluded. No LeVeque,
Higham21, Higham14, HDP/Vershynin, gate, faithfulness, or ledger path is in this
queue.

The 34 owners contain 17,909 lines and form one closed source-correspondence
development: the Chapter 28 gallery, Cauchy, companion, Hilbert, Pascal,
Toeplitz, reciprocal-SPD, randsvd, Gaussian/orthogonal Haar, and Stewart
families. Their apparent genericity is inseparable here from the book's chosen
constructions, displayed endpoints, and cross-family proof chain. This bounded
wave therefore classifies every owner as `source`; it does not publish a new
reusable Analysis API or create a mixed owner.

## Canonical ownership and compatibility

Declarations move without renaming into semantic family leaves under
`NumStability.Source.Higham.Chapter28`. Family aggregates for Cauchy, Companion,
Hilbert, Orthogonal, Pascal, Probability, Randsvd, Stewart, and Toeplitz, plus a
Chapter 28 `TestMatrices` aggregate, provide declaration-free discovery paths.
Every historical module becomes an exact one-target import-only wrapper.
Production imports are retargeted to canonical paths, while one canonical-only
and one old-only smoke module per TSV row check the recorded representative
declaration.

## Required closure

Completion requires 34 canonical leaves, 34 wrappers, 68 isolated route tests,
sorted and reachable family aggregates, zero production import of a queued old
path, focused builds of every canonical family and both route-test umbrellas,
compatibility validation, layout self-test/current scan, scoped diff checking,
and an exact before/after debt report. Repository-wide scans that overlap the
independent Higham14 lane are interpreted only after that lane reaches its
shared-manifest boundary.

## Completion record

All 34 declaration owners now live at their frozen canonical paths, and all 34
historical paths are exact one-target, declaration-free wrappers. The 34
canonical-only and 34 old-only smoke leaves compile through their two isolated
route umbrellas. No production module imports a queued historical path.

The focused build of `NumStability.Source.Higham.Chapter28.TestMatrices`,
`NumStabilityTest.Import.Canonical.Source.Higham.Chapter28.TestMatricesWave`,
and
`NumStabilityTest.Import.Compatibility.Algorithms.TestMatrices.Higham28TestMatrices`
completed successfully with 3,405 jobs. Compatibility validation passed at 579
wrappers and 927 direct canonical targets. The layout placeholder self-test and
current scan passed, with the reviewed counters moving from the green Higham14
boundary to this wave's boundary as follows:

| Counter | Before | After | Delta |
| --- | ---: | ---: | ---: |
| Lean modules | 2,607 | 2,651 | +44 |
| unclassified modules | 202 | 168 | -34 |
| mixed modules | 9 | 9 | 0 |
| modules missing module docs | 104 | 94 | -10 |
| legacy naming exceptions | 126 | 92 | -34 |
| declaration-bearing umbrellas | 20 | 20 | 0 |
| unsorted aggregate imports | 0 | 0 | 0 |

The enclosing `NumStability.Source.Higham.Chapter28` aggregate also completed
successfully with 3,463 jobs after the Stewart branch's proof-local matrix
measurable-space instance was given an explicit source-local name, avoiding
an anonymous-instance collision when the Stewart and real-Ginibre branches are
imported together.

The exact scoped inventory contains 163 changed paths: the 34 old and 34
canonical paths recorded in the TSV; 34 canonical and 34 legacy test leaves;
10 family/discovery aggregates; the Chapter 28, canonical-test, legacy-test,
production, root-test, tier, layout, compatibility, and queue integration
paths named above. All 163 exist, all 163 are reported changed, scoped
`git diff --check` passed, and a direct trailing-whitespace scan reported zero
issues.
