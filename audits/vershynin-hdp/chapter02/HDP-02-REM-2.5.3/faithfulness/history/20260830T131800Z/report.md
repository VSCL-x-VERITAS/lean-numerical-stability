# Faithfulness audit: HDP-02-REM-2.5.3

## Decision

- Classification: `not-faithful-weaker`
- Accepted: `false`
- Adjudicated: `false`
- Target SHA-256: `f659eb68bf990d70a7116b3acaa48f29f5d750f4420e61dad86b6fc2599565da`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The source and D001-D063 show that the Lean predicates accurately encode the two formulas containing standalone constant 2, including A>1, positive scales, every t>=0, the two-sided tail event, and the one-point exponential-square expectation. The source therefore implies these qualitative replacement Iffs. The converse fails because the source claim is attached to all of Proposition 2.5.2 and explicitly includes absolute-factor parameter comparability, while the Lean conclusion omits the remaining characterization and every quantitative witness relation. This is reduced conclusion strength, hence not-faithful-weaker. No dependency, semantic check, or implication remains unclear, so adjudication is not requested.

## Implications

- **Lean implies source:** `no`. The Lean proposition gives only qualitative existence equivalences for the two properties containing literal 2. It provides neither the equivalence with properties (ii), (iii), and centered (v) nor, decisively, the absolute-factor bounds relating scale parameters that Proposition 2.5.2 explicitly builds into its meaning of equivalence. Bare existential Iffs cannot recover those quantitative conclusions.
- **Source implies lean:** `yes`. The source says either affected occurrence of 2 may be replaced by any fixed absolute A>1 while retaining Proposition 2.5.2. Thus the threshold-2 and threshold-A versions of each affected property are qualitatively equivalent. D001 and D002 faithfully encode those versions; measurability and finite-expectation integrability are implicit in the source setting.

## Findings

- **major / quantitative-equivalence-omitted:** The Lean statement cannot imply the source's quantitative characterization, so it is strictly weaker even if unchanged properties are supplied from surrounding context.
- **major / characterization-incomplete:** The target is a pair of threshold-invariance lemmas rather than a self-contained formal statement of the full selected result.
- **note / off-domain-vacuity:** This vacuously extends the theorem outside the source domain but does not alter the implication judgment in the intended measurable setting.
- **major / quantitative-equivalence-omitted:** The translation cannot imply the source's controlled parameter-transfer claim, so it is strictly weaker despite capturing qualitative constant replacement.
- **minor / random-variable-domain-vacuity:** This adds mathematically uninformative cases outside the source domain, though it does not obstruct either implication once the local definitions are used.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `fail` | `pass` |
| `C04` | `pass` | `fail` |
| `C05` | `fail` | `fail` |
| `C06` | `pass` | `pass` |
| `C07` | `fail` | `fail` |
| `C08` | `pass` | `pass` |
| `C09` | `fail` | `fail` |
| `C10` | `fail` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `63` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `63` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/agent_outputs/agent_runs.json` (`44d4fd62f4c33a8aacedef9e72b1e07983437ddab270d433f5d556004c29844d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/agent_outputs/blind_translation.json` (`12101114e4943868cd74fadf5546da8d83a18e99602c5e982deb1dd66ae176ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/agent_outputs/direct_judge.json` (`35533ebd5ab9ae81f754e3f9ee90586355b6ee42341e106c4b25b58acbb2a2d9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/agent_outputs/roundtrip_judge.json` (`126a687e989afef86f768c4cd0b3156aa9a17180c54e743a189a8b2812a8221a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/agent_outputs/source_contract.json` (`7af013d2536177f6d2f050c34f1a83db5f1e666d140decdf9a68380fea1bf74a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/decision.json` (`65532b4655aeab32aefa7ea9e577228ddf31e3823ba4b26aa9271254e7e94ad2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/history/20260830T125810Z/inputs/blind_dependency_inventory.json` (`e9a4d4dc00713f7fb3ab87e89b5ca0a8583a6455b9a410347eeb74d37ea57cc5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/history/20260830T125810Z/inputs/blind_dossier.md` (`646e5bc6b8b019008dceacde9ed85d8d77e0974c5461fc1ae3dcbcb569cb8d61`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/history/20260830T125810Z/inputs/blind_review_packet.md` (`646e5bc6b8b019008dceacde9ed85d8d77e0974c5461fc1ae3dcbcb569cb8d61`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/history/20260830T125810Z/inputs/declaration_dossier.md` (`baa903e8c8498fd57a7fdeb379b2a947dc9a7a01ed73f01bae18e376cda2a16a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/history/20260830T125810Z/inputs/dependency_inventory.json` (`70eeaecfee49a3c5c68905e6f651d70a0daa498803bc8620e4891a2ea3f92efd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/history/20260830T125810Z/inputs/direct_review_packet.md` (`8af58b3ba75671297798e7f3e3537e3bf27c37133cdf1fa41fdd080ef614e21f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/history/20260830T125810Z/inputs/source_locator.json` (`d1287714f86cfdd1df593cf2b4a1553e1d971105e71adc82f9b21a84dcab42e4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/inputs/blind_dependency_inventory.json` (`e9a4d4dc00713f7fb3ab87e89b5ca0a8583a6455b9a410347eeb74d37ea57cc5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/inputs/blind_dossier.md` (`646e5bc6b8b019008dceacde9ed85d8d77e0974c5461fc1ae3dcbcb569cb8d61`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/inputs/blind_review_packet.md` (`646e5bc6b8b019008dceacde9ed85d8d77e0974c5461fc1ae3dcbcb569cb8d61`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/inputs/declaration_dossier.md` (`baa903e8c8498fd57a7fdeb379b2a947dc9a7a01ed73f01bae18e376cda2a16a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/inputs/dependency_inventory.json` (`70eeaecfee49a3c5c68905e6f651d70a0daa498803bc8620e4891a2ea3f92efd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/inputs/direct_review_packet.md` (`8af58b3ba75671297798e7f3e3537e3bf27c37133cdf1fa41fdd080ef614e21f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.5.3/faithfulness/inputs/source_locator.json` (`d1287714f86cfdd1df593cf2b4a1553e1d971105e71adc82f9b21a84dcab42e4`)
