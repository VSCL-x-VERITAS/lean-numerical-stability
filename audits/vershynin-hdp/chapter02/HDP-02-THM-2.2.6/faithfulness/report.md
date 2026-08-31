# Faithfulness audit: HDP-02-THM-2.2.6

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `d2579abd7ac5257917ee6680255f5406ffa0f36cf94d88b5a91bcdad0bd6b6b8`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Primary source and proof-free Lean declaration evidence agree on the complete substantive Hoeffding claim: a finite jointly independent family of real random variables, one individual closed interval per variable, strict positive threshold, separate centering by each expectation, the unweighted one-sided upper-tail event, and the exact exponential rate -2t^2 divided by the sum of squared widths. The imported definitions resolve all blind dependency uncertainty: mu is normalized to mass one, the bounded measurable functions are integrable so their Bochner integrals are expectations, and iIndepFun is standard mutual indexed independence. The source's unqualified interval notation has the conventional almost-sure meaning; null-set representative changes would preserve the conclusion even under a literal pointwise reading. Arbitrary finite indexing is coordinate-free, with an additional trivial empty case. Finally, when all widths vanish, the centered sum is zero almost everywhere, so the positive-threshold event has probability zero. Lean's totalized quotient yields right side 1 rather than the customary limiting value 0, but both conclusions hold and both implications remain valid. The consistent classification is faithful-equivalent and accepted, with no remaining uncertainty.

## Implications

- **Lean implies source:** `yes`. On positive width energy, the Lean proposition is exactly Theorem 2.2.6 after finite reindexing and interpreting probability, expectation, independence, and boundedness by their standard measure-theoretic meanings. If all widths vanish, every X_i is constant almost everywhere, its integral is that constant, and the positive-threshold centered event has probability zero; this proves the source's intended trivial/limiting branch despite the printed quotient. If the source interval notation is read pointwise, replace each X_i on its null exceptional set by a measurable interval-valued representative; the joint law, independence, expectations, and event probability are unchanged.
- **Source implies lean:** `yes`. Every numbered source family reindexes to a nonempty finite type and supplies the target's probability-space, measurability, joint-independence, interval, and positive-threshold assumptions; pointwise bounds imply the target's a.e. bounds. The conclusions coincide when the width energy is positive. When it is zero, the target's total quotient gives right side 1 and its centered event has probability zero. The additional empty finite type has the same direct zero-event proof, so it is not genuine extra strength.

## Findings

- **minor / zero-denominator presentation:** The numerical right-side term differs from the customary limiting value at the degenerate boundary, but the theorem propositions imply one another and acceptance is unchanged.
- **note / almost-everywhere representatives:** The standard a.s. reading matches directly; even a literal pointwise reading is propositionally equivalent after choosing bounded a.e.-equal representatives.
- **note / finite indexing:** Nonempty cases differ only by reindexing, and the empty case is a true zero-event boundary, not reduced applicability or nonvacuous strength.
- **note / centered-expectation semantics:** Each Lean center is exactly E X_i, preserving the source's separately centered summands.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `unclear` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `61` dependencies (`0` hash-reused); unclear: `D016, D022, D032`.
- Direct judge covered `61` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/agent_outputs/adjudicator.json` (`3b21619e423082bef80d963a81818f5cafe3808545ba661e0cf4cf43bc7f5ac6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/agent_outputs/agent_runs.json` (`48cae70e87c1ed12d6d0e0e73c5428579dc1faf565ac8a9a78da77081451f931`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/agent_outputs/blind_translation.json` (`2b5abd2fe95b7fd7898ae5fd8ecda0e65cac657f5b22f9956ffc54d4aab66984`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/agent_outputs/direct_judge.json` (`32db385a861c846232f57c4ed61ada384669d97a442ae4c28c3534cc26322679`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/agent_outputs/roundtrip_judge.json` (`d3334067cb47daf6c7a29f8280e5aa9d4fb22ee874f76fdb9087d38f7381dcd5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/agent_outputs/source_contract.json` (`4137fbd43d60539808ac9e716063e9b99c7004fefa7e6f257390b73219aae3fe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/decision.json` (`728a532e7593414887b5170fde4879a6e5c33f2f4609bed07c0d50b7857c7136`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/agent_outputs/adjudicator.json` (`3b21619e423082bef80d963a81818f5cafe3808545ba661e0cf4cf43bc7f5ac6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/agent_outputs/agent_runs.json` (`48cae70e87c1ed12d6d0e0e73c5428579dc1faf565ac8a9a78da77081451f931`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/agent_outputs/blind_translation.json` (`2b5abd2fe95b7fd7898ae5fd8ecda0e65cac657f5b22f9956ffc54d4aab66984`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/agent_outputs/direct_judge.json` (`32db385a861c846232f57c4ed61ada384669d97a442ae4c28c3534cc26322679`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/agent_outputs/roundtrip_judge.json` (`d3334067cb47daf6c7a29f8280e5aa9d4fb22ee874f76fdb9087d38f7381dcd5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/agent_outputs/source_contract.json` (`4137fbd43d60539808ac9e716063e9b99c7004fefa7e6f257390b73219aae3fe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/decision.json` (`c980fedd413647978d73974b975d471e5f3650bc45cc427ebabf48d71aff900e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/inputs/blind_dependency_inventory.json` (`a96c3e8fe74b37071ab64fd42ae13e47df54e4e7c06d12cce6f94d77ebb7b669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/inputs/blind_dossier.md` (`7f9489ddf506b444d91aaa39c2028c02d13e26b888c95b779c8f7b4c6ebb1860`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/inputs/blind_review_packet.md` (`7f9489ddf506b444d91aaa39c2028c02d13e26b888c95b779c8f7b4c6ebb1860`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/inputs/declaration_dossier.md` (`b48b49c86815925dc2fdcf52742c0e60f40ad39f2fcc509b5dffd3cb6e9478db`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/inputs/dependency_inventory.json` (`a96c3e8fe74b37071ab64fd42ae13e47df54e4e7c06d12cce6f94d77ebb7b669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/inputs/direct_review_packet.md` (`537533d5d0bca47bfa0260dd10208fe3523bda014692d75572511e86d43b4929`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/history/20260831T101824Z/inputs/source_locator.json` (`c76b208c184ac017b2e3458623b032cb651a7e2f84e092202fdb060fa5950899`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/inputs/blind_dependency_inventory.json` (`a96c3e8fe74b37071ab64fd42ae13e47df54e4e7c06d12cce6f94d77ebb7b669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/inputs/blind_dossier.md` (`7f9489ddf506b444d91aaa39c2028c02d13e26b888c95b779c8f7b4c6ebb1860`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/inputs/blind_review_packet.md` (`7f9489ddf506b444d91aaa39c2028c02d13e26b888c95b779c8f7b4c6ebb1860`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/inputs/declaration_dossier.md` (`f9250b4b07b4f01916e81cd37229eecd0b2d41fcabf3ecc4159dab84e84cf578`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/inputs/dependency_inventory.json` (`a96c3e8fe74b37071ab64fd42ae13e47df54e4e7c06d12cce6f94d77ebb7b669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/inputs/direct_review_packet.md` (`537533d5d0bca47bfa0260dd10208fe3523bda014692d75572511e86d43b4929`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.6/faithfulness/inputs/source_locator.json` (`c76b208c184ac017b2e3458623b032cb651a7e2f84e092202fdb060fa5950899`)
