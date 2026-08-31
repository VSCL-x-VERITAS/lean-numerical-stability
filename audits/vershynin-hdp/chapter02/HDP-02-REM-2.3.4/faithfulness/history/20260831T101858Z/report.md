# Faithfulness audit: HDP-02-REM-2.3.4

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `3d88b762a8d3ff0b9266af3888a302c81bc413b9b2a5fcb2301b1b7825460e95`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target is a faithful precise rendering of Remark 2.3.4 and its inherited bound. It states the standard fixed-rate Stirling equivalence for the Poisson atom and sandwiches the actual discrete upper tail between that atom and the Chernoff profile. These endpoints differ on the displayed asymptotic scale by sqrt(2πk), exactly supporting the source's qualitative sharpness conclusion. Imported declaration evidence resolves π and all other operators. Natural thresholds are equivalent to arbitrary real thresholds for the discrete law after applying a ceiling and the monotonicity of the profile. The only apparent domain addition, rate zero, makes all relevant positive-index quantities vanish and therefore is not genuine nonvacuous strength. Both implication directions hold, so the classification is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. For positive fixed rate, the target's IsEquivalent assertion is the precise Stirling asymptotic in equation (2.9), and its sandwich separates the point mass, actual tail, and Chernoff profile exactly as the remark does. The endpoint profiles differ by sqrt(2πk), yielding the source's exponential-scale sharpness. The integer tail statement also yields the real-threshold bound using the ceiling of the threshold and monotonicity of exp(-λ)*(eλ/t)^t for t>λ.
- **Source implies lean:** `yes`. The source's Stirling calculation gives the fixed-rate point-mass asymptotic, its equation (2.8) gives the upper inequality at every integer k>λ, and singleton containment gives the lower inequality. If the source's unstated Poisson convention excludes λ=0, the target's zero endpoint is still forced directly by the same Poisson formulas: all relevant positive-index terms are zero, so it adds no independent nonvacuous claim.

## Findings

