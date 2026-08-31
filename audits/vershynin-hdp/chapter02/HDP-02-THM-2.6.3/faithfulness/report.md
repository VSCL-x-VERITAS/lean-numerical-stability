# Faithfulness audit: HDP-02-THM-2.6.3

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `c9d93a30fc2023949ba94bb83eba1d91b6e28ed95574162b0195760656b2f540`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The pinned theorem and the elaborated target state the same weighted General Hoeffding inequality. Both quantify a single positive absolute constant uniformly over every positive finite family of independent centered sub-gaussian real random variables, every deterministic real coefficient vector, and every t >= 0. The Lean event is the same two-sided event and its upper bound has the same prefactor, exponent, maximum psi_2 scale, and Euclidean coefficient norm. Recursive inspection of all 93 dependencies confirms the intended meanings of sub-gaussianity, the psi_2 infimum, maximum, independence, expectation, probability, sums, absolute value, and real operations. The arbitrary finite index type is equivalent by reindexing to the source's N coordinates, and the totalized zero-denominator convention only handles cases where the weighted sum is identically zero. Thus both implications hold, with no unresolved issue requiring adjudication.

## Implications

- **Lean implies source:** `yes`. Specialize the Lean theorem to ι = Fin N (or any enumeration of {1,...,N}). The definitions of IsSubGaussian, PsiTwoNorm, psiTwoNormMax, iIndepFun, integral, μ.real, finite sum, and absolute value recover the source hypotheses, K, event, and bound. Explicit integrability/measurability are implicit in the source, and the totalized zero-denominator cases remain valid degenerate instances of the source claim.
- **Source implies lean:** `yes`. For any finite nonempty ι, choose an enumeration by Fin N, transport X and a along it, and apply the source theorem. Mutual independence, means, sub-gaussian norms, the maximum, both finite sums, and the event are invariant under that reindexing. The source's absolute c is uniform, so it witnesses the outer Lean existential; explicit Lean side conditions merely expose the standard meanings of random variable and expectation.

## Findings

- **note / index-domain-representation:** This is a reindexing-invariant reformulation and causes no loss or gain in mathematical content.
- **note / degenerate-denominator-convention:** The affected weighted sum is identically zero, making the tail event trivial; this convention therefore changes neither implication nor acceptance.
- **note / explicit-analytic-side-conditions:** These conditions make the source's terms well-defined in Lean and do not restrict the intended source domain.
- **note / degenerate-denominator-convention:** The translation makes an omitted source boundary convention explicit without narrowing applicability or changing the nondegenerate formula; it does not affect either implication verdict.
- **note / source-cross-reference-typo:** This source-side typo does not alter the theorem's displayed contract or the round-trip comparison.

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

