# Faithfulness audit: HDP-02-THM-2.2.2

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `b2516642cbc7b90008d4cbdcbf7008aca1307b4bc624d17bcc1813e8078ccb22`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The Lean proposition is a source-faithful measure-theoretic rendering of Theorem 2.2.2. Its explicit measurability, probability-measure, independence, and pushforward-law hypotheses formalize what the source calls independent symmetric Bernoulli random variables. The weighted event and exponential constant are exact, since the squared Euclidean norm is the sum of coefficient squares. Arbitrary finite indexing and Lean's totalized handling of a zero denominator add only valid conservative boundary coverage.

## Implications

- **Lean implies source:** `yes`. Specialize ι to Fin N and read hX, hIndep, and hLaw as the source random-variable, independence, and symmetric Bernoulli assumptions. The event and exponent then reduce exactly to the printed formula because ∑i(a i)^2=‖a‖₂².
- **Source implies lean:** `yes`. Enumerate any finite ι by Fin(card ι) and transport the source theorem across that bijection; finite sums, independence, and marginal laws are invariant under reindexing. The empty or zero-coefficient cases not needing the printed quotient argument satisfy the Lean inequality directly, since its totalized right side is 1.

## Findings

- **note / finite-index-generalization:** This is an indexing-invariant reformulation; every finite type is equivalent to Fin(card ι), and the added empty case is valid.
- **note / zero-denominator-totalization:** This is a conservative valid treatment of a boundary case and does not change the theorem on its nondegenerate domain.
- **note / zero-denominator-convention:** This resolves an explicit source ambiguity conservatively and does not alter the theorem on its well-defined nonzero-coefficient domain.
- **note / finite-index-representation:** This is an equivalent coordinate-free encoding, with the empty family added only as a valid degenerate boundary case.

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

- Blind translator covered `71` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `71` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/agent_outputs/agent_runs.json` (`8853ff6093b597c58d6697f0ad8dd4752895abb7e02bdaed689bcbe65d0b85df`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/agent_outputs/batch_source_contract.json` (`ee90e2b2069746aea492a9fbd95fd8f77c8341a848420f40b4aa3293dddc9d0e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/agent_outputs/blind_translation.json` (`2eaa53bb8ebda43cd2d3def184d8d2c7b0ef06ee78469f6d9f12826b94ebec5f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/agent_outputs/direct_judge.json` (`5297282ec55b8d873a7fb6d40920202b17e1a2ab2f7198f60306c116fda4b681`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/agent_outputs/roundtrip_judge.json` (`8b9a59ff8cfc5afe6b44d3e533cd56e0fe6f46ecfbfad20ce52d6237b37fad5f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/agent_outputs/source_contract.json` (`01817a1778ccbeaccced7376fd84fb3b4bdf60411a1c7a13aeaa088509edd6d1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/decision.json` (`d5096bec1e369e9ee12cef0d52337e5b064555d42d870d23bb3880c3a1a76f67`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/history/20260830T060948Z/inputs/blind_dependency_inventory.json` (`4022d46aa10e09a24d2db9e7adb0980894152cee2ec8bfd140d972dcbd3a09eb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/history/20260830T060948Z/inputs/blind_dossier.md` (`1d6eebd102f7f74d0e635d6f4d74632421299cdce51f7d701ab51a22a155d6ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/history/20260830T060948Z/inputs/blind_review_packet.md` (`1d6eebd102f7f74d0e635d6f4d74632421299cdce51f7d701ab51a22a155d6ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/history/20260830T060948Z/inputs/declaration_dossier.md` (`12c7865d4b615a4cc447604e556e62ac2f8978fb0f49d603f85a8dbdf763ef94`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/history/20260830T060948Z/inputs/dependency_inventory.json` (`3a41db0d95064e816466d5dcabebb249e4355a51b4b5b2afaa0e40d6b585d051`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/history/20260830T060948Z/inputs/direct_review_packet.md` (`78c0e5c5248ec23074046e13f25d01e007f3799993badab2c2da1e24939912b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/history/20260830T060948Z/inputs/source_locator.json` (`a5968aacc60d984dc578d84532ce0d7294a8f020556d418f408527304b905474`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/inputs/batch_source_locator.json` (`028f2b261295e8952a97906c27def2b3259ef7882e18f724b1e4b6f26d1a41c8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/inputs/blind_dependency_inventory.json` (`4022d46aa10e09a24d2db9e7adb0980894152cee2ec8bfd140d972dcbd3a09eb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/inputs/blind_dossier.md` (`1d6eebd102f7f74d0e635d6f4d74632421299cdce51f7d701ab51a22a155d6ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/inputs/blind_review_packet.md` (`1d6eebd102f7f74d0e635d6f4d74632421299cdce51f7d701ab51a22a155d6ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/inputs/declaration_dossier.md` (`12c7865d4b615a4cc447604e556e62ac2f8978fb0f49d603f85a8dbdf763ef94`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/inputs/dependency_inventory.json` (`3a41db0d95064e816466d5dcabebb249e4355a51b4b5b2afaa0e40d6b585d051`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/inputs/direct_review_packet.md` (`78c0e5c5248ec23074046e13f25d01e007f3799993badab2c2da1e24939912b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.2.2/faithfulness/inputs/source_locator.json` (`a5968aacc60d984dc578d84532ce0d7294a8f020556d418f408527304b905474`)
