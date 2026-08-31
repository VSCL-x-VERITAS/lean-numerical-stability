# Faithfulness audit: HDP-02-EX-2.3.6

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `76d464ff7978e14bcdd9037d2f75878c8596774b9fc556c5b35c7846b60c6d5d`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The regenerated Lean proposition has the same logical shape and mathematical content as Exercise 2.3.6: there exists one positive absolute constant c, uniform over all Poisson rates and thresholds; the threshold range is 0 < t <= lambda; the event is inclusive and two-sided; and the bound is exactly 2 exp(-c t^2/lambda). Canonical poissonMeasure is an exact law-based realization of X ~ Pois(lambda), and explicit rate positivity follows from the threshold range. Both implications hold, so the target is faithful-equivalent and accepted.

## Implications

- **Lean implies source:** `yes`. The outer Lean witness c is positive and uniform over every rate and threshold. Any X with Poisson(lambda) law has the same two-sided deviation-event probability as the identity outcome under poissonMeasure lambda, so the Lean inequality gives exactly the source claim. The source's threshold range itself forces lambda > 0 whenever the claim is instantiated.
- **Source implies lean:** `yes`. Choose in Lean the positive absolute constant supplied by the source. Apply the source statement to the identity natural-number random variable on the canonical poissonMeasure rate; its law is Pois(rate), its centered event is exactly the Lean set, and all formula terms agree. The separate hrate premise is already implied by 0 < t <= rate.

## Findings

- **note / uniform-constant-quantification:** The regenerated target now captures the source uniformity exactly and does not fix an unnecessarily stronger numerical constant.
- **note / canonical-law-representation:** The event probability is determined solely by the law, so this canonicalization is exact.
- **note / redundant-rate-positivity:** The premise is logically redundant and does not reduce applicability.
- **note / canonical-law-formulation:** This is an equivalent law-based formulation and preserves both implication directions.
- **note / zero-rate-domain:** Removing a source parameter value with an empty guarded threshold domain has no substantive effect.

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

