import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Integral.Gamma
import Mathlib.MeasureTheory.Function.L1Space.Integrable
import Mathlib.Probability.Moments.IntegrableExpMul
import Mathlib.Tactic
import NumStability.HDP.Scalar.Preliminaries
import NumStability.HDP.ContractSignatures.C_02_hex_h2_d6_d9

/-!
# Standard-normal MGF

This module proves the standard-normal moment-generating-function identity
used by the Chapter 2 sub-Gaussian development.
-/

noncomputable section

open MeasureTheory
open ProbabilityTheory
open Filter
open scoped Topology

namespace NumStability.HDP.Scalar.SubGaussian

/-- The standard-normal MGF is `exp (lam ^ 2 / 2)`. -/
theorem standardNormalMGF (lam : ℝ) :
    ∫ x, Real.exp (lam * x) ∂(gaussianReal 0 1) =
      Real.exp (lam ^ 2 / 2) := by
  rw [integral_gaussianReal_eq_integral_smul (μ := (0 : ℝ)) (v := (1 : NNReal))
    (f := fun x : ℝ => Real.exp (lam * x)) (by norm_num)]
  change (∫ x : ℝ, gaussianPDFReal 0 1 x * Real.exp (lam * x)) =
    Real.exp (lam ^ 2 / 2)
  have hpdf (x : ℝ) :
      gaussianPDFReal 0 1 x =
        (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) := by
    simp [gaussianPDFReal]
  simp_rw [hpdf]
  have hshift :
      ∫ x : ℝ, Real.exp (-(x - lam) ^ 2 / 2) =
        ∫ x : ℝ, Real.exp (-x ^ 2 / 2) :=
    integral_sub_right_eq_self (fun x : ℝ => Real.exp (-x ^ 2 / 2)) lam
  have hpoint :
      (fun x : ℝ =>
        (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) *
          Real.exp (lam * x)) =
        (fun x : ℝ =>
          Real.exp (lam ^ 2 / 2) *
            ((Real.sqrt (2 * Real.pi))⁻¹ *
              Real.exp (-(x - lam) ^ 2 / 2))) := by
    funext x
    calc
      (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) * Real.exp (lam * x) =
          (Real.sqrt (2 * Real.pi))⁻¹ *
            (Real.exp (-x ^ 2 / 2) * Real.exp (lam * x)) := by ring
      _ = (Real.sqrt (2 * Real.pi))⁻¹ *
            Real.exp (-x ^ 2 / 2 + lam * x) := by
              rw [Real.exp_add]
      _ = Real.exp (lam ^ 2 / 2) *
            ((Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(x - lam) ^ 2 / 2)) := by
              calc
                (Real.sqrt (2 * Real.pi))⁻¹ *
                    Real.exp (-x ^ 2 / 2 + lam * x) =
                    (Real.sqrt (2 * Real.pi))⁻¹ *
                      Real.exp (lam ^ 2 / 2 + (-(x - lam) ^ 2 / 2)) := by
                        congr 1
                        congr 1
                        nlinarith
                _ = Real.exp (lam ^ 2 / 2) *
                      ((Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(x - lam) ^ 2 / 2)) := by
                        rw [Real.exp_add]
                        ring
  have hgauss :
      ∫ x : ℝ, Real.exp (-x ^ 2 / 2) = Real.sqrt (Real.pi / (1 / 2)) := by
    have hnorm := ProbabilityTheory.integral_gaussianPDFReal_eq_one (0 : ℝ)
      (v := (1 : NNReal)) (by norm_num)
    simp_rw [hpdf] at hnorm
    rw [integral_const_mul] at hnorm
    norm_num [Real.sqrt_eq_rpow] at hnorm ⊢
    field_simp at hnorm ⊢
    nlinarith
  rw [hpoint, integral_const_mul, integral_const_mul, hshift, hgauss]
  norm_num [Real.sqrt_eq_rpow]
  field_simp

private structure StandardNormalSquareMGFProviders where
  hVar : gaussianReal 0 1 = volume.withDensity (gaussianPDF 0 1)
  hPdfMeas : Measurable (gaussianPDF 0 1)
  hPdfTop : ∀ x : ℝ, gaussianPDF 0 1 x < ⊤
  hToReal : ∀ x : ℝ, (gaussianPDF 0 1 x).toReal = gaussianPDFReal 0 1 x
  hWithDensity : ∀ {g : ℝ → ℝ},
    Integrable g (volume.withDensity (gaussianPDF 0 1)) ↔
      Integrable (fun x => g x * (gaussianPDF 0 1 x).toReal) volume
  hIntegral : ∀ {f : ℝ → ℝ},
    (∫ x, f x ∂(gaussianReal 0 1)) =
      ∫ x, gaussianPDFReal 0 1 x * f x
  hConstMul : ∀ (r : ℝ) (f : ℝ → ℝ),
    (∫ x, r * f x) = r * (∫ x, f x)
  hExp : ∀ {b : ℝ}, 0 < b →
    Integrable (fun x : ℝ => Real.exp (-b * x ^ 2)) volume
  hGaussian : ∀ (b : ℝ),
    ∫ x : ℝ, Real.exp (-b * x ^ 2) = Real.sqrt (Real.pi / b)
  hIff : ∀ {b : ℝ},
    Integrable (fun x : ℝ => Real.exp (-b * x ^ 2)) volume ↔ 0 < b

private theorem standardNormalSquareMGF_integrable
    (lam : ℝ) (hsmall : |lam| < (Real.sqrt 2)⁻¹)
    (p : StandardNormalSquareMGFProviders) :
    Integrable (fun x : ℝ => Real.exp (lam ^ 2 * x ^ 2)) (gaussianReal 0 1) := by
  have hsq : lam ^ 2 < (1 / 2 : ℝ) := by
    have hinv : 0 ≤ (Real.sqrt 2)⁻¹ := by positivity
    have hsq' : lam ^ 2 < ((Real.sqrt 2)⁻¹) ^ 2 := by
      calc
        lam ^ 2 = |lam| ^ 2 := (sq_abs lam).symm
        _ < |(Real.sqrt 2)⁻¹| ^ 2 :=
          (sq_lt_sq₀ (abs_nonneg lam) (abs_nonneg ((Real.sqrt 2)⁻¹))).2
            (by simpa [abs_of_nonneg hinv] using hsmall)
        _ = ((Real.sqrt 2)⁻¹) ^ 2 := sq_abs _
    simpa [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)] using hsq'
  have hb : 0 < (1 / 2 : ℝ) - lam ^ 2 := sub_pos.mpr hsq
  rw [p.hVar]
  apply (p.hWithDensity (g := fun x : ℝ => Real.exp (lam ^ 2 * x ^ 2))).2
  simp only [p.hToReal]
  have htarget : Integrable (fun x : ℝ => gaussianPDFReal 0 1 x *
      Real.exp (lam ^ 2 * x ^ 2)) volume := by
    rw [show (fun x : ℝ => gaussianPDFReal 0 1 x * Real.exp (lam ^ 2 * x ^ 2)) =
      (fun x => (Real.sqrt (2 * Real.pi))⁻¹ *
        Real.exp (-((1 / 2 : ℝ) - lam ^ 2) * x ^ 2)) by
    funext x
    have hpdf (x : ℝ) : gaussianPDFReal 0 1 x =
        (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) := by
      simp [gaussianPDFReal]
    rw [hpdf]
    calc
      (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) *
          Real.exp (lam ^ 2 * x ^ 2) =
          (Real.sqrt (2 * Real.pi))⁻¹ *
            (Real.exp (-x ^ 2 / 2) * Real.exp (lam ^ 2 * x ^ 2)) := by ring
      _ = (Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-x ^ 2 / 2 + lam ^ 2 * x ^ 2) := by rw [Real.exp_add]
      _ = (Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-((1 / 2 : ℝ) - lam ^ 2) * x ^ 2) := by
            congr 2
            ring]
    exact (p.hExp hb).const_mul _
  simpa only [mul_comm] using htarget

private theorem standardNormalSquareMGF_value
    (lam : ℝ) (hsmall : |lam| < (Real.sqrt 2)⁻¹)
    (p : StandardNormalSquareMGFProviders) :
    ∫ x : ℝ, Real.exp (lam ^ 2 * x ^ 2) ∂(gaussianReal 0 1) =
      (Real.sqrt (1 - 2 * lam ^ 2))⁻¹ := by
  have hsq : lam ^ 2 < (1 / 2 : ℝ) := by
    have hinv : 0 ≤ (Real.sqrt 2)⁻¹ := by positivity
    have hsq' : lam ^ 2 < ((Real.sqrt 2)⁻¹) ^ 2 := by
      calc
        lam ^ 2 = |lam| ^ 2 := (sq_abs lam).symm
        _ < |(Real.sqrt 2)⁻¹| ^ 2 :=
          (sq_lt_sq₀ (abs_nonneg lam) (abs_nonneg ((Real.sqrt 2)⁻¹))).2
            (by simpa [abs_of_nonneg hinv] using hsmall)
        _ = ((Real.sqrt 2)⁻¹) ^ 2 := sq_abs _
    simpa [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)] using hsq'
  have hb : 0 < (1 / 2 : ℝ) - lam ^ 2 := sub_pos.mpr hsq
  have hq : 0 < 1 - 2 * lam ^ 2 := by nlinarith
  rw [p.hIntegral]
  have hpdf (x : ℝ) : gaussianPDFReal 0 1 x =
      (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) := by
    simp [gaussianPDFReal]
  simp_rw [hpdf]
  rw [show (fun x : ℝ => (Real.sqrt (2 * Real.pi))⁻¹ *
      Real.exp (-x ^ 2 / 2) * Real.exp (lam ^ 2 * x ^ 2)) =
      (fun x => (Real.sqrt (2 * Real.pi))⁻¹ *
        Real.exp (-((1 / 2 : ℝ) - lam ^ 2) * x ^ 2)) by
    funext x
    calc
      (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) *
          Real.exp (lam ^ 2 * x ^ 2) =
          (Real.sqrt (2 * Real.pi))⁻¹ *
            (Real.exp (-x ^ 2 / 2) * Real.exp (lam ^ 2 * x ^ 2)) := by ring
      _ = (Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-x ^ 2 / 2 + lam ^ 2 * x ^ 2) := by rw [Real.exp_add]
      _ = (Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-((1 / 2 : ℝ) - lam ^ 2) * x ^ 2) := by
            congr 2
            ring]
  rw [p.hConstMul, p.hGaussian]
  apply (sq_eq_sq₀ (by positivity) (by positivity)).1
  rw [mul_pow]
  simp only [inv_pow]
  rw [Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 2 * Real.pi),
    Real.sq_sqrt (div_nonneg (by positivity : (0 : ℝ) ≤ Real.pi) hb.le),
    Real.sq_sqrt hq.le]
  field_simp

