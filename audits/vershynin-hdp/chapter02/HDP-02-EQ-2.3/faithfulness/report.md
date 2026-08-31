# Faithfulness audit: HDP-02-EQ-2.3

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `b62a543d72cf57fc7dfbba86403641e8e6dfaaa9d52aaf6c1590a1ecb5f8ddb7`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target is a faithful equivalent of Equation (2.3). It preserves the full t≥1 domain including t=1, the one-sided non-strict event g≥t, the non-strict upper-bound direction, and the exact density value exp(−t²/2)/√(2π), with no spurious 1/t, factor 2, lower bound, absolute value, or neighboring Proposition 2.1.2 conclusion.

## Implications

- **Lean implies source:** `yes`. Any standard-normal random variable has law standardNormalLaw, so the Lean bound on standardNormalLaw(Ici t) yields Equation (2.3) for every t≥1.
- **Source implies lean:** `yes`. Applying Equation (2.3) to the canonical N(0,1) distribution gives the Lean inequality, with Ici t representing exactly g≥t and the same density expression.

## Findings

- **note / distribution-level-presentation:** This is equivalent because the claim depends only on the distribution of g.

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

- Blind translator covered `41` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `41` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/agent_outputs/agent_runs.json` (`90c33b7c807133dc0106cd3d81fbdb5c62aef513bc0d53e90e84c0ac2b63fa3f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/agent_outputs/batch_source_contract.json` (`09cdb24e1e276d62c844ad00797da5cbf34e59c6d0af39a7eca884251bcf4647`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/agent_outputs/blind_translation.json` (`951fca348a85d44f5370bc1a85eba87434dcc55532777c1eae3ca2006915669e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/agent_outputs/direct_judge.json` (`6d7e089b41a443985c57359f592704762ccf987fb6f048d6d2e4ba741e0ab52b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/agent_outputs/roundtrip_judge.json` (`1e08546a849294a37de341cd95aa2f410540c3b876b9f05c8122b4825ddda62e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/agent_outputs/source_contract.json` (`7c80558ff42f0aafe6a70aa8ebbc5b91eb71cfe23a8c1991a42b7ae8156a1892`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/decision.json` (`30e98fc6ab1002e6da5388b6336cf9216340f999473736b331ad386af8069eab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/agent_outputs/agent_runs.json` (`3f570e71a212ab1c6fa3454d5e66e63ede1c4dbd2a026e55014112e275aaf542`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/agent_outputs/batch_source_contract.json` (`09cdb24e1e276d62c844ad00797da5cbf34e59c6d0af39a7eca884251bcf4647`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/agent_outputs/blind_translation.json` (`951fca348a85d44f5370bc1a85eba87434dcc55532777c1eae3ca2006915669e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/agent_outputs/direct_judge.json` (`6d7e089b41a443985c57359f592704762ccf987fb6f048d6d2e4ba741e0ab52b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/agent_outputs/roundtrip_judge.json` (`1e08546a849294a37de341cd95aa2f410540c3b876b9f05c8122b4825ddda62e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/agent_outputs/source_contract.json` (`7c80558ff42f0aafe6a70aa8ebbc5b91eb71cfe23a8c1991a42b7ae8156a1892`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/decision.json` (`3fd9185be0e5db617f5fc4903645d4484f69b1514407c9076a46bdf8b208a41f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/inputs/batch_source_locator.json` (`956543067ac76eb3dd8be09fc85f20e06d57688858509658fcce7144483a5a4a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/inputs/blind_dependency_inventory.json` (`f50590b2c8689f668d691dc412f8069b58e8ef21ba230f780585da38fce8631c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/inputs/blind_dossier.md` (`e45493210b7414f538d2522be2136c68f8ea7253e5063569cafc0b2b09e0fe9b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/inputs/blind_review_packet.md` (`e45493210b7414f538d2522be2136c68f8ea7253e5063569cafc0b2b09e0fe9b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/inputs/declaration_dossier.md` (`953957392d886f4e439da1cc2722615b1ebb0a526d493c491bcdf3064412d890`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/inputs/dependency_inventory.json` (`2d8ff2bbafaf19d9127a34d3c5110a301ed055e442682131a9016317d335a06b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/inputs/direct_review_packet.md` (`baac101e7e58c7a7abd0202042f197c63aa6a6dd64346d92ff6cc28c19c02c3b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/history/20260831T083840Z/inputs/source_locator.json` (`4990f6a32b5dff1f0cd567ae0856c7ec8e81697c939ebc1374eabff821de8ead`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/inputs/blind_dependency_inventory.json` (`f50590b2c8689f668d691dc412f8069b58e8ef21ba230f780585da38fce8631c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/inputs/blind_dossier.md` (`e45493210b7414f538d2522be2136c68f8ea7253e5063569cafc0b2b09e0fe9b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/inputs/blind_review_packet.md` (`e45493210b7414f538d2522be2136c68f8ea7253e5063569cafc0b2b09e0fe9b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/inputs/declaration_dossier.md` (`eb5a795856c567f42f9691638d400ce355924566f70e798c3eb73cf502a98587`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/inputs/dependency_inventory.json` (`2d8ff2bbafaf19d9127a34d3c5110a301ed055e442682131a9016317d335a06b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/inputs/direct_review_packet.md` (`baac101e7e58c7a7abd0202042f197c63aa6a6dd64346d92ff6cc28c19c02c3b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.3/faithfulness/inputs/source_locator.json` (`4990f6a32b5dff1f0cd567ae0856c7ec8e81697c939ebc1374eabff821de8ead`)
