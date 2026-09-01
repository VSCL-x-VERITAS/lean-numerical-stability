# Faithfulness audit: HDP-01-THM-1.3.4

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `b3ac2141e5a273a07ba571e7a01b53d8cc71dad25146b83edfda2dfb1404cd38`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The sole unresolved semantic issue is resolved by the primary source itself. Nonnegativity of λ follows from convergence of nonnegative Bernoulli-parameter sums, and λ=0 is not excluded by the theorem or the preceding Poisson definition. Natural-number exponentiation makes the displayed mass formula valid at zero, producing the degenerate law at zero. With the previously agreed product-law, weak-convergence, canonical-law, and indexing equivalences, both implications hold and the Lean proposition is faithful-equivalent to the source theorem.

## Implications

- **Lean implies source:** `yes`. The Lean proposition preserves the independent product-Bernoulli row law, rare-event hypotheses, unscaled success-count distribution, and weak convergence to Poisson(rate). Its Fin(N+1) rows correspond to the source's rows after the harmless N↔N+1 shift. Since source-admissible limits are nonnegative, the Lean NNReal rate domain covers every source case.
- **Source implies lean:** `yes`. The source assumptions force λ≥0 and do not exclude λ=0; its preceding probability-mass formula defines the degenerate Poisson(0) law. Hence the source covers every rate : ℝ≥0 used by Lean. Applying the source theorem to the canonical independent Bernoulli product construction and shifting the row index yields the complete Lean proposition.

## Findings

- **note / poisson-parameter-endpoint-resolved:** The endpoint introduces neither reduced applicability nor genuine extra strength; both formulations include the nonvacuous zero-rate case.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `unclear` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `unclear` | `pass` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `84` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `84` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/agent_outputs/adjudicator.json` (`d2741158efb781fbc75fd6e751fd899c99b27008549083e12468c372aa792e9f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/agent_outputs/agent_runs.json` (`54eaeeea9642a35407eba8b7b1a34901898b2b66c4749c9da0351df188b2ce64`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/agent_outputs/blind_translation.json` (`b3b7d62a7fd8d71970818719ef3c08927d90d1d2a3f1a60453f4302e229e1f8d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/agent_outputs/direct_judge.json` (`0ff0c7ca0075b7372656cb58ca5b0ab464f51735040be9cb4b43908baad3b89a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/agent_outputs/direct_judge_attempt1_truncated.json` (`5b3640b56a0a871f32068223d2cd0ea84ab1445680905d9cc06ace050ee6b187`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/agent_outputs/roundtrip_judge.json` (`f0b7bb8ea6b087ebca19b686890b206e9ab46e5786a18b9d83f584114814441f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/agent_outputs/source_contract.json` (`0f4354b97700aec87177e4d50be77eedbed41a8cb6f21c9f15654488e6b46a5d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/decision.json` (`565cd730cd137567752fdcf8b5a4794829ad5e8aa898295ba83a68e0d3680e8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/inputs/blind_dependency_inventory.json` (`4e6da9c7a4b05ea0368c4de9e67eff9234e21b8882ea0a8eb7283b68c662677d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/inputs/blind_dossier.md` (`f555e5a10e031b909d2b7b00eefe7a802a19d121d6a84c36de4f2d62d76370b0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/inputs/blind_review_packet.md` (`f555e5a10e031b909d2b7b00eefe7a802a19d121d6a84c36de4f2d62d76370b0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/inputs/declaration_dossier.md` (`079530911f8c9e866d1070b66b0761af7a7e91eb86ec3ddc1ef5cef985c21e13`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/inputs/dependency_inventory.json` (`0b4e23525b6d4d46fb018b7c786da05920b1b65766321d486ea669a801cf35eb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/inputs/direct_review_packet.md` (`d380f040256e9070382be2e63f9cd875cd1ecc0f752f7e43487655c0425c7af7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.4/faithfulness/inputs/source_locator.json` (`8f0273c90d59b7b65eba2c08d17dd1d11cb5728e7f34b07e4a3fa8be8fdb122e`)
