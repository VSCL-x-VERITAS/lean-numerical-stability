# Faithfulness audit: HDP-02-EX-2.3.5

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `8285d02877ab6804aef7ffa2880c557c4e2e67ae2b1acd58208cf47787feed03`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target preserves the entire inherited setting and conclusion of Exercise 2.3.5: a finite family of mutually independent Bernoulli variables, their success-count sum and mean, 0 < delta <= 1, the inclusive two-sided relative-deviation event, prefactor 2, and exponential decay linear in the mean and quadratic in delta. The complete direct evidence resolves the three probability predicates that the blind translation could not expand, so the exact hypotheses are source-matching and satisfiable. Lean then fixes the source's unspecified uniform absolute constant to c = 1/4. This is genuine nonvacuous strength, not reduced applicability: Lean implies the source, while the source's existential statement does not imply that numerical coefficient.

## Implications

- **Lean implies source:** `yes`. The probability-space, exact Bernoulli-law, mutual-independence, measurability, finite-sum, mean, and delta hypotheses match the inherited source setting. The Lean conclusion is the same inclusive two-sided relative-deviation bound with the uniform positive absolute constant fixed to c = 1/4, so it supplies the existential witness required by the book.
- **Source implies lean:** `no`. Exercise 2.3.5 asserts only that some positive absolute constant c exists. That proposition does not identify or entail c = 1/4; a smaller source witness gives a weaker exponential estimate and cannot establish the specific Lean bound.

## Findings

- **note / explicit-absolute-constant:** Lean provides a genuine nonvacuous strengthening with c = 1/4; it implies the source, but the source statement alone does not imply this particular rate.
- **note / blind-frontier-resolved:** The blind translator's deliberate external-frontier uncertainty does not leave a semantic mismatch or nonvacuity risk after adjudication.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `fail` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `fail` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `62` dependencies (`0` hash-reused); unclear: `D017, D033, D034`.
- Direct judge covered `62` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/adjudicator.json` (`d26b563d8a4697135bdc6d62c3256e3653b7f3110e2e12b83d84412c3f882cc9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/agent_runs.json` (`49f28b9a0e20c3d444110595181ed1615a0de949c38afacb0e759a261536e6cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/blind_translation.json` (`4c081c4d9a051ea7d9113af1705cfba3bb1b7088943b62b812d9e4492edbac97`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/direct_judge.json` (`cb39939156aa8288e5a556e5cd7331a9119abe8e053ca9d895ac5e11760ceeaa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/roundtrip_judge.json` (`7091bea4489309cffa563daac63b70530ed3c6933e25469d183b20ee4772d41d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/source_contract.json` (`a6e6dfbb889ec9e37db859eef7f397d5cfad1069bb2065f6377581741bc52dd6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/decision.json` (`2ce537612f5c4517a286a0927b142820615ff1d2d30e44fa0d4ff5c7ff19167e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/blind_dependency_inventory.json` (`8f94a589e07155e1f1d59856d121752be80c1b537e18e431f5b563e4452894b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/blind_dossier.md` (`11e026f7bb7630a9509aff89c30b867375e503f5e1754321e11053b62224590d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/blind_review_packet.md` (`11e026f7bb7630a9509aff89c30b867375e503f5e1754321e11053b62224590d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/declaration_dossier.md` (`238050c64196374f691e41351555276bee3f5c5116210824da8f47e0bd34cbb5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/dependency_inventory.json` (`8f94a589e07155e1f1d59856d121752be80c1b537e18e431f5b563e4452894b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/direct_review_packet.md` (`4c129f8367597cea9cb5d12b0328af189988694139b7c2ba2e4d7d01bdb8a9b4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/source_locator.json` (`01200fc74239c47d25498073e307484fe7a0d486632f642dfae76ce03e8720ab`)
