# Faithfulness audit: HDP-02-BODY-2.4-UNION-BOUND

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `9d73a1109e27bf0395e6cf8ceb3996e91bf5ad3083e6d357a20d20e7cab3133b`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The refreshed target explicitly returns both links of the source's displayed union-bound chain. Its operators, finite indexing, cardinal factor, shared middle sum, inequality directions, and uniform pointwise premise all specialize exactly to the Erdos-Renyi proof step. The target is not merely equivalent to that concrete passage: it proves a reusable result for arbitrary finite families and measures, with many nontrivial instances. Thus Lean implies the source but the source does not imply the full Lean proposition, yielding accepted classification faithful-stronger. No dependency, semantic check, or implication remains unclear, so adjudication is not required.

## Implications

- **Lean implies source:** `yes`. Instantiate ι with the n vertices, μ with the Erdos-Renyi probability law, Bad i with {|d_i-d| >= 0.1d}, and q with 2 exp(-cd). The preceding per-vertex estimate supplies hBad. The first returned conjunct is the source union-bound link, and the second is the source sum <= n * 2 exp(-cd) link.
- **Source implies lean:** `no`. The cited source passage establishes only the concrete degree-deviation chain for the n vertices of the fixed random graph model. By itself it does not establish the target's universal statement for every measurable space, arbitrary measure, finite index type, set family, and q.

## Findings

- **note / proper-generalization:** Lean implies the source instance, while the concrete source claim does not imply the universal target; this is genuine nonvacuous strength and therefore accepted as faithful-stronger.
- **note / real-measure-coercion:** There is no mismatch in the source probability instance. In the generalized arbitrary-measure domain, the statement should not be read as the usual extended-real union bound when an infinite mass occurs.
- **note / generalization:** This explains the one-way implication and the faithful-stronger classification; the source is recovered by direct specialization.
- **note / real-conversion domain:** There is no uncertainty for the probability-space source instance. Outside that instance, the translated theorem must be read as a statement about the stated real conversions, not as an unqualified extended-real measure inequality.
- **note / unused inherited context:** The omission strengthens the selected claim and does not create an unresolved semantic discrepancy.

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

- Blind translator covered `19` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `19` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/agent_outputs/agent_runs.json` (`ab7ca9760a33f062721ea0bd109500f577e93ebd8cdbf15f70e8abddc9ebbe29`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/agent_outputs/blind_translation.json` (`20b83b3ce24d0e7a363d1ad7b9fbf9859e2354371dfaf9ad71f8e92e1a893d3e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/agent_outputs/direct_judge.json` (`5cd965b17e5ddf862ded9554c76d6a8b423e9187ed3460ecb1d8ff90725b806e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/agent_outputs/roundtrip_judge.json` (`c2d216f3a70ba19b622d58dda4076d97486eb2debcb56d7d7b03b1dc53221a0f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/agent_outputs/source_contract.json` (`c370236a9220aeb0a8d7431d82b4923e2672b4cf977669739e04e21558b0f367`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/decision.json` (`84d1ec9fe03c30367d75088146b4dd8ca58e4a4fd055dd0d423b413bfe81181c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/agent_outputs/agent_runs.json` (`d331fe8180a7119e0141590cf9c899219d66f329770823b719f252b5f2c17442`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/agent_outputs/blind_translation.json` (`2976dd5966d6e2e7d176ee2b7385e83b7dbdb1f3c017d1e61f2cf75e31f45a4f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/agent_outputs/source_contract.json` (`49a171f7ed43cf46c9331751115440b037617c1479252e611e005ae2e91c1549`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/inputs/blind_dependency_inventory.json` (`6d10c6e38ade09e510cc1e3718e9c1d8cfe6b13d7608c3fe537179dec1c091f7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/inputs/blind_dossier.md` (`1688c68f68262774fbc2761325a2aa6b3376cfd24bc93bbece086fb4e284c151`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/inputs/blind_review_packet.md` (`1688c68f68262774fbc2761325a2aa6b3376cfd24bc93bbece086fb4e284c151`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/inputs/declaration_dossier.md` (`6ac56b2a247aee818f88541cdea640506b77546632849d99c7101597e03ccc61`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/inputs/dependency_inventory.json` (`6d10c6e38ade09e510cc1e3718e9c1d8cfe6b13d7608c3fe537179dec1c091f7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/inputs/direct_review_packet.md` (`e6e5e4edbea285c7619d6677769777cc312a00cfa4196ecab7e74519b14a0d63`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T112903Z/inputs/source_locator.json` (`345e340ebf6e9917f59d9e05b0b013d9a5bba073d4326ca46b6f74cafe65a488`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/agent_outputs/agent_runs.json` (`69eaeb651878421022a735d07f58f2d0b1466c1a0e1dd8fe8b149f47fbf303e5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/agent_outputs/blind_translation.json` (`7a5bbb6d178005cbf3d72d44162b90d43b28597c39acbf65726a7731f610fa7c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/agent_outputs/roundtrip_judge.json` (`25ba5950673c06818e16794b32269e286f95fd50fc3bd532e93f4dab06b5ede6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/agent_outputs/source_contract.json` (`ed2067457651bf6a96462dceba4fafacd0a3670c50a3bc92dfd859f1875194d3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/inputs/blind_dependency_inventory.json` (`19d7bf53147a3e431dafb627f1bd4eb6ef14cbd1111df4e7dc5827c6331db5d4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/inputs/blind_dossier.md` (`b9e2f509ba0841223c30d1fddd9db5cdb2e909dd9aa91dd103207693c18caf8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/inputs/blind_review_packet.md` (`b9e2f509ba0841223c30d1fddd9db5cdb2e909dd9aa91dd103207693c18caf8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/inputs/declaration_dossier.md` (`45a474735ac84b6dc5ff04898090b4e3e07a220d14b0bb301d31279c1a92c633`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/inputs/dependency_inventory.json` (`19d7bf53147a3e431dafb627f1bd4eb6ef14cbd1111df4e7dc5827c6331db5d4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/inputs/direct_review_packet.md` (`ec54983a1117609aa5e675d2ea20fb260469882d0b428b7014525fe8d72a9535`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/history/20260830T113546Z/inputs/source_locator.json` (`345e340ebf6e9917f59d9e05b0b013d9a5bba073d4326ca46b6f74cafe65a488`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/inputs/blind_dependency_inventory.json` (`a29023c98a4577cce39fde5592e000c54994d6a185b2afd8b3c349043030542b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/inputs/blind_dossier.md` (`554214f0fcea0e850e20ac4fd240aa1a33cd24d59efd85563b92841b833b7f40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/inputs/blind_review_packet.md` (`554214f0fcea0e850e20ac4fd240aa1a33cd24d59efd85563b92841b833b7f40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/inputs/declaration_dossier.md` (`9a5f5816cf16ada3e90a49151e7163310f345dbb36f00621d6ec107a9d5d39fd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/inputs/dependency_inventory.json` (`a29023c98a4577cce39fde5592e000c54994d6a185b2afd8b3c349043030542b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/inputs/direct_review_packet.md` (`42747fd5614e0ec2c0fe8ebff112ccc3b83793b32754aec837055331366b5987`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-UNION-BOUND/faithfulness/inputs/source_locator.json` (`345e340ebf6e9917f59d9e05b0b013d9a5bba073d4326ca46b6f74cafe65a488`)
