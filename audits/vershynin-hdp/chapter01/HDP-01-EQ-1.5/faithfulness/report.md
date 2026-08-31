# Faithfulness audit: HDP-01-EQ-1.5

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `0e8c09e90f4d15ba9ee23622be8149e2741becebd7509a3d3618c37ad0bebc34`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The Lean statement preserves the positive finite sample size, real-valued common-space family, identical distribution, exact reciprocal-N average, centered-second-moment variance, and exact σ²/N conclusion. Local pinned semantics resolve the ambient-measure concern: distinct-pair independence forces every finite N≥2 case to have total mass zero or one, and all remaining non-probability cases are trivial. The pairwise-independence hypothesis is weaker than the source's mutual independence, is sufficient for variance additivity, and admits non-jointly-independent iid examples. Thus Lean implies the source, the source does not cover all Lean cases, and the difference is genuine nonvacuous strength rather than reduced applicability.

## Implications

- **Lean implies source:** `yes`. On the source probability space, IsFiniteMeasure holds. Mutual independence entails all distinct-pair IndepFun hypotheses, common finite variance gives L2 membership, and identical distribution gives IdentDistrib with the reference variable. Mathlib variance is exactly the centered second moment and the conclusion is the same reciprocal-N identity.
- **Source implies lean:** `no`. The Lean proposition covers pairwise-independent iid families that need not be jointly independent. This is nonvacuous: A, B, and AB for two independent uniform signs are iid and pairwise independent but not jointly independent. The source theorem does not cover such families. The additional finite-measure cases are either probability-normalized, zero-measure, or the tautological N=1 case.

## Findings

- **minor / genuine-independence-strengthening:** The target has strictly broader, nonvacuous applicability and is therefore faithful-stronger rather than faithful-equivalent.
- **note / finite-measure-generality:** The absence of an explicit IsProbabilityMeasure hypothesis introduces no substantive invalid cases and does not prevent acceptance.
- **note / moment-presentation:** This is a faithful reformulation of the common finite moments, not a semantic omission.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `unclear` |
| `C02` | `pass` | `pass` |
| `C03` | `unclear` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `unclear` | `pass` |
| `C06` | `unclear` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `unclear` | `pass` |

## Dependency coverage

- Blind translator covered `48` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `48` dependencies (`0` hash-reused); failing or unclear: `D005, D006, D014, D015, D016, D027, D028, D029`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/agent_outputs/adjudicator.json` (`9e42a7cf94cc41fb9e6d32d6048afbcb2a4ff46b6a9691824f340001ebf1e363`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/agent_outputs/agent_runs.json` (`e2872acb7b98ba09eeef9a4f0714b9ffefce821c32768a59ce7700bfb5aeecbe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/agent_outputs/batch_source_contract.json` (`411b1a2eabf406e54959810552609dcd353cd391f1acc5fe8260489f4c4b7f49`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/agent_outputs/blind_translation.json` (`928e6d6e3226798ab93dada10c95618d1211b9f6006b7b2e5a78e7d96a482dc2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/agent_outputs/direct_judge.json` (`9bcb02a41ca062bebae5fac583c379239c09aff71ad692cef45a2a30a05becef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/agent_outputs/roundtrip_judge.json` (`d500b20cb8cc7baa8a30167d45fe3e0ed643ea39334fc6be8a513fc2aea1cb0e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/agent_outputs/source_contract.json` (`8d08a949424ba89680828e2a8ddc21b66f613bdf794602423efdec64064b4a99`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/decision.json` (`a4b873e44553cb292d75e02cef7d37a1bae2cb16cfeb48cf3a09c0026f5494a8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/inputs/batch_source_locator.json` (`8af4dd8a560766600bf26dfe42cd90ec6e6a587195df82808dc65bf0eb7eb2c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/inputs/blind_dependency_inventory.json` (`2a85e82dadc9652bfedcb33502f4b8638c3b33d0bb4327951c8593300e3f12e3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/inputs/blind_dossier.md` (`080022e6cfc9f85f88809481b26eb15df2bbb1aa3d640a6258d34da14d65dd74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/inputs/blind_review_packet.md` (`080022e6cfc9f85f88809481b26eb15df2bbb1aa3d640a6258d34da14d65dd74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/inputs/declaration_dossier.md` (`1ff172aa1866809cc98413754bcf73334cb65a84c4945403f2c5981278f2e613`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/inputs/dependency_inventory.json` (`2a85e82dadc9652bfedcb33502f4b8638c3b33d0bb4327951c8593300e3f12e3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/inputs/direct_review_packet.md` (`5e5b7f994518effc4ce612038b4f8069c7b7a33937132a76f3f0694cd7196b11`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.5/faithfulness/inputs/source_locator.json` (`c783b354f1c1d7cfc04cedf2df1a2df3af62f7ce9c32e18a64ea68b663d29488`)
