# Faithfulness audit: HDP-02-DEF-2.5.6

## Decision

- Classification: `not-faithful-different`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `81c8dc7d3c974cbcbd777db182d4a3c154980c095cb78ef283b5c4d64a119145`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The disagreement turns on the audit boundary. Recursive dependency inspection is required to interpret PsiTwoGauge and SubGaussianSquarePoint, but dependency coverage does not authorize treating every referenced definition as an additional conclusion of the selected theorem. Once D001-D004 are unfolded, the exact target is a square-point finiteness characterization. It accurately contains the equation-(2.13) scale set and avoids an attainment error, yet it neither performs the source's four-property class designation nor states the selected declaration as the definition of the named psi_2 norm. Conversely, the source does not supply the target's universal ENNReal totalization and empty-set behavior. Both implication directions therefore fail, making not-faithful-different the classification and false the accepted flag.

## Implications

- **Lean implies source:** `no`. Unfolding all relevant dependencies yields a theorem that finiteness of the property-(iv) scale infimum is equivalent to existence of a positive property-(iv) witness. This preserves the core exponential-square formula but does not conclude that the common class of properties (i)-(iv) is called sub-gaussian, and it does not present the selected declaration as the definition of the named psi_2 norm. Consequently the Lean proposition does not imply the full two-part source definition.
- **Source implies lean:** `no`. The source names the sub-gaussian class and defines its psi_2 norm by a positive-real infimum. It does not state the exact universal finiteness iff for every function X, or the ENNReal totalization in which nonmeasurable or witness-free functions receive an empty admissible set and gauge top. Those additional order-theoretic and out-of-domain claims are required for the exact Lean proposition, so the selected source result alone does not imply it.

## Findings

- **critical / wrong top-level claim:** The selected target declaration cannot stand as a faithful formal statement of Definition 2.5.6.
- **major / missing class designation:** The formal target omits one of the source definition's two essential acts.
- **major / unmarked extended-domain theorem:** The target adds boundary and out-of-domain semantics not asserted by the selected source passage; these do not compensate for the omitted source content.
- **note / formula-level agreement:** The analytic formula underlying property (iv) is accurately represented, but only inside a different top-level finiteness theorem.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `fail` |
| `C06` | `pass` | `fail` |
| `C07` | `pass` | `fail` |
| `C08` | `pass` | `fail` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `fail` |
| `C12` | `pass` | `fail` |

## Dependency coverage

- Blind translator covered `72` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `72` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/agent_outputs/adjudicator.json` (`e2e23cd6711dc89b387fa723b8a04d596a45c960a0c05b9bb5378774f7ef72a5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/agent_outputs/agent_runs.json` (`db8975590872eed7b31ae044247cfe5c3896f090a6004d97ee95613a7de47995`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/agent_outputs/blind_translation.json` (`3de4a310ab6042a62776506e09792426590aeba10f2bcb67642c33ed9c117461`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/agent_outputs/direct_judge.json` (`8a628b56ba3e614a1e7a7d53a01bacfe11ab28676b6a465316079943a869aa4e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/agent_outputs/roundtrip_judge.json` (`01cd4a0709dc3bf77b34d4b8c072bb3a9bf1da811687c1ccad42e6766d52e011`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/agent_outputs/source_contract.json` (`037c1ee6972c5a6c38222dbdbab8788fe2901348d8c425287ea9b46d9459b086`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/decision.json` (`2a98803fb2176b172721f31bb3436c2e934fcf4899f54e1edd1e173bb2910ba5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/history/20260830T140932Z/inputs/blind_dependency_inventory.json` (`af6904a6b9aa080f6d93cca46bbe0f1d665dd2981c514010ae2d40c60c2e8732`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/history/20260830T140932Z/inputs/blind_dossier.md` (`08b64dfae3e3107b83650d4763fcc7ab4f21e287c485d9bf0092df9ac0d5f17e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/history/20260830T140932Z/inputs/blind_review_packet.md` (`08b64dfae3e3107b83650d4763fcc7ab4f21e287c485d9bf0092df9ac0d5f17e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/history/20260830T140932Z/inputs/declaration_dossier.md` (`92663083592c7fed76475ac31428eda08130ff928cd11a561971cd8fec276d74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/history/20260830T140932Z/inputs/dependency_inventory.json` (`145aa9faf8a954ce73eff8d5b20d92f5834a73931ddf5e3dc5d32bb0a59c3fd6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/history/20260830T140932Z/inputs/direct_review_packet.md` (`0eb6a03ed2a1e467a63878de37b567e3a6cd9ed204c3baab5841523d1fae5566`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/history/20260830T140932Z/inputs/source_locator.json` (`51dd9f00fa63046119060e13d66ef0fa01d1b9f18be7b2f15314c0e499dc0408`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/inputs/blind_dependency_inventory.json` (`af6904a6b9aa080f6d93cca46bbe0f1d665dd2981c514010ae2d40c60c2e8732`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/inputs/blind_dossier.md` (`08b64dfae3e3107b83650d4763fcc7ab4f21e287c485d9bf0092df9ac0d5f17e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/inputs/blind_review_packet.md` (`08b64dfae3e3107b83650d4763fcc7ab4f21e287c485d9bf0092df9ac0d5f17e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/inputs/declaration_dossier.md` (`92663083592c7fed76475ac31428eda08130ff928cd11a561971cd8fec276d74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/inputs/dependency_inventory.json` (`145aa9faf8a954ce73eff8d5b20d92f5834a73931ddf5e3dc5d32bb0a59c3fd6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/inputs/direct_review_packet.md` (`0eb6a03ed2a1e467a63878de37b567e3a6cd9ed204c3baab5841523d1fae5566`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.5.6/faithfulness/inputs/source_locator.json` (`51dd9f00fa63046119060e13d66ef0fa01d1b9f18be7b2f15314c0e499dc0408`)
