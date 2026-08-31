# Methodological Origin and Attribution

## Primary inspiration

This package adapts and extends the semantic-correctness audit presented in:

> Theodore Meek, Siyuan Ge, Di Qiu Xiang, Simon Chess, and Vasily Ilin.
> "Formalizing Numerical Analysis: An Agent Pipeline and Quality Audit Beyond
> Kernel Acceptance." arXiv:2606.14000v1 [cs.AI], 2026.

Paper: <https://arxiv.org/abs/2606.14000>

The relevant discussion is Section 3.2.1, "Semantic Correctness," together
with the judge prompts reproduced in the paper's appendix.

## Relationship to the paper

The package retains the central design of comparing natural-language source
claims and Lean statements through independent evidence paths:

- direct source-versus-Lean judgment;
- blind translation of Lean back into mathematical language;
- round-trip source-versus-translation judgment;
- separate checks of the two logical implication directions;
- stateless role execution and recorded judge provenance.

This is an independent implementation, not source code released with the
paper and not a claim to reproduce the paper's experiments exactly. It adds
engineering and domain controls needed for repository-level theorem audits:

- recursive coverage of imported Lean declarations that determine semantics;
- source-contract extraction from immutable, hash-verified documents;
- configurable semantic checklists, including numerical-analysis and
  floating-point profiles;
- hash-bound prompts, schemas, scripts, source files, and Lean environment;
- conditional adjudication of disagreements and unresolved checks;
- task-local machine-readable artifacts, model provenance, and run history;
- separate classifications for weaker and materially different statements.

## Suggested attribution

When describing use of this package, a precise statement is:

> We used a formalization-faithfulness audit protocol adapted from the
> semantic-correctness methodology of Meek et al. (2026), extended with
> recursive imported-definition coverage, hash-bound evidence, configurable
> semantic checklists, and conditional multi-agent adjudication.

## BibTeX

```bibtex
@misc{meek2026formalizing,
  title         = {Formalizing Numerical Analysis: An Agent Pipeline and
                   Quality Audit Beyond Kernel Acceptance},
  author        = {Meek, Theodore and Ge, Siyuan and Xiang, Di Qiu and
                   Chess, Simon and Ilin, Vasily},
  year          = {2026},
  eprint        = {2606.14000},
  archivePrefix = {arXiv},
  primaryClass  = {cs.AI},
  url           = {https://arxiv.org/abs/2606.14000}
}
```
