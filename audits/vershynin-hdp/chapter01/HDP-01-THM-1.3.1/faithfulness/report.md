# Faithfulness audit: HDP-01-THM-1.3.1

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `b5aa46ddbb76bf7c8a4784335588af027e26d84764c98b994594e31f01ad8e8f`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target is exactly a forwarding declaration to Mathlib's real strong law. On the source probability-space domain, its hypotheses and conclusion reproduce the ordinary i.i.d. finite-mean strong law with no variance assumption. The pinned theorem explicitly implements Etemadi's stronger pairwise-independent version, giving a genuine nonvacuous extension beyond jointly independent sequences. Its apparently arbitrary measure domain is carefully handled: if X 0 is not almost everywhere zero, integrability and pairwise independence force μ to be a probability measure; otherwise identical distribution makes every X i almost everywhere zero and the conclusion is trivial, with the zero-measure case vacuous. Therefore Lean implies the source, the source does not imply the pairwise-independent Lean generalization, and the configured classification is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. For a source probability space and an i.i.d. real sequence with finite mean, full independence supplies pairwise IndepFun, identical distribution supplies hIdent, and finite mean supplies Integrable (X 0) μ. The Lean conclusion is the same first-n average converging μ-almost everywhere to the expectation, modulo harmless zero-based indexing.
- **Source implies lean:** `no`. The source's full-independence theorem does not entail the pairwise-independent extension. Pairwise-independent identically distributed sequences that are not jointly independent give genuine nonvacuous target instances on probability spaces. Although Lean quantifies over arbitrary measures, strong_law_ae_real proves that every non-a.e.-zero instance is probability-normalized and treats the remaining non-probability cases trivially, so strictness rests on pairwise independence.

## Findings

- **minor / independence-strength:** The target is a genuine nonvacuous strengthening, so it is accepted but is not statement-equivalent.
- **note / arbitrary-measure-semantics:** The missing explicit probability-measure hypothesis does not create unnormalized nontrivial cases. Non-probability instances are trivial, and zero-measure instances are vacuous.
- **note / indexing:** Zero-based indexing and the defined n = 0 quotient do not change the asymptotic claim.
- **note / checklist-id-interpretation:** Adjudication used the manifest's configured checklist requirements; the ID-description drift does not alter the final implication pair.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `unclear` | `fail` |
| `C03` | `unclear` | `pass` |
| `C04` | `unclear` | `fail` |
| `C05` | `unclear` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `unclear` | `pass` |
| `C09` | `unclear` | `unclear` |
| `C10` | `unclear` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `unclear` | `unclear` |

## Dependency coverage

- Blind translator covered `45` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `45` dependencies (`0` hash-reused); failing or unclear: `D010, D012, D014, D015, D016, D017, D019, D026, D027, D030, D031, D045`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/agent_outputs/adjudicator.json` (`5f3eead2aba56d37a2b92fcf5784c60321aedba09f8162dbfa09462d5f35c01a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/agent_outputs/agent_runs.json` (`d7e95de0d262ef168f683be4710365d7b904a55da636b99800ce16377688c12d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/agent_outputs/batch_source_contract.json` (`411b1a2eabf406e54959810552609dcd353cd391f1acc5fe8260489f4c4b7f49`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/agent_outputs/blind_translation.json` (`e1f50c620fd7f9cc0edff04ac7fcb5a4b2bf1b08bfa9f1bdbaa8cb2a88f1f681`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/agent_outputs/direct_judge.json` (`b5ca5f9165e4313cf30ea1f0ecc5221fbebac882061fe1e7ade1e9a517d3485f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/agent_outputs/roundtrip_judge.json` (`ce9c5cf91013e8b7a6eeb9e200cf37dcdbc53756dcaf9fbc01eb1c8352b6962c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/agent_outputs/source_contract.json` (`52f6f50bdf3c861857f53470c9c39784282a3715470472803658cfae5e4fbbcb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/decision.json` (`17db01a5623903a455e6925ab80d1a5923b5666930931210d2843c02bc70e76d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/inputs/batch_source_locator.json` (`8af4dd8a560766600bf26dfe42cd90ec6e6a587195df82808dc65bf0eb7eb2c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/inputs/blind_dependency_inventory.json` (`d8a29914970c8582b7345fa0edf755ddfec933b94931a9dc8b9b5b9588df72a8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/inputs/blind_dossier.md` (`b99d64e3b52b96ed1ec62339866cef1a2bb91398e7e1575acf6bc8049bf06944`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/inputs/blind_review_packet.md` (`b99d64e3b52b96ed1ec62339866cef1a2bb91398e7e1575acf6bc8049bf06944`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/inputs/declaration_dossier.md` (`8ad1febe46ea79fbf06e8815ecb9cc153b9899e27e6d6812b0e44976971d3813`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/inputs/dependency_inventory.json` (`d8a29914970c8582b7345fa0edf755ddfec933b94931a9dc8b9b5b9588df72a8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/inputs/direct_review_packet.md` (`37d4b8051bd1be757adc9d76b8bfe911380a2bf1c8e7b94a5ff9520d06162985`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-1.3.1/faithfulness/inputs/source_locator.json` (`8f5cc99e62335f2ebf192a437c621c9043ef81dad62573bd967115d75cd14710`)
