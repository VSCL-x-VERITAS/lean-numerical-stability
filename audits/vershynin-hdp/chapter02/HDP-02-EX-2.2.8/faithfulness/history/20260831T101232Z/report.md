# Faithfulness audit: HDP-02-EX-2.2.8

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `374e1393ee79a49ac90546f7e2c10e2c5c49ffaa7f784ff37e6e44966ab39622`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The fixed Lean proposition contains Exercise 2.2.8 as the exact specialization to independent wrong-answer indicators: its mean, majority threshold, logarithmic sample-size constant, and epsilon tail guarantee match the source. It further proves the same bound for a heterogeneous family of arbitrary [0,1]-valued random variables with no larger means. That extension has ordinary non-indicator models and is genuine theorem strength rather than an additional premise or narrower domain. All primary evidence, dependency meanings, boundary cases, and implication directions are resolved, so adjudication is not requested.

## Implications

- **Lean implies source:** `yes`. Instantiate W i as the indicator that run i is wrong. Exact one-run success 1/2 + delta gives expectation 1/2 - delta, independent repeated randomness gives iIndepFun, and indicators are measurable and [0,1]-valued. The Lean conclusion bounds the probability of at least half wrong answers, including a possible tie, by epsilon, so majority correctness is at least 1 - epsilon under the source threshold.
- **Source implies lean:** `no`. The source amplification result only addresses wrong-answer indicators from copies of one randomized decision algorithm. It does not by itself establish the Lean tail bound for arbitrary independent, not necessarily identically distributed, real variables in [0,1] whose means may merely be bounded above by 1/2 - delta.

## Findings

- **note / genuine generalization:** The Lean proposition is nonvacuously stronger than the source, while the source is recovered by indicator specialization.
- **note / algorithm abstraction:** The algorithmic statement follows after interpreting W as wrong-answer indicators; no execution or answer type is encoded directly.
- **note / implicit independence:** This makes explicit the independence necessary for the source's indicated derivation and does not reduce intended applicability.
- **note / genuine generalization:** The reconstruction strictly extends the source model while preserving it as a nonvacuous specialization, so only translation-to-source entailment holds.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `62` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `62` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/agent_outputs/agent_runs.json` (`795f7c07cd2375bf3fb81f3d4d5062d50d4486ba37b6ea437ef63888719ae1a1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/agent_outputs/blind_translation.json` (`caf4c0ebd9c84ec248fc3eb6fbf285a4edf68f4d9d1359f3caae16c8985cface`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/agent_outputs/direct_judge.json` (`4b211cef07bfff71e033b262afd89d2993e0cc95c690be4c2aea205fc09b8e25`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/agent_outputs/roundtrip_judge.json` (`e4c9cf18a0aa3d58cea58873f4d343dd875887633064cb933dfaeb5e66c9a8e8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/agent_outputs/source_contract.json` (`01a164e18073cb5dcc525ad15495390ae0fa83e03bc5071ac9f5141920444f30`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/decision.json` (`fb05c38a09ffcaccf73f8769c4c568fd2e4832a5c6a56b488a0def2c9ac7ef12`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/inputs/blind_dependency_inventory.json` (`dea036451485493a89a7acca229e10b871e1d1feb67b4d9433c6b81ca281847c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/inputs/blind_dossier.md` (`df605d2f9d418376153dd67ed233aef6f0a0d35d41db75a643c355c1d9cc9dd8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/inputs/blind_review_packet.md` (`df605d2f9d418376153dd67ed233aef6f0a0d35d41db75a643c355c1d9cc9dd8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/inputs/declaration_dossier.md` (`8382241a7b53fbb6c39ccb1ef80d69aff74e5666f25e0325b37db2878d4d1045`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/inputs/dependency_inventory.json` (`dea036451485493a89a7acca229e10b871e1d1feb67b4d9433c6b81ca281847c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/inputs/direct_review_packet.md` (`6069e812927eee993ada1ab119c6e10c7f117bb2b4861349ed75e7a27f6bac6d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.8/faithfulness/inputs/source_locator.json` (`c443cec5caf9f5517ac28d6bdc331d2b9375a8317781ed93ac5f6f226f526c15`)
