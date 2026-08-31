# Faithfulness audit: HDP-02-BODY-2.1-ZN-IDENTITY

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `b6d633f77585bca45fbe0a68bd26c2faa80676e810e472dd904e1b6be415810a`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

All three required hashes verify. The target faithfully inlines Z_N=(S_N-N/2)/sqrt(N/4) and states the exact event identity underlying the first equality of Equation (2.2). Positive N makes sqrt(N/4) strictly positive, so the standardized inequality is pointwise equivalent to S_N≥3N/4. The inherited independent fair-toss model, uncentered head count, center N/2, normalization sqrt(N/4), and threshold are all preserved exactly. Both implication directions hold, and the event-level formulation is a harmless definitional strengthening with no independent mathematical content.

## Implications

- **Lean implies source:** `yes`. Lean identifies the two underlying events after inlining Z_N. Applying the common probability measure gives the exact first equality in Equation (2.2).
- **Source implies lean:** `yes`. Under the source definition Z_N=(S_N-N/2)/sqrt(N/4) and positive N, multiplying the standardized inequality by the positive scale sqrt(N/4) shows pointwise that Z_N≥sqrt(N/4) is equivalent to S_N≥3N/4. Thus the source context entails the Lean event equality, not merely an accidental equality of probabilities.

## Findings

