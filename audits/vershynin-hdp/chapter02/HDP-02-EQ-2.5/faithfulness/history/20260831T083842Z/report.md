# Faithfulness audit: HDP-02-EQ-2.5

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `eeda3ee8b8398f23998aef030b01ca35e45f658b8171735a8d0fc0d152d61db8`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The formal proposition preserves the exact upper-tail event, positive exponential parameter, transformed threshold exp(lambda t), equality of the two event probabilities, and the Markov upper bound exp(-lambda t) times the expectation of exp(lambda S). The dependency uncertainties concern opaque implementations of standard measure-theoretic structures, but their supplied interfaces and target roles suffice to identify probability and expectation, and the probability and integrability hypotheses handle finiteness. The theorem specializes to every source instance but applies to a genuinely broader class of random variables and thresholds, so it is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Specialize the arbitrary measurable S to the source weighted Bernoulli sum on its probability space. The finite sum is measurable and has integrable exponential, and the two Lean conjuncts then reproduce the complete equality-and-inequality chain in Equation (2.5).
- **Source implies lean:** `no`. The selected source statement is confined to a finite weighted sum of independent symmetric Bernoulli variables in the inherited context and t ≥ 0. It does not establish the proposition for every measurable real S with integrable exponential or for arbitrary real t.

## Findings

- **note / scope-generalization:** This is genuine nonvacuous broader applicability: all source instances remain included, and the displayed equality and bound are unchanged.

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
| `C08` | `pass` | `fail` |
| `C09` | `pass` | `fail` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `42` dependencies (`0` hash-reused); unclear: `D008, D010, D011, D013, D022`.
- Direct judge covered `42` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/agent_outputs/adjudicator.json` (`2beb037e58be7805a5bfdab8039616466b4b555e4bd345b890ae1cab624830fb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/agent_outputs/agent_runs.json` (`cff212b46c7ff3e4b214dfe9f52f30f21cea02a457a932fb48775f2be5994859`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/agent_outputs/blind_translation.json` (`3592ffd4c8d1fd0ef946381f85cf664f9cc43654fdd66bcedc11a725c03a19b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/agent_outputs/direct_judge.json` (`7cc5790dea2063229f1aa39037b3cf8485a30c964fbe2cd4d81f908395627822`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/agent_outputs/roundtrip_judge.json` (`d2761239bf21320f435faa289deda0230f53b4f4ffdc301797e7a3dab9d3cf37`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/agent_outputs/source_contract.json` (`3f22d3dbe19159a5d05e7d5c702b179d92ae993f6e0e69a4a7c4a3112fa4ce07`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/decision.json` (`996c161989a379beaf8767e5e4f60251468ac50ecd59a77337f340d355062b7d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/agent_outputs/agent_runs.json` (`ebbd17684c25cfb9bab2348d01d3c3ea0bb73d190853ea5f50b40e854a00b783`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/agent_outputs/blind_translation.json` (`8c1f5df09426bc97d470996fc3f66d5b37d35490d376c62241d32de4ab19820a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/agent_outputs/direct_judge.json` (`358ebcd39a3bcfc9771eacec09108943e4822da5107a3561c5063e7c343aeb80`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/agent_outputs/source_contract.json` (`3f22d3dbe19159a5d05e7d5c702b179d92ae993f6e0e69a4a7c4a3112fa4ce07`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/inputs/blind_dependency_inventory.json` (`22f864991aa7b0b4e6a9e90f4928e2f392de80f62b679ff294140fe7c0fe11af`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/inputs/blind_dossier.md` (`b2f843748829df086e4d050dddd085fc587e195d72653ed646e3cbbc1864f444`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/inputs/blind_review_packet.md` (`b2f843748829df086e4d050dddd085fc587e195d72653ed646e3cbbc1864f444`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/inputs/declaration_dossier.md` (`6a60ff4f9ead90c7c280d68a685716b868d1ad67d7be93fa54956e5e124ff159`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/inputs/dependency_inventory.json` (`22f864991aa7b0b4e6a9e90f4928e2f392de80f62b679ff294140fe7c0fe11af`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/inputs/direct_review_packet.md` (`abe90e82a189a1b72c03ee7ceff88fe32b417d602dcf85f6e9d7abc8db312f19`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/history/20260830T065034Z/inputs/source_locator.json` (`a4368e751903c5dafcb7a91ee08afd96eacd35c368d61da56688f73fdf4325d5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/inputs/blind_dependency_inventory.json` (`b9253bc4042516ecf4b4b384e14d5288034c7d4a5231bcb72de492cd77480ac2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/inputs/blind_dossier.md` (`d98bc11558fc2f7c316a3319a90b9aef3eb58b3b65744c96c6ca632e8eb6d3fb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/inputs/blind_review_packet.md` (`d98bc11558fc2f7c316a3319a90b9aef3eb58b3b65744c96c6ca632e8eb6d3fb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/inputs/declaration_dossier.md` (`07340da2403004f76ae8c6a55db7f36b8ff4e2464ed75af35d8bdabdfe5c9a7f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/inputs/dependency_inventory.json` (`b9253bc4042516ecf4b4b384e14d5288034c7d4a5231bcb72de492cd77480ac2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/inputs/direct_review_packet.md` (`4bf6b882dcd10f1da5cb500fc4157ff032cbb66ff68c272643e0df1b6c3b5f69`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.5/faithfulness/inputs/source_locator.json` (`a4368e751903c5dafcb7a91ee08afd96eacd35c368d61da56688f73fdf4325d5`)
