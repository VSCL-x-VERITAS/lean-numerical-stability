# Faithfulness audit: HDP-02-DEF-2.4-ERDOS-RENYI

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `7a31f13078a1ac3f54c79528cd0d10a40279ea7c9842ca6ed65a82ad48b27409`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target unfolds to Mathlib's binomial random simple-graph measure on Fin n. Its event tests exactly the members of a finite loopless edge family E and requires precisely T to be present; hT makes the pattern consistent. The right side is p to the number of present edges times 1-p to the number of absent specified edges, with ENNReal coercions and boundary cases preserving ordinary probability values. This is exactly the finite product-law content of independent Bernoulli(p) decisions for all unordered pairs of distinct vertices. Both implication directions hold, all dependencies and checks are resolved, and adjudication is unnecessary.

## Implications

- **Lean implies source:** `yes`. After unfolding the audited dependencies, Lean gives exactly the source contract's finite cylinder-event identity for every finite family of loopless unordered edges and every present subfamily, with p and 1-p factors and all boundary cases. Fin n is merely a canonical labeling of an n-vertex set.
- **Source implies lean:** `yes`. The source's mutually independent Bernoulli(p) edge decisions imply that any prescribed statuses on E have probability equal to the product of p over T and 1-p over E minus T. Finset cardinalities and hT reduce this to the exact displayed Lean formula under SimpleGraph.binomialRandom.

## Findings

- **note / source-expansion:** This is a faithful explicit consequence of the defining independence statement, not an additional modeling assumption.
- **note / vertex-labeling:** The representation differs only by relabeling and does not change the edge-pattern probability law.
- **note / canonical vertex labeling:** This is an inessential canonical representation: all n-element vertex sets are bijective and the Erdos-Renyi edge law is preserved by relabeling.
- **note / equivalent finite-pattern formulation:** Because the formula covers every finite loop-free edge family and every present subfamily, it is equivalent to the source's mutual independent Bernoulli characterization.

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

- Blind translator covered `68` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `68` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/agent_runs.json` (`536bef41a9bda60510ce25ebf821384fae60abe88c209e056ec80fcf10df90df`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/blind_translation.json` (`31a25016d415438e1fda574a47f4387bbba6e528a65d21438ac6bb0933d49801`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/direct_judge.json` (`c9df420a530be3498efaf566d111735ef67d5f5782b88fc9a52713663a8f187a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/roundtrip_judge.json` (`34eb905b79145042fb0d8bb7dc37b6425a2971640bd6617786a2b6be11c33ea2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/agent_outputs/source_contract.json` (`5ca6e6c81095f7a8c2c0835ef6abfc296103ba0498547b51b607031ac961a4fb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/decision.json` (`b3f409738cb7e8f288128a10fc0f6607dbb9201ceece4455df94b889a32db396`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/blind_dependency_inventory.json` (`6a5a2def334a0872e52150aaaa9414e3e57bcbd25e415a8b4435210b6a0845a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/blind_dossier.md` (`3faf3d7773e4f00dc9f88b45042ad93176ea207b60d259995e73120350ff068a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/blind_review_packet.md` (`3faf3d7773e4f00dc9f88b45042ad93176ea207b60d259995e73120350ff068a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/declaration_dossier.md` (`25f86edece1c70f3216f6cadb34c39b1333a62a1bfdb8b305e6381403abf46dc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/dependency_inventory.json` (`26f952d5b04a549c81c574c91853d476576d05ef05a55e9609ab34dc69891e5e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/direct_review_packet.md` (`3498b98f86f75797e3956f2b1fe393aac5a5d62ae2355b67ab9bab009da7d776`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T102243Z/inputs/source_locator.json` (`235a7de5dd86801a46c5ed1da0a3bed3c9be13256ac647687be747f3ffd33e8b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/agent_outputs/adjudicator.json` (`3495e852decd01307541141e6fe6f398328dcdea020e9705985d0a7d5d326e66`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/agent_outputs/agent_runs.json` (`ff26812f8f721089837cccee4deec14496dc148176339fb88bec74beac58806b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/agent_outputs/blind_translation.json` (`91edecd00a7407c86b7063cd58db45b08f8476aaddb71822d36a4799d14aa07e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/agent_outputs/direct_judge.json` (`8fabf133ac9c31fbc0c08cafdfcbdf0160e85f3ac578588d43074f345fc8eea4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/agent_outputs/roundtrip_judge.json` (`3f0a4fbab3fcf127ef5a8e8a84093bb4961026d3869460362f6174a9227a8b0d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/agent_outputs/source_contract.json` (`183c438352d683a6dcf747e98c63a7018bda4f6bb1412aee6914ef8df0535aaa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/decision.json` (`90f500ee33777590fa624f74efedf6cabc1ab21d994736b8de73f6160c7a1d88`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/inputs/blind_dependency_inventory.json` (`6a5a2def334a0872e52150aaaa9414e3e57bcbd25e415a8b4435210b6a0845a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/inputs/blind_dossier.md` (`3faf3d7773e4f00dc9f88b45042ad93176ea207b60d259995e73120350ff068a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/inputs/blind_review_packet.md` (`3faf3d7773e4f00dc9f88b45042ad93176ea207b60d259995e73120350ff068a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/inputs/declaration_dossier.md` (`195e1876cba2ead59803a54904802195ad7ef126c346bde0fa6198b0824b8e88`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/inputs/dependency_inventory.json` (`26f952d5b04a549c81c574c91853d476576d05ef05a55e9609ab34dc69891e5e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/inputs/direct_review_packet.md` (`3498b98f86f75797e3956f2b1fe393aac5a5d62ae2355b67ab9bab009da7d776`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/history/20260830T110536Z/inputs/source_locator.json` (`235a7de5dd86801a46c5ed1da0a3bed3c9be13256ac647687be747f3ffd33e8b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/blind_dependency_inventory.json` (`ae152f56e0602c7eb9bb7f4bbd909447a07620f7218a138d34bd3d22ba9713a8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/blind_dossier.md` (`49dd0c878eef4f9a8a701a03c6b95b4cf53b73c352a018e5f497f94359326a91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/blind_review_packet.md` (`49dd0c878eef4f9a8a701a03c6b95b4cf53b73c352a018e5f497f94359326a91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/declaration_dossier.md` (`48b3dd275d3695c982edbe575ab1a43ae4331deeca9752038b2f26e7e44c032a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/dependency_inventory.json` (`55e7db6abc21cae57bb6914fcc92fff3fed43cda566fc7f22d1dd154d50e2d7e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/direct_review_packet.md` (`6821e15162a70d3e72ecfc9e0ac9ffab8d3cb3f691efa370ef749d0fe3e01c8d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.4-ERDOS-RENYI/faithfulness/inputs/source_locator.json` (`235a7de5dd86801a46c5ed1da0a3bed3c9be13256ac647687be747f3ffd33e8b`)