- **note / event-level-reformulation:** For N>0 the event predicates are algebraically identical, so this is a harmless definitional reformulation rather than genuine additional strength.
- **note / probability-equality-lifted-to-event-equality:** The translated form is surface-stronger but is derivable pointwise from the source normalization and positive N, so both statements are equivalent in the selected context.
- **note / normalization-inlined:** Definitional inlining preserves the exact centering, scale, and threshold.
- **note / finite-index-relabeling:** The change is semantically harmless because the identity is invariant under finite reindexing.

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

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/agent_outputs/agent_runs.json` (`7affa28dd3d7bbfe662a6a23aff3df4e2fbfe09829d9e5d6d43f69bf0d830e40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/agent_outputs/batch_source_contract.json` (`cafa57c0ba650f089b5691b7e6515255c57da61ca68152e651b0ae398b13c84b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/agent_outputs/blind_translation.json` (`35ad4b712514f68e09cd6f62b0c7d63b54fb5d31d38d72fa09088d42b5cbcddf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/agent_outputs/direct_judge.json` (`699e474f66870ee51a07d445f903472500d1b595b87b0746a008890e6565a613`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/agent_outputs/roundtrip_judge.json` (`a85b87eb2ea70e9f08e5ae716b4a0a3e4e1bfcf309186afeda512cf88720cc9e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/agent_outputs/source_contract.json` (`57aaf34ae74095e10d40591e6c20f6704498b499b1198b57853739effc4ebe03`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/decision.json` (`a4ad47adbb9635032a4e731a2afff9042934a7908899e51f496b41bb19c297ee`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/agent_outputs/agent_runs.json` (`79d5fcb4c76552615157218b416984cedb6c2a943fe84136c87c3449c5053938`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/agent_outputs/batch_source_contract.json` (`cafa57c0ba650f089b5691b7e6515255c57da61ca68152e651b0ae398b13c84b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/agent_outputs/blind_translation.json` (`35ad4b712514f68e09cd6f62b0c7d63b54fb5d31d38d72fa09088d42b5cbcddf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/agent_outputs/direct_judge.json` (`699e474f66870ee51a07d445f903472500d1b595b87b0746a008890e6565a613`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/agent_outputs/roundtrip_judge.json` (`a85b87eb2ea70e9f08e5ae716b4a0a3e4e1bfcf309186afeda512cf88720cc9e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/agent_outputs/source_contract.json` (`57aaf34ae74095e10d40591e6c20f6704498b499b1198b57853739effc4ebe03`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/decision.json` (`daaf3902b556719146297deaa64842d8bb8dd8d41fa5270f63cdf245548600d5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/inputs/batch_source_locator.json` (`4c7a88366d0548118109a5d217b640efedf6233f9fa438344ec0bc62cc0095d4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/inputs/blind_dependency_inventory.json` (`3ba0da1421f9642b0a00ad615dbf8a77f8d3b22d94cd49eb8799c9fdfce096a9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/inputs/blind_dossier.md` (`e878b2d95d5caa5983bfe764b1c8f66d8cd1d0f8b0c36cc9d7b600ae5a1ac66c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/inputs/blind_review_packet.md` (`e878b2d95d5caa5983bfe764b1c8f66d8cd1d0f8b0c36cc9d7b600ae5a1ac66c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/inputs/declaration_dossier.md` (`1ded52760f2475003b3b6ecb4b4548608d640a61ae0eb8e02cad57fda81bcb88`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/inputs/dependency_inventory.json` (`451568a72464632712e9df3be296c536b41cff2ec0525dab54331b89d7faf65a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/inputs/direct_review_packet.md` (`c9643630e69c6621eabca8b28f3b4b608a9b1cd438a7fc49356ab9a20052a57c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T082815Z/inputs/source_locator.json` (`165ea2d8470279191ba7156b469c6034dbeee2fb94dc52f9cfde003f6982d7b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/agent_outputs/agent_runs.json` (`7affa28dd3d7bbfe662a6a23aff3df4e2fbfe09829d9e5d6d43f69bf0d830e40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/agent_outputs/batch_source_contract.json` (`cafa57c0ba650f089b5691b7e6515255c57da61ca68152e651b0ae398b13c84b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/agent_outputs/blind_translation.json` (`35ad4b712514f68e09cd6f62b0c7d63b54fb5d31d38d72fa09088d42b5cbcddf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/agent_outputs/direct_judge.json` (`699e474f66870ee51a07d445f903472500d1b595b87b0746a008890e6565a613`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/agent_outputs/roundtrip_judge.json` (`a85b87eb2ea70e9f08e5ae716b4a0a3e4e1bfcf309186afeda512cf88720cc9e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/agent_outputs/source_contract.json` (`57aaf34ae74095e10d40591e6c20f6704498b499b1198b57853739effc4ebe03`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/decision.json` (`740a510dd1265342fc5efbdd1056269bc84cc676f5f0a81b1cd1b3945a615d7d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/inputs/blind_dependency_inventory.json` (`3ba0da1421f9642b0a00ad615dbf8a77f8d3b22d94cd49eb8799c9fdfce096a9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/inputs/blind_dossier.md` (`e878b2d95d5caa5983bfe764b1c8f66d8cd1d0f8b0c36cc9d7b600ae5a1ac66c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/inputs/blind_review_packet.md` (`e878b2d95d5caa5983bfe764b1c8f66d8cd1d0f8b0c36cc9d7b600ae5a1ac66c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/inputs/declaration_dossier.md` (`51d225fb2761cea66bb5c66956d01a2fb47509efd693caf12dd26f29b66a446f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/inputs/dependency_inventory.json` (`451568a72464632712e9df3be296c536b41cff2ec0525dab54331b89d7faf65a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/inputs/direct_review_packet.md` (`c9643630e69c6621eabca8b28f3b4b608a9b1cd438a7fc49356ab9a20052a57c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/history/20260831T100734Z/inputs/source_locator.json` (`165ea2d8470279191ba7156b469c6034dbeee2fb94dc52f9cfde003f6982d7b7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/inputs/blind_dependency_inventory.json` (`3ba0da1421f9642b0a00ad615dbf8a77f8d3b22d94cd49eb8799c9fdfce096a9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/inputs/blind_dossier.md` (`e878b2d95d5caa5983bfe764b1c8f66d8cd1d0f8b0c36cc9d7b600ae5a1ac66c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/inputs/blind_review_packet.md` (`e878b2d95d5caa5983bfe764b1c8f66d8cd1d0f8b0c36cc9d7b600ae5a1ac66c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/inputs/declaration_dossier.md` (`ae1a3e4402d3ea1d9c63ef6e3bd75d8e3b06d4d1d618355a448e98e9aca03c60`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/inputs/dependency_inventory.json` (`451568a72464632712e9df3be296c536b41cff2ec0525dab54331b89d7faf65a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/inputs/direct_review_packet.md` (`c9643630e69c6621eabca8b28f3b4b608a9b1cd438a7fc49356ab9a20052a57c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-ZN-IDENTITY/faithfulness/inputs/source_locator.json` (`165ea2d8470279191ba7156b469c6034dbeee2fb94dc52f9cfde003f6982d7b7`)
