# Faithfulness audit: HDP-01-DEF-INDICATOR

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `22572d3537785ceba5594ad325f56ef287ebd574a7192f5697ff44459e807018`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The dependency bodies establish the exact pointwise real-valued indicator rule: membership yields 1 and nonmembership yields 0, so the Lean statement entails every source instance. The only consequential difference is scope. The source speaks about events in probability spaces, while Lean proves the rule for arbitrary sets in arbitrary measurable spaces. Because this is a satisfiable broader domain rather than an extra hypothesis or restricted domain, source-to-Lean implication fails and the correct accepted classification is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Instantiate the Lean statement on the underlying measurable space of any source probability space and on any source event E. The inspected definition gives exactly 1 on E and 0 off E, so every source instance follows.
- **Source implies lean:** `no`. The source defines the indicator only for events in a probability space, whereas Lean quantifies over every Set Ω without MeasurableSet E and without a probability measure. For example, a nontrivial set in a trivial measurable space need not be an event but is still covered by Lean; the source supplies no such instance.

## Findings

- **major / event-domain-generalization:** The target is strictly broader than the selected source definition. It remains faithful under the protocol as a genuine nonvacuous strengthening, but it is not equivalent.
- **note / real-codomain-resolution:** The real-valued choice is resolved by the cited inherited context and does not require adjudication.
- **major / domain-generalization:** The translation has strictly broader applicability. It implies the source claim, but the source does not imply the translated universal claim.
- **note / codomain-resolution:** The surrounding authoritative context resolves the footnote's codomain ambiguity in favor of the translation; this creates no implication failure.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `fail` | `fail` |
| `C03` | `pass` | `pass` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `fail` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `15` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `15` dependencies (`0` hash-reused); failing or unclear: `D001`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/agent_outputs/agent_runs.json` (`61e4f636be3a423304c105a7a5f2b224c48084bd26405da396e6e2ed5f75c5d2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/agent_outputs/batch_source_contract.json` (`f78f795913a1a975aeaa39e69fb325bee52653cb2512d692e64c27a538fa18d9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/agent_outputs/blind_translation.json` (`8b2491fbf4ef877c5dcdd150c0821fb269fbd31dbc160eb627a58c781d8f52a9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/agent_outputs/direct_judge.json` (`8075abfc94a784ae5b190bb32852fd2e646e15d209a9b6a7b49177b5d84848b0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/agent_outputs/roundtrip_judge.json` (`c42a3056eeb4a9e3c0b5c37bbfc30f78b3e887e2608dff8d0b40cf4290b6d817`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/agent_outputs/source_contract.json` (`3fe36388d27a5e60947d4484e11dab8c7bc604bdbf9cbdcb76814fe98c598b68`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/decision.json` (`68b1231293bbfa00d133aee7965c6d5bc1aaa017b74d40045d5843c2a2419db7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/inputs/batch_source_locator.json` (`6b68799ac5aa540dcd4c8133bb1a9b308fda76686fb0525b1e00e2d6dc0c6640`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/inputs/blind_dependency_inventory.json` (`31d0a52119d0a08e105727f8281600512a5d5e1e6911249a89ccb70d114b7618`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/inputs/blind_dossier.md` (`b69721dcd729277865a54c4a5ad0ba2c0f3db61d6403789a595e33e2ca249410`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/inputs/blind_review_packet.md` (`b69721dcd729277865a54c4a5ad0ba2c0f3db61d6403789a595e33e2ca249410`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/inputs/declaration_dossier.md` (`f8642446930c73395fc716fc43536336a881968e1996b4c21463cda8e7649b03`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/inputs/dependency_inventory.json` (`7b358ccb9203d477a9ee25dea7abfae483becf30f2dc4d095c731d2437c38913`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/inputs/direct_review_packet.md` (`5b73c25b3d8a6cf0e71044b38b3985d2adebc36d9816d5f704fd8d89c5a483a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-INDICATOR/faithfulness/inputs/source_locator.json` (`8c21584e771316fbd53439a6a762dbed8ac8ca97ca21d28bf3d6f19aaf485862`)
