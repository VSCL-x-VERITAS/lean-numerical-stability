# Faithfulness audit: HDP-02-THM-2.3.1

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `25c6907af5a0f83a5b60f9d797db3af59bd5acd7948686c94ecc2fcf3d8731e3`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The Lean proposition is a source-faithful representation of Theorem 2.3.1. Boolean Bernoulli variables with law PMF.bernoulli p_i are exactly the source's 0/1 Bernoulli variables; indexed independence is mutual independence; the indicator sum is S_N; and sum_i p_i is its mean mu. The strict threshold condition, upper-tail event, exponential factor, quotient, real exponent, and inequality direction all match. Arbitrary finite reindexing and the valid empty-family edge case are harmless, so both implication directions hold and the classification is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. Represent each source Bernoulli X_i by its Boolean success outcome B_i, reindex the N variables by a finite type, and use HasLaw and iIndepFun for the exact Bernoulli laws and mutual independence. The Lean indicator sum is S_N, sum_i p_i is E S_N = mu, and the displayed Lean bound becomes exactly P{S_N >= t} <= e^{-mu}(e mu/t)^t.
- **Source implies lean:** `yes`. Convert each Boolean B_i to the real indicator X_i = 1 when true and 0 when false. HasLaw for PMF.bernoulli supplies a Bernoulli variable with parameter p_i, iIndepFun supplies mutual independence, and its mean is p_i, so Theorem 2.3.1 gives the Lean conclusion after finite reindexing. If the finite type is empty, the source's conventional N >= 1 presentation does not apply, but the Lean instance follows directly because t > 0, the event t <= 0 is empty, and both sides are zero; this harmless degenerate extension does not create genuine additional theorem strength.

## Findings

- **note / bernoulli-representation:** This is an exact measurable recoding and does not change the theorem.
- **note / empty-index-extension:** The additional case is valid and trivial, so it is not genuine nonvacuous strengthening and does not prevent equivalence.
- **note / finite-index boundary:** There is no loss of a source case. Nonempty finite types are reindexings of the source family, while the added empty case is a compatible trivial boundary case.
- **note / real-power and zero-mean convention:** The explicit convention matches the displayed formula and handles the included zero-mean case; it does not change either implication.

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

- Blind translator covered `49` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `49` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/agent_outputs/agent_runs.json` (`6caae28581278ec753812d4132d74f6c15bf270f60fd22eb05d1cf1c213a8f99`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/agent_outputs/blind_translation.json` (`0126f8378807f6291c4408ebbfc6ac2d15b534a936ef25b5b8cc1b13d32819cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/agent_outputs/direct_judge.json` (`bb402847e2fd44094f21ab93cb4b2ffe9fe5f0e874d8507e93bce97b9616b469`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/agent_outputs/roundtrip_judge.json` (`22b4257b03e0306f555a8a8938e32b6c40703e401d694f890a8c4962b107ef51`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/agent_outputs/source_contract.json` (`3ce961bff19c30e76b6fef56b369a5145be6210146379a2b19f38eb0469d0c43`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/decision.json` (`c84814b84f9bdd8e696143f2b5f5fd49979f2bd27b3ffa70095129f5a7685069`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/agent_outputs/agent_runs.json` (`6caae28581278ec753812d4132d74f6c15bf270f60fd22eb05d1cf1c213a8f99`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/agent_outputs/blind_translation.json` (`0126f8378807f6291c4408ebbfc6ac2d15b534a936ef25b5b8cc1b13d32819cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/agent_outputs/direct_judge.json` (`bb402847e2fd44094f21ab93cb4b2ffe9fe5f0e874d8507e93bce97b9616b469`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/agent_outputs/roundtrip_judge.json` (`22b4257b03e0306f555a8a8938e32b6c40703e401d694f890a8c4962b107ef51`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/agent_outputs/source_contract.json` (`3ce961bff19c30e76b6fef56b369a5145be6210146379a2b19f38eb0469d0c43`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/decision.json` (`998a3c0d5ff8772b0d21f0c120f04b90c94bdf72842708f574b7ac40f32aa335`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/inputs/blind_dependency_inventory.json` (`5a6312d91dd2d79dd56988575a61c863fd284ff65c3e0c42a1d6d568ce3a5911`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/inputs/blind_dossier.md` (`1ead9800864b7b2f59f3290c23bf4fba8b75afa25776fb8a72c13ac9d8c6c175`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/inputs/blind_review_packet.md` (`1ead9800864b7b2f59f3290c23bf4fba8b75afa25776fb8a72c13ac9d8c6c175`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/inputs/declaration_dossier.md` (`cdae9c2ab26388e24eac49551e0d29bf59d6a2f5ff861f6d515d262674f241cf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/inputs/dependency_inventory.json` (`5a6312d91dd2d79dd56988575a61c863fd284ff65c3e0c42a1d6d568ce3a5911`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/inputs/direct_review_packet.md` (`bc29b4624c62d7fe8c7d85c846386f4984ae753273352a988058766599a1158b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/history/20260830T102720Z/inputs/source_locator.json` (`b80c8fbc5328ae601004226885d5fcd56edaee70964a3fdf1119e3cbcfde01f1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/inputs/blind_dependency_inventory.json` (`5a6312d91dd2d79dd56988575a61c863fd284ff65c3e0c42a1d6d568ce3a5911`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/inputs/blind_dossier.md` (`1ead9800864b7b2f59f3290c23bf4fba8b75afa25776fb8a72c13ac9d8c6c175`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/inputs/blind_review_packet.md` (`1ead9800864b7b2f59f3290c23bf4fba8b75afa25776fb8a72c13ac9d8c6c175`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/inputs/declaration_dossier.md` (`5e1a367043c55c6facb13a5a651f28545cd855131479c1c58224f7ae7045dae7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/inputs/dependency_inventory.json` (`5a6312d91dd2d79dd56988575a61c863fd284ff65c3e0c42a1d6d568ce3a5911`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/inputs/direct_review_packet.md` (`bc29b4624c62d7fe8c7d85c846386f4984ae753273352a988058766599a1158b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-THM-2.3.1/faithfulness/inputs/source_locator.json` (`b80c8fbc5328ae601004226885d5fcd56edaee70964a3fdf1119e3cbcfde01f1`)
