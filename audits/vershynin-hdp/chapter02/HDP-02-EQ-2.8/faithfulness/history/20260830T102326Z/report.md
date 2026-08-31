# Faithfulness audit: HDP-02-EQ-2.8

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `9c46ddb55a3e379592d7c2f7543124f0460a54c863baae70ab5e6e8db0253ce3`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Display (2.8) is read with its enclosing Exercise 2.3.3. The local wording is silent about whether Pois(lambda) admits zero, but the exercise's explicit reference to Theorem 1.3.4 supplies the inherited convention. In the first edition, lambda is a finite limit of sums of nonnegative Bernoulli parameters, zero is not excluded, and the preceding Poisson mass formula gives the degenerate law at zero. Lean's NNReal rate and poissonMeasure therefore have exactly the source domain. At rate zero, t > lambda forces t > 0 and both sides of the bound are zero. All other event, order, constant, exponent, and law semantics already agree, so both implications hold and the formalization is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. For every source-admissible nonnegative lambda and real t > lambda, the Lean proposition states the identical inclusive Poisson-tail event and exact display (2.8) bound. Replacing an arbitrary random variable having the law by its canonical Poisson measure preserves this law-invariant probability.
- **Source implies lean:** `yes`. Exercise 2.3.3's explicit Theorem 1.3.4 hint imports the first-edition Poisson convention whose parameter is a finite limit of nonnegative Bernoulli means and may equal zero. Thus display (2.8) covers every rate : NNReal, including the degenerate zero law, and yields the canonical-measure formulation with the same real threshold and bound.

## Findings

- **note / poisson-zero-rate-convention-resolved:** The zero-rate endpoint introduces neither reduced applicability nor extra strength, so the displayed statement is equivalent rather than merely stronger.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `unclear` | `unclear` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `30` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `30` dependencies (`0` hash-reused); failing or unclear: `D008`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/agent_outputs/adjudicator.json` (`f3900800ad9e85fb8c9128a9580d9ec37d4961da8b712f3f60307e2bd80ac4b2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/agent_outputs/agent_runs.json` (`28c3dcbd15ce398a70bc5a1c802d7ef4eb3fa2bb0ae6462637f8f2c00a0bc960`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/agent_outputs/blind_translation.json` (`cde7f83d7be959fc0c20a0ce50db460a8e9d179cc7e91dfccba020f184abd703`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/agent_outputs/direct_judge.json` (`729f4c513a8c0e8f53ebcedb3bd306ab28e61791db5723296143611c52b1195e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/agent_outputs/roundtrip_judge.json` (`4a252a46455ea36016a4061d526760dc4d0e77aac38faffc2bcd88cec7081086`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/agent_outputs/source_contract.json` (`0f1aa62087660831e6c8c7e1c5848e6af6e8d55441d4f12ecdee05af606b51c5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/decision.json` (`cc3b4e31d28dbbd2a1820f601492d08008ffb71593ce8cf60bdbc8dfeb7d0f2f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/history/20260830T094218Z/agent_outputs/source_contract.json` (`0f1aa62087660831e6c8c7e1c5848e6af6e8d55441d4f12ecdee05af606b51c5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/history/20260830T094218Z/inputs/blind_dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/history/20260830T094218Z/inputs/blind_dossier.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/history/20260830T094218Z/inputs/blind_review_packet.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/history/20260830T094218Z/inputs/declaration_dossier.md` (`c43373fa604fc901c633729f897079f39686d48003637d9f985adfc8903e343a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/history/20260830T094218Z/inputs/dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/history/20260830T094218Z/inputs/direct_review_packet.md` (`e0a64a5f182177d9bb38d365a11764d69fa69ed495a212d3ce7389b9b2ce8cdc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/history/20260830T094218Z/inputs/source_locator.json` (`5c313e304de94ba69513a3ab4e585f17190e4f4e8558badc2732b420fcdfebcb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/inputs/blind_dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/inputs/blind_dossier.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/inputs/blind_review_packet.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/inputs/declaration_dossier.md` (`1325d2c7e5de3a1c41f0426c611db73b72c77b7eab51386e8b60c165c005f369`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/inputs/dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/inputs/direct_review_packet.md` (`e0a64a5f182177d9bb38d365a11764d69fa69ed495a212d3ce7389b9b2ce8cdc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.8/faithfulness/inputs/source_locator.json` (`5c313e304de94ba69513a3ab4e585f17190e4f4e8558badc2732b420fcdfebcb`)
