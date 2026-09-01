# Faithfulness audit: HDP-01-EQ-1.3-CORRECTED

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `e327e86eb2448b685ed1c53cdae4bf2bb53730be5b2b205f0629024a9d83c8df`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The hash-pinned source supports the corrected statement 0<p<=q<=infinity. Lean expresses that range by p!=0 and p<=q in ENNReal, retains infinity, imposes exact mass-one normalization, and uses the matching absolute-moment and essential-supremum operators. AE representatives do not alter eLpNorm. Both implications hold, so the corrected target is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. Every source random variable satisfies the Lean premises, and eLpNorm exactly represents the corrected finite/top Lp quantities.
- **Source implies lean:** `yes`. Apply the corrected source result to an AEStronglyMeasurable function's measurable AE representative, then use eLpNorm's AE invariance.

## Findings

- **note / explicit-corrected-source-scope:** Acceptance is for HDP-01-EQ-1.3-CORRECTED, not the literal ill-defined p=0 wording.
- **note / almost-everywhere-representatives:** Raw representatives are broader, but the quantities and both implications are unchanged.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `unclear` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `27` dependencies (`0` hash-reused); unclear: `D007`.
- Direct judge covered `27` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/agent_outputs/adjudicator.json` (`eb7718635badcf99f5b16f58a4cf5f90247909aba63053d4c846a1594d8f0199`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/agent_outputs/agent_runs.json` (`5897e83aad473c6ef6fa4c1b81d2b10b9af6c80982f7dce017447351d3cbee11`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/agent_outputs/blind_translation.json` (`23e2048d4716c3f323fa0bf872fb78dc6edebda779027e629bc7fef80d04046d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/agent_outputs/direct_judge.json` (`4a8eb15872b5e4a1fa39ab4d7646c9613943c2a14c116e99fd19a222198b62d1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/agent_outputs/roundtrip_judge.json` (`302d1707f2f6a640a839177b28905c5f695f02c52d28fea40f73e9370cf8cbc6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/agent_outputs/source_contract.json` (`597be3809dd2fded6ffa010bb0b1d2312f7a05c3cc6d801baaa434fb94dec028`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/decision.json` (`d00886c513d7352fd1a4d1acf0685ac7ea54641b63718863086c7dc2148e1fc5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/inputs/blind_dependency_inventory.json` (`d252df2869bd936a9fb97fd2b4f1b3414cab0835643f7f58737cd36c374b30d9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/inputs/blind_dossier.md` (`5035a0fd230aafcaa420c8aff0e87d6b6abc60e9a3f41650a68a7f3e4afb925d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/inputs/blind_review_packet.md` (`5035a0fd230aafcaa420c8aff0e87d6b6abc60e9a3f41650a68a7f3e4afb925d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/inputs/declaration_dossier.md` (`5f16f7678581a4dea17deea4a0d04d2478fc6e4e00e9000cc899c3fecf8a3413`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/inputs/dependency_inventory.json` (`d252df2869bd936a9fb97fd2b4f1b3414cab0835643f7f58737cd36c374b30d9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/inputs/direct_review_packet.md` (`28ef89af905f9a7bdd9cf01d0e420e355516f902aa3c4d6ad692a9b96780f2b1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-CORRECTED/faithfulness/inputs/source_locator.json` (`f15e2f45478189b796bfbc59dccb0632f9a94651d26670e52309f5043708bd54`)
