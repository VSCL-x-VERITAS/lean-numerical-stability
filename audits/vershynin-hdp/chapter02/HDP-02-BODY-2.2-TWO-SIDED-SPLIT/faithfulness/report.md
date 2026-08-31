# Faithfulness audit: HDP-02-BODY-2.2-TWO-SIDED-SPLIT

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `23595365d943bb0fc92423453be1a9bf946f18869b28791bfdfacab5b14d6868`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

For positive `t`, the real event `{|S| >= t}` is the disjoint union of `{S >= t}` and `{-S >= t}`, so the Lean equality has exactly the source's event and measure semantics. The probability and measurability hypotheses make `mu.real` a sound real probability interpretation and are satisfied by the source model. The only consequential structural difference is that Lean abstracts away the Bernoulli family, coefficients, and weighted-sum construction and proves the identity for every measurable real-valued `S`. Thus Lean implies the selected source claim, the selected source claim does not imply the full universal Lean proposition, and the difference is genuine nonvacuous strength.

## Implications

- **Lean implies source:** `yes`. Specialize the Lean proposition to the source probability space and to `S = sum_{i=1}^N a_i X_i`. Source random variables are measurable, hence their finite real linear combination is measurable, and the source has `t > 0`. The Lean equality then is exactly the displayed source equality with the same three non-strict events.
- **Source implies lean:** `no`. The selected source claim ranges only over `S` constructed as a finite real weighted sum of independent symmetric Bernoulli variables. It does not assert the equality for every probability space and every arbitrary measurable real-valued function, which the Lean proposition universally covers.

## Findings

- **note / genuine-generalization:** The formal proposition is strictly more general but retains every source instance; this is nonvacuous strength, not reduced applicability.
- **note / boundary-condition-explicit:** The formal statement faithfully records the inherited condition needed for the exact additive split.
- **major / source-domain-generalization:** The reconstructed proposition strictly generalizes the selected claim. It implies every source instance, but the source claim does not imply the arbitrary-S statement; this supports faithful-stronger rather than faithful-equivalent.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `fail` | `fail` |
| `C03` | `pass` | `pass` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `fail` | `fail` |
| `C09` | `fail` | `fail` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `24` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `24` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/agent_outputs/agent_runs.json` (`3b0b283b507f58f247c45b2d762d67a89a19b28c426d7b17109f71168adc8ad9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/agent_outputs/blind_translation.json` (`67d8af70ae8ecacf077a31866066a0fb4d93a5d7c197b708159e4dfe33f55a6f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/agent_outputs/direct_judge.json` (`0699971d644552b09ce90a14645e6714c326014a6ed1ca51583074ef085aee01`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/agent_outputs/roundtrip_judge.json` (`939f047dfa82ca401d9ad6f1b82e99648a21f6382d949f68d8a3b5ae07cc8bd1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/agent_outputs/source_contract.json` (`00631683fa418a931789dcdf8de9aade8c2c9b719935bbc3cfc8a3b0fc5df640`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/decision.json` (`ca5bd1b52670d17c3dad37be061db06615a22f792795a3adb46cc48ae0cdaf84`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/agent_outputs/agent_runs.json` (`3b0b283b507f58f247c45b2d762d67a89a19b28c426d7b17109f71168adc8ad9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/agent_outputs/blind_translation.json` (`67d8af70ae8ecacf077a31866066a0fb4d93a5d7c197b708159e4dfe33f55a6f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/agent_outputs/direct_judge.json` (`0699971d644552b09ce90a14645e6714c326014a6ed1ca51583074ef085aee01`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/agent_outputs/roundtrip_judge.json` (`939f047dfa82ca401d9ad6f1b82e99648a21f6382d949f68d8a3b5ae07cc8bd1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/agent_outputs/source_contract.json` (`00631683fa418a931789dcdf8de9aade8c2c9b719935bbc3cfc8a3b0fc5df640`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/decision.json` (`64bf3768552b8398b3004330b786716e7ea0fc1fa62ee5680d66e4a3cbba93ee`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/inputs/blind_dependency_inventory.json` (`10a63b5fc0f3f04de55735e9a4e1f4cd21488e024b5a6c89ee4a227cffbb39c2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/inputs/blind_dossier.md` (`67d36fb655adc3c333a57b0e47957283f3c318e217ed64f0062429e3cc04697c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/inputs/blind_review_packet.md` (`67d36fb655adc3c333a57b0e47957283f3c318e217ed64f0062429e3cc04697c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/inputs/declaration_dossier.md` (`6680ecf8a3461aa83ea70468802db39ab990d2ab2cb15018545f644d083e8029`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/inputs/dependency_inventory.json` (`10a63b5fc0f3f04de55735e9a4e1f4cd21488e024b5a6c89ee4a227cffbb39c2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/inputs/direct_review_packet.md` (`48fe66edcc54d84d0d0cd32840cc1411e4cf684022eba079ff97092d5d1ce915`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/history/20260831T100719Z/inputs/source_locator.json` (`ef8f98de404189121a47a33bb8fe7aca2df6e17bd733468eb3c7b7d8a6494060`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/inputs/blind_dependency_inventory.json` (`10a63b5fc0f3f04de55735e9a4e1f4cd21488e024b5a6c89ee4a227cffbb39c2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/inputs/blind_dossier.md` (`67d36fb655adc3c333a57b0e47957283f3c318e217ed64f0062429e3cc04697c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/inputs/blind_review_packet.md` (`67d36fb655adc3c333a57b0e47957283f3c318e217ed64f0062429e3cc04697c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/inputs/declaration_dossier.md` (`54386d448e6ba5496aa029356b78cbd3a0f15770877055fee1ee433e049a6806`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/inputs/dependency_inventory.json` (`10a63b5fc0f3f04de55735e9a4e1f4cd21488e024b5a6c89ee4a227cffbb39c2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/inputs/direct_review_packet.md` (`48fe66edcc54d84d0d0cd32840cc1411e4cf684022eba079ff97092d5d1ce915`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-TWO-SIDED-SPLIT/faithfulness/inputs/source_locator.json` (`ef8f98de404189121a47a33bb8fe7aca2df6e17bd733468eb3c7b7d8a6494060`)
