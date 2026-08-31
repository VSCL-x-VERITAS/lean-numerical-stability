# Faithfulness audit: HDP-02-BODY-2.4-DEGREE-CHERNOFF

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `c72ed8c2c4e064e115c969abaa705e4ddf849917f9a11bf7a6f4ad56bd2c4fff`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The source and target agree on the fixed vertex, n-1 incident Bernoulli edges, exact binomial degree law, mean (n-1)p, inclusive ten-percent absolute-deviation event, prefactor 2, and one positive absolute exponential constant. The blind role's missing expansions of HasLaw and setBernoulli are resolved by the direct dependency record and do not reveal a mathematical mismatch. The consequential difference is hypothesis scope: the source passage inherits the enclosing dense-regime condition, while the target states the valid local result for all admissible parameters. Because that omission creates genuine nonvacuous broader applicability, Lean implies the source but not conversely, so the correct accepted classification is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. The concrete Bernoulli-edge graph law and ordinary degree observable yield the source's n-1 independent incident-edge representation, the HasLaw conjunct gives its exact Binomial(n-1,p) distribution, and the second conjunct is the same fixed-vertex inclusive two-sided bound with a single positive absolute constant. The unrestricted target therefore specializes to every instance covered by the inherited dense-regime source context.
- **Source implies lean:** `no`. As contracted, the selected source passage inherits d >= C log n from its enclosing proposition. The target has no such premise and asserts both the exact law and tail bound for all admissible n and p. Although the cited local argument justifies that generalization mathematically, the context-scoped source claim alone does not assert the target's additional sparse-regime cases.

## Findings

- **note / genuine broader applicability:** The target is accepted as faithful-stronger rather than faithful-equivalent; it adds nonvacuous sparse-regime instances without changing the fixed-vertex conclusion.
- **note / resolved dependency visibility:** The round-trip judge's dependency-based unclear verdicts do not remain as semantic uncertainties in the adjudicated result.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `unclear` |
| `C10` | `pass` | `unclear` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `78` dependencies (`0` hash-reused); unclear: `D028`.
- Direct judge covered `78` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/agent_outputs/adjudicator.json` (`3ffa7e466614285fc8e9b75d2d837189eea79db4005c2acde1c22a7ff4292c67`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/agent_outputs/agent_runs.json` (`bc57a8423628042fe804ab05650a5217272f5b2d1ada2dc7a13a14a97528dfe4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/agent_outputs/blind_translation.json` (`ddac94ed813962598116dd888cbe2b071046b81893beb6e7d6b70f8110cbf419`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/agent_outputs/direct_judge.json` (`83fddf007c8ef6c5ab1b88d5b49b6fdb6f8553ff7943f842159424fc3ded44f8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/agent_outputs/roundtrip_judge.json` (`21e8c2fb2bbb69ac2c805ad4a59f7689ac7fc224e4b66ad9aa3299b83f0ca146`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/agent_outputs/source_contract.json` (`0be28d3ffbe22e5a651d4d1a581597a8a8e2832feb5ef9629c1ba2dc80bfc67f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/decision.json` (`8fdc7458dbec99d26733381e00543a5770bebcce42f53b6bc7dc40d5401b5476`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/inputs/blind_dependency_inventory.json` (`3d2ce8f2093cb1d4372359117f9a2a2d345f4c98a8de639890b360920ab50a2a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/inputs/blind_dossier.md` (`6bfe5d43140eabc7d55ed47df85fa47b4a2e66482ea01bca4c51fbcd12eb5dbb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/inputs/blind_review_packet.md` (`6bfe5d43140eabc7d55ed47df85fa47b4a2e66482ea01bca4c51fbcd12eb5dbb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/inputs/declaration_dossier.md` (`fb0bbde072c1b788bdef5ea874fa34461dff526fe0da063d350a981e01abd754`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/inputs/dependency_inventory.json` (`092a27a726c5d28a67d4086f2a98e384f642ad14cda3e46f17abc2ef07f05196`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/inputs/direct_review_packet.md` (`cc9a53e0499f40a56301f0a59566c2cf743875cad5f9006137e7b7125675f3c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-DEGREE-CHERNOFF/faithfulness/inputs/source_locator.json` (`8e902b1e824f34bfba9b6de351df06589a9039b20b33b2a799cbc86eb053461c`)
