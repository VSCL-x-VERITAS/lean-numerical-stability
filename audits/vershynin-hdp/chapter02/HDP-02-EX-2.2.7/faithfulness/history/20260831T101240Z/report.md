# Faithfulness audit: HDP-02-EX-2.2.7

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `45582aabbed0b6b6cdfdee3fd5d8b89a73053136b9b329b6d4e16b0c52265861`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The judges agree on all mathematical data and differ only in whether the exercise's permissive proof instruction should be treated as weakening the referenced source theorem. Primary-source syntax resolves that issue: the imperative is to prove Theorem 2.2.6, and the immediately preceding theorem is the exact coefficient-2 proposition formalized in Lean. The optional constant clause broadens acceptable solutions without rewriting that theorem. The Lean target is therefore faithful-equivalent, accepted, nonvacuous, and free of remaining uncertainty.

## Implications

- **Lean implies source:** `yes`. The Lean target states the coefficient-2 upper-tail inequality of Theorem 2.2.6, with the same mutual independence, per-variable almost-sure interval bounds, centered sum, positive threshold, and squared-width denominator. It therefore directly supplies exactly the theorem that Exercise 2.2.7 asks to prove; it also satisfies the exercise's optional weaker-constant allowance by taking the absolute constant to be 2.
- **Source implies lean:** `yes`. The source result explicitly referenced by the exercise is Theorem 2.2.6 itself, whose displayed coefficient is 2. Reindexing its finite numbered family by any nonempty finite type yields the Lean statement. The Lean-only empty-index and totalized zero-width cases are harmless true extensions: for t > 0 the centered upper-tail event is null, while the totalized right-hand side is 1. The permissive phrase about accepting another absolute constant is an instruction about an allowable exercise solution, not a mathematical premise from which the exact theorem has been removed.

## Findings

- **note / exercise-proof allowance:** The allowance explains why a weaker coefficient could still count as a satisfactory exercise proof, but an exact coefficient-2 formalization remains equivalent to the referenced source theorem rather than being classified as a different stronger source claim.
- **note / boundary conventions:** These extensions do not change the substantive result or either entailment direction because t > 0 makes the centered upper-tail event null in both cases.

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

- Blind translator covered `61` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `61` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/agent_outputs/adjudicator.json` (`d5d32c676b7752d61a555a1a12b02bf461984187e3e0c994d7c77b1a1aaec68b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/agent_outputs/agent_runs.json` (`d69edf74dff6ed85b31422ef087d318c0c7def4f3223189220f62d57dfa5d027`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/agent_outputs/blind_translation.json` (`facc0cb4e5b2b545c0811d64760052f8e74eebbb2f5502f1f9c27eb20dd290a6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/agent_outputs/direct_judge.json` (`56ec6ac71f415d7358ef31c3584b2c3223b501e46fd8ff641b06dcb09209f162`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/agent_outputs/roundtrip_judge.json` (`1f006d5e0ef6ecd40d7f535a8e151bcf2a3620a535dc3d07c57ebf63756c4432`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/agent_outputs/source_contract.json` (`3609fba9de8096b2eff1dacbf2685f28211d34cfc754df53ca0096de2b355949`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/decision.json` (`7763e18a93a2fe6a4d98c737dec93368ad4820f411b1cb4f2ec9f0738500650d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/inputs/blind_dependency_inventory.json` (`a96c3e8fe74b37071ab64fd42ae13e47df54e4e7c06d12cce6f94d77ebb7b669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/inputs/blind_dossier.md` (`7f9489ddf506b444d91aaa39c2028c02d13e26b888c95b779c8f7b4c6ebb1860`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/inputs/blind_review_packet.md` (`7f9489ddf506b444d91aaa39c2028c02d13e26b888c95b779c8f7b4c6ebb1860`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/inputs/declaration_dossier.md` (`e584c93647930b752894db9518c0ff6c5b11a2592fbdae3f6702432773251f46`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/inputs/dependency_inventory.json` (`a96c3e8fe74b37071ab64fd42ae13e47df54e4e7c06d12cce6f94d77ebb7b669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/inputs/direct_review_packet.md` (`d65c9c3d56004d7a696060ff6190be4e171b303b3c967744c5bc704bd1efbef9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.7/faithfulness/inputs/source_locator.json` (`8db5dd2b934d7804c9d4bbb222804bae50f4e85f445b0cb1ba34a1c363d01574`)
