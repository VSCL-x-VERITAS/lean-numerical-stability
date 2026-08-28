# Faithfulness audit: HDP-01-DEF-EXPECTATION-VARIANCE

## Decision

- Classification: `undetermined`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `103ea6c65a4fce21bd82892765d0c1b34a66ce9d368621aa82ec73b7dfd5baab`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The primary evidence establishes exact agreement of the expectation and variance formulas on finite-moment cases and establishes that Lean explicitly carries two finiteness hypotheses. It does not establish whether those hypotheses narrow the source's intended domain, because the source omits its nonfinite-value convention, nor whether the source's random-variable binder matches Lean's almost-everywhere measurability. Both implication directions therefore retain consequential uncertainty. The only classification consistent with that pair is undetermined, which is not accepted.

## Implications

- **Lean implies source:** `unclear`. Lean matches both formulas on its finite-moment domain. It is not known whether this domain covers the source claim because the source does not specify nonfinite boundary cases, and it is not known whether Lean's almost-everywhere strong measurability matches the source's inherited random-variable requirement.
- **Source implies lean:** `unclear`. The source formulas yield the Lean conclusions under the finite-moment interpretation, but the selected passage does not establish the two finite-integrability premises or specify a measurability convention sufficient to identify every Lean binder with a source random variable.

## Findings

- **major / potential-reduced-applicability:** If the source includes nonfinite cases, Lean is weaker by reduced applicability; if finite-valued definedness is implicit, this mismatch may disappear.
- **major / random-variable-binder-ambiguity:** The domains cannot be proved equivalent or ordered from the selected evidence, preventing a definite implication pair.
- **note / formula-match:** There is no detected mismatch in centering, exponent, integration measure, expectation scope, or the two displayed conclusions on the common finite-moment domain.
- **note / nonvacuity:** The target has genuine instances and is not accepted or rejected merely through vacuity.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `unclear` | `fail` |
| `C03` | `pass` | `pass` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `fail` | `fail` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `46` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `46` dependencies (`0` hash-reused); failing or unclear: `D001, D004, D005, D018`.

## Remaining uncertainties

- Whether the source uses expectation and variance only when they are finite real numbers, or permits undefined or extended-valued cases.
- Whether the source's inherited term random variable requires pointwise measurability or identifies functions up to almost-everywhere equality in a way matching Lean's AEStronglyMeasurable condition.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/agent_outputs/adjudicator.json` (`325522366873365ad2e0d535fb24a787ada9b9b49853896482ebd89470497ab8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/agent_outputs/agent_runs.json` (`242868be42c4c2b8ee63065841aa1f28d96aea1a376dbee7b2e795bbc795d205`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/agent_outputs/blind_translation.json` (`706aa548fcb9e722d428d0c12c246e3899ec55a57c7ac63a76dd54a3f081fc93`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/agent_outputs/direct_judge.json` (`88ebae6f2942967f9d3243f85831432d2ea54b9f70564caa7c30bef2ef616e3f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/agent_outputs/roundtrip_judge.json` (`9209cba646cdf4854d6a9d559d25479e84eb5dbbad964273db493dee6c786fa0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/agent_outputs/source_contract.json` (`215f0f6c7f5ba1a644b8c4181ecdead7a600bcda8e1a7d4c67de2fb4b2032330`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/decision.json` (`c282b4f6ec34100545924c8c47ab1251cefaba1acf8645960ffeccbebf53763b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/inputs/blind_dependency_inventory.json` (`1db389c92b7fb96173847dd1d4c411706ea915e5c6ae5b01d19b27e697b722d1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/inputs/blind_dossier.md` (`012867011f8bfa738fc4217b76246ad75cf0d2dbce5a602a46dba0403c533897`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/inputs/blind_review_packet.md` (`012867011f8bfa738fc4217b76246ad75cf0d2dbce5a602a46dba0403c533897`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/inputs/declaration_dossier.md` (`3916738031aebe9cd0812c5444a6a21999c3e149217847501c9c4badd883a759`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/inputs/dependency_inventory.json` (`e3463d788c3dfbe6e97ebec0bbe11aa65fdb4401d3ec4bb2756d044815ecc87b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/inputs/direct_review_packet.md` (`e40deffc2f1af092a1c2be890ce394efc29c31828e1cf63680f2dc9fe5b035c5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-EXPECTATION-VARIANCE/faithfulness/inputs/source_locator.json` (`78297ef8f280aecfe2670967b0958e37d255900de7f3c2f43a5d4f03942e5594`)
