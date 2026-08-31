# Faithfulness audit: HDP-02-REM-2.3.4

## Decision

- Classification: `not-faithful-weaker`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `52b1a9ee479e525072cda203e88f168459e9c305db350d21eaad012b96a98e85`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Remark 2.3.4 is not merely display (2.9): after deriving the Poisson point-mass Stirling approximation, it compares the preceding upper-tail bound with the smallest mass in that tail, identifies the square-root multiplicative discrepancy, and concludes qualitative exponential-scale sharpness. The target accurately formalizes display (2.9) as IsEquivalent for each fixed positive rate, because the invoked Stirling formula has exactly that ratio-one meaning. But the target neither represents the remainder of the selected remark nor covers the source's zero-rate Poisson endpoint. The full source therefore entails the Lean proposition on its restricted domain, whereas the Lean proposition does not entail the complete source claim. The result is not-faithful-weaker and is not accepted.

## Implications

- **Lean implies source:** `no`. The configured source locator selects all of Remark 2.3.4. The Lean proposition requires 0 < rate although the source's inherited Poisson parameter convention includes lambda = 0, and its conclusion contains only the point-mass asymptotic (2.9), not the remark's entire-tail comparison, sqrt(2 pi k) discrepancy, or qualitative sharpness conclusion. These are reduced applicability and omitted conclusions, so the Lean statement does not imply the selected source claim in full.
- **Source implies lean:** `yes`. For every fixed positive lambda covered by the Lean premise, the source's exact Poisson mass formula combined with the invoked Stirling formula gives the displayed comparison with ratio tending to one as k tends to infinity. That is exactly Mathlib's IsEquivalent relation for the two real-valued natural-indexed functions, with matching constants, powers, casts, and square-root factor.

## Findings

- **major / incomplete-remark-coverage:** A substantive portion of the selected source result is absent, so the formal target is weaker than the full remark.
- **major / reduced-rate-domain:** The formal target omits a source-admissible boundary case; under the protocol, this restriction is reduced applicability rather than genuine strength.
- **note / display-2.9-formula-match:** The encoded point-mass asymptotic itself is faithful; rejection is caused by the narrower domain and incomplete coverage of the selected remark.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `unclear` | `unclear` |
| `C04` | `unclear` | `unclear` |
| `C05` | `unclear` | `fail` |
| `C06` | `pass` | `pass` |
| `C07` | `unclear` | `unclear` |
| `C08` | `pass` | `fail` |
| `C09` | `pass` | `pass` |
| `C10` | `unclear` | `unclear` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `44` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `44` dependencies (`0` hash-reused); failing or unclear: `D001, D003, D007, D023, D037, D043, D044`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/adjudicator.json` (`e63d2a26f0862c4336f0391584d38bf1c7527b49f64018c8f98bdbd5301eeeeb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/agent_runs.json` (`f47d325eef8976ea5210a01f9b8e0ee2336db816067bea715a1a9a2275f0ddb3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/blind_translation.json` (`a29289e64f46b59f28c3e8d274f141f4d790497499dacdbef84a3e127db92010`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/direct_judge.json` (`7ad794ae8a0328bac9430eecc13ff93b56892579a0575aa791ee0a3e28a672cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/roundtrip_judge.json` (`1821c91f5b7e7f9dd13a44ffaba665d874553f858f244f0af58aa6adf8d2e9b5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/agent_outputs/source_contract.json` (`82e5af8dcf542dcfb1e5490532b292497b44de08ca38bbb584bcf8e46d6ef2b2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/decision.json` (`4770fc73520f5e64fe107ba1ab3252d8a6c89f8fc1c8570c960ccf872066c525`)
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
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/blind_dependency_inventory.json` (`82ce58b57de1e68b558aa8adeb89f050c2950a3bc690f74ae68760775eb26b85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/blind_dossier.md` (`a630b1c95601c99e43af0cf17a14a5569f79ee7a4631385dff92192bcaa5a04c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/blind_review_packet.md` (`a630b1c95601c99e43af0cf17a14a5569f79ee7a4631385dff92192bcaa5a04c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/declaration_dossier.md` (`51f30294977c542f1ba1eef77dd4dd881fb99594e0e0154a06588c5a1dd74ea3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/dependency_inventory.json` (`82ce58b57de1e68b558aa8adeb89f050c2950a3bc690f74ae68760775eb26b85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/direct_review_packet.md` (`ef517dff10c1c4d03ef3d214ceacc650a4a0bfe7ba41472b06303eaa68c050e8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-REM-2.3.4/faithfulness/inputs/source_locator.json` (`1a3f59d7e82e2a3d6db021038aeb71400ea498bd92790fee7def2a9c215fea83`)
