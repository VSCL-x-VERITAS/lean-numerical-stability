# Faithfulness audit: HDP-01-LEM-1.2.1-FUBINI

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `f1d5445de64f48c01ae67ce25f592ceb1147146b836c2c4ac32cdc19ea0d7f49`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

Both implication directions hold. The round-trip judgment treated the wider quantified domain as automatically blocking source-to-Lean implication, but the methodology asks for logical implication and reserves faithful-stronger for genuine nonvacuous strength. Here the positive-part reduction derives the arbitrary-X formulation from the source formulation without changing either integrand on the integration domain. Consequently the statements are faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. Specializing the Lean proposition to a measurable nonnegative X yields the selected source interchange, with ENNReal lower integrals preserving the source's explicitly permitted infinite case and the omitted endpoint t=0 being Lebesgue-null.
- **Source implies lean:** `yes`. For arbitrary measurable X in the Lean domain, apply the source result to the measurable nonnegative random variable Y=max(X,0). Since t>0 implies (t<X(ω) iff t<Y(ω)), both sides of the source equality for Y are exactly the corresponding Lean sides for X. Thus the source theorem logically derives every Lean instance.

## Findings

- **note / representation-equivalent-domain-generalization:** The apparent domain enlargement is a representation-equivalent consequence of the source theorem, not genuine additional theorem strength.
- **note / threshold-endpoint:** The possible endpoint difference is confined to the Lebesgue-null singleton {0} and does not affect either implication.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `25` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `25` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/agent_outputs/adjudicator.json` (`f43e40181daa307d6f2096c260b247143a51006c1151862d8c5fb94055287bc7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/agent_outputs/agent_runs.json` (`66aa1b734eff20dd907b4c49eddaa6eb4e6d3957ecedac6ea6f137d700dc0126`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/agent_outputs/blind_translation.json` (`383588df6a658e28bd0255577cca980b1c32a95f15e5d7d000f92d7eac3e8427`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/agent_outputs/direct_judge.json` (`bcdfb314d70a7b2395689a186e36978f60a642c274268dd25be65dfc33786e11`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/agent_outputs/roundtrip_judge.json` (`8cb3ee014aabc36829fa6e038a98ac9d259955e4bd4cafdd466c2ef9603088b8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/agent_outputs/source_contract.json` (`77e07cf4d7a701c1fa29ac5c6ee5c30fa54bd1260f2cfe7e6f8565062a030c67`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/decision.json` (`31d4c98cc9cc955f71911ec2020a7ec7c2c4af666e4425fb1107bc9f4204204d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/inputs/blind_dependency_inventory.json` (`af3114ae46e4c453267b5f2a7dc2bc2f5e7487dbca5efebbfbe9d1bd3d1c2109`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/inputs/blind_dossier.md` (`f17356b7b7802f5ad161fb4385897f23f4b6e801f6cb04c27b9dd165fd56fe3f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/inputs/blind_review_packet.md` (`f17356b7b7802f5ad161fb4385897f23f4b6e801f6cb04c27b9dd165fd56fe3f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/inputs/declaration_dossier.md` (`982d02578a63cf7f7ddcbdd502131b0aa6cffc5f1cbea1674d7f1b929cceee6d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/inputs/dependency_inventory.json` (`af3114ae46e4c453267b5f2a7dc2bc2f5e7487dbca5efebbfbe9d1bd3d1c2109`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/inputs/direct_review_packet.md` (`4655d986c842d5e5c3b4f6436cc95d16939cb9da5afa4d7115dcef1b3ff500f1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-FUBINI/faithfulness/inputs/source_locator.json` (`5b1f3d526385762ca4b8ad67d90ad9589109214154683f0a67d64033a69ec7e1`)
