# Faithfulness audit: HDP-02-BODY-2.7-YOUNG

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `f25af1e5576bfba3d0d9a87c454796380d1a38f8aa55abb4b7ec35c75923cccd`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The authoritative passage and the elaborated Lean proposition have the same unrestricted real binders, product, two exact squares divided by 2, addition, and non-strict inequality. Every dependency resolves to the standard real operations or to numeral-elaboration machinery that preserves the constants. Both implication directions hold, with no unresolved dependency, semantic check, vacuity issue, or applicability restriction.

## Implications

- **Lean implies source:** `yes`. After unfolding the supplied operation and numeral instances, Lean states exactly that every real a,b satisfy ab ≤ a²/2 + b²/2, so it directly entails the selected source result.
- **Source implies lean:** `yes`. The source universally asserts the identical inequality over the identical real domain with no extra assumptions, and therefore entails the Lean proposition.

## Findings

No findings were recorded.

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

- Blind translator covered `24` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `24` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/agent_outputs/agent_runs.json` (`4ccdb7b75211add417eebb272db587033c9224d445196c61076147fb1d0c2f69`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/agent_outputs/batch_source_contract.json` (`856d0400f37d309d6e394f4e5d704d0cd26bb8d59f2cdc4932f9f89bb4eb46e9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/agent_outputs/blind_translation.json` (`4e37ccd5ee45144d691ca22f39d317f1f258f21320bff1b7a1bec34b0a8c910f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/agent_outputs/direct_judge.json` (`7ddf688f5c08c134743b8574d07071aacd52056ad3f1553c8e02981ecc3d96ee`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/agent_outputs/roundtrip_judge.json` (`e8d7fab50d423c1c139d4b0bffba15d88cd7e083329398ab08f26228828015fe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/agent_outputs/source_contract.json` (`0eda986facb88e21e005a4e45b5f4153296ca23df8be427e90b69a8d6875917d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/decision.json` (`e01619c853ea83792d939dcce1290cd82406d8f2c34ae05f71f26a599d4ff38d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/agent_outputs/batch_source_contract.json` (`3e39d619b3c4737f1beebc1f4a6d89d80928155a0af9cf2c3a44f3fd92e95975`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/agent_outputs/source_contract.json` (`d8a8c6e509e49525b395950205c22c8e5f63c2e8c9bf257744bcd2a6cb02ba40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/inputs/batch_source_locator.json` (`96999ab9c93dd8971b343042a9dbb8df6ab0d66f4db2c3e00054f6ef1ac2564e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/inputs/blind_dependency_inventory.json` (`9e295156a4899975db7738f4cfc9cdd186df80a2053991df7eb82de028cab18e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/inputs/blind_dossier.md` (`3ba76ab9b6cec5498ad83e9e260e2846cf6da26357cb8ffbeb9f40d3b2e58494`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/inputs/blind_review_packet.md` (`3ba76ab9b6cec5498ad83e9e260e2846cf6da26357cb8ffbeb9f40d3b2e58494`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/inputs/declaration_dossier.md` (`5a4304a88dd908c2a8e85bb4e0ad3d10e21cd7eac3742470a189253c0335cc34`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/inputs/dependency_inventory.json` (`9e295156a4899975db7738f4cfc9cdd186df80a2053991df7eb82de028cab18e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/inputs/direct_review_packet.md` (`2f5609e9ee41b2bad20e3643f8ccf53efbbc12d4a6a98c0d9218f5a3ab774302`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/history/20260831T171447Z/inputs/source_locator.json` (`6ab18362eac1df0fa9bbbdbe31f91e4e0bbde775e4ca4a1b4933307107ad8b80`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/inputs/batch_source_locator.json` (`344c2f15f875394c1b35c8732c25ff4482a74b2364f89e81c7bee4a9d3ea6fc2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/inputs/blind_dependency_inventory.json` (`9e295156a4899975db7738f4cfc9cdd186df80a2053991df7eb82de028cab18e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/inputs/blind_dossier.md` (`3ba76ab9b6cec5498ad83e9e260e2846cf6da26357cb8ffbeb9f40d3b2e58494`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/inputs/blind_review_packet.md` (`3ba76ab9b6cec5498ad83e9e260e2846cf6da26357cb8ffbeb9f40d3b2e58494`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/inputs/declaration_dossier.md` (`5a4304a88dd908c2a8e85bb4e0ad3d10e21cd7eac3742470a189253c0335cc34`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/inputs/dependency_inventory.json` (`9e295156a4899975db7738f4cfc9cdd186df80a2053991df7eb82de028cab18e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/inputs/direct_review_packet.md` (`2f5609e9ee41b2bad20e3643f8ccf53efbbc12d4a6a98c0d9218f5a3ab774302`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-YOUNG/faithfulness/inputs/source_locator.json` (`6ab18362eac1df0fa9bbbdbe31f91e4e0bbde775e4ca4a1b4933307107ad8b80`)
