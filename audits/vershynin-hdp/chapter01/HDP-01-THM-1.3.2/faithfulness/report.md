# Faithfulness audit: HDP-01-THM-1.3.2

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `b3c503367b51998e23754085891633930accd18c1605aa683b2e2417322db19a`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target preserves the source's iid and moment assumptions, normalization, asymptotic sample size, universal CDF threshold, and standard-normal limiting law. Explicit sigma positivity and zero-based indexing are faithful formal elaborations, so both implications hold.

## Implications

- **Lean implies source:** `yes`. The Lean hypotheses give one iid real sequence with finite second moments, common mean m, common variance sigma squared, and positive sigma. The conclusion is the source's all-threshold pointwise CDF convergence for the standardized n-term sum.
- **Source implies lean:** `yes`. Interpreting random variables as measurable and finite variance as a finite second moment, the source iid assumptions provide the Lean independence, identical-law, and L2 hypotheses. The displayed normalization supplies nondegenerate sigma, and the following source paragraph supplies the pointwise-CDF conclusion.

## Findings

- **note / explicit-side-condition:** This resolves the displayed quotient's well-definedness and does not materially strengthen the intended nondegenerate theorem.
- **note / indexing-convention:** Both contain exactly n iid summands; the difference is a harmless reindexing.
- **note / indexing:** This is a harmless and internally consistent zero-based reindexing.
- **note / side-condition:** The condition resolves well-definedness and does not materially strengthen the intended theorem.

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

- Blind translator covered `92` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `92` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/agent_outputs/agent_runs.json` (`f7b92c1e53dea06b2722eaa0ba0d1c8d94b8b00208ad9695685df756b63e5851`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/agent_outputs/blind_translation.json` (`66c97cae8d659c0cd5c73b93911124d365bf0344fcbebcbab3f01cf4cf714c73`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/agent_outputs/direct_judge.json` (`6480060ea5bbbf0163d442635e8c8ee3c06cc71895f7c99f0ad564f0b55ce515`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/agent_outputs/roundtrip_judge.json` (`c9f988887bd8ad4ec708ff841f5235dc591f616ec5c269c0ae84cd685c7c270b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/agent_outputs/source_contract.json` (`f589901a37cfae3120a3778efdf2619590df6bd01e598d8977cd688629b15251`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/decision.json` (`8282dca98f20ade9bd3fd377aac33e2ccad838bad5b2b4e763e8e434b0466f6a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/inputs/blind_dependency_inventory.json` (`331622028a99dc67680fc0a72cde403c7ddbed52bddc4ccd987a1387a5fa0e92`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/inputs/blind_dossier.md` (`851f4d9b3ae58008a1df16ebe6eb63072fd83954c156f107d1fa91124c64ae7e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/inputs/blind_review_packet.md` (`851f4d9b3ae58008a1df16ebe6eb63072fd83954c156f107d1fa91124c64ae7e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/inputs/declaration_dossier.md` (`4a1a298f2651be816d64885ba44236316a5b9f106d14da6f6e5a7c95a4274c6c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/inputs/dependency_inventory.json` (`40757ac66a0b893293e260d7703955ebdd30fd25aa81c45cff5509050c26d8e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/inputs/direct_review_packet.md` (`347191388c567f43339b2e60b335a28d49564c0a835a07b32c05f76f86e480a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.2/faithfulness/inputs/source_locator.json` (`bae8949074efd2eda2596c1a206689ec4c83c90159fc29a1e3f55e6e45632dd1`)
