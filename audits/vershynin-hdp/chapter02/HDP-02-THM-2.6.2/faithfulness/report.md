# Faithfulness audit: HDP-02-THM-2.6.2

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `901dabfa3f1c2dd8d9b395bc6e17ebacaa27235fc27a9c63632ee02bbec5b238`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The contract preserves the absolute universal constant, independent centered sub-gaussian hypotheses, intrinsic psi-two scale, two-sided event, prefactor, exponent, and threshold range. The only apparent discrepancy is Lean's total division at zero total energy. Under the source's conventional mathematical reading and the supplied intrinsic-gauge definitions, zero energy forces the sum to vanish almost surely, making the sharper source boundary conclusion automatic; conversely, Lean's totalized bound is automatic there. The empty-Fintype extension is likewise automatic. Both implications therefore hold, the theorem is nonvacuous on positive-energy families, and the correct classification is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. For every nonempty family with positive total squared psi-two energy, the formulas coincide after finite reindexing. If the energy is zero, finiteness of each gauge follows from the sub-gaussian witness, and a zero intrinsic psi-two gauge forces the corresponding variable to vanish almost surely. Hence the sum vanishes almost surely: for t > 0 the conventional source boundary bound has probability zero, and at t = 0 the estimate is trivial. Lean's total division therefore does not obstruct this implication.
- **Source implies lean:** `yes`. For positive total energy, the source gives exactly D001's inequality. At zero energy Lean's total division makes the right-hand side 2, so the conclusion follows from the probability bound by 1. The extra empty-Fintype case is also automatic: the sum and denominator are zero, with probability 1 at t = 0 and probability 0 for t > 0. Thus the same universal source constant witnesses the Lean proposition.

## Findings

