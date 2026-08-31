# Faithfulness audit: HDP-02-BODY-2.2-COSH-MGF

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `8feb8bd2b769cebc456cbad200800bb269fbbb934e7ec67da802574adbd575e0`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The exact Rademacher law, exponential arguments, probability weights, arithmetic mean, and hyperbolic-cosine value match the immutable source. The target's conjunction is logically equivalent to the source equality chain despite stating E=cosh rather than average=cosh as its second conjunct. Its essential hypotheses generalize the single-factor calculation by replacing the indexed family context with an exact pushforward-law hypothesis and by allowing all real lam and a. Thus Lean implies the selected source instance, the selected contextual claim does not imply the full generalized Lean proposition with binder roles preserved, and the correct accepted classification is faithful-stronger. All dependencies and semantic checks are resolved, so adjudication is not required.

## Implications

- **Lean implies source:** `yes`. Given the source context, specialize Lean's X and a to the fixed Rademacher factor X_i and coefficient a_i and specialize lam to the inherited positive lambda. hLaw is exactly Definition 2.2.1 in measure form. Lean's first conjunct is the first source equality, and its two conjuncts together give the source's average=cosh equality.
- **Source implies lean:** `no`. The selected source passage, read with its inherited proof context, asserts the factor calculation for an index i in a finite independent family with lambda > 0 and under the current normalization. It does not itself quantify over every probability-space realization with the same pushforward law, arbitrary real lam (including nonpositive values), and arbitrary scalar a after discarding all family context. Those additional cases are true but are not implied by the selected contextual claim while preserving the binders' intended roles.

## Findings

- **note / faithful-generalization:** This is a genuine nonvacuous strengthening in applicability, not a weakening: every source instance is recovered and both equality stages remain available.
- **major / parameter-domain-and-context-generalization:** The translation directly specializes to the source, but the source passage does not imply all newly quantified cases. This is a genuine, nonvacuous strengthening and determines the faithful-stronger classification.
- **note / equality-chain-representation:** The formulations are logically equivalent by symmetry and transitivity of equality, so the representational difference does not affect faithfulness.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `fail` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `65` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `65` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/agent_outputs/agent_runs.json` (`1f5ac8b3315a5865e22586b9c9d0a7a7226b261a1cae82dc732bcf2b91284a36`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/agent_outputs/blind_translation.json` (`8d680011e40828b4586abc44aeb91c699ba8983a8011f4db667340aad136dae2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/agent_outputs/direct_judge.json` (`1b85a8c7eb5f357655d33cd68d9f5f6aa97c1dd4f95d0a60667a4be613f0dfa2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/agent_outputs/roundtrip_judge.json` (`c1484ffdfecd36ff749da2ff95157d75d45160cf838c8bab5eff020ba7770ad7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/agent_outputs/source_contract.json` (`9b8ce075efada78036f72ce6f4f2bd3ea2975eff025174fb7521bf2e2828fdf0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/decision.json` (`239683a594ca1c1809c55c53cfdc1207cd168baa569c9f27d7462e1e64957ce8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/agent_outputs/agent_runs.json` (`1f5ac8b3315a5865e22586b9c9d0a7a7226b261a1cae82dc732bcf2b91284a36`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/agent_outputs/blind_translation.json` (`8d680011e40828b4586abc44aeb91c699ba8983a8011f4db667340aad136dae2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/agent_outputs/direct_judge.json` (`1b85a8c7eb5f357655d33cd68d9f5f6aa97c1dd4f95d0a60667a4be613f0dfa2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/agent_outputs/roundtrip_judge.json` (`c1484ffdfecd36ff749da2ff95157d75d45160cf838c8bab5eff020ba7770ad7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/agent_outputs/source_contract.json` (`9b8ce075efada78036f72ce6f4f2bd3ea2975eff025174fb7521bf2e2828fdf0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/decision.json` (`101dd3c5014cf3aad6728d0178a931adfc77add5f60bc0efb3d37f39811d69d5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/inputs/blind_dependency_inventory.json` (`c222ea30796f005bc2e19a24ad8f59cd42efac152d43a68e324f46d6c1440a64`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/inputs/blind_dossier.md` (`73cf7432b1fdbe7c276c03263e9936775fab837487cb3b93a885f853cd9c9b4d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/inputs/blind_review_packet.md` (`73cf7432b1fdbe7c276c03263e9936775fab837487cb3b93a885f853cd9c9b4d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/inputs/declaration_dossier.md` (`118f3fc72d21855284c6761c86fde87f2e45a5b5ef0a4f76788bf861cd1e333d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/inputs/dependency_inventory.json` (`2890f95d8e1b293e2e76d3a04bf88b8e7a5db1fdfc7468f3ff3153bbe45fc641`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/inputs/direct_review_packet.md` (`df4ad0f52399ba02dd518f980b2b44a8925e26f093c0c5944fdd3ecf8ca21ae4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/history/20260831T100726Z/inputs/source_locator.json` (`5869de7f5d8335c0e92ef4a4537046a62ea716d3317316e7f14c5f648b894487`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/inputs/blind_dependency_inventory.json` (`c222ea30796f005bc2e19a24ad8f59cd42efac152d43a68e324f46d6c1440a64`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/inputs/blind_dossier.md` (`73cf7432b1fdbe7c276c03263e9936775fab837487cb3b93a885f853cd9c9b4d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/inputs/blind_review_packet.md` (`73cf7432b1fdbe7c276c03263e9936775fab837487cb3b93a885f853cd9c9b4d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/inputs/declaration_dossier.md` (`e88939f6ef4691d37c0bea47c7a918b5ca52081eb81345498b738fb0d7b81704`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/inputs/dependency_inventory.json` (`2890f95d8e1b293e2e76d3a04bf88b8e7a5db1fdfc7468f3ff3153bbe45fc641`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/inputs/direct_review_packet.md` (`df4ad0f52399ba02dd518f980b2b44a8925e26f093c0c5944fdd3ecf8ca21ae4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COSH-MGF/faithfulness/inputs/source_locator.json` (`5869de7f5d8335c0e92ef4a4537046a62ea716d3317316e7f14c5f648b894487`)
