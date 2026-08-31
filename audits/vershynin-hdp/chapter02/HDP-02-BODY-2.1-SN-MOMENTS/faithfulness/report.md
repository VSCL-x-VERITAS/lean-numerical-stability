# Faithfulness audit: HDP-02-BODY-2.1-SN-MOMENTS

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `392bd0e6e6a3fccb5b7547b9b367e1c075cb3996d45e3bf8c4f6bd868e8d3ea8`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Both required hashes verify. The declaration exactly formalizes the page-12 identities and their immediately following probabilistic model: positive N, an arbitrary common probability-space realization, mutually independent fair Bernoulli tosses, the uncentered 0/1 head count, and the exact expectation N/2 and variance N/4. The arbitrary finite index type and explicit marginal-law/measurability hypotheses merely expose source conventions, while boundedness ensures the formal integral and real variance have their ordinary meanings. Both implication directions hold.

## Implications

- **Lean implies source:** `yes`. Every Lean instance is a positive finite family of mutually independent fair Bernoulli outcomes on a common probability space. The summed 0/1 indicator is exactly the number of heads, and Lean concludes both source moment identities with the exact values N/2 and N/4.
- **Source implies lean:** `yes`. Any source experiment of N independent fair tosses can be represented by a nonempty finite index type, its common probability space, and Bool-valued head outcomes with the specified pushforward laws and independence. The source's two exact moment identities are then precisely the target conclusion.

## Findings

- **note / finite-index-representation:** This is a harmless equivalence under finite relabeling and does not change the mathematical content.
- **note / probability-model-made-explicit:** The formal probability-space details expose rather than strengthen the source's intended experiment.

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

