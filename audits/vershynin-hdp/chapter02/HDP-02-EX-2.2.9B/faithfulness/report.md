# Faithfulness audit: HDP-02-EX-2.2.9B

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `98eea6c7ef516d2f342be425912749b09cdf501357268e9c5f2784daddbd08de`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The formal theorem captures the source's prescribed median-of-means construction, parameter dependence, target mean, strict accuracy convention, and confidence guarantee. Its rectangular sample is simply the source iid sample regrouped into disjoint blocks, and its explicit constants and odd block count are valid concrete choices for the two hidden O factors. The direct judge's concern is mathematically correct only for a literal uniform raw-product reading at degenerate boundaries; that reading makes the source statement itself untenable without max-one terms and is not the asymptotic sample-complexity meaning indicated by the exercise and its hint. Lean therefore implies the intended source claim. The reverse implication fails because the source neither fixes Lean's constants nor proves the broader pairwise-within-block theorem. The final classification is accepted faithful-stronger, with no remaining adjudication uncertainty and with the source boundary limitation recorded.

## Implications

- **Lean implies source:** `yes`. For the source iid family, regroup observations into disjoint equal-size blocks. Mutual independence of all observations implies mutual independence of block vectors and within-block pairwise independence, while identical laws and finite variance give the remaining Lean hypotheses. Selecting a positive integer n near 4 sigma^2/epsilon^2 and the least odd block count near 8 log(1/delta) yields the source's product sample-complexity rate in its intended high-accuracy/high-confidence asymptotic sense. Lean's bound on the event |median-mean|>=epsilon is exactly success |median-mean|<epsilon with probability at least 1-delta. The positive-integer baselines at sigma=0 or delta near 1 expose an omission in a literal uniform reading of the source O notation; that impossible literal reading is not the intended theorem being formalized.
- **Source implies lean:** `no`. The source asserts only unspecified absolute constants for the total sample and repetition orders and assumes a fully independent flat sample. It does not entail the exact constants 4 and 8, the exact odd count 2*k+1, universal validity for every admissible n and k, or Lean's broader application to blocks whose coordinates are only pairwise independent.

## Findings

- **minor / source-asymptotic-boundary-limitation:** The O claim must be read in the intended nondegenerate asymptotic sample-complexity sense. Lean makes the positive-integer convention explicit and remains an accepted formalization, but the source limitation should remain documented.
- **note / explicit-constant-strengthening:** Lean supplies particular absolute constants not entailed by the printed result, supporting faithful-stronger rather than faithful-equivalent.
- **note / odd-integer-median-convention:** This is a faithful tie-free realization of the hinted estimator and changes the count only by an absolute additive rounding term.
- **note / hierarchical-independence-generalization:** Every regrouped iid sample qualifies, while some non-jointly-independent within-block families also qualify. This is genuine nonvacuous strength, not reduced applicability.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `fail` |
| `C05` | `unclear` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `unclear` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `unclear` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `100` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `100` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/agent_outputs/adjudicator.json` (`fd6b4be3b5e186e1b74efa918c3d3ca3310d5ea2dca6b3b7cd71df2615a54f15`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/agent_outputs/agent_runs.json` (`ff9585d2582c0239d8afa195b22899aa95caca5a87aa76481ef3795f92b5e0bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/agent_outputs/blind_translation.json` (`523f9a719cd6d360ccfdd4240c3ca2801542d1e7d18ff60ab7c3f0a0f76b8985`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/agent_outputs/direct_judge.json` (`93fe2562de1a0d243da9c29313b64a8f6b2e3769c6279610fdf6e33fa6279d21`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/agent_outputs/roundtrip_judge.json` (`7cdecc253ad8e43cc88e82bff99f3516e1b89449ded1d41dcbce4f7d3988c3d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/agent_outputs/source_contract.json` (`9f0ff71e05cca544d08f974287e50b60ac5dc20bdaee804ce9e8b7b68822ef60`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/decision.json` (`d97c6d2bf025f6e3be4ed94d7d1a989c4bdab28a2f8417611e67383f19df82c1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/agent_outputs/adjudicator.json` (`fd6b4be3b5e186e1b74efa918c3d3ca3310d5ea2dca6b3b7cd71df2615a54f15`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/agent_outputs/agent_runs.json` (`ff9585d2582c0239d8afa195b22899aa95caca5a87aa76481ef3795f92b5e0bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/agent_outputs/blind_translation.json` (`523f9a719cd6d360ccfdd4240c3ca2801542d1e7d18ff60ab7c3f0a0f76b8985`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/agent_outputs/direct_judge.json` (`93fe2562de1a0d243da9c29313b64a8f6b2e3769c6279610fdf6e33fa6279d21`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/agent_outputs/roundtrip_judge.json` (`7cdecc253ad8e43cc88e82bff99f3516e1b89449ded1d41dcbce4f7d3988c3d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/agent_outputs/source_contract.json` (`9f0ff71e05cca544d08f974287e50b60ac5dc20bdaee804ce9e8b7b68822ef60`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/decision.json` (`69cc27ba6c76c4829c401d781d381b90a6fec0a5d67bff288de59a6fd8ece847`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/inputs/blind_dependency_inventory.json` (`259684623721ee089c69c19ade5ef78773fe031757c83d20638d9fff0865c5de`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/inputs/blind_dossier.md` (`9a66d1e122aba12a127547cb7192530c02d92f1f918d332bbec95e0b20c17f10`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/inputs/blind_review_packet.md` (`9a66d1e122aba12a127547cb7192530c02d92f1f918d332bbec95e0b20c17f10`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/inputs/declaration_dossier.md` (`8ffa35028d634e3ff24a9b33b2061de4e9c0f07762b0a1e87aafdd9e5047240a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/inputs/dependency_inventory.json` (`6b150a34181ce6c5ef916704033eaf0d2d6e18d628d6257cf4e7bb01fcf8b068`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/inputs/direct_review_packet.md` (`6920db5b843af9d5ba6bbb9c72f7bb67113df05291670c7590e4d13562b92d61`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/history/20260831T101344Z/inputs/source_locator.json` (`97b4edd3f30f3e43dae3b32356451aff9aaffb5099eb63cfbfd377944e9c9e8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/inputs/blind_dependency_inventory.json` (`259684623721ee089c69c19ade5ef78773fe031757c83d20638d9fff0865c5de`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/inputs/blind_dossier.md` (`9a66d1e122aba12a127547cb7192530c02d92f1f918d332bbec95e0b20c17f10`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/inputs/blind_review_packet.md` (`9a66d1e122aba12a127547cb7192530c02d92f1f918d332bbec95e0b20c17f10`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/inputs/declaration_dossier.md` (`7aeaf969881509a73030387b5263ceaf53386abee273d8d3633db4185a1e6008`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/inputs/dependency_inventory.json` (`6b150a34181ce6c5ef916704033eaf0d2d6e18d628d6257cf4e7bb01fcf8b068`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/inputs/direct_review_packet.md` (`6920db5b843af9d5ba6bbb9c72f7bb67113df05291670c7590e4d13562b92d61`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9B/faithfulness/inputs/source_locator.json` (`97b4edd3f30f3e43dae3b32356451aff9aaffb5099eb63cfbfd377944e9c9e8e`)
