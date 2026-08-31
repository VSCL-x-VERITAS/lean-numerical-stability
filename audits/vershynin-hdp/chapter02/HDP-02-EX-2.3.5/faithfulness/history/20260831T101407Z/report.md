# Faithfulness audit: HDP-02-EX-2.3.5

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `5acadfca0625edaef2d6e4e2d92abefe6b79316014a0b39014742e6bbe823f02`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The regenerated Lean proposition now has exactly the source's logical shape: there exists one positive real absolute constant c that works uniformly for every finite independent Bernoulli family and every 0 < delta <= 1. Boolean Bernoulli variables are an exact 0/1 recoding, the indicator sum is S_N, the parameter sum is mu, and the inclusive event, prefactor 2, exponent -c mu delta^2, and all side conditions match. Arbitrary finite indexing and its valid empty case are harmless. Both implications hold, so the classification is faithful-equivalent and accepted.

## Implications

- **Lean implies source:** `yes`. The outer Lean witness c is positive and uniform over every subsequently quantified probability space, finite Bernoulli family, and delta. Recode each Boolean variable as its real 0/1 indicator; then the Lean sum is S_N, sum_i p_i is mu, and the event and bound are exactly those printed in Exercise 2.3.5.
- **Source implies lean:** `yes`. Choose in Lean the positive absolute constant asserted by the source. Any finite-type Bernoulli family can be reindexed as X_1,...,X_N, with Bool true/false mapped to 1/0, so the source gives the exact Lean inequality for nonempty families. For an empty finite type, the event is the full space and the bound is 1 <= 2, so the harmless extra case follows directly with the same c.

## Findings

- **note / uniform-constant-quantification:** The regenerated target now captures the source's existential and uniformity exactly; it neither fixes a stronger numerical constant nor permits data dependence.
- **note / bernoulli-representation:** This is an exact measurable recoding.
- **note / empty-index-extension:** The extra case is valid and trivial, so it is not genuine additional theorem strength.
- **note / representation:** These are equivalent encodings of a finite Bernoulli family and do not alter either implication direction.
- **note / degenerate-empty-family:** The extra degenerate instance is valid independently and does not weaken or restrict the source claim.

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

