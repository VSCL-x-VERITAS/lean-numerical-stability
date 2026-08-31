# Faithfulness audit: HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `4d6f8dd8c1162e2a032d41c49a2a63ef74ea2cf7048c6e6ee1866cfe96ec50ac`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The unresolved imported semantics are determinate in pinned Mathlib. Variance agrees with the source on every nonzero admissible measure, and the zero-measure boundary case has variance zero. Thus the finite-measure binder introduces no semantic mismatch. The target preserves the source's normalized initial-segment averages, variance object, finite common moments through L2 and identical distribution, and limit to zero. Its pairwise-independence hypothesis is genuinely weaker than the source's joint-family independence while remaining sufficient for variance additivity, so Lean implies the source but not conversely. The consistent configured decision is accepted faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Specialize μ to a probability measure and the sequence to the source's jointly independent identically distributed family. Joint independence supplies every required pairwise IndepFun hypothesis, finite common variance supplies L2 membership, and the N+1 zero-based averages are exactly the positive sample sizes after reindexing.
- **Source implies lean:** `no`. The source result assumes joint independence and therefore does not assert the conclusion for identically distributed L2 sequences that are pairwise independent but not jointly independent. Such sequences form a genuine nonvacuous additional domain covered by the Lean proposition.

## Findings

- **note / operators-and-definitions:** The imported operators match ordinary variance and independence in the source probability-space setting, so C06 passes.
- **minor / finite-measure-domain-qualification:** The judges' description of arbitrary finite-measure applicability is too broad: positive admissible measures are already probability measures, and the sole extra zero-measure case is trivial. This does not change acceptance or classification.
- **note / genuine-strength:** The weaker independence hypothesis gives genuine nonvacuous additional applicability, supporting faithful-stronger rather than reduced applicability.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `54` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `54` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/agent_outputs/adjudicator.json` (`dee431b53c9f1249a1b2bd40951b824b1b1f9c93737eb3110733dd1c267134ed`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/agent_outputs/agent_runs.json` (`745a910f2ef6d233cac1ae0f20429c6036f3a3eeddd0a5513f29741e21f6080d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/agent_outputs/batch_source_contract.json` (`411b1a2eabf406e54959810552609dcd353cd391f1acc5fe8260489f4c4b7f49`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/agent_outputs/blind_translation.json` (`1f5e99d99557823c7baa9598d6462d9bb161770b16ebdcc904f6b60f1fac8c45`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/agent_outputs/direct_judge.json` (`fc6a8411c5ec89f8926f910a28f7eed6c56cd92a9c4cb4588c05cc8fe493329b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/agent_outputs/roundtrip_judge.json` (`26c6ec9a35a9105dbf5c2c7919b78e15a2f55e7afb0eac59092ccf82951d1764`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/agent_outputs/source_contract.json` (`f244f080200b5e382d3c290b17bea58a84601b2c07c649dde14cb8bf3ee6c09f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/decision.json` (`194f94620d4bf81002021a9e0556c5056b7317cb2f2b3d9172f261ccec270307`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/inputs/batch_source_locator.json` (`8af4dd8a560766600bf26dfe42cd90ec6e6a587195df82808dc65bf0eb7eb2c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/inputs/blind_dependency_inventory.json` (`892ee29a176f0ca550ccc243e1815397f81fd517910d8d4d098a5231720927d4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/inputs/blind_dossier.md` (`7eca56d257686f6ec6a298359ab3506c3808c2d09c0017d5b553549ca13010cb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/inputs/blind_review_packet.md` (`7eca56d257686f6ec6a298359ab3506c3808c2d09c0017d5b553549ca13010cb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/inputs/declaration_dossier.md` (`4b961fab057cda8932abb61e055840d2fb8beacf93cf0be68dd04b54a2d6b332`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/inputs/dependency_inventory.json` (`892ee29a176f0ca550ccc243e1815397f81fd517910d8d4d098a5231720927d4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/inputs/direct_review_packet.md` (`60328f4c4abd2d20e98f89c293b325a3ed931add170fa1e5cd20fe5538d3db00`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-SAMPLE-MEAN-VARIANCE-LIMIT/faithfulness/inputs/source_locator.json` (`7c64e92c10c4ce7c579b3f098943ee34a13ee60c2228d6c49e0feb18ab842384`)
