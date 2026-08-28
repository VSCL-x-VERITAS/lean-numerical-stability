# Faithfulness audit: HDP-01-EXERCISE-1.2.2-CORRECTED

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `c825829a6974079db4ea6acd7b281287322b67f5392b7417d3acd27fac88f1ba`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target faithfully formalizes the configured corrected finite-real version of Exercise 1.2.2. Integrable X μ supplies finite absolute expectation, while Measurable X expresses the source's random-variable condition and ensures the strict tail events are measurable. The two restricted Real-volume integrals reproduce the source's half-line dt-integrals, μ.real reproduces event probability under a probability measure, and the sign and strict event orientations are exact. The only discrepancy is with the source's literally printed universal wording; that wording is mathematically ill-defined for two-sided heavy-tailed variables and is precisely the discrepancy the corrected role is designed to repair.

## Implications

- **Lean implies source:** `yes`. For every measurable integrable real-valued X on a probability space, the Lean proposition asserts the corrected finite-real identity with the same expectation, strict tail events, sign, and half-line domains. The open endpoints are Lebesgue-null, and μ.real equals ordinary event probability because μ is finite.
- **Source implies lean:** `yes`. The configured corrected finite-real source claim quantifies over measurable integrable real random variables on arbitrary probability spaces and gives exactly this equality. Its probability, expectation, and dt-integrals map to μ.real, MeasureTheory.integral, and restricted Real volume in the target.

## Findings

- **note / configured-correction-versus-literal-print:** Against the literal overbroad wording this is reduced applicability, but under the task's configured corrected finite-real role these hypotheses are the intended repair and yield an equivalent formal statement.
- **major / printed-source-defect-versus-configured-correction:** The translation is faithful to the explicitly configured finite-real correction, but it must not be reported as equivalent to the literal overbroad printed wording. The added integrability condition repairs the undefined infinity-minus-infinity case.
- **note / extended-valued-generality:** The translation does not cover the maximal corrected extended-valued formulation, but that is outside this task's configured finite-real theorem and does not reduce faithfulness here.
- **note / measurability-hypothesis:** The explicit hypothesis matches the source object category. Although it is stronger than mere almost-everywhere strong measurability, it does not reduce applicability relative to source random variables.
- **note / endpoint-representation:** The only set-theoretic difference is the singleton threshold 0, which has Lebesgue measure zero, so the integral values and theorem content are unchanged.

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

- Blind translator covered `41` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `41` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/agent_outputs/agent_runs.json` (`8376d2321f3cf202e7ad7e7e09fc60352f1390840faa73a88415ace120738a82`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/agent_outputs/batch_source_contract.json` (`c109f6c7f244e51d19ffd96100af0e82534773a18e3ae2fb5da86a7fb8d950b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/agent_outputs/blind_translation.json` (`3345b7070378bbbacae1fea10b2c199a87bda8aec19be2516c603919dd7f65a6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/agent_outputs/direct_judge.json` (`3012b635fc9f90d9888921058d55cdd05954933a3f42b9c5973c69095517c585`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/agent_outputs/roundtrip_judge.json` (`888a3dd211c2b6d0f5c7642b286ae503141863e70c22789e93d76cbbca96b9e8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/agent_outputs/source_contract.json` (`d8256518f0caa2397bf383825cb1a13659c534207d2a894cf6de35dfc8149823`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/decision.json` (`fc9c01a09779e4502bae59a9d83b0c54e8c6a6042805565c8c65cb76c577d181`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/inputs/batch_source_locator.json` (`f90463199dff5f0bb5f11829057d602a8f52f8145f015d6fb148efd1556ec924`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/inputs/blind_dependency_inventory.json` (`7211d9bf737fadeb348a251a3a8c6245aa47681d73687d9fe3b30beca4033a8a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/inputs/blind_dossier.md` (`dab270bd09593f5bbe7ff996376076cb5a87a4ac592175d28b6bced77487d264`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/inputs/blind_review_packet.md` (`dab270bd09593f5bbe7ff996376076cb5a87a4ac592175d28b6bced77487d264`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/inputs/declaration_dossier.md` (`9ee127d9cd090fb159b43bb1d04febd1037db350eed3538968ae8bf187a994f2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/inputs/dependency_inventory.json` (`7211d9bf737fadeb348a251a3a8c6245aa47681d73687d9fe3b30beca4033a8a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/inputs/direct_review_packet.md` (`647a0b79cc62f869418d822c4d4a4089a5b20cfe03c517ad158329bd67fecedc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.2-CORRECTED/faithfulness/inputs/source_locator.json` (`b20a66d53a136c91ce3569c66fb634f24e54a458443de66d7ead0a1429c231ae`)
