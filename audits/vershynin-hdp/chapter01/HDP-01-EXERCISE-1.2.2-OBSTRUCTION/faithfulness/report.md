# Faithfulness audit: HDP-01-EXERCISE-1.2.2-OBSTRUCTION

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `c825829a6974079db4ea6acd7b281287322b67f5392b7417d3acd27fac88f1ba`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target exactly formalizes the canonical obstruction selected for this audit: both separately displayed tail integrals diverge for the standard Cauchy law. That fact is sufficient, under the source's own Lebesgue-expectation convention, to expose the undefined infinity-minus-infinity case in its unrestricted wording. Conversely, the configured Cauchy obstruction entails precisely these two distributional equalities. The result is therefore faithful-equivalent and accepted under the obstruction role, while remaining explicitly distinct from the formula printed in Exercise 1.2.2.

## Implications

- **Lean implies source:** `yes`. Under the configured obstruction role, the two Lean equalities state that the standard Cauchy upper- and lower-tail integrals are both infinite. Since the source defines expectation as a Lebesgue integral and displays the terms separately, this yields infinite positive and negative parts, an undefined Lebesgue expectation, and an undefined infinity-minus-infinity right-hand side. Thus the target fully diagnoses why the unrestricted printed claim is not meaningful. This does not assert that the target is the printed formula.
- **Source implies lean:** `yes`. The configured source obstruction selects the standard Cauchy law as a witness and requires both separately displayed one-sided tail integrals to diverge. In distributional form these are exactly the two equalities asserted by the Lean target. The literal printed formula alone would not imply this Cauchy theorem, but that is not the configured comparison role.

## Findings

- **major / source-definedness-obstruction:** The printed right-hand side is infinity minus infinity for an included random variable, while its Lebesgue expectation is undefined; the unrestricted claim therefore requires a qualification.
- **note / configured-obstruction-role:** The target is faithful as the configured discrepancy witness and should not be described as a direct transcription of the printed universal formula.
- **note / witness provenance:** This is faithful only in the configured discrepancy-obstruction role: the Cauchy statement is a diagnostic witness to the printed universal claim, not a claim that the witness itself appears in the source.

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

- Blind translator covered `29` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `29` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/agent_outputs/agent_runs.json` (`e51ab16680727ebd6a96b326371e218a84e52cfa29d227807a3d97a20f3eaa1a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/agent_outputs/batch_source_contract.json` (`c109f6c7f244e51d19ffd96100af0e82534773a18e3ae2fb5da86a7fb8d950b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/agent_outputs/blind_translation.json` (`68ae9f8b92d12cd0a8d0c116de201c5dae4453ebab2bd5cde28399e9f2f64f8b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/agent_outputs/direct_judge.json` (`84dd89341b00356eb6c3281faf66ced1fd5948985b9275de4b438a6bcde10ab5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/agent_outputs/roundtrip_judge.json` (`d4ec1f3a43211b7bde564457f80a9d3acc53e7666f1c3e0fef4a90dff4fa9004`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/agent_outputs/source_contract.json` (`0dedd8c8fdf46b0d85248120405ca3c9827f5bb746a230e0f5969d315881e272`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/decision.json` (`428cfbcf9f719f410e5cc024c92b99d0492f04513a41bac64b89266f38c3a408`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/inputs/batch_source_locator.json` (`f90463199dff5f0bb5f11829057d602a8f52f8145f015d6fb148efd1556ec924`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/inputs/blind_dependency_inventory.json` (`c5ee9e780e07745b7e6ee28307edd9fcf312a3a3f3e5ce140880fa733b84a7a5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/inputs/blind_dossier.md` (`4b26bc360d675682a66f3150ec93e7c10cf60a6cf4109c4d1a5cf01ba3356ace`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/inputs/blind_review_packet.md` (`4b26bc360d675682a66f3150ec93e7c10cf60a6cf4109c4d1a5cf01ba3356ace`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/inputs/declaration_dossier.md` (`3671e912bc740b6aaf214b18d128d700a07e1924ace14bb1c41c865f04481cea`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/inputs/dependency_inventory.json` (`c5ee9e780e07745b7e6ee28307edd9fcf312a3a3f3e5ce140880fa733b84a7a5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/inputs/direct_review_packet.md` (`5db981e9f60aa3018a1308785a1a5e661573384feac79da8b95753e53f6d566e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-OBSTRUCTION/faithfulness/inputs/source_locator.json` (`8babc0ffaf8640c27fb3510532461c9741eb089e1e2378a2eb4cef53decb9ace`)
