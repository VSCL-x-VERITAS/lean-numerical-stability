# Faithfulness audit: HDP-01-THM-1.3.2-TAIL

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `b3c503367b51998e23754085891633930accd18c1605aa683b2e2417322db19a`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target preserves the iid finite-variance assumptions, centered sigma-sqrt-N normalization, every-threshold closed upper tail, atTop limit, and exact Gaussian integral. Both implications hold.

## Implications

- **Lean implies source:** `yes`. The target directly states the same standardized iid upper-tail convergence, with a cofinal N+1 reindexing and the identical Gaussian integral.
- **Source implies lean:** `yes`. The source iid finite-variance nondegenerate assumptions provide the explicit Lean regularity and yield the same pushforward-law Tendsto statement.

## Findings

- **note / indexing:** This is a cofinal reindexing and does not change the limit.
- **note / explicit-regularity:** These expose the intended source domain.
- **note / sample-size reindexing:** This avoids zero normalization and does not change the limit.
- **note / measure-theoretic representation:** These are extensionally equivalent representations.

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

- Blind translator covered `101` dependencies (`77` hash-reused); unclear: `none`.
- Direct judge covered `101` dependencies (`77` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/agent_outputs/agent_runs.json` (`18a048a9f706aed48868f68e541695676098978b7f5d4ca696d1cce6d1f511a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/agent_outputs/blind_translation.json` (`7f91c1dbc824c9efe375bd4ba37943fb7145fbea731b3b25139df4fa1c62ad56`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/agent_outputs/direct_judge.json` (`a5333418f34704e71ce24106387826b51d7c555931dec5ab6bea3386ac30f5d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/agent_outputs/roundtrip_judge.json` (`9b4c107acac5f0ac1479fbfce1789e35d985383f1b7f55d03c7860d629935299`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/agent_outputs/source_contract.json` (`a2b3a1fbf1b1601ec4d7c2bda7beb59e73c35d1a7a96a06cfe79240f0831d47e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/decision.json` (`7d39035ac27aeee083b453a3810dca23a2db7cfc30175ab295b56bb7f3eb2df9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/blind_dependency_inventory.json` (`b0a5898126ccd7d4a66965af6c04887329eda7cd2b731cb1a67b70f8c4b88538`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/blind_dossier.md` (`026ff3706666ccc6da1b743def72afa56d7e4fb5042639b7d34616debb6bca60`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/blind_review_packet.md` (`af92343b9f789e3d0df2603bfa127c8da8fb35030ce2316b9b80b05b38c3351a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/declaration_dossier.md` (`36ef08987f10431f4d24962fe6df04fe4d9000916f69cca125c33b62dc9bcdb1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/dependency_inventory.json` (`2f4b5d928cbaa6fae7faf5f713a28d34dc4db39914dac7b39aac7830584e1308`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/dependency_reuse_blind.json` (`770ed34ef040c2fe7f6538b6970ed5b56ed8ce367b5284fb0dd00f2705c8ca39`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/dependency_reuse_direct.json` (`5d2029ca2fee5e57b792a57bca7c265fe86f9b8e8caedcdc9543c7d1f68027cb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/direct_review_packet.md` (`3b711f41430e8c290d505c761026dc9556e015d6562a608d4aa75d7be57ed13d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2-TAIL/faithfulness/inputs/source_locator.json` (`ff552612a768860516427737812115829a3d4fe3e00f703e3278b38ea270d4d4`)
