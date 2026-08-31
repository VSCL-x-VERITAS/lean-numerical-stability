# Faithfulness audit: HDP-02-DEF-2.7.5

## Decision

- Classification: `not-faithful-weaker`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `bd264cee399d2f77b511f98b33543172f60942c7254d1d00f0ef1cc865c9c77f`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Adjudication is against the complete selected book definition, not against a silently corrected intended version. The Lean semantic closure accurately represents display (2.21), all four properties, their positive parameters, and the resulting nonvacuous finiteness/class-membership equivalence. However, the immutable source also literally assigns the exact psi_1 norm role to the smallest K3 of property 3, whereas the formal gauge uses the distinct property-(d) one-point scales. Since optimal property-(c) and property-(d) constants need not coincide, a finiteness equivalence using the latter cannot imply the full printed quantitative definition. The full source does imply the wrapper, so the required directions are no/yes, classification not-faithful-weaker, and acceptance false. The source discrepancy is preserved as a critical finding; the display-aligned wrapper's mathematical usefulness is recorded separately from faithfulness acceptance.

## Implications

- **Lean implies source:** `no`. Unfolding D001 and D004 gives the exact one-point infimum in display (2.21), and the target then asserts only that this gauge is finite exactly when one of D013/D014/D005/D007 has a positive scale. It does not imply the full printed definition's separate exact claim that the psi_1 norm is the smallest K3 satisfying property (c). D005 and D007 are deliberately distinct, and their optimal constants can differ (already for a positive constant random variable), so the missing quantitative clause cannot be recovered by definitional unfolding or by absolute-factor equivalence.
- **Source implies lean:** `yes`. The printed source includes both the display-(2.21) infimum and the assertion that properties (a)--(d) are equivalent up to an absolute factor. Hence satisfying any one property supplies a positive property-(d) scale and makes the displayed gauge finite; conversely a finite displayed gauge supplies a positive one-point scale and therefore property (d). The exact but discrepant K3/property-3 clause adds quantitative content but does not invalidate this class-membership/finiteness consequence.

## Findings

- **critical / immutable-source-discrepancy:** The formal display-based gauge cannot be counted as representing both consecutive printed numerical prescriptions. The defect must remain visible and requires an explicit corrected-source or corpus-exclusion policy if the display is to govern a different benchmark.
- **major / exact-definition-weakened-to-finiteness:** The wrapper preserves the qualitative sub-exponential class and the display-based finiteness characterization, but not every quantitative conclusion in the full printed definition; this yields Lean-implies-source no and not-faithful-weaker.
- **note / display-aligned-wrapper:** The declaration remains a sound and useful wrapper for the display-(2.21) convention and sub-exponential membership, even though this audit cannot accept it as the complete literal Definition 2.7.5.
- **note / infimum-not-minimum:** The formal wrapper does not add a minimum-attainment requirement and faithfully follows the display on this boundary issue.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `fail` |
| `C06` | `pass` | `fail` |
| `C07` | `pass` | `fail` |
| `C08` | `pass` | `fail` |
| `C09` | `pass` | `fail` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `101` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `101` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

- The cited immutable source does not determine whether 'smallest K3 in property 3' or the immediately following display (2.21) reflects the author's intended exact norm definition. This unresolved authorial intent does not change the literal-source implication pair; treating display (2.21) as a correction would require a separate, explicit corpus policy.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/agent_outputs/adjudicator.json` (`73953bc20e57de5f2feb52985ede1a8b5936476b4925fb2be568f089b1f5a481`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/agent_outputs/agent_runs.json` (`3f19732f22e033185ac1b19450bd9e6985aef7cf9888060377269870bf4b71c2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/agent_outputs/batch_source_contract.json` (`4ebe1af4c0627a3d03ad37d2e0f49d55aa03c0529180ace45df3de42da8b70b0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/agent_outputs/blind_translation.json` (`884a1b28fd39db92c4d546ef5fa4bf1e637b87598867b21d0c7d3127f2ea3138`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/agent_outputs/direct_judge.json` (`4de7c4697373f549c8136edda6a91f220e45529ac73e54bf28099ba149746343`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/agent_outputs/roundtrip_judge.json` (`37acf0fd0709c5f2286514e10782a37c7ef626f5f76dcbc1e6699612a4ebf1e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/agent_outputs/source_contract.json` (`45c352e00533bc851b1284de83b0fe52d55bb6db3a8c70120b6cc23acb235416`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/decision.json` (`7ebf5b5fe8d855bb21ff1f9836013699b2065684ddc006df6982d9726296d394`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/inputs/batch_source_locator.json` (`71ac7c8fdc2c77a852751bf33b7ed201d5c8832272eb22e99a2e37ce5786de30`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/inputs/blind_dependency_inventory.json` (`6e693d87e84839aab3580764bccdceace40d8284dd27ddb9abc12dc36b0938dd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/inputs/blind_dossier.md` (`c2f1468a135220ea8205c807d5b88d40cc9e12265e0e2093ac39310d95808bc5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/inputs/blind_review_packet.md` (`c2f1468a135220ea8205c807d5b88d40cc9e12265e0e2093ac39310d95808bc5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/inputs/declaration_dossier.md` (`8a19cad4af3c7196238274448dac39e1092b52a4cbe0c617f02ce80e00ad788c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/inputs/dependency_inventory.json` (`97489f07173a3fbbe205361d4d0235673ab378726450336e00cc93ab052fd276`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/inputs/direct_review_packet.md` (`e880101c8faa5cc34ac2e8bae15972539591c336106683729dd6674564040c0b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.7.5/faithfulness/inputs/source_locator.json` (`71e187b0b7518f344d622081c5171c2fafeadaee71906a680cfcefde3c111409`)