- Blind translator covered `93` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `93` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/agent_outputs/agent_runs.json` (`735c153cdb95f25c78e2f0d57b2e2b29029155f06f9a6d94b2b6c5d0a788e301`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/agent_outputs/batch_source_contract.json` (`71dc8e11d8659af56b9929b4ca727149e8f765041778f9ef6eed499fe22326ef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/agent_outputs/blind_translation.json` (`2be53ff0b041278e30ffb811cd1e065e87ab37347d989a61fe606bb5f9b19539`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/agent_outputs/direct_judge.json` (`1981c4fb9510b4428a6fce9002184a6798d722a7c70534a47d7930028875211a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/agent_outputs/roundtrip_judge.json` (`64f1ee30cf37f5c3ed34ede0dcd8823c3e8d52488081f31ae72bd360015c06e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/agent_outputs/source_contract.json` (`0c868e0d4daa1947c33cd2df29b1ca78e62988621787f0f1a25354f52a127abf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/decision.json` (`b18377506c69dfc4c0af37ebc149290e8e0ac6e14cb28ef6214efd5b9d3f8ab2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/agent_outputs/agent_runs.json` (`54dea8dd6c20d8c5bb555ab4f5f82f49ed234e67d3028ae70b671a5aaa69114e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/agent_outputs/batch_source_contract.json` (`7e48a80ea9ba9191332554ef56bfa82c56e83d693e6a8059e4c8d154777719e2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/agent_outputs/source_contract.json` (`c6136d862aae2a0fa54ac5ca53d76a46431cd2d381b5159460e329a32e9dd9a7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/inputs/batch_source_locator.json` (`045bbe7245cc09969423aecd658f52230e744208d8e32f03da13222eaf557dfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/inputs/blind_dependency_inventory.json` (`09720b724c6e4f23032669cfcb2e4ca55fb00893df6865d860ec925030540a33`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/inputs/blind_dossier.md` (`c974c42ba22d9f8f0a734d311e7d47ee05b8c1b948a18c0a27b8de204a9661cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/inputs/blind_review_packet.md` (`c974c42ba22d9f8f0a734d311e7d47ee05b8c1b948a18c0a27b8de204a9661cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/inputs/declaration_dossier.md` (`697f114de8bfc920ccc8f8fb93fd2e52b7cd84bba8b8aeb87f60b58d9f108c83`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/inputs/dependency_inventory.json` (`9b3dc41af360a677e4eb1ea9eea1ce8148f6f899c6e4f099db1be4c4b52197bc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/inputs/direct_review_packet.md` (`f64b3a96947d28ec289f3e7b8750f5b33d6ad9920d67102f3022840e5f18dffd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T181929Z/inputs/source_locator.json` (`76a23be0d30b209adaad2626e9478a91aa2e689c36c7c1da6562415558be4e2b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/agent_outputs/agent_runs.json` (`b0395df5ff2ac4a92ff2f5434a282ad5361317483317e4ae99a0e1c1ef1bc732`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/agent_outputs/batch_source_contract.json` (`71dc8e11d8659af56b9929b4ca727149e8f765041778f9ef6eed499fe22326ef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/agent_outputs/source_contract.json` (`0c868e0d4daa1947c33cd2df29b1ca78e62988621787f0f1a25354f52a127abf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/inputs/batch_source_locator.json` (`045bbe7245cc09969423aecd658f52230e744208d8e32f03da13222eaf557dfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/inputs/blind_dependency_inventory.json` (`09720b724c6e4f23032669cfcb2e4ca55fb00893df6865d860ec925030540a33`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/inputs/blind_dossier.md` (`c974c42ba22d9f8f0a734d311e7d47ee05b8c1b948a18c0a27b8de204a9661cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/inputs/blind_review_packet.md` (`c974c42ba22d9f8f0a734d311e7d47ee05b8c1b948a18c0a27b8de204a9661cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/inputs/declaration_dossier.md` (`ff402bb64b10812d685dcd047a63187138f6624670084ef79f42f6b02592f55b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/inputs/dependency_inventory.json` (`9b3dc41af360a677e4eb1ea9eea1ce8148f6f899c6e4f099db1be4c4b52197bc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/inputs/direct_review_packet.md` (`f64b3a96947d28ec289f3e7b8750f5b33d6ad9920d67102f3022840e5f18dffd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/history/20260831T184029Z/inputs/source_locator.json` (`76a23be0d30b209adaad2626e9478a91aa2e689c36c7c1da6562415558be4e2b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/inputs/blind_dependency_inventory.json` (`a16aca6ff81be90316e5fd2b38d89b488bf2ddf2f8077569544f9ee78f2a9d20`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/inputs/blind_dossier.md` (`ffdf59c6cde162c43f89b351ba1ec62b2b1235d8f4018f580076fc01ab424cbc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/inputs/blind_review_packet.md` (`ffdf59c6cde162c43f89b351ba1ec62b2b1235d8f4018f580076fc01ab424cbc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/inputs/declaration_dossier.md` (`4671ab10a5f1bb2c722c2a795f37249dbc315f49d63d5f5f1fde29f22fefb870`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/inputs/dependency_inventory.json` (`029801270c2c0752db8fd558b7373beacfb6595aa912e012af8e618db5074570`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/inputs/direct_review_packet.md` (`ec5dfce363b10e442ab0887fb33841f6a9f86d083f1edf204e8d4be3b2ae8676`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.3/faithfulness/inputs/source_locator.json` (`76a23be0d30b209adaad2626e9478a91aa2e689c36c7c1da6562415558be4e2b`)
