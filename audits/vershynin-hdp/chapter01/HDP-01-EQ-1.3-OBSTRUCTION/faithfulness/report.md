# Faithfulness audit: HDP-01-EQ-1.3-OBSTRUCTION

## Decision

- Classification: `not-faithful-different`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `e327e86eb2448b685ed1c53cdae4bf2bb53730be5b2b205f0629024a9d83c8df`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

Primary-source scope controls the comparison. The PDF presents an Lp monotonicity result whose printed zero endpoint is undefined under its own preceding definitions. The Lean declaration faithfully proves one elementary arithmetic fact explaining that defect, but it omits the selected result's objects, quantifiers, operators, and conclusion. The direct judgment obtained equivalence only by replacing the source result with a target-assigned obstruction role; the primary source and elaborated Lean type do not support that rescoping. The appropriate outcome is therefore not-faithful-different and not accepted.

## Implications

- **Lean implies source:** `no`. Noninvertibility of real zero explains why the displayed 1/p formula cannot be instantiated at p=0, but it proves none of the source's Lp monotonicity cases and contains none of the source's random-variable, exponent, norm, or inequality content.
- **Source implies lean:** `no`. Equation (1.3) asserts an Lp inequality rather than reciprocal nonexistence. Its p=0 instance is undefined under the immediately preceding source definitions, so it cannot function as a well-formed antecedent establishing the Lean proposition; its well-defined positive-exponent content likewise has a different conclusion.

## Findings

- **critical / source-validity:** The printed endpoint is ill-defined and must be recorded as a source defect rather than silently converted into a different theorem.
- **major / role-scope:** Calling the target an obstruction certificate is accurate, but that role does not make it source-equivalent or acceptable as the formalization of Equation (1.3).
- **note / relevant-obstruction-evidence:** The theorem is useful evidence diagnosing the p=0 defect, provided it is not counted as the source equation itself.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `fail` |
| `C05` | `pass` | `fail` |
| `C06` | `pass` | `fail` |
| `C07` | `pass` | `fail` |
| `C08` | `pass` | `fail` |
| `C09` | `pass` | `fail` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `12` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `12` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/agent_outputs/adjudicator.json` (`f3bc7044bf943cc373adf25913b9df3a5e878b0d6be40c111583469ea74aec4d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/agent_outputs/agent_runs.json` (`85a7b598c1b751091d1c16774fe4ab7785517e05f6523f887d7ed2592187a6e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/agent_outputs/blind_translation.json` (`a58f6c80802ea5a9ca74286e6443f74e2d9a3f86887ec1929fcd26a729607907`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/agent_outputs/direct_judge.json` (`940bc26227c3da7f3b06a257089897231258c5df7185c6a3344de86f0e29703d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/agent_outputs/roundtrip_judge.json` (`2e3439d9a01afa1c0b8d369ce007e43af86ccaf4c3ba0755fb7055c91db43c6e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/agent_outputs/source_contract.json` (`806f640808caa3424debe4342f5fe07f96b541d1438945d0ae59860978b670c8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/decision.json` (`aeea98aa95cbe50a5aef34f34e5c34d3e80aee4c3e5617255909a0803ec51430`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/inputs/blind_dependency_inventory.json` (`410d075cee5c51e660ce0ed69a9785c5a609130678799b18420a258eb5b0d262`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/inputs/blind_dossier.md` (`0b20f2bcf4f6a33a6fac4fc63d7e8177c1073be9935257e8a227c96a5d170196`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/inputs/blind_review_packet.md` (`0b20f2bcf4f6a33a6fac4fc63d7e8177c1073be9935257e8a227c96a5d170196`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/inputs/declaration_dossier.md` (`f0a79babd3a374d3ec02a8f649c577e5f687a490ffad4e4a0ebb97bff896d19a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/inputs/dependency_inventory.json` (`410d075cee5c51e660ce0ed69a9785c5a609130678799b18420a258eb5b0d262`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/inputs/direct_review_packet.md` (`56a835b5ea3986be558997055639e5f9567bb9c5b66611f76fe2eec00c73b6f3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.3-OBSTRUCTION/faithfulness/inputs/source_locator.json` (`c81489acc8b6d0b3c57ee58c183b1c09e51c98903cd8c2e154b5d08686d8b61d`)
