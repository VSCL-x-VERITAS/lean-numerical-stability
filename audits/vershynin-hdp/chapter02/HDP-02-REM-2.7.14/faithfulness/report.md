# Faithfulness audit: HDP-02-REM-2.7.14

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `e3abb95887ad22ff8557493c2866b858a25f6d17e81ca5c5b65be7af3a11c763`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target faithfully expands the source hierarchy into its two membership implications. Essential boundedness is represented by a positive almost-everywhere bound, sub-gaussian membership by finiteness of an infimum over the source's exponential-moment admissibility condition, and Lp membership by integrability of |X|^p for every real p >= 1. Both implication directions hold, the formal hypotheses are nonvacuous, and the only identified issue is the source's reversed explanatory cross-references.

## Implications

- **Lean implies source:** `yes`. The first Lean conjunct turns any positive almost-everywhere real bound into finite psi2 gauge, which is L-infinity contained in L-psi2. The second turns finite psi2 gauge into finiteness of every real p-th absolute moment for p >= 1, which is L-psi2 contained in Lp.
- **Source implies lean:** `yes`. The source's bounded-to-sub-gaussian inclusion applies to every essentially bounded measurable X and hence to every supplied positive almost-everywhere bound B. Its sub-gaussian moment characterization supplies Integrable |X|^p for every finite real p >= 1. The explicit PsiTwoGauge definition matches the source psi2 membership condition.

## Findings

- **note / source-cross-reference-order:** This is a defect in the source's explanatory attribution, not a faithfulness defect in the Lean proposition.
- **note / source-cross-reference-order:** This is an editorial defect in the source's attribution, not a mismatch in the translated mathematical proposition.

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

- Blind translator covered `79` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `79` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/agent_outputs/agent_runs.json` (`59b085d74b83fa98ff34e74920108c09724eeb3f5e5104b89888686150a58662`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/agent_outputs/batch_source_contract.json` (`41d3faa402b25eacdb908cd11303321046406186927b5b864d3203bda82170e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/agent_outputs/blind_translation.json` (`34bf3457eb1136f59c05f85d7a9c74d1d694b4aaba787e6839cb6714e888087e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/agent_outputs/direct_judge.json` (`cc486335d201bc1a037c3958a3fee9e3296aa69ed22dda84e55e90fb475fe34d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/agent_outputs/roundtrip_judge.json` (`140f70ecea356c400f408fdfee172318d74867865b1fccb6951d237c0bd813ee`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/agent_outputs/source_contract.json` (`299fb817a6deefea9d8bfa177b2833bc362ac8c48f72277daed0b65593f73d4c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/decision.json` (`9f130ac60f1e233dd9d2d7c6e824b0679ab8c0637d2b16d7cb00af5c153c448b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/agent_outputs/agent_runs.json` (`08385a90fe8905a0e2ae2b9faadd93c5859afe96a8771d150a060a95a622a3b3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/agent_outputs/batch_source_contract.json` (`41d3faa402b25eacdb908cd11303321046406186927b5b864d3203bda82170e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/agent_outputs/blind_translation.json` (`34bf3457eb1136f59c05f85d7a9c74d1d694b4aaba787e6839cb6714e888087e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/agent_outputs/source_contract.json` (`299fb817a6deefea9d8bfa177b2833bc362ac8c48f72277daed0b65593f73d4c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/inputs/batch_source_locator.json` (`0c92a3724f4a66523d51afce70be3d984f9875b5aabca32f80522b8f22d80186`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/inputs/blind_dependency_inventory.json` (`a3dd1b6a513cbbc8a884726f50912a9e06a42fa5964a7138a3f8cc355e70ca1c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/inputs/blind_dossier.md` (`55d83969fda77a84a61cc97af1efee2b844dfaf33ecf472cb0bb88f228a0b52c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/inputs/blind_review_packet.md` (`55d83969fda77a84a61cc97af1efee2b844dfaf33ecf472cb0bb88f228a0b52c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/inputs/declaration_dossier.md` (`14620db181737f2f19ad268766d98e7230183629989726c3394301c3701cf611`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/inputs/dependency_inventory.json` (`f87168ff68f218e52e8b0140a813dc439712ac1ac335dca07a953868ddd2612a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/inputs/direct_review_packet.md` (`b64c0b92ce6978d4a4fe93fa39cef1bcb8c822dc37e4cfd12f2432d695b8a275`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/history/20260831T184826Z/inputs/source_locator.json` (`d8c4cbab76938eda3a969d40eef47f527627b565d0516995b90409b0d554b547`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/inputs/blind_dependency_inventory.json` (`a3dd1b6a513cbbc8a884726f50912a9e06a42fa5964a7138a3f8cc355e70ca1c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/inputs/blind_dossier.md` (`55d83969fda77a84a61cc97af1efee2b844dfaf33ecf472cb0bb88f228a0b52c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/inputs/blind_review_packet.md` (`55d83969fda77a84a61cc97af1efee2b844dfaf33ecf472cb0bb88f228a0b52c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/inputs/declaration_dossier.md` (`906e364db6f479a59366f1856be80f1de5a0856d0cc1687862054efca308aa02`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/inputs/dependency_inventory.json` (`f87168ff68f218e52e8b0140a813dc439712ac1ac335dca07a953868ddd2612a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/inputs/direct_review_packet.md` (`b64c0b92ce6978d4a4fe93fa39cef1bcb8c822dc37e4cfd12f2432d695b8a275`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.7.14/faithfulness/inputs/source_locator.json` (`d8c4cbab76938eda3a969d40eef47f527627b565d0516995b90409b0d554b547`)
