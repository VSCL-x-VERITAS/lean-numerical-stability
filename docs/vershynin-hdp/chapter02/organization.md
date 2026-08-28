# Chapter 2 organization baseline

Chapter 2 uses the repository-wide organization counters owned by the
`book-formalization-migration` workflow. The previous all-zero values in
`gates/ch02.json` were inherited and contradicted the current Chapter 1 gate;
they were not backed by a Chapter 2 organization report or a current scan.

Current measured counters:

| Counter | Value | Evidence |
|---|---:|---|
| unclassified production modules | 309 | current `tools/architecture/check_layout.py` result shared with Chapter 1 |
| duplicate wrappers | 0 | current inspected Chapter 1/2 wrapper baseline |
| placeholder findings | 1 | current layout scan identifies `NumStability/HDP/Concentration/MetricMeasure.lean` |
| canonical placement pending | 0 | no recorded pending Chapter 2 relocation after the current scalar/contract split |

These nonzero values are repository-wide debt, not a Chapter 2 mathematical
hard blocker. They keep the organization loop open and remain locally
actionable. The generated organization preflight now rejects future gate
counter divergence before a stop.