- Blind translator covered `60` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `60` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/agent_runs.json` (`564d2362e19bd567cf08b1947ee7e71253b748003286718520aeb3d422079c3a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/blind_translation.json` (`33c3a383d66be60d3bd3259f50078a00802a94fd537439a762336d855800d9f5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/direct_judge.json` (`ddb696939225a8017b7a3ea53dd88c903da72d959c619b15003a3c9c053b96a7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/roundtrip_judge.json` (`5a7f801d4305f12b69699e7f537cab4f23337f23a476cdc2f7a271f057d4d87c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/agent_outputs/source_contract.json` (`a8047257a5f36c9e5d88f7795fb62bb55027d8937970f8441d7c2e26119fcda7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/decision.json` (`4fedbf8af119365e8fb3eb584c37bd28cb94469a73a8f0cdaff5a340ee199711`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/agent_outputs/adjudicator.json` (`d26b563d8a4697135bdc6d62c3256e3653b7f3110e2e12b83d84412c3f882cc9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/agent_outputs/agent_runs.json` (`49f28b9a0e20c3d444110595181ed1615a0de949c38afacb0e759a261536e6cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/agent_outputs/blind_translation.json` (`4c081c4d9a051ea7d9113af1705cfba3bb1b7088943b62b812d9e4492edbac97`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/agent_outputs/direct_judge.json` (`cb39939156aa8288e5a556e5cd7331a9119abe8e053ca9d895ac5e11760ceeaa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/agent_outputs/roundtrip_judge.json` (`7091bea4489309cffa563daac63b70530ed3c6933e25469d183b20ee4772d41d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/agent_outputs/source_contract.json` (`a6e6dfbb889ec9e37db859eef7f397d5cfad1069bb2065f6377581741bc52dd6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/decision.json` (`2ce537612f5c4517a286a0927b142820615ff1d2d30e44fa0d4ff5c7ff19167e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/inputs/blind_dependency_inventory.json` (`8f94a589e07155e1f1d59856d121752be80c1b537e18e431f5b563e4452894b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/inputs/blind_dossier.md` (`11e026f7bb7630a9509aff89c30b867375e503f5e1754321e11053b62224590d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/inputs/blind_review_packet.md` (`11e026f7bb7630a9509aff89c30b867375e503f5e1754321e11053b62224590d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/inputs/declaration_dossier.md` (`238050c64196374f691e41351555276bee3f5c5116210824da8f47e0bd34cbb5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/inputs/dependency_inventory.json` (`8f94a589e07155e1f1d59856d121752be80c1b537e18e431f5b563e4452894b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/inputs/direct_review_packet.md` (`4c129f8367597cea9cb5d12b0328af189988694139b7c2ba2e4d7d01bdb8a9b4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T100836Z/inputs/source_locator.json` (`01200fc74239c47d25498073e307484fe7a0d486632f642dfae76ce03e8720ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/agent_outputs/agent_runs.json` (`564d2362e19bd567cf08b1947ee7e71253b748003286718520aeb3d422079c3a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/agent_outputs/blind_translation.json` (`33c3a383d66be60d3bd3259f50078a00802a94fd537439a762336d855800d9f5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/agent_outputs/direct_judge.json` (`ddb696939225a8017b7a3ea53dd88c903da72d959c619b15003a3c9c053b96a7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/agent_outputs/roundtrip_judge.json` (`5a7f801d4305f12b69699e7f537cab4f23337f23a476cdc2f7a271f057d4d87c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/agent_outputs/source_contract.json` (`a8047257a5f36c9e5d88f7795fb62bb55027d8937970f8441d7c2e26119fcda7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/inputs/blind_dependency_inventory.json` (`8fb5a3b2cb2622277adfa28925a380ed1c1b56a47d34f0f03f1fba9b47c61335`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/inputs/blind_dossier.md` (`61d2e02699bbf27569ad6e28803af567ac3e3951dd5af3cfd600c178f63634a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/inputs/blind_review_packet.md` (`61d2e02699bbf27569ad6e28803af567ac3e3951dd5af3cfd600c178f63634a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/inputs/declaration_dossier.md` (`8724fd09755a6fd5182c9a73301da1efabeb5650d0e749ee064571d4fea765f3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/inputs/dependency_inventory.json` (`8fb5a3b2cb2622277adfa28925a380ed1c1b56a47d34f0f03f1fba9b47c61335`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/inputs/direct_review_packet.md` (`47a03b285a9cbec76cc042181cbcbe93d462605975521f4cb7600d3750bdc96a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T101710Z/inputs/source_locator.json` (`01200fc74239c47d25498073e307484fe7a0d486632f642dfae76ce03e8720ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T102523Z/inputs/blind_dependency_inventory.json` (`8fb5a3b2cb2622277adfa28925a380ed1c1b56a47d34f0f03f1fba9b47c61335`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T102523Z/inputs/blind_dossier.md` (`61d2e02699bbf27569ad6e28803af567ac3e3951dd5af3cfd600c178f63634a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T102523Z/inputs/blind_review_packet.md` (`61d2e02699bbf27569ad6e28803af567ac3e3951dd5af3cfd600c178f63634a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T102523Z/inputs/declaration_dossier.md` (`92cda98a9d5b3eb0fd62799c52e731908bbcd0fb970e138e1a7cab9b67f61023`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T102523Z/inputs/dependency_inventory.json` (`8fb5a3b2cb2622277adfa28925a380ed1c1b56a47d34f0f03f1fba9b47c61335`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T102523Z/inputs/direct_review_packet.md` (`47a03b285a9cbec76cc042181cbcbe93d462605975521f4cb7600d3750bdc96a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/history/20260830T102523Z/inputs/source_locator.json` (`01200fc74239c47d25498073e307484fe7a0d486632f642dfae76ce03e8720ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/blind_dependency_inventory.json` (`8fb5a3b2cb2622277adfa28925a380ed1c1b56a47d34f0f03f1fba9b47c61335`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/blind_dossier.md` (`61d2e02699bbf27569ad6e28803af567ac3e3951dd5af3cfd600c178f63634a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/blind_review_packet.md` (`61d2e02699bbf27569ad6e28803af567ac3e3951dd5af3cfd600c178f63634a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/declaration_dossier.md` (`a0ff8dfd4a0688af8c6dcfb2b7d6f1ea391a7716cd4d19c06094d59b8e4925c3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/dependency_inventory.json` (`8fb5a3b2cb2622277adfa28925a380ed1c1b56a47d34f0f03f1fba9b47c61335`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/direct_review_packet.md` (`47a03b285a9cbec76cc042181cbcbe93d462605975521f4cb7600d3750bdc96a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.5/faithfulness/inputs/source_locator.json` (`01200fc74239c47d25498073e307484fe7a0d486632f642dfae76ce03e8720ab`)