- **note / endpoint-totalization:** The endpoint is a harmless degenerate closure of the source statement, not genuine additional strength.
- **note / formalization-of-approximation:** This makes the source's standard large-k approximation precise without asserting uniformity in the rate or an asymptotic formula for the full tail.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `unclear` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `unclear` |
| `C10` | `pass` | `unclear` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `47` dependencies (`0` hash-reused); unclear: `D039`.
- Direct judge covered `47` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/adjudicator.json` (`7fdd58ee77d4e0f9544d524836aaaa598e62ed3c6b487925ea4dac8101d2834b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/agent_runs.json` (`0a8569a5ddd9dd0dc4abafb756db98179b45c9db253b416357f2146190adb2ee`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/blind_translation.json` (`32ab400a76a8bbb084480602cacec94c80ce49a09849c69b84ebf596ba543133`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/direct_judge.json` (`ef3ac32fdbec154b385b833fc695ca5f67f6524459c95417c0d0e17835f41122`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/roundtrip_judge.json` (`f9c59edc3e6b6052979f4ba7d6d57dbea3ee4ab448cbfcc571d685322e669695`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/source_contract.json` (`456ed534b0083c41d341afebdc69190bccc9bb0eb557cf01caedf85010d31c3c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/decision.json` (`3ca1b52f2cb898c6c815a5185cfbd1b72c36a2dacfb9766d4f99383903d6ba92`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/agent_outputs/agent_runs.json` (`021ef44d43e0a663681d69c2fde5819d339bf4f53ee991f0adb6d15b155fc7fe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/agent_outputs/blind_translation.json` (`a29289e64f46b59f28c3e8d274f141f4d790497499dacdbef84a3e127db92010`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/agent_outputs/direct_judge.json` (`7ad794ae8a0328bac9430eecc13ff93b56892579a0575aa791ee0a3e28a672cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/agent_outputs/source_contract.json` (`82e5af8dcf542dcfb1e5490532b292497b44de08ca38bbb584bcf8e46d6ef2b2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/inputs/blind_dependency_inventory.json` (`82ce58b57de1e68b558aa8adeb89f050c2950a3bc690f74ae68760775eb26b85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/inputs/blind_dossier.md` (`a630b1c95601c99e43af0cf17a14a5569f79ee7a4631385dff92192bcaa5a04c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/inputs/blind_review_packet.md` (`a630b1c95601c99e43af0cf17a14a5569f79ee7a4631385dff92192bcaa5a04c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/inputs/declaration_dossier.md` (`e8f566f28bee85c8991d986c2d9ccf840affc55247be1d28b69a2bda6fad3a1b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/inputs/dependency_inventory.json` (`82ce58b57de1e68b558aa8adeb89f050c2950a3bc690f74ae68760775eb26b85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/inputs/direct_review_packet.md` (`ef517dff10c1c4d03ef3d214ceacc650a4a0bfe7ba41472b06303eaa68c050e8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T102641Z/inputs/source_locator.json` (`1a3f59d7e82e2a3d6db021038aeb71400ea498bd92790fee7def2a9c215fea83`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/agent_outputs/adjudicator.json` (`e63d2a26f0862c4336f0391584d38bf1c7527b49f64018c8f98bdbd5301eeeeb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/agent_outputs/agent_runs.json` (`f47d325eef8976ea5210a01f9b8e0ee2336db816067bea715a1a9a2275f0ddb3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/agent_outputs/blind_translation.json` (`a29289e64f46b59f28c3e8d274f141f4d790497499dacdbef84a3e127db92010`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/agent_outputs/direct_judge.json` (`7ad794ae8a0328bac9430eecc13ff93b56892579a0575aa791ee0a3e28a672cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/agent_outputs/roundtrip_judge.json` (`1821c91f5b7e7f9dd13a44ffaba665d874553f858f244f0af58aa6adf8d2e9b5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/agent_outputs/source_contract.json` (`82e5af8dcf542dcfb1e5490532b292497b44de08ca38bbb584bcf8e46d6ef2b2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/decision.json` (`4770fc73520f5e64fe107ba1ab3252d8a6c89f8fc1c8570c960ccf872066c525`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/inputs/blind_dependency_inventory.json` (`82ce58b57de1e68b558aa8adeb89f050c2950a3bc690f74ae68760775eb26b85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/inputs/blind_dossier.md` (`a630b1c95601c99e43af0cf17a14a5569f79ee7a4631385dff92192bcaa5a04c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/inputs/blind_review_packet.md` (`a630b1c95601c99e43af0cf17a14a5569f79ee7a4631385dff92192bcaa5a04c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/inputs/declaration_dossier.md` (`51f30294977c542f1ba1eef77dd4dd881fb99594e0e0154a06588c5a1dd74ea3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/inputs/dependency_inventory.json` (`82ce58b57de1e68b558aa8adeb89f050c2950a3bc690f74ae68760775eb26b85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/inputs/direct_review_packet.md` (`ef517dff10c1c4d03ef3d214ceacc650a4a0bfe7ba41472b06303eaa68c050e8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/history/20260830T161432Z/inputs/source_locator.json` (`1a3f59d7e82e2a3d6db021038aeb71400ea498bd92790fee7def2a9c215fea83`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/blind_dependency_inventory.json` (`1d2864b3eb232d44acdc11bdd61126369b5b50f1b89eaf80216052ff16a15bb9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/blind_dossier.md` (`c21017ea50090ee758ab7e12b1aff326c9ea55ca4c83cd102b4967e282058bc7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/blind_review_packet.md` (`c21017ea50090ee758ab7e12b1aff326c9ea55ca4c83cd102b4967e282058bc7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/declaration_dossier.md` (`8c09188ed61b9d349838bcabc3cec52a090c09e6e2c2ab123ed25c0de697ca27`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/dependency_inventory.json` (`1d2864b3eb232d44acdc11bdd61126369b5b50f1b89eaf80216052ff16a15bb9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/direct_review_packet.md` (`58244a56edf65eb376df9ecc07f966428047658816467b5fb3d9b7258edc5482`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/source_locator.json` (`1a3f59d7e82e2a3d6db021038aeb71400ea498bd92790fee7def2a9c215fea83`)