private theorem standardNormalSquareMGF_not_integrable
    (lam : ℝ) (hlarge : (Real.sqrt 2)⁻¹ ≤ |lam|)
    (p : StandardNormalSquareMGFProviders) :
    ¬ Integrable (fun x : ℝ => Real.exp (lam ^ 2 * x ^ 2)) (gaussianReal 0 1) := by
  intro hInt
  rw [p.hVar] at hInt
  have hvol := (p.hWithDensity (g := fun x : ℝ => Real.exp (lam ^ 2 * x ^ 2))).1 hInt
  simp only [p.hToReal] at hvol
  have hvol' : Integrable (fun x : ℝ => gaussianPDFReal 0 1 x *
      Real.exp (lam ^ 2 * x ^ 2)) volume := by
    simpa only [mul_comm] using hvol
  have hsq : (1 / 2 : ℝ) ≤ lam ^ 2 := by
    have hinv : 0 ≤ (Real.sqrt 2)⁻¹ := by positivity
    have hsq' : ((Real.sqrt 2)⁻¹) ^ 2 ≤ |lam| ^ 2 := by
      calc
        ((Real.sqrt 2)⁻¹) ^ 2 = |(Real.sqrt 2)⁻¹| ^ 2 := (sq_abs _).symm
        _ ≤ |lam| ^ 2 :=
          (sq_le_sq₀ (abs_nonneg ((Real.sqrt 2)⁻¹)) (abs_nonneg lam)).2
            (by simpa [abs_of_nonneg hinv] using hlarge)
    simpa [abs_sq, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)] using hsq'
  have hrew : (fun x : ℝ => gaussianPDFReal 0 1 x * Real.exp (lam ^ 2 * x ^ 2)) =
      (fun x => (Real.sqrt (2 * Real.pi))⁻¹ *
        Real.exp (-((1 / 2 : ℝ) - lam ^ 2) * x ^ 2)) := by
    funext x
    have hpdf (x : ℝ) : gaussianPDFReal 0 1 x =
        (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) := by
      simp [gaussianPDFReal]
    rw [hpdf]
    calc
      (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) *
          Real.exp (lam ^ 2 * x ^ 2) =
          (Real.sqrt (2 * Real.pi))⁻¹ *
            (Real.exp (-x ^ 2 / 2) * Real.exp (lam ^ 2 * x ^ 2)) := by ring
      _ = (Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-x ^ 2 / 2 + lam ^ 2 * x ^ 2) := by rw [Real.exp_add]
      _ = (Real.sqrt (2 * Real.pi))⁻¹ *
          Real.exp (-((1 / 2 : ℝ) - lam ^ 2) * x ^ 2) := by
            congr 2
            ring
  rw [hrew] at hvol'
  have hbad : ¬ Integrable (fun x : ℝ =>
      Real.exp (-((1 / 2 : ℝ) - lam ^ 2) * x ^ 2)) := by
    rw [p.hIff]
    exact not_lt_of_ge (sub_nonpos.mpr hsq)
  have hc : (Real.sqrt (2 * Real.pi))⁻¹ ≠ 0 := by positivity
  exact hbad ((integrable_const_mul_iff (isUnit_iff_ne_zero.mpr hc) _).mp hvol')

/-! Exercise 2.5.5(a): the standard normal square-MGF is finite exactly on
the neighborhood `|lam| < 1 / sqrt 2`, where it equals the displayed inverse
square-root formula, and is non-integrable at and beyond the boundary. -/
theorem standardNormalSquareMGF (lam : ℝ) :
    (|lam| < (Real.sqrt 2)⁻¹ →
      Integrable (fun x : ℝ => Real.exp (lam ^ 2 * x ^ 2)) (gaussianReal 0 1) ∧
        (∫ x : ℝ, Real.exp (lam ^ 2 * x ^ 2) ∂(gaussianReal 0 1)) =
          (Real.sqrt (1 - 2 * lam ^ 2))⁻¹) ∧
    ((Real.sqrt 2)⁻¹ ≤ |lam| →
      ¬ Integrable (fun x : ℝ => Real.exp (lam ^ 2 * x ^ 2)) (gaussianReal 0 1)) := by
  let p : StandardNormalSquareMGFProviders :=
    { hVar := ProbabilityTheory.gaussianReal_of_var_ne_zero 0 (by norm_num)
      hPdfMeas := ProbabilityTheory.measurable_gaussianPDF 0 1
      hPdfTop := fun x => ProbabilityTheory.gaussianPDF_lt_top
      hToReal := fun x => ProbabilityTheory.toReal_gaussianPDF x
      hWithDensity := by
        intro g
        exact (integrable_withDensity_iff
          (ProbabilityTheory.measurable_gaussianPDF 0 1)
          (ae_of_all _ (fun x => ProbabilityTheory.gaussianPDF_lt_top)))
      hIntegral := by
        intro f
        simpa only [smul_eq_mul] using
          (ProbabilityTheory.integral_gaussianReal_eq_integral_smul
            (μ := (0 : ℝ)) (v := (1 : NNReal)) (f := f) (by norm_num))
      hConstMul := MeasureTheory.integral_const_mul
      hExp := _root_.integrable_exp_neg_mul_sq
      hGaussian := _root_.integral_gaussian
      hIff := _root_.integrable_exp_neg_mul_sq_iff }
  constructor
  · intro hsmall
    exact ⟨standardNormalSquareMGF_integrable lam hsmall
        p,
      standardNormalSquareMGF_value lam hsmall p⟩
  · intro hlarge
    exact standardNormalSquareMGF_not_integrable lam hlarge p

/-! Exercise 2.5.1: exact standard-normal `Lᵖ` moments and a uniform
`O(√p)` estimate.  The norm statement uses Mathlib's root-free `eLpNorm'`
representation, while the growth companion exposes the equivalent real
integral form used by the source calculation. -/
theorem standardNormalLpNorm (p : ℝ) (hp : 1 ≤ p) :
    (eLpNorm' (fun x : ℝ => x) p (gaussianReal 0 1)).toReal =
      (2 ^ (p / 2) * Real.Gamma ((1 + p) / 2) / Real.Gamma (1 / 2)) ^ (1 / p) := by
  have hp0 : 0 < p := lt_of_lt_of_le zero_lt_one hp
  have hpm : 0 ≤ p := hp0.le
  have hInt : Integrable (fun x : ℝ => |x| ^ p) (gaussianReal 0 1) :=
    integrable_rpow_abs_of_integrable_exp_mul (t := (1 : ℝ)) one_ne_zero
      (integrable_exp_mul_gaussianReal (μ := (0 : ℝ)) (v := (1 : NNReal)) 1)
      (integrable_exp_mul_gaussianReal (μ := (0 : ℝ)) (v := (1 : NNReal)) (-1)) hpm
  have hnonneg : 0 ≤ᶠ[ae (gaussianReal 0 1)] (fun x : ℝ => |x| ^ p) :=
    Filter.Eventually.of_forall (fun x => Real.rpow_nonneg (abs_nonneg x) p)
  have hlin :
      (∫⁻ x : ℝ, ‖(fun y : ℝ => y) x‖ₑ ^ p ∂(gaussianReal 0 1)) =
        ENNReal.ofReal (∫ x : ℝ, |x| ^ p ∂(gaussianReal 0 1)) := by
    calc
      (∫⁻ x : ℝ, ‖(fun y : ℝ => y) x‖ₑ ^ p ∂(gaussianReal 0 1)) =
          ∫⁻ x : ℝ, ENNReal.ofReal (|x| ^ p) ∂(gaussianReal 0 1) := by
            apply lintegral_congr
            intro x
            rw [Real.enorm_eq_ofReal_abs]
            rw [ENNReal.ofReal_rpow_of_nonneg (abs_nonneg x) hpm]
      _ = ENNReal.ofReal (∫ x : ℝ, |x| ^ p ∂(gaussianReal 0 1)) :=
        (MeasureTheory.ofReal_integral_eq_lintegral_ofReal hInt hnonneg).symm
  rw [MeasureTheory.eLpNorm'_eq_lintegral_enorm, hlin, ← ENNReal.toReal_rpow,
    ENNReal.toReal_ofReal (integral_nonneg (fun x =>
      Real.rpow_nonneg (abs_nonneg x) p))]
  congr 1
  rw [ProbabilityTheory.integral_gaussianReal_eq_integral_smul (μ := (0 : ℝ))
    (v := (1 : NNReal)) (f := fun x : ℝ => |x| ^ p) (by norm_num)]
  simp_rw [smul_eq_mul]
  rw [show (fun x : ℝ =>
      gaussianPDFReal 0 1 x * |x| ^ p) =
      (fun x : ℝ =>
        (Real.sqrt (2 * Real.pi))⁻¹ *
          (|x| ^ p * Real.exp (-x ^ 2 / 2))) by
    funext x
    have hpdf :
        gaussianPDFReal 0 1 x =
          (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) := by
      simp [gaussianPDFReal]
    rw [hpdf]
    ring]
  rw [integral_const_mul]
  have habs :
      (∫ x : ℝ, |x| ^ p * Real.exp (-x ^ 2 / 2)) =
        2 * ∫ x : ℝ in Set.Ioi 0, x ^ p * Real.exp (-x ^ 2 / 2) := by
    calc
      (∫ x : ℝ, |x| ^ p * Real.exp (-x ^ 2 / 2)) =
          ∫ x : ℝ, (|x| ^ p * Real.exp (-|x| ^ 2 / 2)) := by
            apply integral_congr_ae
            filter_upwards [] with x
            rw [sq_abs]
      _ = 2 * ∫ x : ℝ in Set.Ioi 0, x ^ p * Real.exp (-x ^ 2 / 2) := by
        exact integral_comp_abs (f := fun x : ℝ =>
          x ^ p * Real.exp (-x ^ 2 / 2))
  rw [habs]
  have hgamma := integral_rpow_mul_exp_neg_mul_rpow (p := (2 : ℝ))
    (q := p) (b := (1 / 2 : ℝ)) (by norm_num) (by linarith) (by norm_num)
  have hgamma' :
      ∫ x : ℝ in Set.Ioi 0, x ^ p * Real.exp (-x ^ 2 / 2) =
        (1 / 2) ^ (-(p + 1) / 2) * (1 / 2) * Real.Gamma ((p + 1) / 2) := by
    calc
      (∫ x : ℝ in Set.Ioi 0, x ^ p * Real.exp (-x ^ 2 / 2)) =
          ∫ x : ℝ in Set.Ioi 0, x ^ p * Real.exp (-(1 / 2) * x ^ 2) := by
            apply setIntegral_congr_fun measurableSet_Ioi
            intro x hx
            congr 3
            dsimp
            rw [show -x ^ 2 / 2 = -(1 / 2) * x ^ 2 by ring]
            have hx2 : x ^ (2 : ℝ) = x ^ (2 : ℕ) := by
              norm_num [Real.rpow_natCast]
            rw [hx2]
      _ = _ := hgamma
  rw [hgamma']
  have hsqrt : 0 < Real.sqrt (2 * Real.pi) := by positivity
  have hgamma0 : 0 < Real.Gamma (1 / 2) :=
    Real.Gamma_pos_of_pos (by norm_num)
  have hgammaP : 0 < Real.Gamma ((p + 1) / 2) :=
    Real.Gamma_pos_of_pos (by linarith)
  rw [show (1 + p) / 2 = (p + 1) / 2 by ring]
  have hpi : Real.Gamma (1 / 2) = Real.sqrt Real.pi := by
    exact Real.Gamma_one_half_eq
  rw [hpi]
  field_simp [hsqrt.ne', hgamma0.ne']
  rw [show (1 / 2 : ℝ) ^ (-((p + 1) / 2)) =
      2 ^ ((p + 1) / 2) by
    rw [show (1 / 2 : ℝ) = (2 : ℝ)⁻¹ by ring,
      Real.inv_rpow (by positivity : (0 : ℝ) ≤ 2),
      Real.rpow_neg (by positivity : (0 : ℝ) ≤ 2)]
    simp]
  rw [Real.sqrt_mul (by norm_num : (0 : ℝ) ≤ 2)]
  simp only [Real.sqrt_eq_rpow]
  rw [show (p + 1) / 2 = p / 2 + 1 / 2 by ring,
    Real.rpow_add (by norm_num : (0 : ℝ) < 2)]
  ring

theorem standardNormalLpNormGrowth :
    ∃ C : ℝ, 0 < C ∧
      ∀ p : ℝ, 1 ≤ p →
        (∫ x : ℝ, |x| ^ p ∂(gaussianReal 0 1)) ^ (1 / p) ≤ C * Real.sqrt p := by
  refine ⟨2 * Real.exp 1, by positivity, ?_⟩
  intro p hp
  have hp0 : 0 < p := lt_of_lt_of_le zero_lt_one hp
  have hpm : 0 ≤ p := hp0.le
  have hq : 0 < Real.sqrt p := Real.sqrt_pos.2 hp0
  have hq2 : (Real.sqrt p) ^ 2 = p := Real.sq_sqrt hpm
  have hdiv : p / Real.sqrt p = Real.sqrt p := by
    apply (div_eq_iff hq.ne').2
    nlinarith [hq2]
  have hInt : Integrable (fun x : ℝ => |x| ^ p) (gaussianReal 0 1) :=
    integrable_rpow_abs_of_integrable_exp_mul (t := (1 : ℝ)) one_ne_zero
      (integrable_exp_mul_gaussianReal (μ := (0 : ℝ)) (v := (1 : NNReal)) 1)
      (integrable_exp_mul_gaussianReal (μ := (0 : ℝ)) (v := (1 : NNReal)) (-1)) hpm
  have hplus : Integrable (fun x : ℝ => Real.exp (Real.sqrt p * x))
      (gaussianReal 0 1) :=
    integrable_exp_mul_gaussianReal (μ := (0 : ℝ)) (v := (1 : NNReal)) _
  have hminus : Integrable (fun x : ℝ => Real.exp (-Real.sqrt p * x))
      (gaussianReal 0 1) :=
    integrable_exp_mul_gaussianReal (μ := (0 : ℝ)) (v := (1 : NNReal)) _
  have hsum : Integrable (fun x : ℝ =>
      Real.exp (Real.sqrt p * x) + Real.exp (-Real.sqrt p * x))
      (gaussianReal 0 1) := hplus.add hminus
  have hpoint : ∀ x : ℝ, |x| ^ p ≤
      (p / Real.sqrt p) ^ p *
        (Real.exp (Real.sqrt p * x) + Real.exp (-Real.sqrt p * x)) := by
    intro x
    have h := rpow_abs_le_mul_max_exp x hpm hq.ne'
    rw [abs_of_pos hq] at h
    calc
      |x| ^ p ≤ (p / Real.sqrt p) ^ p *
          max (Real.exp (Real.sqrt p * x)) (Real.exp (-Real.sqrt p * x)) := by
            simpa using h
      _ ≤ (p / Real.sqrt p) ^ p *
          (Real.exp (Real.sqrt p * x) + Real.exp (-Real.sqrt p * x)) := by
            apply mul_le_mul_of_nonneg_left
            · exact max_le
                (le_add_of_nonneg_right (Real.exp_nonneg _))
                (le_add_of_nonneg_left (Real.exp_nonneg _))
            · positivity
  have hprod : Integrable (fun x : ℝ =>
      (p / Real.sqrt p) ^ p *
        (Real.exp (Real.sqrt p * x) + Real.exp (-Real.sqrt p * x)))
      (gaussianReal 0 1) := hsum.const_mul _
  have hbound := integral_mono_ae hInt hprod
    (Filter.Eventually.of_forall hpoint)
  have hsumEval :
      (∫ x : ℝ, Real.exp (Real.sqrt p * x) +
        Real.exp (-Real.sqrt p * x) ∂(gaussianReal 0 1)) =
        2 * Real.exp (p / 2) := by
    rw [integral_add hplus hminus, standardNormalMGF, standardNormalMGF]
    simp [hq2]
    ring
  have hbound' :
      (∫ x : ℝ, |x| ^ p ∂(gaussianReal 0 1)) ≤
        (Real.sqrt p) ^ p * (2 * Real.exp (p / 2)) := by
    calc
      (∫ x : ℝ, |x| ^ p ∂(gaussianReal 0 1)) ≤
          (p / Real.sqrt p) ^ p *
            (∫ x : ℝ, Real.exp (Real.sqrt p * x) +
              Real.exp (-Real.sqrt p * x) ∂(gaussianReal 0 1)) := by
        simpa [integral_const_mul] using hbound
      _ = (Real.sqrt p) ^ p * (2 * Real.exp (p / 2)) := by
        rw [hsumEval, hdiv]
  have hB : 2 * Real.exp (p / 2) ≤ (2 * Real.exp 1) ^ p := by
    have htwo : (2 : ℝ) ≤ 2 ^ p := by
      simpa using Real.rpow_le_rpow_of_exponent_le (x := (2 : ℝ))
        (y := (1 : ℝ)) (z := p) (by norm_num) hp
    have hexp : Real.exp (p / 2) ≤ Real.exp p := by
      exact Real.exp_le_exp.2 (by linarith)
    calc
      2 * Real.exp (p / 2) ≤ 2 ^ p * Real.exp p :=
        mul_le_mul htwo hexp (by positivity) (by positivity)
      _ = (2 * Real.exp 1) ^ p := by
        rw [Real.mul_rpow (by norm_num) (by positivity), Real.exp_one_rpow]
  have hroot := Real.rpow_le_rpow
    (integral_nonneg (fun x => Real.rpow_nonneg (abs_nonneg x) p)) hbound'
      (one_div_pos.mpr hp0).le
  calc
    (∫ x : ℝ, |x| ^ p ∂(gaussianReal 0 1)) ^ (1 / p) ≤
        ((Real.sqrt p) ^ p * (2 * Real.exp (p / 2))) ^ (1 / p) := hroot
    _ = Real.sqrt p * (2 * Real.exp (p / 2)) ^ (1 / p) := by
      rw [Real.mul_rpow (by positivity : (0 : ℝ) ≤ (Real.sqrt p) ^ p)
        (by positivity), ← Real.rpow_mul hq.le]
      congr 1
      field_simp
      simp
    _ ≤ 2 * Real.exp 1 * Real.sqrt p := by
      have hBroot : (2 * Real.exp (p / 2)) ^ (1 / p) ≤
          ((2 * Real.exp 1) ^ p) ^ (1 / p) :=
        Real.rpow_le_rpow (by positivity) hB (one_div_pos.mpr hp0).le
      have hCroot : ((2 * Real.exp 1) ^ p) ^ (1 / p) =
          2 * Real.exp 1 := by
        rw [← Real.rpow_mul (by positivity : (0 : ℝ) ≤ 2 * Real.exp 1)]
        congr 1
        field_simp
        simp
      rw [hCroot] at hBroot
      calc
        Real.sqrt p * (2 * Real.exp (p / 2)) ^ (1 / p) ≤
            Real.sqrt p * (2 * Real.exp 1) :=
          mul_le_mul_of_nonneg_left hBroot hq.le
        _ = 2 * Real.exp 1 * Real.sqrt p := by ring

/-! The moment-to-square-MGF implication from Proposition 2.5.2. -/

/- The root-free integral form of the usual `Lᵖ` moment-growth hypothesis. -/
def LpMomentGrowth {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (K : ℝ) : Prop :=
  AEMeasurable X μ ∧
    ∀ p : ℝ, 1 ≤ p →
      Integrable (fun ω => |X ω| ^ p) μ ∧
        (∫ ω, |X ω| ^ p ∂μ) ≤ (K * Real.sqrt p) ^ p

def EvenMomentBound {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (K : ℝ) : Prop :=
  ∀ n : ℕ, 1 ≤ n →
    Integrable (fun ω => |X ω| ^ (2 * n)) μ ∧
      (∫ ω, |X ω| ^ (2 * n) ∂μ) ≤ K ^ (2 * n) * (2 * n : ℝ) ^ n

def squareMGFTerm {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (n : ℕ) (ω : Ω) : ENNReal :=
  ENNReal.ofReal (((lam ^ 2 * X ω ^ 2) ^ n) / (n.factorial : ℝ))

lemma squareMGFTerm_aemeasurable
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ}
    (hX : AEMeasurable X μ) (lam : ℝ) (n : ℕ) :
    AEMeasurable (squareMGFTerm X lam n) μ := by
  unfold squareMGFTerm
  fun_prop

lemma exp_series_pointwise (x : ℝ) (hx : 0 ≤ x) :
    ENNReal.ofReal (Real.exp x) =
      ∑' n : ℕ, ENNReal.ofReal (x ^ n / (n.factorial : ℝ)) := by
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity)
    (NormedSpace.expSeries_div_summable x)]
  rw [NormedSpace.expSeries_div_hasSum_exp x |>.tsum_eq]
  rw [← Real.exp_eq_exp_ℝ]

lemma geom_bound (q : ℝ) (hq0 : 0 ≤ q) (hq : q ≤ 1 / 2) :
    (∑' n : ℕ, q ^ n) ≤ Real.exp (2 * q) := by
  have hqlt : q < 1 := lt_of_le_of_lt hq (by norm_num)
  have hsum := (hasSum_geometric_of_lt_one hq0 hqlt).tsum_eq
  rw [hsum]
  have hden : 0 < 1 - q := sub_pos.mpr hqlt
  have hrat : (1 - q)⁻¹ ≤ 1 + 2 * q := by
    rw [inv_eq_one_div]
    apply (div_le_iff₀ hden).2
    nlinarith [mul_nonneg hq0 (sub_nonneg.mpr (by linarith : q ≤ 1 / 2))]
  exact hrat.trans (by simpa [add_comm] using Real.add_one_le_exp (2 * q))

lemma factorial_ratio_bound (n : ℕ) (hn : 1 ≤ n) :
    ((2 * n : ℝ) ^ n) / (n.factorial : ℝ) ≤ (2 * Real.exp 1) ^ n := by
  have hfac := Stirling.le_factorial_stirling n
  have hroot : 1 ≤ Real.sqrt (2 * Real.pi * (n : ℝ)) := by
    rw [Real.one_le_sqrt]
    have hpi : (2 : ℝ) ≤ Real.pi := by
      nlinarith [Real.one_le_pi_div_two]
    have hnpos : (0 : ℝ) < (n : ℝ) := by
      exact_mod_cast (show 0 < n by omega)
    have hn1' : (1 : ℝ) ≤ (n : ℝ) := by exact_mod_cast hn
    have hpn : 2 * (n : ℝ) ≤ Real.pi * n :=
      mul_le_mul_of_nonneg_right hpi (le_of_lt hnpos)
    have hn1 : (1 : ℝ) ≤ 2 * (n : ℝ) := by nlinarith
    have hprod : (1 : ℝ) ≤ Real.pi * n := hn1.trans hpn
    nlinarith [hprod]
  have hn0 : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hepos : 0 < Real.exp 1 := Real.exp_pos _
  have hbase : 0 ≤ (n : ℝ) / Real.exp 1 := by positivity
  have hfac' : (n : ℝ) ^ n / (Real.exp 1) ^ n ≤ (n.factorial : ℝ) := by
    have hfac'' := (le_trans (mul_le_mul_of_nonneg_right hroot
      (by positivity : 0 ≤ ((n : ℝ) / Real.exp 1) ^ n)) hfac)
    simpa [div_pow] using hfac''
  have hmul : (n : ℝ) ^ n ≤ (n.factorial : ℝ) * (Real.exp 1) ^ n := by
    rw [← div_le_iff₀ (by positivity : 0 < (Real.exp 1) ^ n)]
    simpa [div_pow] using hfac'
  have hmul' : (2 * n : ℝ) ^ n ≤ (n.factorial : ℝ) * (2 * Real.exp 1) ^ n := by
    rw [mul_pow]
    calc
      2 ^ n * (n : ℝ) ^ n ≤ 2 ^ n * ((n.factorial : ℝ) * (Real.exp 1) ^ n) :=
        mul_le_mul_of_nonneg_left hmul (by positivity)
      _ = (n.factorial : ℝ) * (2 * Real.exp 1) ^ n := by
        rw [mul_pow]
        ring
  exact (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).2
    (by simpa [mul_comm] using hmul')

lemma squareMGFTerm_eq_mul
    {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (n : ℕ) (ω : Ω) :
    squareMGFTerm X lam n ω =
      ENNReal.ofReal ((lam ^ 2) ^ n / (n.factorial : ℝ)) *
        ENNReal.ofReal (|X ω| ^ (2 * n)) := by
  unfold squareMGFTerm
  rw [← ENNReal.ofReal_mul (by positivity :
    0 ≤ (lam ^ 2) ^ n / (n.factorial : ℝ))]
  congr 1
  rw [mul_pow]
  have hXsq : X ω ^ 2 = |X ω| ^ 2 := (sq_abs _).symm
  rw [hXsq, ← pow_mul]
  ring

lemma evenMomentBound_of_lpMomentGrowth
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ} {K : ℝ}
    (hLp : LpMomentGrowth μ X K) : EvenMomentBound μ X K := by
  intro n hn
  have hp := hLp.2 (2 * (n : ℝ)) (by
    have hn' : (1 : ℝ) ≤ n := by exact_mod_cast hn
    nlinarith)
  have hpn : 2 * (n : ℝ) = ((2 * n : ℕ) : ℝ) := by norm_num
  have hfun : (fun ω => |X ω| ^ (2 * (n : ℝ))) =
      (fun ω => |X ω| ^ (2 * n : ℕ)) := by
    funext ω
    rw [hpn, Real.rpow_natCast]
  rw [hfun] at hp
  have heq : (K * Real.sqrt (2 * (n : ℝ))) ^ (2 * (n : ℕ)) =
      K ^ (2 * (n : ℕ)) * (2 * (n : ℝ)) ^ n := by
    rw [mul_pow, pow_mul, pow_mul]
    rw [Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 2 * (n : ℝ))]
  constructor
  · exact hp.1
  · calc
      (∫ ω, |X ω| ^ (2 * n) ∂μ) ≤
          (K * Real.sqrt (2 * (n : ℝ))) ^ (2 * (n : ℝ)) := hp.2
      _ = (K * Real.sqrt (2 * (n : ℝ))) ^ (2 * n : ℕ) := by
        rw [hpn, Real.rpow_natCast]
      _ = K ^ (2 * n) * (2 * (n : ℝ)) ^ n := heq

lemma squareMGFTerm_lintegral_le_geom
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ} {K lam : ℝ}
    (hMom : EvenMomentBound μ X K) {n : ℕ} (hn : 1 ≤ n) :
    (∫⁻ ω, squareMGFTerm X lam n ω ∂μ) ≤
      ENNReal.ofReal ((2 * Real.exp 1 * (lam * K) ^ 2) ^ n) := by
  have hm := hMom n hn
  have hterm := squareMGFTerm_eq_mul X lam n
  rw [lintegral_congr_ae (Filter.Eventually.of_forall (fun ω => hterm ω))]
  rw [lintegral_const_mul' _ _ (by simp)]
  rw [← ofReal_integral_eq_lintegral_ofReal hm.1
    (Filter.Eventually.of_forall (fun ω => by positivity))]
  have hscalar : 0 ≤ (lam ^ 2) ^ n / (n.factorial : ℝ) := by positivity
  have hbound := mul_le_mul_of_nonneg_left hm.2 hscalar
  rw [← ENNReal.ofReal_mul hscalar]
  apply ENNReal.ofReal_le_ofReal
  calc
    (lam ^ 2) ^ n / (n.factorial : ℝ) *
          (∫ ω, |X ω| ^ (2 * n) ∂μ) ≤
        (lam ^ 2) ^ n / (n.factorial : ℝ) *
          (K ^ (2 * n) * (2 * n : ℝ) ^ n) := hbound
    _ = ((lam * K) ^ (2 * n) * (2 * n : ℝ) ^ n) /
          (n.factorial : ℝ) := by ring
    _ ≤ (2 * Real.exp 1 * (lam * K) ^ 2) ^ n := by
      have hratio := factorial_ratio_bound n hn
      have hnonneg : 0 ≤ (lam * K) ^ (2 * n) := by
        rw [pow_mul]
        positivity
      apply (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).2
      have hratio' : (2 * n : ℝ) ^ n ≤ (2 * Real.exp 1) ^ n * (n.factorial : ℝ) :=
        (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).mp hratio
      calc
        (lam * K) ^ (2 * n) * (2 * n : ℝ) ^ n ≤
            (lam * K) ^ (2 * n) * ((2 * Real.exp 1) ^ n * (n.factorial : ℝ)) := by
              gcongr
        _ = (2 * Real.exp 1 * (lam * K) ^ 2) ^ n * (n.factorial : ℝ) := by
              calc
                (lam * K) ^ (2 * n) * ((2 * Real.exp 1) ^ n * (n.factorial : ℝ)) =
                    ((lam * K) ^ 2) ^ n * (2 * Real.exp 1) ^ n * (n.factorial : ℝ) := by
                      rw [pow_mul]
                      ring
                _ = (2 * Real.exp 1 * (lam * K) ^ 2) ^ n * (n.factorial : ℝ) := by
                      rw [← mul_pow]
                      ring

lemma squareMGF_lintegral_le
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K lam : ℝ}
    (hX : AEMeasurable X μ) (hK : 0 ≤ K)
    (hMom : EvenMomentBound μ X K) (hsmall : |lam| * K ≤ 1 / 4) :
    (∫⁻ ω, ENNReal.ofReal (Real.exp (lam ^ 2 * X ω ^ 2)) ∂μ) ≤
      ENNReal.ofReal (Real.exp (4 * Real.exp 1 * (lam * K) ^ 2)) := by
  let q : ℝ := 2 * Real.exp 1 * (lam * K) ^ 2
  have hprod : |lam * K| ≤ 1 / 4 := by
    rw [abs_mul, abs_of_nonneg hK]
    exact hsmall
  have hsq : (lam * K) ^ 2 ≤ (1 / 4 : ℝ) ^ 2 := by
    apply (sq_le_sq (a := lam * K) (b := (1 / 4 : ℝ))).2
    simpa using hprod
  have hq0 : 0 ≤ q := by positivity
  have hqhalf : q ≤ 1 / 2 := by
    have hfirst : q ≤ 2 * Real.exp 1 * (1 / 4 : ℝ) ^ 2 := by
      dsimp [q]
      exact mul_le_mul_of_nonneg_left hsq (by positivity)
    have hexp : Real.exp 1 ≤ 3 := Real.exp_one_lt_three.le
    nlinarith [hfirst]
  have hqsum : Summable (fun n : ℕ => q ^ n) := by
    exact (hasSum_geometric_of_lt_one hq0
      (lt_of_le_of_lt hqhalf (by norm_num))).summable
  have hterm_sum :
      (∑' n : ℕ, ∫⁻ ω, squareMGFTerm X lam n ω ∂μ) ≤
        ∑' n : ℕ, ENNReal.ofReal (q ^ n) := by
    apply ENNReal.tsum_le_tsum
    intro n
    cases n with
    | zero => simp [squareMGFTerm]
    | succ n =>
        simpa [q] using
          (squareMGFTerm_lintegral_le_geom hMom (n := n + 1) (by omega))
  calc
    (∫⁻ ω, ENNReal.ofReal (Real.exp (lam ^ 2 * X ω ^ 2)) ∂μ) =
        ∫⁻ ω, ∑' n : ℕ, squareMGFTerm X lam n ω ∂μ := by
          apply lintegral_congr_ae
          filter_upwards [] with ω
          exact exp_series_pointwise (lam ^ 2 * X ω ^ 2) (by positivity)
    _ = ∑' n : ℕ, ∫⁻ ω, squareMGFTerm X lam n ω ∂μ := by
          apply lintegral_tsum
          intro n
          exact squareMGFTerm_aemeasurable hX lam n
    _ ≤ ∑' n : ℕ, ENNReal.ofReal (q ^ n) := hterm_sum
    _ = ENNReal.ofReal (∑' n : ℕ, q ^ n) := by
          symm
          exact ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity) hqsum
    _ ≤ ENNReal.ofReal (Real.exp (2 * q)) :=
          ENNReal.ofReal_le_ofReal (geom_bound q hq0 hqhalf)
    _ = ENNReal.ofReal (Real.exp (4 * Real.exp 1 * (lam * K) ^ 2)) := by
          congr 2
          dsimp [q]
          ring

lemma squareMGF_real_le
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K lam : ℝ}
    (hX : AEMeasurable X μ) (hK : 0 ≤ K)
    (hMom : EvenMomentBound μ X K) (hsmall : |lam| * K ≤ 1 / 4) :
    Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
      (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤
        Real.exp (4 * Real.exp 1 * (lam * K) ^ 2) := by
  have hbound := squareMGF_lintegral_le hX hK hMom hsmall
  have hmeas : AEMeasurable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ := by
    fun_prop
  have hfinite :
      (∫⁻ ω, ‖Real.exp (lam ^ 2 * X ω ^ 2)‖ₑ ∂μ) < (⊤ : ENNReal) := by
    have htop : ENNReal.ofReal (Real.exp (4 * Real.exp 1 * (lam * K) ^ 2)) <
        (⊤ : ENNReal) :=
      ENNReal.ofReal_lt_top
    refine lt_of_le_of_lt ?_ htop
    simpa only [← ofReal_norm_eq_enorm, Real.norm_eq_abs,
      abs_of_pos (Real.exp_pos _)] using hbound
  have hInt : Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ :=
    ⟨hmeas.aestronglyMeasurable, (hasFiniteIntegral_iff_enorm).2 hfinite⟩
  refine ⟨hInt, ?_⟩
  have hEq := ofReal_integral_eq_lintegral_ofReal hInt
    (Filter.Eventually.of_forall (fun ω => (Real.exp_pos _).le))
  rw [← hEq] at hbound
  exact (ENNReal.ofReal_le_ofReal_iff (Real.exp_nonneg _)).mp hbound

/-! If the `Lᵖ` moments grow like `K * sqrt p`, then the square-exponential
MGF is bounded on the source's local scale. The displayed constants come from
the Stirling lower bound and the resulting geometric series. -/
theorem momentToSquareMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hLp : LpMomentGrowth μ X K) (lam : ℝ)
    (hsmall : |lam| ≤ (4 * K)⁻¹) :
    Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
      (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤
        Real.exp (4 * Real.exp 1 * (lam * K) ^ 2) := by
  have hsmall' : |lam| * K ≤ 1 / 4 := by
    calc
      |lam| * K ≤ (4 * K)⁻¹ * K :=
        mul_le_mul_of_nonneg_right hsmall hK.le
      _ = 1 / 4 := by field_simp
  exact squareMGF_real_le hLp.1 hK.le
    (evenMomentBound_of_lpMomentGrowth hLp) hsmall'

lemma exp_le_add_exp_sq (x : ℝ) :
    Real.exp x ≤ x + Real.exp (x ^ 2) := by
  have hcosh (y : ℝ) : Real.cosh y ≤ Real.exp (y ^ 2 / 2) :=
    Real.cosh_le_exp_half_sq y
  rcases le_total x 0 with hx | hx
  · have hy : 0 ≤ -x := neg_nonneg.mpr hx
    have hs : -x ≤ Real.sinh (-x) := (Real.self_le_sinh_iff).2 hy
    have hmain : Real.exp x - x ≤ Real.cosh (-x) := by
      rw [Real.cosh_eq]
      simp only [neg_neg]
      have hpos : 0 < Real.exp (-x) := Real.exp_pos _
      have hident : Real.exp x = (Real.exp (-x))⁻¹ := by
        simpa using (Real.exp_neg (-x))
      rw [hident]
      rw [Real.sinh_eq] at hs
      simp only [neg_neg] at hs
      rw [hident] at hs
      field_simp at hs ⊢
      nlinarith [hs]
    have hhalf : Real.exp ((-x) ^ 2 / 2) ≤ Real.exp ((-x) ^ 2) := by
      rw [Real.exp_le_exp]
      nlinarith [sq_nonneg x]
    have hsq : (-x) ^ 2 = x ^ 2 := by ring
    have hchain : Real.cosh (-x) ≤ Real.exp (x ^ 2) := by
      exact (hcosh (-x)).trans (by simpa [hsq] using hhalf)
    linarith [hmain, hchain]
  · have hcoshsub : Real.cosh x - Real.sinh x = Real.exp (-x) :=
      Real.cosh_sub_sinh x
    have hs : Real.sinh x - x ≤ Real.cosh x - 1 := by
      have he : 1 - x ≤ Real.exp (-x) := by
        simpa [sub_eq_add_neg, add_comm] using (Real.add_one_le_exp (-x))
      linarith [hcoshsub]
    have hmain : Real.exp x - x ≤ 2 * Real.cosh x - 1 := by
      rw [← Real.cosh_add_sinh x]
      linarith
    have hsq : 2 * Real.cosh x - 1 ≤ Real.exp (x ^ 2) := by
      have hc := hcosh x
      have hp : 0 ≤ Real.exp (x ^ 2 / 2) := Real.exp_nonneg _
      have hsquare : (Real.exp (x ^ 2 / 2) - 1) ^ 2 ≥ 0 := sq_nonneg _
      have hexp : Real.exp (x ^ 2 / 2) ^ 2 = Real.exp (x ^ 2) := by
        calc
          Real.exp (x ^ 2 / 2) ^ 2 =
              Real.exp (x ^ 2 / 2) * Real.exp (x ^ 2 / 2) := by ring
          _ = Real.exp (x ^ 2 / 2 + x ^ 2 / 2) := by rw [Real.exp_add]
          _ = Real.exp (x ^ 2) := by congr 1 <;> ring
      rw [← hexp]
      nlinarith
    linarith [hmain, hsq]

lemma exp_le_abs_add_exp_sq (x : ℝ) :
    Real.exp x ≤ |x| + Real.exp (x ^ 2) := by
  exact (exp_le_add_exp_sq x).trans (by
    simpa [add_comm] using add_le_add_right (le_abs_self x) (Real.exp (x ^ 2)))

def SquareMGFLocal {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (C : ℝ) : Prop :=
  AEMeasurable X μ ∧
    ∀ t : ℝ, |t| ≤ 1 →
      Integrable (fun ω => Real.exp (t ^ 2 * X ω ^ 2)) μ ∧
        (∫ ω, Real.exp (t ^ 2 * X ω ^ 2) ∂μ) ≤ Real.exp (C * t ^ 2)

lemma integrable_exp_mul_of_square
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : Ω → ℝ} (hX : AEMeasurable X μ) (hIntX : Integrable X μ)
    {a : ℝ} (hSq : Integrable (fun ω => Real.exp (a ^ 2 * X ω ^ 2)) μ) :
    Integrable (fun ω => Real.exp (a * X ω)) μ := by
  have hdom : Integrable (fun ω => |a| * |X ω| +
      Real.exp (a ^ 2 * X ω ^ 2)) μ := by
    have hlin : Integrable (fun ω => |a| * |X ω|) μ :=
      hIntX.norm.const_mul |a|
    exact hlin.add hSq
  refine MeasureTheory.Integrable.mono' hdom ?_ ?_
  · fun_prop
  filter_upwards [] with ω
  have hpoint := exp_le_abs_add_exp_sq (a * X ω)
  have hposExp : 0 < Real.exp (a * X ω) := Real.exp_pos _
  simpa only [Real.norm_eq_abs, abs_of_pos hposExp, abs_mul, mul_pow] using hpoint

/-! A centered local square-MGF bound implies a global linear MGF bound. -/
theorem squareMGFToMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {C : ℝ} (hC : 0 ≤ C)
    (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0)
    (hSquare : SquareMGFLocal μ X C) (lam : ℝ) :
    Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
        Real.exp ((C + 1 / 2) * lam ^ 2) := by
  by_cases hsmall : |lam| ≤ 1
  · have hsq := hSquare.2 lam hsmall
    have hInt := integrable_exp_mul_of_square hSquare.1 hCenter.1 hsq.1
    refine ⟨hInt, ?_⟩
    have hlin : Integrable (fun ω => lam * X ω) μ := hCenter.1.const_mul lam
    have hsum : Integrable (fun ω => lam * X ω +
        Real.exp (lam ^ 2 * X ω ^ 2)) μ := hlin.add hsq.1
    have hmono := MeasureTheory.integral_mono_ae hInt hsum
      (Filter.Eventually.of_forall (fun ω => by
        have hpoint := exp_le_add_exp_sq (lam * X ω)
        convert hpoint using 1 <;> ring))
    calc
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
          ∫ ω, lam * X ω + Real.exp (lam ^ 2 * X ω ^ 2) ∂μ := hmono
      _ = lam * (∫ ω, X ω ∂μ) +
          ∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ := by
            rw [integral_add hlin hsq.1, integral_const_mul]
      _ = ∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ := by
            rw [hCenter.2]
            ring
      _ ≤ Real.exp (C * lam ^ 2) := hsq.2
      _ ≤ Real.exp ((C + 1 / 2) * lam ^ 2) := by
            apply Real.exp_le_exp.mpr
            nlinarith [sq_nonneg lam]
  · have hlam : 1 < |lam| := lt_of_not_ge hsmall
    have hlam2 : 1 ≤ lam ^ 2 := by
      have hsquare := sq_abs lam
      nlinarith
    have hsq := hSquare.2 1 (by norm_num)
    have hInt : Integrable (fun ω => Real.exp (lam * X ω)) μ := by
      have hdom : Integrable (fun ω => Real.exp (lam ^ 2 / 2) *
          Real.exp (X ω ^ 2)) μ := by
        simpa using hsq.1.const_mul (Real.exp (lam ^ 2 / 2))
      refine MeasureTheory.Integrable.mono' hdom
        ((hSquare.1.const_mul lam).exp.aestronglyMeasurable) ?_
      filter_upwards [] with ω
      have hyoung : lam * X ω ≤ lam ^ 2 / 2 + X ω ^ 2 / 2 := by
        nlinarith [sq_nonneg (lam - X ω)]
      have hpos : 0 < Real.exp (lam * X ω) := Real.exp_pos _
      rw [Real.norm_eq_abs, abs_of_pos hpos]
      calc
        Real.exp (lam * X ω) ≤ Real.exp (lam ^ 2 / 2 + X ω ^ 2 / 2) :=
          Real.exp_le_exp.mpr hyoung
        _ = Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2 / 2) := by
          rw [Real.exp_add]
        _ ≤ Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2) := by
          gcongr
          nlinarith [sq_nonneg (X ω)]
    refine ⟨hInt, ?_⟩
    have hdom : Integrable (fun ω => Real.exp (lam ^ 2 / 2) *
        Real.exp (X ω ^ 2)) μ := by
      simpa using hsq.1.const_mul (Real.exp (lam ^ 2 / 2))
    have hmono := MeasureTheory.integral_mono_ae hInt hdom
      (Filter.Eventually.of_forall (fun ω => by
        have hyoung : lam * X ω ≤ lam ^ 2 / 2 + X ω ^ 2 / 2 := by
          nlinarith [sq_nonneg (lam - X ω)]
        calc
          Real.exp (lam * X ω) ≤ Real.exp (lam ^ 2 / 2 + X ω ^ 2 / 2) :=
            Real.exp_le_exp.mpr hyoung
          _ = Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2 / 2) := by
            rw [Real.exp_add]
          _ ≤ Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2) := by
            gcongr
            nlinarith [sq_nonneg (X ω)]))
    calc
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
          ∫ ω, Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2) ∂μ := hmono
      _ = Real.exp (lam ^ 2 / 2) *
          (∫ ω, Real.exp (X ω ^ 2) ∂μ) := by rw [integral_const_mul]
      _ ≤ Real.exp (lam ^ 2 / 2) * Real.exp C := by
        gcongr
        simpa using hsq.2
      _ = Real.exp (lam ^ 2 / 2 + C) := by
        rw [Real.exp_add]
      _ ≤ Real.exp ((C + 1 / 2) * lam ^ 2) := by
            apply Real.exp_le_exp.mpr
            have hprod : 0 ≤ C * (lam ^ 2 - 1) :=
              mul_nonneg hC (sub_nonneg.mpr hlam2)
            nlinarith

/-! The square-MGF tail conversion used by the sub-Gaussian equivalences. -/
theorem squareMGFToTail
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hX : Measurable X) (hK : 0 < K)
    (hMGF : Integrable (fun ω => Real.exp (X ω ^ 2 / K ^ 2)) μ ∧
      (∫ ω, Real.exp (X ω ^ 2 / K ^ 2) ∂μ) ≤ 2)
    {t : ℝ} (ht : 0 ≤ t) :
    μ.real {ω | |X ω| ≥ t} ≤ 2 * Real.exp (-t ^ 2 / K ^ 2) := by
  let Y : Ω → ℝ := fun ω => Real.exp (X ω ^ 2 / K ^ 2)
  have hY : Measurable Y := by
    simpa [Y] using (hX.pow_const 2).div_const (K ^ 2) |>.exp
  have hY_nonneg : ∀ᵐ ω ∂μ, 0 ≤ Y ω :=
    Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _))
  have hmarkov :=
    NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite
      hY hY_nonneg hMGF.1 (Real.exp_pos (t ^ 2 / K ^ 2))
  have hsubset : {ω | |X ω| ≥ t} ⊆
      Y ⁻¹' Set.Ici (Real.exp (t ^ 2 / K ^ 2)) := by
    intro ω hω
    change Real.exp (t ^ 2 / K ^ 2) ≤ Real.exp (X ω ^ 2 / K ^ 2)
    apply (Real.exp_le_exp).2
    apply (div_le_div_of_nonneg_right _ (sq_nonneg K))
    have habs : |t| ≤ |X ω| := by simpa [abs_of_nonneg ht] using hω
    exact (sq_le_sq).mpr habs
  have hmono {A B : Set Ω} (hAB : A ⊆ B) :
      μ.real A ≤ μ.real B := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
  calc
    μ.real {ω | |X ω| ≥ t} ≤ μ.real (Y ⁻¹' Set.Ici (Real.exp (t ^ 2 / K ^ 2))) :=
      hmono hsubset
    _ ≤ (∫ ω, Y ω ∂μ) / Real.exp (t ^ 2 / K ^ 2) := by
      simpa [NumStability.HDP.Scalar.Preliminaries.expectation] using hmarkov
    _ ≤ 2 / Real.exp (t ^ 2 / K ^ 2) := by
      exact div_le_div_of_nonneg_right hMGF.2 (le_of_lt (Real.exp_pos _))
    _ = 2 * Real.exp (-t ^ 2 / K ^ 2) := by
      rw [div_eq_mul_inv, ← Real.exp_neg]
      ring

/-! Exercise 2.5.5(b): a square-MGF bound valid for every real parameter
forces the variable to have no mass beyond the corresponding deterministic
threshold.  We retain the tail-zero form, which is the measure-theoretic
meaning of the source's essential boundedness conclusion. -/
theorem squareMGFGlobalTailZero
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hX : Measurable X) (hK : 0 ≤ K)
    (hMGF : ∀ lam : ℝ,
      Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
        (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤ Real.exp (K * lam ^ 2))
    {t : ℝ} (ht : 0 ≤ t) (hthreshold : K < t ^ 2) :
    μ.real {ω | |X ω| ≥ t} = 0 := by
  have hgap : 0 < t ^ 2 - K := sub_pos.mpr hthreshold
  have hbound : ∀ n : ℕ,
      μ.real {ω | |X ω| ≥ t} ≤
        Real.exp (-((n : ℝ) ^ 2) * (t ^ 2 - K)) := by
    intro n
    by_cases hn : n = 0
    · subst n
      have hprob : μ.real {ω | |X ω| ≥ t} ≤ 1 := by
        rw [Measure.real_def]
        exact ENNReal.toReal_mono ENNReal.one_ne_top prob_le_one
      simpa using hprob
    · let a : ℝ := (n : ℝ) ^ 2
      let Y : Ω → ℝ := fun ω => Real.exp (a * X ω ^ 2)
      have ha : 0 < a := by
        dsimp [a]
        positivity
      have hY : Measurable Y := by
        dsimp [Y]
        fun_prop
      have hmarkov :=
        NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite
          (μ := μ) hY
          (Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _)))
          (by simpa [Y, a] using (hMGF (n : ℝ)).1)
          (Real.exp_pos (a * t ^ 2))
      have hsubset : {ω | |X ω| ≥ t} ⊆
          Y ⁻¹' Set.Ici (Real.exp (a * t ^ 2)) := by
        intro ω hω
        change Real.exp (a * t ^ 2) ≤ Real.exp (a * X ω ^ 2)
        apply (Real.exp_le_exp).2
        apply mul_le_mul_of_nonneg_left _ ha.le
        exact (sq_le_sq).mpr (by simpa [abs_of_nonneg ht] using hω)
      have hmono {A B : Set Ω} (hAB : A ⊆ B) : μ.real A ≤ μ.real B := by
        rw [Measure.real_def, Measure.real_def]
        exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
      calc
        μ.real {ω | |X ω| ≥ t} ≤
            μ.real (Y ⁻¹' Set.Ici (Real.exp (a * t ^ 2))) := hmono hsubset
        _ ≤ (∫ ω, Y ω ∂μ) / Real.exp (a * t ^ 2) := by
          simpa [NumStability.HDP.Scalar.Preliminaries.expectation] using hmarkov
        _ ≤ Real.exp (K * a) / Real.exp (a * t ^ 2) := by
          apply div_le_div_of_nonneg_right _ (le_of_lt (Real.exp_pos _))
          simpa [Y, a] using (hMGF (n : ℝ)).2
        _ = Real.exp (-a * (t ^ 2 - K)) := by
          rw [div_eq_mul_inv, ← Real.exp_neg, ← Real.exp_add]
          congr 1
          ring
        _ = Real.exp (-((n : ℝ) ^ 2) * (t ^ 2 - K)) := by rfl
  have hpow : Tendsto (fun n : ℕ => (n : ℝ) ^ 2) atTop atTop := by
    exact (tendsto_pow_atTop (α := ℝ) (n := 2) (by norm_num)).comp
      tendsto_natCast_atTop_atTop
  have hscaled : Tendsto
      (fun n : ℕ => (t ^ 2 - K) * (n : ℝ) ^ 2) atTop atTop :=
    hpow.const_mul_atTop hgap
  have hlim : Tendsto
      (fun n : ℕ => Real.exp (-((n : ℝ) ^ 2) * (t ^ 2 - K))) atTop (𝓝 0) := by
    apply Real.tendsto_exp_atBot.comp
    simpa [Function.comp_def, mul_comm] using
      (tendsto_neg_atTop_atBot.comp hscaled)
  exact le_antisymm
    (le_of_tendsto_of_tendsto' tendsto_const_nhds hlim (fun n => hbound n))
    (by positivity)

/-! The two-sided tail conversion from an all-parameter linear MGF bound. -/
theorem mgfToTail
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hX : Measurable X) (hK : 0 < K)
    (hMGF : ∀ lam : ℝ,
      Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
        (∫ ω, Real.exp (lam * X ω) ∂μ) ≤ Real.exp (K ^ 2 * lam ^ 2))
    {t : ℝ} (ht : 0 ≤ t) :
    μ.real {ω | |X ω| ≥ t} ≤ 2 * Real.exp (-t ^ 2 / (4 * K ^ 2)) := by
  by_cases ht0 : t = 0
  · rw [ht0]
    have hprob : μ.real {ω | |X ω| ≥ 0} ≤ 1 := by
      rw [Measure.real_def]
      exact ENNReal.toReal_mono ENNReal.one_ne_top prob_le_one
    calc
      μ.real {ω | |X ω| ≥ 0} ≤ 1 := hprob
      _ ≤ 2 * Real.exp (-0 ^ 2 / (4 * K ^ 2)) := by
        simp
  have htpos : 0 < t := lt_of_le_of_ne ht (Ne.symm ht0)
  let lam : ℝ := t / (2 * K ^ 2)
  have hlam : 0 < lam := by
    dsimp [lam]
    positivity
  have hupper : μ.real {ω | X ω ≥ t} ≤
      Real.exp (-t ^ 2 / (4 * K ^ 2)) := by
    let Y : Ω → ℝ := fun ω => Real.exp (lam * X ω)
    have hY : Measurable Y := by
      simpa [Y] using (hX.const_mul lam).exp
    have hmarkov :=
      NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite hY
        (Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _)))
        (hMGF lam).1 (Real.exp_pos (lam * t))
    have hsubset : {ω | X ω ≥ t} ⊆
        Y ⁻¹' Set.Ici (Real.exp (lam * t)) := by
      intro ω hω
      change Real.exp (lam * t) ≤ Real.exp (lam * X ω)
      exact (Real.exp_le_exp).2 (mul_le_mul_of_nonneg_left hω hlam.le)
    have hmono {A B : Set Ω} (hAB : A ⊆ B) :
        μ.real A ≤ μ.real B := by
      rw [Measure.real_def, Measure.real_def]
      exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
    calc
      μ.real {ω | X ω ≥ t} ≤ μ.real (Y ⁻¹' Set.Ici (Real.exp (lam * t))) :=
        hmono hsubset
      _ ≤ (∫ ω, Y ω ∂μ) / Real.exp (lam * t) := by
        simpa [NumStability.HDP.Scalar.Preliminaries.expectation] using hmarkov
      _ ≤ Real.exp (K ^ 2 * lam ^ 2) / Real.exp (lam * t) := by
        exact div_le_div_of_nonneg_right (hMGF lam).2 (le_of_lt (Real.exp_pos _))
      _ = Real.exp (-t ^ 2 / (4 * K ^ 2)) := by
        rw [div_eq_mul_inv, ← Real.exp_neg, ← Real.exp_add]
        congr 1
        dsimp [lam]
        field_simp [ne_of_gt hK]
        ring
  have hlower : μ.real {ω | -X ω ≥ t} ≤
      Real.exp (-t ^ 2 / (4 * K ^ 2)) := by
    let Y : Ω → ℝ := fun ω => Real.exp (lam * (-X ω))
    have hY : Measurable Y := by
      simpa [Y] using ((hX.neg.const_mul lam).exp)
    have hmarkov :=
      NumStability.HDP.Scalar.Preliminaries.markovInequalityFinite hY
        (Filter.Eventually.of_forall (fun ω => le_of_lt (Real.exp_pos _)))
        (by simpa [Y, mul_assoc] using (hMGF (-lam)).1)
        (Real.exp_pos (lam * t))
    have hsubset : {ω | -X ω ≥ t} ⊆
        Y ⁻¹' Set.Ici (Real.exp (lam * t)) := by
      intro ω hω
      change Real.exp (lam * t) ≤ Real.exp (lam * (-X ω))
      exact (Real.exp_le_exp).2 (mul_le_mul_of_nonneg_left hω hlam.le)
    have hmono {A B : Set Ω} (hAB : A ⊆ B) :
        μ.real A ≤ μ.real B := by
      rw [Measure.real_def, Measure.real_def]
      exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
    calc
      μ.real {ω | -X ω ≥ t} ≤ μ.real (Y ⁻¹' Set.Ici (Real.exp (lam * t))) :=
        hmono hsubset
      _ ≤ (∫ ω, Y ω ∂μ) / Real.exp (lam * t) := by
        simpa [NumStability.HDP.Scalar.Preliminaries.expectation] using hmarkov
      _ ≤ Real.exp (K ^ 2 * (-lam) ^ 2) / Real.exp (lam * t) := by
        exact div_le_div_of_nonneg_right (by simpa [Y, mul_assoc] using (hMGF (-lam)).2)
          (le_of_lt (Real.exp_pos _))
      _ = Real.exp (-t ^ 2 / (4 * K ^ 2)) := by
        rw [div_eq_mul_inv, ← Real.exp_neg, ← Real.exp_add]
        congr 1
        dsimp [lam]
        field_simp [ne_of_gt hK]
        ring
  have hsubset : {ω | |X ω| ≥ t} ⊆
      {ω | X ω ≥ t} ∪ {ω | -X ω ≥ t} := by
    intro ω hω
    change t ≤ |X ω| at hω
    change t ≤ X ω ∨ t ≤ -X ω
    by_cases h : t ≤ X ω
    · exact Or.inl h
    · right
      have hlt : X ω < t := lt_of_not_ge h
      by_contra hnot
      exact (not_lt_of_ge hω) ((abs_lt).2 (by constructor <;> linarith))
  have hunion : μ.real ({ω | X ω ≥ t} ∪ {ω | -X ω ≥ t}) ≤
      μ.real {ω | X ω ≥ t} + μ.real {ω | -X ω ≥ t} := by
    rw [Measure.real_def, Measure.real_def, Measure.real_def]
    calc
      (μ ({ω | X ω ≥ t} ∪ {ω | -X ω ≥ t})).toReal ≤
          (μ {ω | X ω ≥ t} + μ {ω | -X ω ≥ t}).toReal := by
        apply ENNReal.toReal_mono
        · exact ENNReal.add_ne_top.mpr ⟨measure_ne_top μ _, measure_ne_top μ _⟩
        · exact measure_union_le _ _
      _ = (μ {ω | X ω ≥ t}).toReal + (μ {ω | -X ω ≥ t}).toReal :=
        ENNReal.toReal_add (measure_ne_top μ _) (measure_ne_top μ _)
  calc
    μ.real {ω | |X ω| ≥ t} ≤
        μ.real ({ω | X ω ≥ t} ∪ {ω | -X ω ≥ t}) := by
      rw [Measure.real_def, Measure.real_def]
      exact ENNReal.toReal_mono (measure_ne_top μ _) (measure_mono hsubset)
    _ ≤ μ.real {ω | X ω ≥ t} + μ.real {ω | -X ω ≥ t} := hunion
    _ ≤ Real.exp (-t ^ 2 / (4 * K ^ 2)) +
        Real.exp (-t ^ 2 / (4 * K ^ 2)) := add_le_add hupper hlower
    _ = 2 * Real.exp (-t ^ 2 / (4 * K ^ 2)) := by ring

/-! Exercise 2.6.9: a finite two-point sub-Gaussian witness for the strict
inequality between the centered and uncentered `ψ₂` gauges.  The gauge below
is the exact Orlicz gauge for a two-point law, written after evaluating its
finite expectation. -/
def twoPointPsiTwoAdmissible (a b q t : ℝ) : Prop :=
  0 < t ∧ (1 - q) * Real.exp ((a / t) ^ 2) + q * Real.exp ((b / t) ^ 2) ≤ 2

def twoPointPsiTwoNorm (a b q : ℝ) : ℝ :=
  sInf {t : ℝ | twoPointPsiTwoAdmissible a b q t}

lemma twoPointPsiTwoNorm_le_of_admissible {a b q t : ℝ}
    (ht : twoPointPsiTwoAdmissible a b q t) :
    twoPointPsiTwoNorm a b q ≤ t := by
  unfold twoPointPsiTwoNorm
  apply csInf_le
  · exact ⟨0, by intro s hs; exact le_of_lt hs.1⟩
  · exact ht

lemma twoPointPsiTwoNorm_ge_of_lower {a b q r : ℝ}
    (hS : Set.Nonempty {t : ℝ | twoPointPsiTwoAdmissible a b q t})
    (hLower : ∀ t, twoPointPsiTwoAdmissible a b q t → r ≤ t) :
    r ≤ twoPointPsiTwoNorm a b q := by
  unfold twoPointPsiTwoNorm
  apply le_csInf hS
  intro t ht
  exact hLower t ht

def exercise269Law : Measure ℝ :=
  (999 / 1000 : ENNReal) • Measure.dirac (-1) +
    (1 / 1000 : ENNReal) • Measure.dirac 4

def exercise269Mean : ℝ :=
  (999 / 1000 : ℝ) * (-1) + (1 / 1000 : ℝ) * 4

lemma exercise269Law_probability : IsProbabilityMeasure exercise269Law := by
  apply isProbabilityMeasure_iff.mpr
  simp [exercise269Law, ENNReal.div_eq_inv_mul]
  calc
    (1000 : ENNReal)⁻¹ * 999 + 1000⁻¹ = 1000⁻¹ * 999 + 1000⁻¹ * 1 := by
      rw [mul_one]
    _ = 1000⁻¹ * (999 + 1) := by rw [mul_add]
    _ = (1000 : ENNReal)⁻¹ * 1000 := by norm_num
    _ = 1 := by exact ENNReal.inv_mul_cancel (by norm_num) (by norm_num)

lemma exercise269Law_integral (f : ℝ → ℝ) :
    ∫ x, f x ∂exercise269Law = (999 / 1000 : ℝ) * f (-1) +
      (1 / 1000 : ℝ) * f 4 := by
  rw [exercise269Law, MeasureTheory.integral_add_measure]
  · rw [MeasureTheory.integral_smul_measure, MeasureTheory.integral_smul_measure,
      MeasureTheory.integral_dirac, MeasureTheory.integral_dirac]
    norm_num
  · apply Integrable.smul_measure
    · exact integrable_dirac (by simp)
    · apply ENNReal.mul_ne_top <;> simp
  · apply Integrable.smul_measure
    · exact integrable_dirac (by simp)
    · simp [ENNReal.div_eq_inv_mul]

lemma exercise269_raw_nonempty :
    Set.Nonempty {t : ℝ | twoPointPsiTwoAdmissible (-1) 4 (1 / 1000) t} := by
  refine ⟨10, ?_⟩
  constructor
  · norm_num
  have h₁ : Real.exp ((-1 / 10 : ℝ) ^ 2) ≤ 1 / (1 - (1 / 100 : ℝ)) := by
    convert Real.exp_bound_div_one_sub_of_interval (x := (1 / 100 : ℝ)) (by norm_num)
      (by norm_num) using 1 <;> norm_num
  have h₂ : Real.exp ((4 / 10 : ℝ) ^ 2) ≤ 1 / (1 - (16 / 100 : ℝ)) := by
    convert Real.exp_bound_div_one_sub_of_interval (x := (16 / 100 : ℝ)) (by norm_num)
      (by norm_num) using 1 <;> norm_num
  calc
    (1 - (1 / 1000 : ℝ)) * Real.exp ((-1 / 10 : ℝ) ^ 2) +
        (1 / 1000 : ℝ) * Real.exp ((4 / 10 : ℝ) ^ 2) ≤
        (1 - (1 / 1000 : ℝ)) * (1 / (1 - (1 / 100 : ℝ))) +
        (1 / 1000 : ℝ) * (1 / (1 - (16 / 100 : ℝ))) := by
          gcongr
    _ ≤ 2 := by norm_num

lemma exercise269_centered_nonempty :
    Set.Nonempty {t : ℝ | twoPointPsiTwoAdmissible (-1 / 200) (999 / 200)
      (1 / 1000) t} := by
  refine ⟨10, ?_⟩
  constructor
  · norm_num
  have h₁ : Real.exp ((-1 / 200 / 10 : ℝ) ^ 2) ≤
      1 / (1 - (1 / 4000000 : ℝ)) := by
    convert Real.exp_bound_div_one_sub_of_interval (x := (1 / 4000000 : ℝ)) (by norm_num)
      (by norm_num) using 1 <;> norm_num
  have h₂ : Real.exp ((999 / 200 / 10 : ℝ) ^ 2) ≤
      1 / (1 - (998001 / 4000000 : ℝ)) := by
    convert Real.exp_bound_div_one_sub_of_interval (x := (998001 / 4000000 : ℝ))
      (by norm_num) (by norm_num) using 1 <;> norm_num
  calc
    (1 - (1 / 1000 : ℝ)) * Real.exp ((-1 / 200 / 10 : ℝ) ^ 2) +
        (1 / 1000 : ℝ) * Real.exp ((999 / 200 / 10 : ℝ) ^ 2) ≤
        (1 - (1 / 1000 : ℝ)) * (1 / (1 - (1 / 4000000 : ℝ))) +
        (1 / 1000 : ℝ) * (1 / (1 - (998001 / 4000000 : ℝ))) := by
          gcongr
    _ ≤ 2 := by norm_num

lemma exercise269_exp_small : Real.exp (9 / 25 : ℝ) ≤ 3 / 2 := by
  apply (Real.le_log_iff_exp_le (by norm_num : (0 : ℝ) < 3 / 2)).mp
  have h := Real.le_log_one_add_of_nonneg (x := (1 / 2 : ℝ)) (by norm_num)
  norm_num at h ⊢
  linarith

lemma exercise269_exp_six : Real.exp (6 : ℝ) < 405 := by
  have hbase : Real.exp 1 < (2719 / 1000 : ℝ) := by
    exact lt_trans Real.exp_one_lt_d9 (by norm_num)
  have hpow : Real.exp 1 ^ 6 < (2719 / 1000 : ℝ) ^ 6 := by
    exact pow_lt_pow_left₀ hbase (by positivity) (by norm_num)
  calc
    Real.exp (6 : ℝ) = Real.exp 1 ^ 6 := by
      rw [← Real.exp_nat_mul 1 6]
      norm_num
    _ < (2719 / 1000 : ℝ) ^ 6 := hpow
    _ < 405 := by norm_num

lemma exercise269_raw_admissible :
    twoPointPsiTwoAdmissible (-1) 4 (1 / 1000) (5 / 3) := by
  constructor
  · norm_num
  have hsmall := exercise269_exp_small
  have hlarge : Real.exp (144 / 25 : ℝ) < 405 := by
    exact lt_of_le_of_lt ((Real.exp_le_exp).2 (by norm_num)) exercise269_exp_six
  norm_num only [one_div, sub_eq_add_neg]
  convert (show (999 / 1000 : ℝ) * Real.exp (9 / 25) +
      (1 / 1000 : ℝ) * Real.exp (144 / 25) ≤ 2 by
    nlinarith [hsmall, hlarge]) using 1 <;> norm_num

lemma exercise269_centered_lower :
    ∀ t, twoPointPsiTwoAdmissible (-1 / 200) (999 / 200) (1 / 1000) t →
      9 / 5 ≤ t := by
  intro t ht
  by_contra hnot
  have htpos : 0 < t := ht.1
  have htle : t ≤ 9 / 5 := le_of_not_ge hnot
  have ht_sq : t ^ 2 ≤ (9 / 5 : ℝ) ^ 2 := by
    have hnonneg : 0 ≤ (9 / 5 : ℝ) - t := by linarith
    have hsum : 0 ≤ (9 / 5 : ℝ) + t := by positivity
    nlinarith [mul_nonneg hnonneg hsum]
  have hfrac : (999 / 200 : ℝ) ^ 2 / (9 / 5 : ℝ) ^ 2 ≤
      (999 / 200 : ℝ) ^ 2 / t ^ 2 := by
    exact div_le_div_of_nonneg_left (sq_nonneg _) (sq_pos_of_pos htpos) ht_sq
  have hratio : (7 : ℝ) ≤ (999 / 200 / t) ^ 2 := by
    calc
      (7 : ℝ) ≤ (999 / 200 : ℝ) ^ 2 / (9 / 5 : ℝ) ^ 2 := by norm_num
      _ ≤ (999 / 200 : ℝ) ^ 2 / t ^ 2 := hfrac
      _ = (999 / 200 / t) ^ 2 := by field_simp
  have hexp7 : (1001 : ℝ) < Real.exp 7 := by
    have hbase : (27 / 10 : ℝ) < Real.exp 1 := by
      exact lt_trans (by norm_num) Real.exp_one_gt_d9
    have hpow : (27 / 10 : ℝ) ^ 7 < Real.exp 1 ^ 7 := by
      exact pow_lt_pow_left₀ hbase (by norm_num) (by norm_num)
    calc
      (1001 : ℝ) < (27 / 10 : ℝ) ^ 7 := by norm_num
      _ < Real.exp 1 ^ 7 := hpow
      _ = Real.exp 7 := by
        rw [← Real.exp_nat_mul 1 7]
        norm_num
  have hexp : (1001 : ℝ) < Real.exp ((999 / 200 / t) ^ 2) := by
    exact lt_of_lt_of_le hexp7 ((Real.exp_le_exp).2 hratio)
  have hsmall : (1 : ℝ) ≤ Real.exp ((-1 / 200 / t) ^ 2) :=
    Real.one_le_exp (sq_nonneg _)
  have hcontra : 2 <
      (1 - (1 / 1000 : ℝ)) * Real.exp ((-1 / 200 / t) ^ 2) +
        (1 / 1000 : ℝ) * Real.exp ((999 / 200 / t) ^ 2) := by
    nlinarith
  linarith [ht.2, hcontra]

theorem exercise269_counterexample :
    ∃ (μ : Measure ℝ) (X : ℝ → ℝ),
      IsProbabilityMeasure μ ∧
      μ = exercise269Law ∧
      X = (fun x : ℝ => x) ∧
      ∫ x, X x ∂μ = exercise269Mean ∧
      twoPointPsiTwoNorm (-1) 4 (1 / 1000) <
        twoPointPsiTwoNorm (-1 / 200) (999 / 200) (1 / 1000) := by
  have hraw := twoPointPsiTwoNorm_le_of_admissible exercise269_raw_admissible
  have hcenter := twoPointPsiTwoNorm_ge_of_lower exercise269_centered_nonempty
    exercise269_centered_lower
  have hmean : ∫ x, (fun x : ℝ => x) x ∂exercise269Law = exercise269Mean := by
    rw [exercise269Law_integral]
    norm_num [exercise269Mean]
  refine ⟨exercise269Law, (fun x : ℝ => x), exercise269Law_probability, rfl, rfl, ?_, ?_⟩
  · exact hmean
  · exact lt_of_le_of_lt hraw (lt_of_lt_of_le (by norm_num) hcenter)

end NumStability.HDP.Scalar.SubGaussian

namespace NumStability.HDP.Contract

/-! Stable Chapter 2 alias for the standard-normal `Lᵖ` moment formula. -/
theorem hdp_02_hex_h2_d5_d1 (p : ℝ) (hp : 1 ≤ p) :
    (eLpNorm' (fun x : ℝ => x) p (gaussianReal 0 1)).toReal =
      (2 ^ (p / 2) * Real.Gamma ((1 + p) / 2) / Real.Gamma (1 / 2)) ^ (1 / p) :=
  NumStability.HDP.Scalar.SubGaussian.standardNormalLpNorm p hp

/-! Stable Chapter 2 alias for the standard-normal square-MGF example. -/
theorem hdp_02_hex_h2_d5_d5a (lam : ℝ) :
    (|lam| < (Real.sqrt 2)⁻¹ →
      Integrable (fun x : ℝ => Real.exp (lam ^ 2 * x ^ 2)) (gaussianReal 0 1) ∧
        (∫ x : ℝ, Real.exp (lam ^ 2 * x ^ 2) ∂(gaussianReal 0 1)) =
          (Real.sqrt (1 - 2 * lam ^ 2))⁻¹) ∧
    ((Real.sqrt 2)⁻¹ ≤ |lam| →
      ¬ Integrable (fun x : ℝ => Real.exp (lam ^ 2 * x ^ 2)) (gaussianReal 0 1)) :=
  NumStability.HDP.Scalar.SubGaussian.standardNormalSquareMGF lam

/-- Stable Chapter 2 alias for the moment-to-square-MGF implication. -/
theorem hdp_02_hlem_hsg_hmoment_hto_hsquare_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hLp : NumStability.HDP.Scalar.SubGaussian.LpMomentGrowth μ X K)
    (lam : ℝ) (hsmall : |lam| ≤ (4 * K)⁻¹) :
    Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
      (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤
        Real.exp (4 * Real.exp 1 * (lam * K) ^ 2) :=
  NumStability.HDP.Scalar.SubGaussian.momentToSquareMGF hK hLp lam hsmall

/-- Stable Chapter 2 alias for the square-MGF-to-MGF implication. -/
theorem hdp_02_hlem_hsg_hsquare_hmgf_hto_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {C : ℝ} (hC : 0 ≤ C)
    (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0)
    (hSquare : NumStability.HDP.Scalar.SubGaussian.SquareMGFLocal μ X C)
    (lam : ℝ) :
    Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
        Real.exp ((C + 1 / 2) * lam ^ 2) :=
  NumStability.HDP.Scalar.SubGaussian.squareMGFToMGF hC hCenter hSquare lam

/-! Stable Chapter 2 alias for the square-MGF-to-tail implication. -/
theorem hdp_02_hlem_hsg_hsquare_hmgf_hto_htail
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hX : Measurable X) (hK : 0 < K)
    (hMGF : Integrable (fun ω => Real.exp (X ω ^ 2 / K ^ 2)) μ ∧
      (∫ ω, Real.exp (X ω ^ 2 / K ^ 2) ∂μ) ≤ 2)
    {t : ℝ} (ht : 0 ≤ t) :
    μ.real {ω | |X ω| ≥ t} ≤ 2 * Real.exp (-t ^ 2 / K ^ 2) :=
  NumStability.HDP.Scalar.SubGaussian.squareMGFToTail hX hK hMGF ht

/-! Stable Chapter 2 alias for the global square-MGF boundedness exercise. -/
theorem hdp_02_hex_h2_d5_d5b
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hX : Measurable X) (hK : 0 ≤ K)
    (hMGF : ∀ lam : ℝ,
      Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
        (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤ Real.exp (K * lam ^ 2))
    {t : ℝ} (ht : 0 ≤ t) (hthreshold : K < t ^ 2) :
    μ.real {ω | |X ω| ≥ t} = 0 :=
  NumStability.HDP.Scalar.SubGaussian.squareMGFGlobalTailZero
    hX hK hMGF ht hthreshold

/-! Stable Chapter 2 alias for the all-parameter MGF-to-tail implication. -/
theorem hdp_02_hlem_hsg_hmgf_hto_htail
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hX : Measurable X) (hK : 0 < K)
    (hMGF : ∀ lam : ℝ,
      Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
        (∫ ω, Real.exp (lam * X ω) ∂μ) ≤ Real.exp (K ^ 2 * lam ^ 2))
    {t : ℝ} (ht : 0 ≤ t) :
    μ.real {ω | |X ω| ≥ t} ≤ 2 * Real.exp (-t ^ 2 / (4 * K ^ 2)) :=
  NumStability.HDP.Scalar.SubGaussian.mgfToTail hX hK hMGF ht

/-! Stable Chapter 2 alias for Exercise 2.6.9. -/
theorem hdp_02_hex_h2_d6_d9 : hdp_02_hex_h2_d6_d9__contract_type := by
  simpa [hdp_02_hex_h2_d6_d9__contract_type,
    NumStability.HDP.Scalar.SubGaussian.exercise269Law,
    NumStability.HDP.Scalar.SubGaussian.exercise269Mean,
    NumStability.HDP.Scalar.SubGaussian.twoPointPsiTwoNorm,
    NumStability.HDP.Scalar.SubGaussian.twoPointPsiTwoAdmissible] using
    NumStability.HDP.Scalar.SubGaussian.exercise269_counterexample

end NumStability.HDP.Contract
