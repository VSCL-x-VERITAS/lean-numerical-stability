# Faithfulness audit: HDP-01-EXERCISE-1.3.3

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `2712576b91702d8674eafe0835089fcf608978ed417bed9a886ac8d683f0cb56`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

Accept as a source-faithful strengthening: the quantity, centering, finite-variance condition, positive sample-size indexing, and Big-O rate agree with Exercise 1.3.3, while pairwise independence makes the theorem strictly more general.

## Implications

- **Lean implies source:** `yes`. Joint independence implies pairwise independence, so the Lean theorem specializes to every i.i.d. sequence in the source.
- **Source implies lean:** `no`. The source theorem assumes joint independence and therefore does not by itself establish the Lean target's additional pairwise-independent cases.

## Findings

- **minor / faithful-stronger-independence-generalization:** The translated theorem covers more sequences than the source. This is a sound faithful-stronger generalization for the stated expected absolute-error rate, not a loss of the source case, but it should remain documented rather than described as literal equivalence of hypotheses.

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

- Blind translator covered `70` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `70` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/agent_outputs/agent_runs.json` (`e481e285a867cac031a93d2229ca49e171badb4e2b0939de59e1c924ca256bbf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/agent_outputs/blind_translation.json` (`43a0643b3485c858edc998637fe1d32e46ab177339304ee2973e305ad0ee88be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/agent_outputs/direct_judge.json` (`2a52a8d01d9954d62c84fd9f20f75d343d9475319b007792d152a8877da429b6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/agent_outputs/roundtrip_judge.json` (`66c5d3af85d5b9a956e7625e9cd5b5649c54250b61bfa8ceed2b9bda07e5693d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/agent_outputs/source_contract.json` (`3956f87b769025f5334e7d17209f0185c9dc4f55108e179eeb803d4b0c8efcdb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/decision.json` (`fbcb9e7b8f3ec7bdbb3f2563c71ae9b6d6bf0774c2458c0a957f1965cdd6b4d5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/inputs/blind_dependency_inventory.json` (`0a3f1ee0e9ec3e1d0a375448542bb50358ddc8d1e662ad858c577c56d8e045c5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/inputs/blind_dossier.md` (`d0b39959545ca1d3da9a7c20a34a93398a2afa72720e1c87359a6ef60fd99f27`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/inputs/blind_review_packet.md` (`d0b39959545ca1d3da9a7c20a34a93398a2afa72720e1c87359a6ef60fd99f27`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/inputs/declaration_dossier.md` (`89b307f8ce07140b86eb3df2544ab9f3b722cb8106704cdccf70dcf7fbb37c7a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/inputs/dependency_inventory.json` (`0a3f1ee0e9ec3e1d0a375448542bb50358ddc8d1e662ad858c577c56d8e045c5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/inputs/direct_review_packet.md` (`fc82cc40c1e30cf45760549ff89bbf87dbd1971cacc4ea654c5f1d0500cf36fb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.3.3/faithfulness/inputs/source_locator.json` (`a257b940fed0701fd5762339b524ccebd282228524091ab90c60f7fb4a0d38a1`)