- Blind translator covered `47` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `47` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/agent_outputs/agent_runs.json` (`d1c75c67e45223625efc967f34245797b3fd8a7ee1adbf0b1bf94a6166e34a90`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/agent_outputs/blind_translation.json` (`dd29dff027cecaa45bff9a3c1d90203ad25901ab98db261895f26dc15a7dd0f9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/agent_outputs/direct_judge.json` (`1ee39cb3464b085c3f20bbd00f63fb3235f202c10be04aa9ceb1620d842c79af`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/agent_outputs/roundtrip_judge.json` (`58394beb4ff993f40331bac1bfa6e38e0921e961749e261d74473695b111776a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/agent_outputs/source_contract.json` (`7ac9529a6f587b414e2abd82e1d577198ad57506ec9c30fe522b2ae09f869e91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/decision.json` (`1ec58da273301a7c496476fcbd657c5f4d72fe68c7775fd2b1912e575c198565`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/agent_outputs/adjudicator.json` (`72fbd3b1c460f4b81fe7a1104828cec24bee6bff7f7715d4688b76cacfc1afc1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/agent_outputs/agent_runs.json` (`f5aad325a23ea843b48df22930d72183305f95ddd239d1b20b0bac1587ef8749`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/agent_outputs/blind_translation.json` (`ef18f02ac6bdcfdf4498344065faf01b6193113241e59a5cc65a87f892f7f231`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/agent_outputs/direct_judge.json` (`33683380522fa03dc897ae9859d432de69b646848862f53723e683f7e004b350`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/agent_outputs/roundtrip_judge.json` (`23335ac011f119ea55db90fb2878c0bc6d4815f4ab02e2b30e50d01c0ea4fdae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/agent_outputs/source_contract.json` (`311c436b3fe848121256871a41ef59d7c3e72d215c61455dff681e4bdfa34dfd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/inputs/blind_dependency_inventory.json` (`83e5c99cce9603166dda3b24db09588df9a06763885b970e6c7a6d7e8a3f1471`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/inputs/blind_dossier.md` (`5cc6eeaf4c2ef92a721c5cb5d5044e8a0ad55a42fd4104e59400d21f56cb8f34`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/inputs/blind_review_packet.md` (`5cc6eeaf4c2ef92a721c5cb5d5044e8a0ad55a42fd4104e59400d21f56cb8f34`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/inputs/declaration_dossier.md` (`095a3dcdad60066d38befe936b53c6c8d3cae1239a7fb8cd514094b6cb0f4238`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/inputs/dependency_inventory.json` (`83e5c99cce9603166dda3b24db09588df9a06763885b970e6c7a6d7e8a3f1471`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/inputs/direct_review_packet.md` (`69519e862a3475b1ef6b944834f42cac19ff2f595ff1f3b541317d42f78f8122`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T100915Z/inputs/source_locator.json` (`a705207b903b2d327407b7d039a38eb310145ef58cda5efeaba3b2e70a9864a5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/agent_outputs/agent_runs.json` (`3ca1a59a064f1fb3d4cbb427f3636890661a79183a2d2cd5b19900323a161714`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/agent_outputs/blind_translation.json` (`dd29dff027cecaa45bff9a3c1d90203ad25901ab98db261895f26dc15a7dd0f9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/agent_outputs/source_contract.json` (`7ac9529a6f587b414e2abd82e1d577198ad57506ec9c30fe522b2ae09f869e91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/inputs/blind_dependency_inventory.json` (`293f181043f5e2916f872e2deb8b356a7125ffc80a73290113c153b63578c32a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/inputs/blind_dossier.md` (`0d7762372a149ce7004acb1a88cbc33d02d35ec35f2f5c2dc8543b7eafc84153`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/inputs/blind_review_packet.md` (`0d7762372a149ce7004acb1a88cbc33d02d35ec35f2f5c2dc8543b7eafc84153`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/inputs/declaration_dossier.md` (`0cfe8f8993f7d83f1174caf5ef17f6a06914e5b0dfd8d56deef356e1e9fb37c0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/inputs/dependency_inventory.json` (`293f181043f5e2916f872e2deb8b356a7125ffc80a73290113c153b63578c32a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/inputs/direct_review_packet.md` (`49be1b167828605f33664e0c891e5b0aa5728dc524b6fade1629bee4fb97fa46`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T101748Z/inputs/source_locator.json` (`a705207b903b2d327407b7d039a38eb310145ef58cda5efeaba3b2e70a9864a5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T102608Z/inputs/blind_dependency_inventory.json` (`293f181043f5e2916f872e2deb8b356a7125ffc80a73290113c153b63578c32a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T102608Z/inputs/blind_dossier.md` (`0d7762372a149ce7004acb1a88cbc33d02d35ec35f2f5c2dc8543b7eafc84153`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T102608Z/inputs/blind_review_packet.md` (`0d7762372a149ce7004acb1a88cbc33d02d35ec35f2f5c2dc8543b7eafc84153`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T102608Z/inputs/declaration_dossier.md` (`6bd83bfb580cea03942732d7e611f0488906e9f7305a2df51638187bf9adc5b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T102608Z/inputs/dependency_inventory.json` (`293f181043f5e2916f872e2deb8b356a7125ffc80a73290113c153b63578c32a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T102608Z/inputs/direct_review_packet.md` (`49be1b167828605f33664e0c891e5b0aa5728dc524b6fade1629bee4fb97fa46`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260830T102608Z/inputs/source_locator.json` (`a705207b903b2d327407b7d039a38eb310145ef58cda5efeaba3b2e70a9864a5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/agent_outputs/agent_runs.json` (`ad99b01fd66293a3ac5b7ea87a29749f01967aafaaab7c9d3d4b9e3bce849017`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/agent_outputs/blind_translation.json` (`dd29dff027cecaa45bff9a3c1d90203ad25901ab98db261895f26dc15a7dd0f9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/agent_outputs/direct_judge.json` (`1ee39cb3464b085c3f20bbd00f63fb3235f202c10be04aa9ceb1620d842c79af`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/agent_outputs/roundtrip_judge.json` (`58394beb4ff993f40331bac1bfa6e38e0921e961749e261d74473695b111776a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/agent_outputs/source_contract.json` (`7ac9529a6f587b414e2abd82e1d577198ad57506ec9c30fe522b2ae09f869e91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/decision.json` (`05702d359aed60b454925b1b140e7c14f9d47a67fdef0a3e4fc0f2d65da8faba`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/inputs/blind_dependency_inventory.json` (`293f181043f5e2916f872e2deb8b356a7125ffc80a73290113c153b63578c32a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/inputs/blind_dossier.md` (`0d7762372a149ce7004acb1a88cbc33d02d35ec35f2f5c2dc8543b7eafc84153`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/inputs/blind_review_packet.md` (`0d7762372a149ce7004acb1a88cbc33d02d35ec35f2f5c2dc8543b7eafc84153`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/inputs/declaration_dossier.md` (`f3fa71a7614a6b7293c6f4c81115293dad04e5106230517b05b01173a15367e8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/inputs/dependency_inventory.json` (`293f181043f5e2916f872e2deb8b356a7125ffc80a73290113c153b63578c32a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/inputs/direct_review_packet.md` (`49be1b167828605f33664e0c891e5b0aa5728dc524b6fade1629bee4fb97fa46`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/history/20260831T084140Z/inputs/source_locator.json` (`a705207b903b2d327407b7d039a38eb310145ef58cda5efeaba3b2e70a9864a5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/inputs/blind_dependency_inventory.json` (`293f181043f5e2916f872e2deb8b356a7125ffc80a73290113c153b63578c32a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/inputs/blind_dossier.md` (`0d7762372a149ce7004acb1a88cbc33d02d35ec35f2f5c2dc8543b7eafc84153`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/inputs/blind_review_packet.md` (`0d7762372a149ce7004acb1a88cbc33d02d35ec35f2f5c2dc8543b7eafc84153`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/inputs/declaration_dossier.md` (`dd09fbc752972f3b771f9815bb41bc1ca0d21bcaab08d54de465ec8d992563e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/inputs/dependency_inventory.json` (`293f181043f5e2916f872e2deb8b356a7125ffc80a73290113c153b63578c32a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/inputs/direct_review_packet.md` (`49be1b167828605f33664e0c891e5b0aa5728dc524b6fade1629bee4fb97fa46`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.6/faithfulness/inputs/source_locator.json` (`a705207b903b2d327407b7d039a38eb310145ef58cda5efeaba3b2e70a9864a5`)
