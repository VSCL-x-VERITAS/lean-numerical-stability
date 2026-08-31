# Faithfulness audit: HDP-02-PROP-2.4.1

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `52b1a9ee479e525072cda203e88f168459e9c305db350d21eaad012b96a98e85`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The two judgments agree on the deterministic mathematical core and on source-implies-Lean = no. The round-trip judge's unresolved direction arose from the blind artifact's intentionally limited exposure of the graph-law implementation and from conservative treatment of an unstated small-n convention. The direct artifact's checked dependency ledger establishes that SimpleGraph.binomialRandom is the finite Erdős-Rényi probability law with independent common-p off-diagonal edges, that Measure.real is ordinary probability here, and that degree is ordinary neighbor-set cardinality. The source contract itself identifies the nondegenerate graph regime as clearly intended and records that n = 1 is incompatible with its exact strict proved event, so n >= 2 is a faithful boundary reconciliation rather than an applicability loss. A logarithm-base convention is absorbed by the source's existential absolute constant. Consequently Lean implies the source with witness C = 4000, but the source's unspecified existence claim does not establish the concrete 4000 threshold. Because the concrete premise is satisfiable, this is genuine nonvacuous strength: faithful-stronger, accepted.

## Implications

- **Lean implies source:** `yes`. The Lean/translated statement supplies the source's existential absolute constant with the uniform witness 4000 and matches the Erdős-Rényi law, expected degree (n-1)p, one simultaneous strict 10-percent degree event, and probability threshold 0.9. Its explicit n >= 2 clause reconciles the source's clearly intended nondegenerate regime and is not used as the basis for the strength classification.
- **Source implies lean:** `no`. The source says only that some sufficiently large absolute constant C exists. It neither fixes C = 4000 nor bounds its threshold so as to prove the conclusion for every parameter satisfying 4000 ln(n) <= (n-1)p. Thus the source proposition alone does not entail the concrete Lean theorem.

## Findings

- **minor / quantitative-strengthening:** This is genuine nonvacuous additional quantitative content and is the sole basis for faithful-stronger.
- **note / boundary-domain-explicitness:** The clause is treated as contextual reconciliation, not as reduced applicability and not as theorem strength.
- **note / blind-evidence-resolution:** The round-trip evidentiary cautions do not represent a semantic mismatch in the target.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `unclear` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `unclear` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `unclear` |
| `C09` | `pass` | `unclear` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `not-applicable` |

## Dependency coverage

- Blind translator covered `58` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `58` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/agent_outputs/adjudicator.json` (`a37b70d7031e44e7118dbbb87866e81a3d794bcd6d7ed346de31f6c6244479f8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/agent_outputs/agent_runs.json` (`5673d0b7c1381bf825b46e0e79e837e2dbb57f880d87bb88e4393b01e6323adc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/agent_outputs/blind_translation.json` (`d13db86151cfeae5572df511d45e327ecce6c344d1e23a89631eddd0a79e251a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/agent_outputs/direct_judge.json` (`1713e2bd35a6c8bd9fb673637ff28b8bebfb090cc6b3444f80309a2f2c83f2bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/agent_outputs/roundtrip_judge.json` (`c27c688a371d42456d7e9ded541b49dcaa96dbdc1b6bb9d7309dc9c260a0888f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/agent_outputs/source_contract.json` (`e05414a9a32b58677dcd1c38bbb54368a08c0ce48bba79dbde00a6af2d676f72`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/decision.json` (`d6e3e94e9978f0550ec8259b7d2c8e5880edf38620bd35df7d1d743106412107`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/agent_outputs/adjudicator.json` (`a37b70d7031e44e7118dbbb87866e81a3d794bcd6d7ed346de31f6c6244479f8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/agent_outputs/agent_runs.json` (`5673d0b7c1381bf825b46e0e79e837e2dbb57f880d87bb88e4393b01e6323adc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/agent_outputs/blind_translation.json` (`d13db86151cfeae5572df511d45e327ecce6c344d1e23a89631eddd0a79e251a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/agent_outputs/direct_judge.json` (`1713e2bd35a6c8bd9fb673637ff28b8bebfb090cc6b3444f80309a2f2c83f2bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/agent_outputs/roundtrip_judge.json` (`c27c688a371d42456d7e9ded541b49dcaa96dbdc1b6bb9d7309dc9c260a0888f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/agent_outputs/source_contract.json` (`e05414a9a32b58677dcd1c38bbb54368a08c0ce48bba79dbde00a6af2d676f72`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/decision.json` (`2b0a37416cb2c7d98a23cf7177918024153744cd740ba3a7f20d2d417fe00386`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/inputs/blind_dependency_inventory.json` (`f0aaa42419987fb118ebbbc34a12510fb56116017344f05dcd25c2175d8dd495`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/inputs/blind_dossier.md` (`52c22e7d4fc67bd573ccf84c7daab33ce30bf20860304fff0a993e20376affd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/inputs/blind_review_packet.md` (`52c22e7d4fc67bd573ccf84c7daab33ce30bf20860304fff0a993e20376affd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/inputs/declaration_dossier.md` (`2a87341da10affe5ab8d841903e16401d9948562b36527a3409148cd8618557c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/inputs/dependency_inventory.json` (`7b75d512f2c1f51a6f37b9dcd0cd10b239610d10c76efe2751c9a83faeab798b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/inputs/direct_review_packet.md` (`a271560f4c8baf9086ca0a89d0135e8830a2fdb0f8cfd92c9a74834b755f1cfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/history/20260831T101741Z/inputs/source_locator.json` (`4faab080dce302797b6c75073fb285ce6f387af6dddd5a243aefe71094269ce7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/inputs/blind_dependency_inventory.json` (`f0aaa42419987fb118ebbbc34a12510fb56116017344f05dcd25c2175d8dd495`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/inputs/blind_dossier.md` (`52c22e7d4fc67bd573ccf84c7daab33ce30bf20860304fff0a993e20376affd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/inputs/blind_review_packet.md` (`52c22e7d4fc67bd573ccf84c7daab33ce30bf20860304fff0a993e20376affd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/inputs/declaration_dossier.md` (`4fde190e7ee30c042e18bd5f57a39a4ce6e5b322db1395a911991b0132bab2b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/inputs/dependency_inventory.json` (`7b75d512f2c1f51a6f37b9dcd0cd10b239610d10c76efe2751c9a83faeab798b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/inputs/direct_review_packet.md` (`a271560f4c8baf9086ca0a89d0135e8830a2fdb0f8cfd92c9a74834b755f1cfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.4.1/faithfulness/inputs/source_locator.json` (`4faab080dce302797b6c75073fb285ce6f387af6dddd5a243aefe71094269ce7`)
