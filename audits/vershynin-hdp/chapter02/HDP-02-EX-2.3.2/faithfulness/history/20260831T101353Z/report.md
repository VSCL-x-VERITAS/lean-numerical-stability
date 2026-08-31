# Faithfulness audit: HDP-02-EX-2.3.2

## Decision

- Classification: `undetermined`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `c96198b5e6734497460deb19ba3634916fc30da6ed22e0b171fb1013ec43a74a`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The immutable PDF has the configured SHA-256, and its Exercise 2.3.2 unambiguously prints only t < mu. The Lean proposition adds 0 < t, thereby ensuring a nonzero denominator and a positive base for Real.rpow. All probabilistic objects and every quantitative component agree exactly on 0 < t < mu. The direct judge was right that the guard reduces the printed syntactic domain, but its not-faithful-weaker classification presupposed a definite source proposition in the omitted cases. The source provides none: its right-hand side is undefined at t = 0 and has no stated general real-power meaning for negative t. Following the protocol's source-defect rule, the Lean-to-source implication remains unclear rather than no. Conversely, the source-to-Lean implication is yes because all Lean-admissible positive thresholds are well-defined instances of the printed universal assertion and the formulas match exactly there. One unclear implication forces classification undetermined and accepted false.

## Implications

- **Lean implies source:** `unclear`. Yes on the exact common domain 0 < t < mu. For the full rendered source scope, t = 0 produces division by zero and negative t produces a negative base for a general real exponent, with no source-stated semantics. A whole-domain implication cannot be decided without silently repairing the source.
- **Source implies lean:** `yes`. For every Lean-admissible t, the source condition t < mu holds and the formula is conventionally well-defined because t > 0 and mu > t. The Bernoulli assumptions, inclusive event, mean, constants, quotient, and exponent all coincide, so the positive-domain restriction of the source gives the Lean proposition.

## Findings

- **major / source-domain-definedness:** The exact printed claim is semantically incomplete, so full bidirectional faithfulness cannot be certified and the audit is not accepted.
- **major / positive-threshold-guard:** The guard is the standard well-defined correction and yields exact agreement on the positive-threshold core, but it is not textually supplied by the source.
- **note / nondegenerate-core:** There is no mathematical discrepancy in the intended nondegenerate lower-tail bound.
- **note / later-zero-threshold-use:** The endpoint requires a separate argument or an explicit limiting convention; it does not resolve the source ambiguity.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `fail` | `pass` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `fail` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `fail` | `fail` |
| `C11` | `fail` | `fail` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `49` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `49` dependencies (`0` hash-reused); failing or unclear: `D013, D033, D035, D039, D040, D041, D043, D045`.

## Remaining uncertainties

- The pinned source does not state whether Exercise 2.3.2 should be corrected to 0 < t < mu, assigned a limiting value at t = 0, or supplemented by a separate zero-threshold argument.
- The pinned source gives no real-power convention for the negative-base expression arising when t < 0 and mu > 0.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/agent_outputs/adjudicator.json` (`297900865f45e2d013731c10148cf615e24dd7c2ea3be41c39c4a9fb51c02070`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/agent_outputs/agent_runs.json` (`796ed81bc8775e0312e00d74d881ebc5234cb638dca835b1f889bddc0719e344`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/agent_outputs/blind_translation.json` (`341815c29c9b00885985cee7bd9cb24f92c9a837e3cec95907003c169f545422`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/agent_outputs/direct_judge.json` (`3f131d3635675bfdd7ca6f5ea2251a4f6f6381ca1848cc21956f6aae50cc78fa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/agent_outputs/roundtrip_judge.json` (`76bb84742298c18c23af04fd87f312c576872ce466bff74a433df39e344679ff`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/agent_outputs/source_contract.json` (`c5f674bc2010fe6c051ae631a289ab695f0bb28aad97b2020d8fd49655a3c99b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/decision.json` (`0066f4ef1bec8097144ba9e61fccf610d24e7f446283551f467626aab484259f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/agent_outputs/agent_runs.json` (`ff290b418f88178cc6d0fc139f4016c055ee2b134c183c5801a5bd9ad8d4bc5e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/agent_outputs/direct_judge.json` (`3f131d3635675bfdd7ca6f5ea2251a4f6f6381ca1848cc21956f6aae50cc78fa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/agent_outputs/source_contract.json` (`c5f674bc2010fe6c051ae631a289ab695f0bb28aad97b2020d8fd49655a3c99b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/inputs/blind_dependency_inventory.json` (`5a6312d91dd2d79dd56988575a61c863fd284ff65c3e0c42a1d6d568ce3a5911`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/inputs/blind_dossier.md` (`25861905e15b5b47b9d4f70c0b358f3356b831c38cdec643f1f073cdde2549bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/inputs/blind_review_packet.md` (`25861905e15b5b47b9d4f70c0b358f3356b831c38cdec643f1f073cdde2549bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/inputs/declaration_dossier.md` (`b2d560818f2d95fc949755e27810f6b54243c62ab54d5baa946fdefde4e38522`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/inputs/dependency_inventory.json` (`5a6312d91dd2d79dd56988575a61c863fd284ff65c3e0c42a1d6d568ce3a5911`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/inputs/direct_review_packet.md` (`fa7c1e55cb5f51346c6c922dc41b7c356c29af49c60473714fa6f9be8d2b53d7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/history/20260830T102403Z/inputs/source_locator.json` (`7002a0fa8a44de2d6c5682237bac7144154b385ddf7c24a6fc83c5f4994f1861`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/inputs/blind_dependency_inventory.json` (`5a6312d91dd2d79dd56988575a61c863fd284ff65c3e0c42a1d6d568ce3a5911`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/inputs/blind_dossier.md` (`25861905e15b5b47b9d4f70c0b358f3356b831c38cdec643f1f073cdde2549bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/inputs/blind_review_packet.md` (`25861905e15b5b47b9d4f70c0b358f3356b831c38cdec643f1f073cdde2549bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/inputs/declaration_dossier.md` (`399fc6ac21ef706867866c74a15d475b57e12011dc2b5cf2bf6a6a034cba7193`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/inputs/dependency_inventory.json` (`5a6312d91dd2d79dd56988575a61c863fd284ff65c3e0c42a1d6d568ce3a5911`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/inputs/direct_review_packet.md` (`fa7c1e55cb5f51346c6c922dc41b7c356c29af49c60473714fa6f9be8d2b53d7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.2/faithfulness/inputs/source_locator.json` (`7002a0fa8a44de2d6c5682237bac7144154b385ddf7c24a6fc83c5f4994f1861`)
