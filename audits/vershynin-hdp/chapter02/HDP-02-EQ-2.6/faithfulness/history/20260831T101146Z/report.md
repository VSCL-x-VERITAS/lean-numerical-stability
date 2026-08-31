# Faithfulness audit: HDP-02-EQ-2.6

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `b7b64d248f662cecf1c369f12e518bbf4e6b124657ee82243a6dd0f9e99bf81a`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The Lean target exactly formalizes the MGF factorization in Equation (2.6) on the source's independent symmetric Bernoulli instances. Its sum, product, exponential, expectation, coefficients, and independence premise all have the intended meanings. The formal statement is strictly more general because it applies to arbitrary finite independent real-valued families with finite individual exponential moments, arbitrary probability measures, and all real lambda. Hence Lean implies the selected source result, while that restricted source result does not by itself imply the full Lean proposition.

## Implications

- **Lean implies source:** `yes`. Instantiate the finite type by the source index range and X by the independent symmetric Bernoulli variables. Their boundedness supplies hExp for the source's positive lambda, and the Lean conclusion becomes Equation (2.6).
- **Source implies lean:** `no`. Equation (2.6) in its enclosing source context only treats the N-indexed symmetric Bernoulli family and positive lambda; it does not establish the Lean theorem for arbitrary finite index types, arbitrary independent real-valued families satisfying exponential integrability, arbitrary probability measures, or nonpositive lambda.

## Findings

- **note / genuine-generalization:** The Lean proposition is a genuine nonvacuous strengthening that includes the full source case.
- **note / explicit-integrability:** This formal side condition is automatic in the source context and therefore does not reduce applicability to the selected result.
- **major / nonvacuous scope generalization:** The translation proves the same identity on a genuinely larger class, so it is stronger rather than exactly equivalent.
- **minor / explicit integrability premise:** This extra premise does not reduce applicability to any source instance, but it is an explicit condition in the generalized formulation.
- **note / degenerate index extension:** The translation explicitly includes a harmless boundary case left ambiguous by the source.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `fail` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `34` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `34` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/agent_outputs/agent_runs.json` (`1c06ee2030728c60240b46fa9cad03d853fd1b0b7fdfcf561740efd00c39d7f4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/agent_outputs/blind_translation.json` (`d8b000001237abe05a14fd148f0d6e168762bc103845f23d47da9649ba54c176`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/agent_outputs/direct_judge.json` (`95c09ca7b20a4c53a773f0b34e43e53b02a26ed19c18aaf07a3c231863879255`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/agent_outputs/roundtrip_judge.json` (`6300816d8217391d7734ee826a7aebfe41fd6e606303cf81d621212571f964ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/agent_outputs/source_contract.json` (`bc82c618e91e5cb3e1f80952e3f508ddc5fe2ba7918e32fcda026aafdebebdb4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/decision.json` (`7893492fa23703465449ceba75f9a74517bedc95908bc6edf6dc2f55f750da3c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/agent_outputs/agent_runs.json` (`de1c5e305874243e13d37f1570e3e9bd5ea126d919cc45c05b700a7247138a53`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/agent_outputs/blind_translation.json` (`d8b000001237abe05a14fd148f0d6e168762bc103845f23d47da9649ba54c176`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/agent_outputs/direct_judge.json` (`95c09ca7b20a4c53a773f0b34e43e53b02a26ed19c18aaf07a3c231863879255`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/agent_outputs/roundtrip_judge.json` (`6300816d8217391d7734ee826a7aebfe41fd6e606303cf81d621212571f964ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/agent_outputs/source_contract.json` (`bc82c618e91e5cb3e1f80952e3f508ddc5fe2ba7918e32fcda026aafdebebdb4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/decision.json` (`c0889bf8f38b26a33a529aabd99eb7fc570a7d750817e63d2af8bc88c011a2bc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/inputs/blind_dependency_inventory.json` (`19cf1cd81925ef757dbc2e962c4c380f43cc77ec9caa27875647d9da87193ad6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/inputs/blind_dossier.md` (`73f755d5f6aa75c3be6db47333546cf96ac07daad5ec30e548bb7b67026fb125`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/inputs/blind_review_packet.md` (`73f755d5f6aa75c3be6db47333546cf96ac07daad5ec30e548bb7b67026fb125`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/inputs/declaration_dossier.md` (`85c8710d0974e2bf12bac7eae469c0933026d866712c6fc9c1d08f9b7dec5bef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/inputs/dependency_inventory.json` (`19cf1cd81925ef757dbc2e962c4c380f43cc77ec9caa27875647d9da87193ad6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/inputs/direct_review_packet.md` (`555cc46b70dc745ea587ee28ad1f971236193b21f7e883a09c74e648584fefc1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/history/20260831T083842Z/inputs/source_locator.json` (`283bf89f46a80beea0a59acda233b77ff8446538965fc9219fbbeb2d1941888d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/inputs/blind_dependency_inventory.json` (`19cf1cd81925ef757dbc2e962c4c380f43cc77ec9caa27875647d9da87193ad6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/inputs/blind_dossier.md` (`73f755d5f6aa75c3be6db47333546cf96ac07daad5ec30e548bb7b67026fb125`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/inputs/blind_review_packet.md` (`73f755d5f6aa75c3be6db47333546cf96ac07daad5ec30e548bb7b67026fb125`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/inputs/declaration_dossier.md` (`58b7e3f961152a7cb15c40154c06a35cf4fd8b2ff13df940f5020d8fbf02c42c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/inputs/dependency_inventory.json` (`19cf1cd81925ef757dbc2e962c4c380f43cc77ec9caa27875647d9da87193ad6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/inputs/direct_review_packet.md` (`555cc46b70dc745ea587ee28ad1f971236193b21f7e883a09c74e648584fefc1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.6/faithfulness/inputs/source_locator.json` (`283bf89f46a80beea0a59acda233b77ff8446538965fc9219fbbeb2d1941888d`)