- **note / zero-denominator-totalization:** The displayed right-hand sides differ at zero energy for positive t, but the shared hypotheses force an almost-surely zero sum, so neither implication nor the classification changes.
- **note / empty-index-extension:** The added empty case is automatic for every positive c and every t >= 0, so it is not genuine additional strength or reduced applicability.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `unclear` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `88` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `88` dependencies (`0` hash-reused); failing or unclear: `D001, D045`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/agent_outputs/adjudicator.json` (`dae8e55765031999f7b2f896933f214dd4a02d1589db829ee2a18ab33a53e849`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/agent_outputs/agent_runs.json` (`adc7ae7d429874dc51c46b27158ccf03c951ed456f576af3fbdd8e72935f5f22`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/agent_outputs/batch_source_contract.json` (`71dc8e11d8659af56b9929b4ca727149e8f765041778f9ef6eed499fe22326ef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/agent_outputs/blind_translation.json` (`98392d3920c41da5b23c4787e15583eef8c57fc7e16d01beae35967aa12fbf55`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/agent_outputs/direct_judge.json` (`c29edb85ff9a3fec984888ce281bd39c44f98421f0899737f44de56d0ff12041`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/agent_outputs/roundtrip_judge.json` (`9201477b091944ea326e4ad9b25a148142b7bedd893b36cf92be3da9009a5f3e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/agent_outputs/source_contract.json` (`6bcdc87bd2b31f335482eb48bea681de96ea8774f8ef8d9435840c7fce9c4de8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/decision.json` (`702d71db58c33763eea9e4712b454fa0d619f67d3cf8a03475b0271f72142f60`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/agent_outputs/agent_runs.json` (`422cbfb8e4e2e46c2abcc250defb13cc72d51780d02591819b19fda3d7a4f527`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/agent_outputs/batch_source_contract.json` (`7e48a80ea9ba9191332554ef56bfa82c56e83d693e6a8059e4c8d154777719e2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/agent_outputs/source_contract.json` (`0778f8816d86f6b48e58da8f84b4eb5d049441b24c314a8bafd0fafa30352683`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/inputs/batch_source_locator.json` (`045bbe7245cc09969423aecd658f52230e744208d8e32f03da13222eaf557dfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/inputs/blind_dependency_inventory.json` (`43c3f7c7b6e3c1575c2c214072b98e6f24363141bf55f94dadf20f8c0485be0d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/inputs/blind_dossier.md` (`870ca2906a1684f05734ff417e71caba0172ee4e751bd1a8e29543a01f934197`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/inputs/blind_review_packet.md` (`870ca2906a1684f05734ff417e71caba0172ee4e751bd1a8e29543a01f934197`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/inputs/declaration_dossier.md` (`df7d3374410b027ce157d699a84d0ad2aca9a794dcefd795bb0b7cdfa98e526f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/inputs/dependency_inventory.json` (`d436854476278068b19b30a83b25e22d5a1d4487e0b0ef9b919480cd01f72295`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/inputs/direct_review_packet.md` (`3f15e49e330a50d3b80e7fdb0528f97632359358b784a1b9f9d6fc294876cd46`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T180558Z/inputs/source_locator.json` (`08d8e56d140f84b124cc91a46982353484e5392541bfb4478622546c431d09ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T181929Z/agent_outputs/batch_source_contract.json` (`71dc8e11d8659af56b9929b4ca727149e8f765041778f9ef6eed499fe22326ef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T181929Z/inputs/blind_dependency_inventory.json` (`edd280c4914bfe19292bede8012b4bf4a38ef56482f1bb43f527838e517cb565`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T181929Z/inputs/blind_dossier.md` (`10c70a1f03f3badc1cd3b8c5033fd4616e5662926acbc1b947c61ab432826706`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T181929Z/inputs/blind_review_packet.md` (`10c70a1f03f3badc1cd3b8c5033fd4616e5662926acbc1b947c61ab432826706`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T181929Z/inputs/declaration_dossier.md` (`8e91a78915a9bb6b385ddc0b94c9641b5abd8329385b6e75bfbd7b2141f8ce90`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T181929Z/inputs/dependency_inventory.json` (`0a55716881b18bb954333d88384e4dd68f2076eba461edeabd1ab97326b7caf3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T181929Z/inputs/direct_review_packet.md` (`c740c631425eeb97e693c64c8910aaa6f2af8779a703f0830918e71b8dbc38f0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T181929Z/inputs/source_locator.json` (`08d8e56d140f84b124cc91a46982353484e5392541bfb4478622546c431d09ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/agent_outputs/agent_runs.json` (`4f13437365d73771e1b6f328932ff927fdf057a4f51505777204b1e4eecfef65`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/agent_outputs/batch_source_contract.json` (`71dc8e11d8659af56b9929b4ca727149e8f765041778f9ef6eed499fe22326ef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/agent_outputs/blind_translation.json` (`98392d3920c41da5b23c4787e15583eef8c57fc7e16d01beae35967aa12fbf55`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/agent_outputs/direct_judge.json` (`c29edb85ff9a3fec984888ce281bd39c44f98421f0899737f44de56d0ff12041`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/agent_outputs/roundtrip_judge.json` (`9201477b091944ea326e4ad9b25a148142b7bedd893b36cf92be3da9009a5f3e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/agent_outputs/source_contract.json` (`6bcdc87bd2b31f335482eb48bea681de96ea8774f8ef8d9435840c7fce9c4de8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/inputs/batch_source_locator.json` (`045bbe7245cc09969423aecd658f52230e744208d8e32f03da13222eaf557dfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/inputs/blind_dependency_inventory.json` (`edd280c4914bfe19292bede8012b4bf4a38ef56482f1bb43f527838e517cb565`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/inputs/blind_dossier.md` (`10c70a1f03f3badc1cd3b8c5033fd4616e5662926acbc1b947c61ab432826706`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/inputs/blind_review_packet.md` (`10c70a1f03f3badc1cd3b8c5033fd4616e5662926acbc1b947c61ab432826706`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/inputs/declaration_dossier.md` (`8e91a78915a9bb6b385ddc0b94c9641b5abd8329385b6e75bfbd7b2141f8ce90`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/inputs/dependency_inventory.json` (`0a55716881b18bb954333d88384e4dd68f2076eba461edeabd1ab97326b7caf3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/inputs/direct_review_packet.md` (`c740c631425eeb97e693c64c8910aaa6f2af8779a703f0830918e71b8dbc38f0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/history/20260831T184536Z/inputs/source_locator.json` (`08d8e56d140f84b124cc91a46982353484e5392541bfb4478622546c431d09ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/inputs/blind_dependency_inventory.json` (`edd280c4914bfe19292bede8012b4bf4a38ef56482f1bb43f527838e517cb565`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/inputs/blind_dossier.md` (`10c70a1f03f3badc1cd3b8c5033fd4616e5662926acbc1b947c61ab432826706`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/inputs/blind_review_packet.md` (`10c70a1f03f3badc1cd3b8c5033fd4616e5662926acbc1b947c61ab432826706`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/inputs/declaration_dossier.md` (`cc2ca902b7cb3c9ed83ba4dc420dd61cb2fc12724c9e9fd818e3dcb1822eb36d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/inputs/dependency_inventory.json` (`0a55716881b18bb954333d88384e4dd68f2076eba461edeabd1ab97326b7caf3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/inputs/direct_review_packet.md` (`c740c631425eeb97e693c64c8910aaa6f2af8779a703f0830918e71b8dbc38f0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.6.2/faithfulness/inputs/source_locator.json` (`08d8e56d140f84b124cc91a46982353484e5392541bfb4478622546c431d09ae`)
