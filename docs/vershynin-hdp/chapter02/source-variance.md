# Chapter 2 source variance ledger

The pinned first edition is authoritative for this unit. These are source and
source-to-Lean findings, not skill/process findings; process findings for the
`claude-continue-2` invocation are recorded separately under
`ledgers/skill-issues/book-formalization/vershynin-hdp/sessions/claude-continue-2/`.

| Source row | Printed claim | Evidence/status | Lean result | Relation | Constants/assumptions propagated |
|---|---|---|---|---|---|
| Theorem 2.6.3 / preceding body text (printed p. 29) | The text says "let us apply Theorem 2.6.3 for `a_i X_i` instead of `X_i`" and then states Theorem 2.6.3. The theorem being applied is 2.6.2. | Printed cross-reference defect; no mathematical consequence. Recorded as `VHDP-C02-N001`. | `hdp_02_hthm_h2_d6_d2`, `hdp_02_hthm_h2_d6_d3` are separate rows and 2.6.3 is derived from 2.6.2. | `advisory` | None. |
| Definition 2.7.5 (printed p. 33) | The prose defines `‖X‖_{ψ₁}` as "the smallest `K₃` in property 3", but the display (2.21) it gives is the smallest `K₄` of property (d), and Proposition 2.7.1's properties are lettered (a)–(e). | Prose/display mismatch; the display is unambiguous, so no weakening or correction row is needed. Recorded as `VHDP-C02-N002`. | `PsiOneGauge` follows the display (2.21) / property (d), matching the `ψ₂` convention of Definition 2.5.6. | `source-faithful` | None; the choice fixes which property the gauge is the infimum over. |
| Theorems 2.8.1, 2.8.2, Corollary 2.8.3 (printed pp. 36–37) | The printed bounds are expressed in `‖X_i‖_{ψ₁}`, with `K = max_i ‖X_i‖_{ψ₁}` and denominators `K²‖a‖₂²`, `K‖a‖_∞`. | The original Lean renderings quantified over a per-index MGF-window family `K i` and used `∑(a_i K_i)²`, `max_i(|a_i| K_i)`; three independent audit roles judged that `faithful-stronger`/`faithful-equivalent` but **not acceptable as the printed row**, failing semantic checks C02, C04, C05, C06, C08, C09. Recorded as `VHDP-C02-L001` and `VHDP-C02-L002`. | Printed forms now exist: `bernsteinTailPsiOne`, `bernsteinWeightedTailPsiOne`, `bernsteinAverageTailPsiOne`, with aliases `hdp_02_hthm_h2_d8_d1_hpsi1`, `hdp_02_hthm_h2_d8_d2_hpsi1`, `hdp_02_hcor_h2_d8_d3_hpsi1`. The window-scale results are retained, separately named, as the sharper reusable lemmas. | `source-faithful` (printed forms) / `strengthened` (window-scale forms) | The printed forms keep the absolute constant existential, as printed. The `ψ₁`-to-window conversion `psiOneGaugeToLinearMGF_le` costs an absolute factor `4096 e⁴`, absorbed into that constant. The printed forms add the nondegeneracy hypotheses that make the printed denominators nonzero (`0 < ∑ ‖X_i‖²_{ψ₁}` for 2.8.1; `0 < max_i ‖X_i‖_{ψ₁}` and `0 < ∑ a_i²` for 2.8.2/2.8.3) — exactly the configurations the printed displays leave undefined. |
| Lemma 2.7.7 (printed p. 33) | "Let `X` and `Y` be sub-gaussian random variables. Then `XY` is sub-exponential. Moreover `‖XY‖_{ψ₁} ≤ ‖X‖_{ψ₂}‖Y‖_{ψ₂}`." | Proved by the source's own Young-inequality route. | `psiOneGauge_mul_le`, `psiOneGauge_mul_lt_top`, alias `hdp_02_hlem_h2_d7_d7`. | `source-faithful` | Sub-gaussianity of both factors is carried as `PsiTwoGauge < ∞`. That is the printed hypothesis, not an addition, and it is what makes both `ψ₂`-admissible sets nonempty. |

## Constants introduced

| Constant | Value | Where it comes from | Where it is absorbed |
|---|---|---|---|
| `psiOneScale` | `4096 e⁴` | `subExponentialPropertyTransfer` (`512 e³`, Proposition 2.7.1 (d)⇒(b)) composed with `momentToLinearMGF` (`4 e`, (b)⇒(e)), then doubled by `psiOneGaugeToLinearMGF_le` to turn a non-strict gauge bound into a strict one. | The existential absolute constant `c` of the printed Section 2.8 statements. It is never exposed in a source-facing alias. |

No row in this chapter is `WEAKENED` or `DISCREPANCY`: no printed Chapter 2
claim has been refuted, and none has been closed at a strength below what the
book prints.
