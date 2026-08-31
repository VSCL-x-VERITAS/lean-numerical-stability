# Faithfulness audit: HDP-02-BODY-2.3-BERNOULLI-MGF

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `52b1a9ee479e525072cda203e88f168459e9c305db350d21eaad012b96a98e85`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Rechecking the disputed dependency removes the blind translator's only uncertainty: the integral is exactly expectation under the canonical Bernoulli probability measure because the finite Boolean integrand is automatically integrable, and Mathlib's finite-PMF integral theorem evaluates it as the weighted atom sum. Thus the target matches the source's 0/1 Bernoulli MGF identity, algebraic normalization, and exponential upper bound on the source domain. Lean additionally proves those statements for lambda = 0 and lambda < 0; the negative-lambda range is well-defined and nonvacuous. Lean therefore implies the source, the source does not imply the full Lean proposition, and the consistent classification is faithful-stronger with no remaining uncertainty.

## Implications

- **Lean implies source:** `yes`. Specialize the Lean proposition to the source Bernoulli parameter p_i and its inherited positive lambda. D011 is the ordinary expectation on the canonical two-point Bernoulli law, so the equality gives E exp(lambda X_i) = 1 + (exp(lambda)-1)p_i, algebraically the source's exp(lambda)p_i+(1-p_i), and the second conjunct is exactly the source upper bound exp((exp(lambda)-1)p_i).
- **Source implies lean:** `no`. The selected source computation occurs in the Chernoff proof's lambda > 0 context, while Lean asserts both the exact MGF identity and bound for every real lambda. The added negative-lambda cases are valid but nontrivial: for 0 < p < 1 and lambda < 0, x=(exp(lambda)-1)p lies strictly between -1 and 0, so 1+x and exp(x) are both below 1 and the inequality 1+x <= exp(x) has substantive content. The source-domain statement therefore does not cover all Lean instances.

## Findings

- **note / integral-dependency-resolution:** The opaque one-level body in the blind dossier causes no semantic uncertainty or totalization mismatch for this target; D011 exactly represents the source expectation.
- **note / lambda-domain-strengthening:** Lean retains every source instance and adds genuine nonvacuous negative-lambda cases, so the accepted classification is faithful-stronger rather than faithful-equivalent.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `fail` | `fail` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `39` dependencies (`0` hash-reused); unclear: `D011`.
- Direct judge covered `39` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/agent_outputs/adjudicator.json` (`a78e458d481943e7ffefe77cb4e3ab2d50b251d09e28a590a69b10cafc7dcd62`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/agent_outputs/agent_runs.json` (`394cadb440ec60c999b30b99fa0e3c4af56817f3e3c6396278f9b5660e5d3e4d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/agent_outputs/blind_translation.json` (`219ac5015918ee4185d2ec8ad41d7906f1d5e4a8b1c8aa8a1a5e6601b0f34031`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/agent_outputs/direct_judge.json` (`f73ab61198a903fccec6c7f7786dbc9627dfb9ee2d2d3f700759f0c0d4a3a526`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/agent_outputs/roundtrip_judge.json` (`b356da7f0b92cdd7b055e3da4ef2f7cf7a5304e4a75dabbc21fb99aa412513d5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/agent_outputs/source_contract.json` (`a5a1ffa4268f3a9d06e2d0d525d387f6f89936384519ef09aad5a1fa18116a0b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/decision.json` (`efca31dbe4cb5a35f4913891ec5569f7c8abd6c68b7bb708f7f3484a2793eefd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/agent_outputs/adjudicator.json` (`a78e458d481943e7ffefe77cb4e3ab2d50b251d09e28a590a69b10cafc7dcd62`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/agent_outputs/agent_runs.json` (`394cadb440ec60c999b30b99fa0e3c4af56817f3e3c6396278f9b5660e5d3e4d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/agent_outputs/blind_translation.json` (`219ac5015918ee4185d2ec8ad41d7906f1d5e4a8b1c8aa8a1a5e6601b0f34031`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/agent_outputs/direct_judge.json` (`f73ab61198a903fccec6c7f7786dbc9627dfb9ee2d2d3f700759f0c0d4a3a526`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/agent_outputs/roundtrip_judge.json` (`b356da7f0b92cdd7b055e3da4ef2f7cf7a5304e4a75dabbc21fb99aa412513d5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/agent_outputs/source_contract.json` (`a5a1ffa4268f3a9d06e2d0d525d387f6f89936384519ef09aad5a1fa18116a0b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/decision.json` (`be7eb0489b803e3cd854a4d9e0bc9582a23c6039646293a62387912fb2648436`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/inputs/blind_dependency_inventory.json` (`f8cb3880414fa2088d32b1d2faf32b43ef1a47d55bab37504ff02dd6bf74b707`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/inputs/blind_dossier.md` (`3a256ba3a3b5f419f9e6281ea9a1ec37d0eb1c5ea352c61ab4fe8a0baaa0fe17`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/inputs/blind_review_packet.md` (`3a256ba3a3b5f419f9e6281ea9a1ec37d0eb1c5ea352c61ab4fe8a0baaa0fe17`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/inputs/declaration_dossier.md` (`83dc7babbceb391cb3667430d3f875b635cd4f9ba133a23081e17c94d14143f4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/inputs/dependency_inventory.json` (`f8cb3880414fa2088d32b1d2faf32b43ef1a47d55bab37504ff02dd6bf74b707`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/inputs/direct_review_packet.md` (`3d529c5a08f1fecfde708396e0145e5ce31a04901ca2596fb6d9701ec7bad68a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/history/20260830T102206Z/inputs/source_locator.json` (`b01653bfa41762944d4f40b3a9401a8ca33232b7347430d9a1c1d2f5832ea303`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/inputs/blind_dependency_inventory.json` (`f8cb3880414fa2088d32b1d2faf32b43ef1a47d55bab37504ff02dd6bf74b707`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/inputs/blind_dossier.md` (`3a256ba3a3b5f419f9e6281ea9a1ec37d0eb1c5ea352c61ab4fe8a0baaa0fe17`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/inputs/blind_review_packet.md` (`3a256ba3a3b5f419f9e6281ea9a1ec37d0eb1c5ea352c61ab4fe8a0baaa0fe17`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/inputs/declaration_dossier.md` (`c1ee9dcb60ceff5112c266e9c65281b31eaaff6c3f2dfb656853df594f70212f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/inputs/dependency_inventory.json` (`f8cb3880414fa2088d32b1d2faf32b43ef1a47d55bab37504ff02dd6bf74b707`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/inputs/direct_review_packet.md` (`3d529c5a08f1fecfde708396e0145e5ce31a04901ca2596fb6d9701ec7bad68a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-BERNOULLI-MGF/faithfulness/inputs/source_locator.json` (`b01653bfa41762944d4f40b3a9401a8ca33232b7347430d9a1c1d2f5832ea303`)
