# Faithfulness audit: HDP-02-EX-2.2.10B

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `9dfee113091b30cba4563be12604beb3ff3a37765ffb9d69df7c92146cea4f66`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The abstract per-coordinate premise is exactly the piece of Exercise 2.2.10(a) needed for part (b), specialized to t = 1/epsilon after epsilon is chosen. Every source family supplies that premise, and the Lean conclusion is the displayed source probability inequality verbatim up to finite-type indexing and exp(1) = e. Conversely, the analytic premise admits genuinely broader, satisfiable families, including atomic laws for which the bound is nontrivial. The pinned library definitions eliminate the round-trip uncertainty about integration and independence. Thus Lean implies the source, the source does not imply the generalized Lean theorem, the strengthening is nonvacuous, and the correct accepted classification is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Let n = card iota and S = sum_i X_i. On {S <= epsilon n}, positivity of epsilon gives exp(-S/epsilon) >= exp(-n). Exponential Markov therefore gives P{S <= epsilon n} <= exp(n) E exp(-S/epsilon). D030 plus measurability factors the expectation, and each hLaplace factor is at most epsilon, giving exp(n) epsilon^n = (exp(1) epsilon)^n. For source variables, nonnegativity and a density bounded by 1 imply E exp(-X_i/epsilon) <= integral_0^infinity exp(-x/epsilon) dx = epsilon, so all source instances meet the Lean premises and obtain exactly P{sum X_i <= epsilon N} <= (e epsilon)^N.
- **Source implies lean:** `no`. The printed exercise states the bound only under nonnegativity, continuity, and density bounded by 1; it does not establish the theorem for every measurable independent family satisfying only the epsilon-specific Laplace bounds. That broader class is real and nonvacuous: for epsilon = 1/4, a one-variable atomic law with probabilities 1/8 at 0 and 7/8 at 1 has E exp(-X/epsilon) = 1/8 + (7/8) exp(-4) < 1/4, positive small-ball probability 1/8, and a right-hand side e/4 below 1, yet it has no continuous density.

## Findings

- **note / genuine-analytic-generalization:** The target loses no source instances and adds nonvacuous instances, so the changed hypotheses are genuine strength rather than reduced applicability.
- **note / exact-probability-bound:** The target preserves the source's event boundary, threshold epsilon N, constant e, exponent N, and inequality direction exactly.
- **note / empty-index-extension:** This is a valid source-extraneous edge case and does not reduce applicability or create vacuity in the nonempty cases.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `fail` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `58` dependencies (`0` hash-reused); unclear: `D019, D030`.
- Direct judge covered `58` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/agent_outputs/adjudicator.json` (`e256c43db8dfebdf22094c0242fcfaedfd237962dd1f99ed5be72ec6dd773e1b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/agent_outputs/agent_runs.json` (`0db31e96f1b8938d5bb9a917de179c46b3f0b4809336ba6fbc90d23a77dc8eab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/agent_outputs/blind_translation.json` (`5afbc6084307ff70b02b6d4000d47369938739148756a36952b45a1fe360678a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/agent_outputs/direct_judge.json` (`fe8225e7d53e1a346304335b08121ebcfed33af9ae181f777f5a877f9c10046b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/agent_outputs/roundtrip_judge.json` (`3eaceb11f768aeb5d6ed5cf65bd3ebec209f7abb3c1ec3e2428bf4ec9324afc9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/agent_outputs/source_contract.json` (`65b3fd630b70f54e0397e38d4068fe839a453165af8ad3e7dedaf0acff8f205d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/decision.json` (`1213656af5c2d5fda4a5160b01169ff612a06ada0cecc20622467f20b7648f20`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/inputs/blind_dependency_inventory.json` (`120aea75377e57872d0bb125912316bac5fade0dcbbc801615c2ad35300646a9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/inputs/blind_dossier.md` (`718647af48faad186c5c5a1a8a24cf04555ff35f23b95e952b2ba885f0be26f0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/inputs/blind_review_packet.md` (`718647af48faad186c5c5a1a8a24cf04555ff35f23b95e952b2ba885f0be26f0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/inputs/declaration_dossier.md` (`c4e07ddf09c62042f1617f0dc7a6ab56a7228819c46a550465198b853fda4aef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/inputs/dependency_inventory.json` (`120aea75377e57872d0bb125912316bac5fade0dcbbc801615c2ad35300646a9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/inputs/direct_review_packet.md` (`c74dd202469e82fcc5db4593e0531e4c9c4ec2f1450797f5dd82ee46eeefc7d2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10B/faithfulness/inputs/source_locator.json` (`4d70fe7b2c9154f68b64e251066dda97a21fe1c76d36c7348f59207d2d14e5a6`)
