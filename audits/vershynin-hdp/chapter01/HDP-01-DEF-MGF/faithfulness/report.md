# Faithfulness audit: HDP-01-DEF-MGF

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `667e0469b9658671c3813bfd2fc1efb3d1c576880306ddfe66479bd8885b15ad`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The source formula, its probability-space context, and footnotes 1-2 determine expectation of the positive function exp(tX) by Lebesgue integration for every real t, with no finiteness hypothesis. The direct and blind dossiers both expand the formal object to the ENNReal-valued nonnegative integral of exactly Real.exp (t * X ω). The extended codomain therefore makes the source's unrestricted nonnegative expectation explicit rather than weakening, strengthening, or restricting it. The hypotheses are satisfiable and the definitional equality is nonvacuous in the sense appropriate to a source definition. Both implication directions are yes, so the classification is faithful-equivalent and accepted.

## Implications

- **Lean implies source:** `yes`. The complete declaration evidence unfolds the Lean MGF to the nonnegative Lebesgue integral of exp(t * X ω). This is precisely the source formula E[e^{tX}] under footnotes 1-2. ENNReal does not lose finite values and handles the positive integral's possible +∞ without adding a hypothesis or restricting t.
- **Source implies lean:** `yes`. A source random variable supplies the measurable real-valued X and probability-space setting, and t ranges over all reals. The source's Lebesgue expectation of the nonnegative exponential is exactly represented by the ENNReal nonnegative integral used in Lean, including the divergent case because the source states no finiteness requirement.

## Findings

- **note / explicit-extended-codomain:** This is a faithful clarification that preserves finite values and represents divergence by +∞; it does not change applicability or either implication direction.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `unclear` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `unclear` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `unclear` | `unclear` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `16` dependencies (`0` hash-reused); unclear: `D011`.
- Direct judge covered `16` dependencies (`0` hash-reused); failing or unclear: `D001, D003, D011`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/agent_outputs/adjudicator.json` (`32a27be17d4d63c5e3754854ea467c7ae59b20984946d574cfb37626e25e57fc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/agent_outputs/agent_runs.json` (`d7c5f3a8ff54a3b0e7a0c6f344a6340fc72f1f75856143977b7804fa2f15573a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/agent_outputs/blind_translation.json` (`0a2b40a43b1b427b0cd7d4324b6dcd8471d435aa2895a5b21322d5fa82b54dc2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/agent_outputs/direct_judge.json` (`72389d20aaf456b804198287dc33a540fbeea8be1fdac998474c220605d96c32`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/agent_outputs/roundtrip_judge.json` (`13450e2f8d477d944de7b689ac6e5ffd21d2d8126e1510e0e6a8d11d13ac3784`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/agent_outputs/source_contract.json` (`01b98406c9a6dcb10aeb58e0bd0afa0f4b17f91f633dba60fe72eeb2d143f8f3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/decision.json` (`442a53de747f5e5bb0941dbc4d8af59f28a5e0d0c65ded9f91ddffa8d12ef621`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/inputs/blind_dependency_inventory.json` (`5fe04d9b469028c2044d729a4e9444acbe3375c86892ab78595b29269616a8ec`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/inputs/blind_dossier.md` (`3fd6a19b0925f49240fb5a88b4bc5f19c3a3a156faf7088b33498129d7f03136`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/inputs/blind_review_packet.md` (`3fd6a19b0925f49240fb5a88b4bc5f19c3a3a156faf7088b33498129d7f03136`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/inputs/declaration_dossier.md` (`dfbc326a292df6464b88ccd2d766c82339098d965a5e93284a7ec4b83fbae75a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/inputs/dependency_inventory.json` (`0c0918ea625774c04337a97316c3569d73d503218125b584737f9252f072a9d7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/inputs/direct_review_packet.md` (`f03a350bf49d7f40c615bdd149a37f2bc5911545be90a83081400e5b648ffd1c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MGF/faithfulness/inputs/source_locator.json` (`35db87ce115229c6cd570d65f6c40728af910f15358008c09a67d519b6668e9d`)
