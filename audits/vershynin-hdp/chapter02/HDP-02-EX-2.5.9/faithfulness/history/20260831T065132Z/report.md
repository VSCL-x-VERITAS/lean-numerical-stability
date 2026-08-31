# Faithfulness audit: HDP-02-EX-2.5.9

## Decision

- Classification: `undetermined`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `00e48ec5875f3dd27579ce5dc14a088595854401d35834d1246162df2681f9da`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The analytic and imported-operator semantics are source-faithful: all four objects are genuine members of the named families, the Pareto object is the measurable exponential pushforward of Exp(1), and PsiTwoGauge equal to infinity is the correct negation of Definition 2.5.6. The classification blocker is narrower but decisive. The source prints no distribution parameters, quantifiers, or nondegeneracy convention. Lean nevertheless treats the four parallel family names asymmetrically, quantifying every positive Poisson rate while fixing one standard exponential, Pareto, and Cauchy member. Treating the source as universal would make Lean omit parameter cases for three families; treating it as naming standard representatives would leave Lean's universal Poisson clause beyond the printed claim. Because the protocol forbids inventing a source quantifier, neither implication direction is decidable. The mixed parameter treatment is therefore genuinely undetermined, not accepted, and there is no unique locally source-prescribed repair without an external benchmark convention or clarified source statement.

## Implications

- **Lean implies source:** `unclear`. The Lean proposition proves the correct non-sub-gaussian criterion for every positive-rate Poisson law and for standard Exp(1), Pareto(1,1), and Cauchy(0,1) laws. It implies the printed claim under a canonical-member reading, but it does not itself assert all nonstandard exponential, Pareto, or Cauchy parameter cases under a family-wide reading. Exercise 2.5.9 prints no parameter quantifier selecting either reading.
- **Source implies lean:** `unclear`. A family-wide nondegenerate reading would include the Lean-selected standard laws and all positive Poisson rates, whereas a canonical-member reading need not imply Lean's universal Poisson clause. The pinned source provides no binder, parameter convention, or endpoint rule from which either implication can be established.

## Findings

- **major / family-parameter-scope:** The mixed treatment is genuinely undetermined against the pinned source, rather than demonstrably source-faithful or locally repairable to a unique source-prescribed scope.
- **note / operator-and-law-semantics-resolved:** No operator, law-identity, nonvacuity, or analytic-criterion uncertainty remains; only the source's missing parameter scope blocks acceptance.
- **note / non-sub-gaussian-criterion:** For the selected measurable probability laws, gauge equal to infinity faithfully expresses absence of any admissible finite scale.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `unclear` | `fail` |
| `C03` | `unclear` | `unclear` |
| `C04` | `unclear` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `unclear` |
| `C09` | `unclear` | `fail` |
| `C10` | `unclear` | `unclear` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `81` dependencies (`0` hash-reused); unclear: `D009, D053`.
- Direct judge covered `81` dependencies (`0` hash-reused); failing or unclear: `D001, D008, D018, D019, D020`.

## Remaining uncertainties

- Exercise 2.5.9 does not print any quantifier, parameter values, or endpoint convention for its four parameterized distribution families, while Lean universally quantifies positive Poisson rates and fixes standard members of the other three families. This source-level ambiguity controls both implication directions and cannot be resolved from the pinned source without adding a convention.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/agent_outputs/adjudicator.json` (`11df181f4c81c9b6cdad0c85b09236bb7cde9b93b447c54a6feb21ce9173e358`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/agent_outputs/agent_runs.json` (`09712b4c5456913866219b2b800ee83d447ff52d9101bc7e0a7cc33637ae3525`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/agent_outputs/blind_translation.json` (`8db83c3d7543cab6f7def76c23eba00f1da88bed42f1f58a7ef7dda4f876c4cb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/agent_outputs/direct_judge.json` (`87f730fca560833eb3da759079edf461b74d626d8a612addd4a8e742672e7948`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/agent_outputs/roundtrip_judge.json` (`de9f7849580b58229cd4f12a26b4ec65d0b2615e1a75085ecdb45bf931e163f2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/agent_outputs/source_contract.json` (`611a0979e9f7f12e23907397e71a6be28b5bdac9208a417f64c8d7169943fc18`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/decision.json` (`01f23e49dd1eba09d8104975420782f97877da50a74ec6839fc298b7046a318e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/inputs/blind_dependency_inventory.json` (`4e971d09dd4c7d47046ab76735c206d26117d5c39906ab2ec3ada120d3faa957`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/inputs/blind_dossier.md` (`d2137e4c118e25765158d78fa3b7348bc3a6d25f35933d29a03ed112b34bde7b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/inputs/blind_review_packet.md` (`d2137e4c118e25765158d78fa3b7348bc3a6d25f35933d29a03ed112b34bde7b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/inputs/declaration_dossier.md` (`3668acdb31c1e1000f054982fe6f3fb2062fd57c648763c1836d17c19d0305d9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/inputs/dependency_inventory.json` (`57996185bfdc2b3deb3f58021a51679a4c9438c30e96fa6354077f8645662361`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/inputs/direct_review_packet.md` (`4ddebf283989badf02017a637a99c3add4f56028661c740fe9aeb6149945bd27`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.9/faithfulness/inputs/source_locator.json` (`0fe579db92ab43658b8caaa677dfa5cdbf33f25fcd98fc512ad0be19978322c1`)