- Blind translator covered `67` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `67` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/agent_outputs/agent_runs.json` (`03aed561a2632f58ecab10c2fe37af35c5d1dcd179a3f7b55b5a12846ff15685`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/agent_outputs/batch_source_contract.json` (`a8a7de1cdf7e873a0a37911690deed23454cebd568f618794c55615abb3d854b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/agent_outputs/blind_translation.json` (`650f9688cfabee89099ba3df0cee7ca5579f8aa1c5f471db25d1a649bad00560`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/agent_outputs/direct_judge.json` (`45acd2c21cee5b475717e501144d2b8def02619ad9f2b65290c8ca264aa29c74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/agent_outputs/roundtrip_judge.json` (`c76b3fdcfafcc82184aa87909615b3c88312cdb525625f956ae2dcd7e51837bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/agent_outputs/source_contract.json` (`954b7d4dc1f9e58123686e983998e285f61e13ca464f2e4c113e11e849c98241`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/decision.json` (`971ec883533ec695d9d1a656f9c0665d19862c658db37c34de8a61e73cbc91ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/agent_outputs/agent_runs.json` (`29637c1194584b83221b05ce9e185db12d586e5e6139b7263b301c39ae86ea3b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/agent_outputs/batch_source_contract.json` (`a8a7de1cdf7e873a0a37911690deed23454cebd568f618794c55615abb3d854b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/agent_outputs/blind_translation.json` (`650f9688cfabee89099ba3df0cee7ca5579f8aa1c5f471db25d1a649bad00560`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/agent_outputs/direct_judge.json` (`45acd2c21cee5b475717e501144d2b8def02619ad9f2b65290c8ca264aa29c74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/agent_outputs/roundtrip_judge.json` (`c76b3fdcfafcc82184aa87909615b3c88312cdb525625f956ae2dcd7e51837bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/agent_outputs/source_contract.json` (`954b7d4dc1f9e58123686e983998e285f61e13ca464f2e4c113e11e849c98241`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/decision.json` (`052594f06896fd0ed753819d66d970108a82877a5317f36a264b5779d51c4ac4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/inputs/batch_source_locator.json` (`983a0aecc0d0c2f707faa045151db0fcb2ca9211a2a52ac5b92803f6d1bc35f0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/inputs/blind_dependency_inventory.json` (`8e4f4c5ac1f79cd795f668f2b9e66573635b264a2a6185bd65d05257772ce195`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/inputs/blind_dossier.md` (`61ade95fda570db9b06d0d7c0b69f97abef13abfbd980da34f0e190d27fac47e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/inputs/blind_review_packet.md` (`61ade95fda570db9b06d0d7c0b69f97abef13abfbd980da34f0e190d27fac47e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/inputs/declaration_dossier.md` (`b62b366a0f3e360070f665f7ca94e85dcb980404360468a4884be67f1712952e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/inputs/dependency_inventory.json` (`f4efd783ab3f890803466545a40c2cd2b2d4e56397f7419c7d829f816edab517`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/inputs/direct_review_packet.md` (`4d943d096ab38414a8856516c0a8cbaeb28de0f7ce6649f22b6f424b15df3d08`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T082818Z/inputs/source_locator.json` (`973935bbe30b455d71217a01c4aae84ff34160dab23201c14000e8a1112f6a71`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/agent_outputs/agent_runs.json` (`03aed561a2632f58ecab10c2fe37af35c5d1dcd179a3f7b55b5a12846ff15685`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/agent_outputs/batch_source_contract.json` (`a8a7de1cdf7e873a0a37911690deed23454cebd568f618794c55615abb3d854b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/agent_outputs/blind_translation.json` (`650f9688cfabee89099ba3df0cee7ca5579f8aa1c5f471db25d1a649bad00560`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/agent_outputs/direct_judge.json` (`45acd2c21cee5b475717e501144d2b8def02619ad9f2b65290c8ca264aa29c74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/agent_outputs/roundtrip_judge.json` (`c76b3fdcfafcc82184aa87909615b3c88312cdb525625f956ae2dcd7e51837bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/agent_outputs/source_contract.json` (`954b7d4dc1f9e58123686e983998e285f61e13ca464f2e4c113e11e849c98241`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/decision.json` (`941fde8211ed51ea9853b8f4923bfb4cd0b0c0b84130d5529db0d463d2d50741`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/inputs/blind_dependency_inventory.json` (`8e4f4c5ac1f79cd795f668f2b9e66573635b264a2a6185bd65d05257772ce195`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/inputs/blind_dossier.md` (`61ade95fda570db9b06d0d7c0b69f97abef13abfbd980da34f0e190d27fac47e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/inputs/blind_review_packet.md` (`61ade95fda570db9b06d0d7c0b69f97abef13abfbd980da34f0e190d27fac47e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/inputs/declaration_dossier.md` (`60a9b98dd689fc1f1f4a67a680b9e56d12ee43c66f53482352b07d05fd619ca2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/inputs/dependency_inventory.json` (`f4efd783ab3f890803466545a40c2cd2b2d4e56397f7419c7d829f816edab517`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/inputs/direct_review_packet.md` (`4d943d096ab38414a8856516c0a8cbaeb28de0f7ce6649f22b6f424b15df3d08`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/history/20260831T100742Z/inputs/source_locator.json` (`973935bbe30b455d71217a01c4aae84ff34160dab23201c14000e8a1112f6a71`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/inputs/blind_dependency_inventory.json` (`8e4f4c5ac1f79cd795f668f2b9e66573635b264a2a6185bd65d05257772ce195`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/inputs/blind_dossier.md` (`61ade95fda570db9b06d0d7c0b69f97abef13abfbd980da34f0e190d27fac47e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/inputs/blind_review_packet.md` (`61ade95fda570db9b06d0d7c0b69f97abef13abfbd980da34f0e190d27fac47e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/inputs/declaration_dossier.md` (`61eadc85dd7f472b96e9bd66cbe5516fe42b2f53df8ac9a6bffe61e941d2992f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/inputs/dependency_inventory.json` (`f4efd783ab3f890803466545a40c2cd2b2d4e56397f7419c7d829f816edab517`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/inputs/direct_review_packet.md` (`4d943d096ab38414a8856516c0a8cbaeb28de0f7ce6649f22b6f424b15df3d08`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-SN-MOMENTS/faithfulness/inputs/source_locator.json` (`973935bbe30b455d71217a01c4aae84ff34160dab23201c14000e8a1112f6a71`)
