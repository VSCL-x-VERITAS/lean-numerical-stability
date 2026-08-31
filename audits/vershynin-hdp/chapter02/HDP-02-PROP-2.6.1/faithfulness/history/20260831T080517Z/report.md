# Faithfulness audit: HDP-02-PROP-2.6.1

## Decision

- Classification: `not-faithful-different`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `250fb0d79d95c6f86b958282e0a7de07f2501e6c8435e9e590e1935864fc22f4`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Both judges correctly identify the decisive semantic mismatches: exact input psi_2 gauges are replaced by external MGF witnesses, and one source-level absolute constant is weakened to an existential after all family data. The disagreement concerns only whether the source implies the target. The round-trip judgment derives that direction by using the MGF factorization and the MGF-to-psi_2 characterization cited in the source proof. The factorization supports the target's extra MGF conjunct under its stronger hypotheses, but Proposition 2.6.1 itself does not state that prescribed MGF conclusion, and the gauge conversion is supplied only by separate referenced results. Under the required proposition-statement-level comparison, with no unstated conversion or minimization facts, source-implies-target is not established. Lean-implies-source also fails because arbitrary K_i and an instance-dependent C cannot recover the uniform intrinsic source estimate. The positive-energy restriction merely excludes the empty family. Therefore neither implication holds and not-faithful-different is the consistent final classification.

## Implications

- **Lean implies source:** `no`. The target provides a gauge estimate in terms of arbitrary external MGF witnesses K_i and permits C to depend on the already-fixed family, measure, variables, witnesses, and hypotheses. It therefore does not yield either the source right-hand side sum_i ||X_i||_{psi_2}^2 or one absolute constant uniform over all finite families. Recovering the source domain from the target's equipped MGF domain would also require an unstated characterization and a way to choose or minimize witnesses.
- **Source implies lean:** `no`. The source proposition concludes only generic sub-gaussian closure and its exact-gauge squared estimate. It does not conclude the target's additional exact linear-MGF inequality at the prescribed scale sqrt(sum_i K_i^2), and its gauge estimate does not relate the exact component gauges to the supplied K_i. The product-MGF calculation on PDF page 18 explains the proof route, but the subsequent gauge step invokes separate characterization results; without importing those conversion facts, the proposition statement does not imply the target statement.

## Findings

- **critical / external witnesses versus exact gauges:** The target's quantitative conclusion is about chosen certificates, so it cannot recover the source's intrinsic squared-gauge estimate without additional conversion and minimization facts.
- **critical / absolute-constant quantifier scope:** The target asserts only family-local existence and does not imply the source's universal quantitative theorem.
- **major / additional and changed conclusion:** At proposition-statement level the source does not furnish this prescribed MGF conclusion, while the target does not furnish the source's exact-gauge relation; the statements are different rather than ordered by implication.
- **major / hypothesis specialization:** The target has reduced applicability and changes the represented input data; treating the hypotheses as interchangeable requires a separate sub-gaussian characterization.
- **note / positive-energy boundary:** This makes the target's empty-family case vacuous and records a boundary choice, but it does not drive the main classification.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `fail` | `fail` |
| `C03` | `fail` | `fail` |
| `C04` | `fail` | `fail` |
| `C05` | `fail` | `fail` |
| `C06` | `fail` | `pass` |
| `C07` | `fail` | `fail` |
| `C08` | `fail` | `fail` |
| `C09` | `fail` | `fail` |
| `C10` | `fail` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `112` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `112` dependencies (`0` hash-reused); failing or unclear: `D001, D002, D003, D004, D024, D031`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/agent_outputs/adjudicator.json` (`61dcb32782c7db501087e85bb5fedf93a7f78bd05466f72a597a0cef841e2815`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/agent_outputs/agent_runs.json` (`a37f64c6d88f20a8c97cb52254aaa66687328d8d804c48d13f07f5e0d95ec81c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/agent_outputs/blind_translation.json` (`a90b3ede9e14046b1eb2006228f1d0e43524365804725927e9f12467e2a29121`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/agent_outputs/direct_judge.json` (`e62492c380408c885e59550123d191e9c6e58cdf7d3f63f3b5c9eb96baf0c6ca`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/agent_outputs/roundtrip_judge.json` (`cf93113d3876ccd2daf9cbfbe58667019acbb97401908a8e27f88a2dad1e0e7b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/agent_outputs/source_contract.json` (`984975a69dbce7a410977cff0d49962733bbbf67d403c6edc831996c07179f3e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/decision.json` (`4b96ca505799d0279a3197a3aaafa980f2fd7f6e83f76c5c718bfb9e9ea77c9c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/inputs/blind_dependency_inventory.json` (`4500cddf559e7d7c8a7ccf1ffb7ba334f7c86ec697e3a7f396d9fd29fa631dc7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/inputs/blind_dossier.md` (`e78597b688c2aad759d85ce4a5a8414572c0afc53d628ec75c2e2db31e880f0d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/inputs/blind_review_packet.md` (`e78597b688c2aad759d85ce4a5a8414572c0afc53d628ec75c2e2db31e880f0d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/inputs/declaration_dossier.md` (`c07149fc0aa8af69c98a135946fbef324b25c259d6baf798d29372ff7e988563`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/inputs/dependency_inventory.json` (`9f7c82cbfe9463b15d829fa31c9e8ea980740dee289e16b07efd3b0c9372ca34`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/inputs/direct_review_packet.md` (`c137bf10874d078108833fe099f4b927a3e7030f07ed7fbed896cdd794efae68`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.6.1/faithfulness/inputs/source_locator.json` (`9b575fa5b395cd20480d47fcea5fbe35345eb537699ae1aa92a522bbd2c678e6`)
