# Faithfulness audit: HDP-02-EQ-2.10

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `77bd480cfe02a09053e902cad1cf8e27e7109e108f56e2702bf3662e1fd7a64b`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target is a harmless law-level reformulation of source equation (2.10). The pinned source fixes X with law N(0,1) and asserts, for every real t >= 0, the closed two-sided bound P{|X| >= t} <= 2 exp(-t^2/2). The Lean proposition fixes the canonical measure gaussianReal 0 1 and asserts the identical event-mass inequality. Primary dependency evidence establishes that gaussianReal's second parameter is variance, gaussianReal 0 1 is a probability measure, and Measure.real loses no information on its finite event values. Therefore the realization-based and law-based statements imply each other, all triggered checklist items pass, the proposition is nonvacuous, and no uncertainty remains.

## Implications

- **Lean implies source:** `yes`. Unfolding standardNormalLaw gives gaussianReal 0 1, the Gaussian probability measure with mean 0 and variance 1. Measure.real is exact on its finite event values. Thus the Lean bound is the canonical N(0,1) tail bound, and any source random variable with that law has the same tail-event probability by pushforward-law equality.
- **Source implies lean:** `yes`. Instantiate the source claim with the identity random variable on the Borel real line under gaussianReal 0 1. This is a standard-normal probability space, and the source event probability is exactly standardNormalLaw.real {x | |x| >= t}, with the identical threshold domain and right-hand side.

## Findings

No findings were recorded.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `unclear` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `unclear` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `39` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `39` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/agent_outputs/adjudicator.json` (`cf442a250c7644d808f3a98a436f223fbcb835602431a490266b7362ea2b632b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/agent_outputs/agent_runs.json` (`827491b48bd8a8cd39c87c527ac2784c4205cb12fb433f1c400c1c4c1b888ca2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/agent_outputs/blind_translation.json` (`454fc916c06d791478c05e4516fd0347a1a0d18cfa14452ebf4ffb2dd67bfa17`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/agent_outputs/direct_judge.json` (`9f4b947270e0b8547194e1cfe096a4ebc718d26ef84ab3ffef6731c1fc749302`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/agent_outputs/roundtrip_judge.json` (`2f7552f50adedcc91c34b47f133214941a567e39b17653b72b6eabafc9341bfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/agent_outputs/source_contract.json` (`0fc24271a3af8b5569ccfecd5a51888e257c840f63da84d2ac50268033f48c8f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/decision.json` (`ff77a634dd6700a4f4fa62878e58178ec95aaace08b47c4d0cdb1e5ef0ae5f91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/inputs/blind_dependency_inventory.json` (`6e8732a31c1b54e8ac1e880a0b326220b36b0b216e9fc3f2f7a5dd09a1daa0b3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/inputs/blind_dossier.md` (`9defa35c1df0f7b26bcceed222d068fd6934bc72192e49ebb2d00708a600fd20`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/inputs/blind_review_packet.md` (`9defa35c1df0f7b26bcceed222d068fd6934bc72192e49ebb2d00708a600fd20`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/inputs/declaration_dossier.md` (`03db06780f620b1b108e2c5dfcf4f15870d10bf09488b768ac3f54778313ef64`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/inputs/dependency_inventory.json` (`7243bfd5df8b6425267dba6d28abc733ebf56c0e482baa606918c51b731fcdab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/inputs/direct_review_packet.md` (`bf4042b0c84d197a16d27e18f73cbd851d57d285d4d9acc50e30a2beef0f9723`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.10/faithfulness/inputs/source_locator.json` (`7fc64ce61a7740077c24e97ee4b62d9ffd02d3c486a519659a66a5f80fd52797`)
