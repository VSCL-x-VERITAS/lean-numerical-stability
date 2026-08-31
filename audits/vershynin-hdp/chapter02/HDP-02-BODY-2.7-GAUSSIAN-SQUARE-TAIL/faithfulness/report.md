# Faithfulness audit: HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `96c59ee7d0bb08606522209e4e011dcc58ee9f514ad5f2dd9d39bc46b9437a3e`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Under the source's footnote-supported exponential-scale reading of the informal comparison symbol, the Lean proposition is a faithful exact formulation of the selected coordinate-square tail claim. It disambiguates the scalar absolute value, preserves the positive threshold and strict square event, and replaces the suppressed asymptotic notation with the correct two-sided Mills-ratio bounds. Those bounds are derivable from the recalled Proposition 2.1.2 by square-root substitution, Gaussian symmetry, and atomlessness, and in turn imply the source's exponential-rate and heavier-than-sub-gaussian conclusions. The hypotheses are satisfiable and the quantitative lower bound is genuinely nontrivial for t > 1.

## Implications

- **Lean implies source:** `yes`. The Lean event equality is the source's exact square-to-absolute-value transformation. Its explicit two-sided bounds have the Mills polynomial factor and exp(-t/2), which entail the source's exponential-scale description and the qualitative fact that the tail is strictly heavier than a sub-gaussian tail.
- **Source implies lean:** `yes`. For a source coordinate g_i, Proposition 2.1.2 applied at u = sqrt t, together with standard-normal symmetry and atomlessness, yields twice the displayed one-sided lower and upper bounds. The elementary identity x^2 > t iff |x| > sqrt t for t > 0 yields the Lean equality. The scalar law is the coordinate marginal, and the N=1 case supplies the converse realization.

## Findings

- **note / source-prefactor-imprecision:** The Lean statement follows the exact recalled proposition and correctly resolves an apparent imprecision in the informal footnote; this is not a faithfulness defect.
- **note / scalar-marginal-formulation:** The omitted vector dimension, index, and independence assumptions are unused context for this marginal claim and cause no applicability loss.

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

- Blind translator covered `51` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `51` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/agent_outputs/agent_runs.json` (`dca17ec7463c631d946227fc02e04682b628dfbffd0cca5a8f13660e952244f3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/agent_outputs/batch_source_contract.json` (`f2a9053f59fc0eb571aebbe0d71ed6fcd407d5fc1f2036d41cdaf01bba7e8ffd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/agent_outputs/blind_translation.json` (`c18389bc9bb855f7f328ea5708d2e1f46361b838f59acc2802014b022def1846`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/agent_outputs/direct_judge.json` (`a2ad88c184a9a8c2d59078136bc0a1ffafb02284bafde261c3712535bca57fdf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/agent_outputs/roundtrip_judge.json` (`a3640b7d89b5f0cc337b2c762a0aa503bed3cbcdbd5c40b3e36397f9ad206f4e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/agent_outputs/source_contract.json` (`11faf06f81cf2e73b5557c1f6d4350099656c45673994daed50700ddcf56b5a9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/decision.json` (`97a3b14f067ea113aef39aeea118142f922ff81f49258bfb277b28b78aa49da2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/inputs/batch_source_locator.json` (`8dd0ebf2f2e81d3ebe2c696b4a661b1c23011bb60e49479c50dab33d666ef93b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/inputs/blind_dependency_inventory.json` (`4417c79ac96317547e678a122cfa8c43249a0c080da4ba4848942bbd5c9125e3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/inputs/blind_dossier.md` (`bae9b48c502ddd9b03c580dde95e7a4ecc2cb92820a2fd51df1434b3946d84ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/inputs/blind_review_packet.md` (`bae9b48c502ddd9b03c580dde95e7a4ecc2cb92820a2fd51df1434b3946d84ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/inputs/declaration_dossier.md` (`bba14d988aa9832e222bfe5eb8416062593ca45ea0052e80ac7e70ab2a405648`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/inputs/dependency_inventory.json` (`b046a17ce9c9755e48fbc0b1e71646f257744deb77e0220acceb4b87f15fa359`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/inputs/direct_review_packet.md` (`a8221fb7e0579f2c8f8c77c3b8182e746a517608ffa5538da332913328c18607`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.7-GAUSSIAN-SQUARE-TAIL/faithfulness/inputs/source_locator.json` (`d2b42b30bf2046e6be4e35671eb2dbbd457630c8cc8d345c23bbb337c1209663`)
