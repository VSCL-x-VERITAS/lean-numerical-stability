# Faithfulness audit: HDP-02-DEF-2.4-ERDOS-RENYI

## Decision

- Classification: `undetermined`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `d4ca699cd2b878b85aa5efedfd3628648d3c51b1c2a93eae9700807b35b0d85a`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The prepared evidence agrees on all visible structural features: Fin n is a canonical n-vertex type, p ranges over [0,1], simple graphs exclude loops, the target separates a graph law from deterministic graphs, and the packaged degree is ordinary neighbor-count degree. The exact judge disagreement arises because the direct judge treats D028 as the standard independent Bernoulli-p graph law, whereas the round-trip judge observes that the supplied external-frontier body does not expose the semantics of setBernoulli, edgeSet, or comap. Under the instruction to interpret declarations from supplied evidence rather than names, that central gap cannot be closed. C03, C05, and C07 are resolved as structural passes, but C06 and both implications remain unclear, so the classification is undetermined and the artifact is not accepted.

## Implications

- **Lean implies source:** `unclear`. The target visibly has the right n-vertex simple-graph domain, probability range, off-diagonal edge set, and degree convention. However, its graph-law equality reaches D028, whose supplied body does not define the next-frontier operations needed to derive the source's essential per-edge marginal p and mutual-independence properties.
- **Source implies lean:** `unclear`. The source-reported construction and degree convention align with the target's visible shape, and the degree equality is harmless definitional packaging. Yet the permitted evidence does not establish that the source's independent Bernoulli-p law is exactly the external-frontier measure used by D028.

## Findings

- **major / external-frontier-distribution-semantics:** The source's central edge-marginal and mutual-independence requirements cannot be certified in either implication direction, forcing an undetermined, non-accepted decision.
- **note / quantifier-and-conclusion-structure:** C03, C05, and the relation-form portion of C07 are resolved as passes; they do not add uncertainty beyond C06.
- **note / degree-packaging:** The second conjunct is harmless definitional packaging and is not an independent mismatch or genuine strengthening.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `unclear` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `unclear` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `unclear` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `35` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `35` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

- The permitted dossiers do not supply the declarations or laws of ProbabilityTheory.setBernoulli, SimpleGraph.edgeSet, and MeasureTheory.Measure.comap needed to certify that D028 has exactly probability-p mutually independent indicators on all distinct unordered vertex pairs.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/adjudicator.json` (`3495e852decd01307541141e6fe6f398328dcdea020e9705985d0a7d5d326e66`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/agent_runs.json` (`ff26812f8f721089837cccee4deec14496dc148176339fb88bec74beac58806b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/blind_translation.json` (`91edecd00a7407c86b7063cd58db45b08f8476aaddb71822d36a4799d14aa07e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/direct_judge.json` (`8fabf133ac9c31fbc0c08cafdfcbdf0160e85f3ac578588d43074f345fc8eea4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/roundtrip_judge.json` (`3f0a4fbab3fcf127ef5a8e8a84093bb4961026d3869460362f6174a9227a8b0d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/source_contract.json` (`183c438352d683a6dcf747e98c63a7018bda4f6bb1412aee6914ef8df0535aaa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/decision.json` (`90f500ee33777590fa624f74efedf6cabc1ab21d994736b8de73f6160c7a1d88`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/blind_dependency_inventory.json` (`6a5a2def334a0872e52150aaaa9414e3e57bcbd25e415a8b4435210b6a0845a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/blind_dossier.md` (`3faf3d7773e4f00dc9f88b45042ad93176ea207b60d259995e73120350ff068a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/blind_review_packet.md` (`3faf3d7773e4f00dc9f88b45042ad93176ea207b60d259995e73120350ff068a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/declaration_dossier.md` (`25f86edece1c70f3216f6cadb34c39b1333a62a1bfdb8b305e6381403abf46dc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/dependency_inventory.json` (`26f952d5b04a549c81c574c91853d476576d05ef05a55e9609ab34dc69891e5e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/direct_review_packet.md` (`3498b98f86f75797e3956f2b1fe393aac5a5d62ae2355b67ab9bab009da7d776`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/source_locator.json` (`235a7de5dd86801a46c5ed1da0a3bed3c9be13256ac647687be747f3ffd33e8b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/blind_dependency_inventory.json` (`6a5a2def334a0872e52150aaaa9414e3e57bcbd25e415a8b4435210b6a0845a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/blind_dossier.md` (`3faf3d7773e4f00dc9f88b45042ad93176ea207b60d259995e73120350ff068a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/blind_review_packet.md` (`3faf3d7773e4f00dc9f88b45042ad93176ea207b60d259995e73120350ff068a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/declaration_dossier.md` (`195e1876cba2ead59803a54904802195ad7ef126c346bde0fa6198b0824b8e88`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/dependency_inventory.json` (`26f952d5b04a549c81c574c91853d476576d05ef05a55e9609ab34dc69891e5e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/direct_review_packet.md` (`3498b98f86f75797e3956f2b1fe393aac5a5d62ae2355b67ab9bab009da7d776`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/source_locator.json` (`235a7de5dd86801a46c5ed1da0a3bed3c9be13256ac647687be747f3ffd33e8b`)
