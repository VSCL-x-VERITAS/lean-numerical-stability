import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Probability.Distributions.Gaussian.HasGaussianLaw.Independence
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Analysis.Convex.SpecificFunctions.Basic
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
open scoped BigOperators
open scoped NNReal ENNReal

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

/-! A coarse universal Gamma estimate used by the tail-to-moment conversion. -/
theorem gammaUpperBound {x : ℝ} (hx : 1 / 2 ≤ x) :
    Real.Gamma x ≤ 4 * x ^ x := by
  have hxpos : 0 < x := by linarith
  by_cases hx1 : x ≤ 1
  · have hgamma : Real.Gamma x ≤ Real.Gamma (1 / 2) :=
      Real.Gamma_strictAntiOn_Ioc.antitoneOn
        (by norm_num)
        (by exact ⟨hxpos, hx1⟩)
        hx
    have hpow : x ≤ x ^ x := by
      have h := Real.rpow_le_rpow_of_exponent_ge
        (x := x) (y := (1 : ℝ)) (z := x) hxpos hx1 hx1
      simpa [Real.rpow_one] using h
    rw [Real.Gamma_one_half_eq] at hgamma
    have hsqrt : Real.sqrt Real.pi ≤ 2 := by
      rw [Real.sqrt_le_iff]
      constructor <;> nlinarith [Real.pi_le_four]
    nlinarith
  · have hxgt : 1 < x := lt_of_not_ge hx1
    by_cases hx2 : x ≤ 2
    · have hconv : ConvexOn ℝ (Set.Ioi 0) Real.Gamma := Real.convexOn_Gamma
      rcases hconv with ⟨_, hineq⟩
      have h := hineq (x := (1 : ℝ)) (y := (2 : ℝ))
          (show (1 : ℝ) ∈ Set.Ioi 0 by norm_num)
          (show (2 : ℝ) ∈ Set.Ioi 0 by norm_num)
          (a := 2 - x) (b := x - 1)
          (by linarith) (by linarith) (by ring)
      have hgamma : Real.Gamma x ≤ 1 := by
        have harg : (2 - x) • (1 : ℝ) + (x - 1) • (2 : ℝ) = x := by
          simp [smul_eq_mul]
          ring
        have hrhs : (2 - x) • Real.Gamma (1 : ℝ) +
            (x - 1) • Real.Gamma (2 : ℝ) = 1 := by
          rw [Real.Gamma_one, Real.Gamma_two]
          simp [smul_eq_mul]
          ring
        rw [← harg]
        exact h.trans_eq hrhs
      have hpow : 1 ≤ x ^ x := Real.one_le_rpow (le_of_lt hxgt) (by positivity)
      nlinarith
    · have hxgt2 : 2 < x := lt_of_not_ge hx2
      let n : ℕ := Nat.floor x
      have hnle : (n : ℝ) ≤ x := by
        dsimp [n]
        exact Nat.floor_le hxpos.le
      have hxlt : x < (n : ℝ) + 1 := by
        dsimp [n]
        exact Nat.lt_floor_add_one x
      have hn2 : 2 ≤ n := by
        by_contra hn
        have hn1 : n ≤ 1 := by omega
        have hn1' : (n : ℝ) ≤ 1 := by exact_mod_cast hn1
        nlinarith
      have hconv : ConvexOn ℝ (Set.Ioi 0) Real.Gamma := Real.convexOn_Gamma
      rcases hconv with ⟨_, hineq⟩
      have h := hineq (x := (n : ℝ)) (y := (n : ℝ) + 1)
          (show (n : ℝ) ∈ Set.Ioi 0 by
            exact Set.mem_Ioi.mpr (by exact_mod_cast (show 0 < n by omega)))
          (show (n : ℝ) + 1 ∈ Set.Ioi 0 by
            exact Set.mem_Ioi.mpr (by positivity))
          (a := (n : ℝ) + 1 - x) (b := x - (n : ℝ))
          (by linarith) (by linarith) (by ring)
      have hmono : Real.Gamma (n : ℝ) ≤ Real.Gamma ((n : ℝ) + 1) := by
        apply Real.Gamma_strictMonoOn_Ici.monotoneOn
        · exact Set.mem_Ici.mpr (by exact_mod_cast hn2)
        · exact Set.mem_Ici.mpr (by exact_mod_cast (show 2 ≤ n + 1 by omega))
        · linarith
      have hgamma : Real.Gamma x ≤ Real.Gamma ((n : ℝ) + 1) := by
        calc
          Real.Gamma x ≤
              ((n : ℝ) + 1 - x) * Real.Gamma (n : ℝ) +
                (x - (n : ℝ)) * Real.Gamma ((n : ℝ) + 1) := by
            have harg : ((n : ℝ) + 1 - x) • (n : ℝ) +
                (x - (n : ℝ)) • ((n : ℝ) + 1) = x := by
              simp [smul_eq_mul]
              ring
            calc
              Real.Gamma x = Real.Gamma
                  (((n : ℝ) + 1 - x) • (n : ℝ) +
                    (x - (n : ℝ)) • ((n : ℝ) + 1)) := congrArg Real.Gamma harg.symm
              _ ≤ ((n : ℝ) + 1 - x) • Real.Gamma (n : ℝ) +
                    (x - (n : ℝ)) • Real.Gamma ((n : ℝ) + 1) := h
              _ = ((n : ℝ) + 1 - x) * Real.Gamma (n : ℝ) +
                    (x - (n : ℝ)) * Real.Gamma ((n : ℝ) + 1) := by
                simp [smul_eq_mul]
          _ ≤ ((n : ℝ) + 1 - x) * Real.Gamma ((n : ℝ) + 1) +
                (x - (n : ℝ)) * Real.Gamma ((n : ℝ) + 1) := by
            gcongr
            linarith
          _ = Real.Gamma ((n : ℝ) + 1) := by
            rw [← add_mul]
            congr 1
            ring
      rw [Real.Gamma_nat_eq_factorial n] at hgamma
      have hfac : (n.factorial : ℝ) ≤ (n : ℝ) ^ n := by
        exact_mod_cast Nat.factorial_le_pow n
      have hbase : (n : ℝ) ^ n ≤ x ^ n := by
        gcongr
      have hexp : x ^ (n : ℝ) ≤ x ^ x := by
        apply Real.rpow_le_rpow_of_exponent_le
        · linarith
        · exact hnle
      have hpow : (n : ℝ) ^ n ≤ x ^ x := by
        calc
          (n : ℝ) ^ n ≤ x ^ n := hbase
          _ = x ^ (n : ℝ) := by rw [Real.rpow_natCast]
          _ ≤ x ^ x := hexp
      nlinarith

/- The root-free integral form of the usual `Lᵖ` moment-growth hypothesis. -/
def LpMomentGrowth {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (K : ℝ) : Prop :=
  AEMeasurable X μ ∧
    ∀ p : ℝ, 1 ≤ p →
      Integrable (fun ω => |X ω| ^ p) μ ∧
        (∫ ω, |X ω| ^ p ∂μ) ≤ (K * Real.sqrt p) ^ p

/-! The tail-to-moment direction of Proposition 2.5.2. -/
theorem tailToAbsoluteMoment
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hX : Measurable X) (hK : 0 < K)
    (hTail : ∀ t : ℝ, 0 ≤ t →
      μ {ω | t < |X ω|} ≤ ENNReal.ofReal (2 * Real.exp (-t ^ 2 / K ^ 2)))
    (p : ℝ) (hp : 1 ≤ p) :
    NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p ≤
      ENNReal.ofReal ((8 * Real.exp 1 * K * Real.sqrt p) ^ p) := by
  have hp0 : 0 < p := lt_of_lt_of_le zero_lt_one hp
  have hformula := NumStability.HDP.Scalar.Preliminaries.momentTailFormula
    (μ := μ) (X := X) hX hp0
  have hupper :
      (∫⁻ t in Set.Ioi 0,
        μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1))) ≤
        ∫⁻ t in Set.Ioi 0,
          ENNReal.ofReal (2 * Real.exp (-t ^ 2 / K ^ 2)) *
            ENNReal.ofReal (t ^ (p - 1)) := by
    apply MeasureTheory.setLIntegral_mono
    · fun_prop
    · intro t ht
      exact mul_le_mul_right' (hTail t (le_of_lt (Set.mem_Ioi.mp ht))) _
  have hInt : IntegrableOn
      (fun t : ℝ => t ^ (p - 1) * Real.exp (-(K⁻¹ ^ 2) * t ^ 2)) (Set.Ioi 0) := by
    apply integrableOn_rpow_mul_exp_neg_mul_sq
    · positivity
    · linarith
  have hscale : ∀ t : ℝ,
      ENNReal.ofReal (2 * Real.exp (-t ^ 2 / K ^ 2)) *
          ENNReal.ofReal (t ^ (p - 1)) =
        ENNReal.ofReal (2 * (t ^ (p - 1) *
          Real.exp (-(K⁻¹ ^ 2) * t ^ 2))) := by
    intro t
    calc
      ENNReal.ofReal (2 * Real.exp (-t ^ 2 / K ^ 2)) *
          ENNReal.ofReal (t ^ (p - 1)) =
        ENNReal.ofReal ((2 * Real.exp (-t ^ 2 / K ^ 2)) *
          (t ^ (p - 1))) := (ENNReal.ofReal_mul (by positivity)).symm
      _ = ENNReal.ofReal (2 * (t ^ (p - 1) *
          Real.exp (-(K⁻¹ ^ 2) * t ^ 2))) := by
        congr 1
        field_simp
  have hInt2 : IntegrableOn
      (fun t : ℝ => 2 * (t ^ (p - 1) *
        Real.exp (-(K⁻¹ ^ 2) * t ^ 2))) (Set.Ioi 0) := hInt.const_mul _
  have hEq2 := MeasureTheory.ofReal_integral_eq_lintegral_ofReal hInt2
    (by
      filter_upwards [MeasureTheory.ae_restrict_mem measurableSet_Ioi] with t ht
      have ht0 : 0 < t := Set.mem_Ioi.mp ht
      positivity)
  have hGamma := integral_rpow_mul_exp_neg_mul_rpow
    (p := (2 : ℝ)) (q := p - 1) (b := K⁻¹ ^ 2) (by norm_num) (by linarith) (by positivity)
  have hIntEval :
      (∫ t in Set.Ioi 0,
        t ^ (p - 1) * Real.exp (-(K⁻¹ ^ 2) * t ^ 2)) =
        (K⁻¹ ^ 2) ^ (-p / 2) * (1 / 2) * Real.Gamma (p / 2) := by
    simpa [mul_comm] using hGamma
  have hupperEval :
      (∫⁻ t in Set.Ioi 0,
        ENNReal.ofReal (2 * Real.exp (-t ^ 2 / K ^ 2)) *
          ENNReal.ofReal (t ^ (p - 1))) ≤
        ENNReal.ofReal (2 * ((K⁻¹ ^ 2) ^ (-p / 2) *
          (1 / 2) * Real.Gamma (p / 2))) := by
    rw [MeasureTheory.setLIntegral_congr_fun measurableSet_Ioi
      (fun t _ => hscale t)]
    rw [← hEq2, MeasureTheory.integral_const_mul, hIntEval]
  have hGammaBound : Real.Gamma (p / 2) ≤ 4 * (p / 2) ^ (p / 2) :=
    gammaUpperBound (by linarith)
  have hcalc :
      ENNReal.ofReal p * ENNReal.ofReal
          (2 * ((K⁻¹ ^ 2) ^ (-p / 2) * (1 / 2) * Real.Gamma (p / 2))) ≤
        ENNReal.ofReal ((8 * Real.exp 1 * K * Real.sqrt p) ^ p) := by
    rw [← ENNReal.ofReal_mul (by positivity : 0 ≤ p)]
    apply ENNReal.ofReal_le_ofReal
    have hKpow : (K⁻¹ ^ 2) ^ (-p / 2) = K ^ p := by
      rw [← Real.rpow_natCast, ← Real.rpow_mul (by positivity : 0 ≤ K⁻¹)]
      rw [show (↑(2 : ℕ) : ℝ) * (-p / 2) = -p by norm_num; ring]
      rw [Real.inv_rpow (by positivity : 0 ≤ K)]
      rw [Real.rpow_neg (by positivity : 0 ≤ K)]
      simp
    rw [hKpow]
    have hexp : p ≤ Real.exp p := by
      nlinarith [Real.add_one_le_exp p]
    have hroot : 0 ≤ Real.sqrt p := by positivity
    have hgam : 0 ≤ Real.Gamma (p / 2) :=
      (Real.Gamma_pos_of_pos (by linarith)).le
    have hpowp : 0 ≤ p ^ (p / 2) := by positivity
    have hbase : (p / 2) ^ (p / 2) ≤ p ^ (p / 2) := by
      apply Real.rpow_le_rpow
      · positivity
      · linarith
      · positivity
    have hmulGamma : p * K ^ p * Real.Gamma (p / 2) ≤
        p * K ^ p * (4 * (p / 2) ^ (p / 2)) := by
      exact mul_le_mul_of_nonneg_left hGammaBound (by positivity)
    have hmulBase : 4 * p * K ^ p * (p / 2) ^ (p / 2) ≤
        4 * p * K ^ p * p ^ (p / 2) := by
      exact mul_le_mul_of_nonneg_left hbase (by positivity)
    have hcoef : 4 * p ≤ 8 * Real.exp p := by
      nlinarith [hexp, Real.exp_pos p]
    have hmulCoef : 4 * p * K ^ p * p ^ (p / 2) ≤
        8 * Real.exp p * K ^ p * p ^ (p / 2) := by
      exact mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_right hcoef (by positivity)) (by positivity)
    have hstep : 2 * p * (K ^ p * (1 / 2) * Real.Gamma (p / 2)) ≤
        8 * Real.exp p * K ^ p * p ^ (p / 2) := by
      calc
        2 * p * (K ^ p * (1 / 2) * Real.Gamma (p / 2)) =
            p * K ^ p * Real.Gamma (p / 2) := by ring
        _ ≤ p * K ^ p * (4 * (p / 2) ^ (p / 2)) := hmulGamma
        _ = 4 * p * K ^ p * (p / 2) ^ (p / 2) := by ring
        _ ≤ 4 * p * K ^ p * p ^ (p / 2) := hmulBase
        _ ≤ 8 * Real.exp p * K ^ p * p ^ (p / 2) := hmulCoef
    have hpnonneg : 0 ≤ p := by linarith
    have h8 : (8 : ℝ) ≤ (8 : ℝ) ^ p := by
      have h := Real.rpow_le_rpow_of_exponent_le
        (x := (8 : ℝ)) (y := (1 : ℝ)) (z := p) (by norm_num) hp
      simpa using h
    have hexprpow : Real.exp p = (Real.exp 1) ^ p := by
      rw [Real.rpow_def_of_pos (Real.exp_pos 1), Real.log_exp]
      congr 1
      ring
    have hconst0 : 8 * Real.exp p ≤ (8 * Real.exp 1) ^ p := by
      calc
        8 * Real.exp p ≤ 8 ^ p * Real.exp p :=
          mul_le_mul_of_nonneg_right h8 (Real.exp_pos p).le
        _ = 8 ^ p * (Real.exp 1) ^ p := by rw [hexprpow]
        _ = (8 * Real.exp 1) ^ p := by
          rw [Real.mul_rpow (by norm_num) (by positivity)]
    have hconst : 8 * Real.exp p * K ^ p * p ^ (p / 2) ≤
        (8 * Real.exp 1 * K * Real.sqrt p) ^ p := by
      have h8e : 0 ≤ (8 : ℝ) * Real.exp 1 := by positivity
      have h8eK : 0 ≤ (8 : ℝ) * Real.exp 1 * K := by positivity
      calc
        8 * Real.exp p * K ^ p * p ^ (p / 2) =
            (8 * Real.exp p) * (K ^ p * p ^ (p / 2)) := by ring
        _ ≤ (8 * Real.exp 1) ^ p * (K ^ p * p ^ (p / 2)) := by
          exact mul_le_mul_of_nonneg_right hconst0 (by positivity)
        _ = (8 * Real.exp 1) ^ p * (K ^ p * (Real.sqrt p) ^ p) := by
          rw [Real.sqrt_eq_rpow, ← Real.rpow_mul (by positivity : 0 ≤ p)]
          congr 2
          ring
        _ = (8 * Real.exp 1 * K * Real.sqrt p) ^ p := by
          rw [Real.mul_rpow h8eK (by positivity), Real.mul_rpow h8e (by positivity)]
          ring
    simpa [mul_assoc, mul_left_comm, mul_comm] using hstep.trans hconst
  calc
    NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p =
        ENNReal.ofReal p *
          (∫⁻ t in Set.Ioi 0,
            μ {ω | t < |X ω|} * ENNReal.ofReal (t ^ (p - 1))) := hformula.1
    _ ≤ ENNReal.ofReal p *
          (∫⁻ t in Set.Ioi 0,
            ENNReal.ofReal (2 * Real.exp (-t ^ 2 / K ^ 2)) *
              ENNReal.ofReal (t ^ (p - 1))) :=
      mul_le_mul_left' hupper _
    _ ≤ ENNReal.ofReal p * ENNReal.ofReal
          (2 * ((K⁻¹ ^ 2) ^ (-p / 2) * (1 / 2) * Real.Gamma (p / 2))) :=
      mul_le_mul_left' hupperEval _
    _ ≤ ENNReal.ofReal ((8 * Real.exp 1 * K * Real.sqrt p) ^ p) := hcalc

theorem tailToLpMomentGrowth
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hX : Measurable X) (hK : 0 < K)
    (hTail : ∀ t : ℝ, 0 ≤ t →
      μ.real {ω | |X ω| ≥ t} ≤ 2 * Real.exp (-t ^ 2 / K ^ 2)) :
    LpMomentGrowth μ X (8 * Real.exp 1 * K) := by
  have hTail' : ∀ t : ℝ, 0 ≤ t →
      μ {ω | t < |X ω|} ≤ ENNReal.ofReal (2 * Real.exp (-t ^ 2 / K ^ 2)) := by
    intro t ht
    let A : Set Ω := {ω | t < |X ω|}
    let B : Set Ω := {ω | |X ω| ≥ t}
    have hAB : A ⊆ B := by
      intro ω hω
      change t < |X ω| at hω
      change t ≤ |X ω|
      exact le_of_lt hω
    have hB : μ B ≤ ENNReal.ofReal (2 * Real.exp (-t ^ 2 / K ^ 2)) := by
      rw [← ENNReal.ofReal_toReal (measure_ne_top μ B)]
      apply ENNReal.ofReal_le_ofReal
      simpa [B, MeasureTheory.measureReal_def] using hTail t ht
    exact (measure_mono hAB).trans hB
  refine ⟨hX.aemeasurable, ?_⟩
  intro p hp
  have hmoment := tailToAbsoluteMoment hX hK hTail' p hp
  have hfinite :
      NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p < (⊤ : ENNReal) :=
    lt_of_le_of_lt hmoment (by simp)
  have hmeas : AEMeasurable (fun ω => |X ω| ^ p) μ := by
    fun_prop
  have hInt : Integrable (fun ω => |X ω| ^ p) μ := by
    refine ⟨hmeas.aestronglyMeasurable, ?_⟩
    rw [hasFiniteIntegral_iff_norm]
    change (∫⁻ ω, ENNReal.ofReal ‖|X ω| ^ p‖ ∂μ) < (⊤ : ENNReal)
    convert hfinite using 1
    apply MeasureTheory.lintegral_congr_ae
    filter_upwards [] with ω
    rw [Real.norm_eq_abs, abs_of_nonneg (Real.rpow_nonneg (abs_nonneg _) _)]
    rfl
  constructor
  · exact hInt
  · have hEq := MeasureTheory.ofReal_integral_eq_lintegral_ofReal hInt
      (Filter.Eventually.of_forall (fun ω => by positivity))
    have hbound : ENNReal.ofReal (∫ ω, |X ω| ^ p ∂μ) ≤
        ENNReal.ofReal ((8 * Real.exp 1 * K * Real.sqrt p) ^ p) := by
      calc
        ENNReal.ofReal (∫ ω, |X ω| ^ p ∂μ) =
            NumStability.HDP.Scalar.Preliminaries.absoluteMoment μ X p := by
          simpa [NumStability.HDP.Scalar.Preliminaries.absoluteMoment,
            Real.norm_eq_abs] using hEq
        _ ≤ ENNReal.ofReal ((8 * Real.exp 1 * K * Real.sqrt p) ^ p) := hmoment
    exact (ENNReal.ofReal_le_ofReal_iff (by positivity)).mp hbound

/-! The moment-to-square-MGF implication from Proposition 2.5.2. -/

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

/-! The all-parameter MGF bound forces centering (Exercise 2.5.4). -/
theorem mgfBoundForcesMeanZero
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hX : Integrable X μ)
    (hMGF : ∀ lam : ℝ,
      Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
        (∫ ω, Real.exp (lam * X ω) ∂μ) ≤ Real.exp (K ^ 2 * lam ^ 2)) :
    (∫ ω, X ω ∂μ) = 0 := by
  let m : ℝ := ∫ ω, X ω ∂μ
  have hquad : ∀ lam : ℝ, lam * m ≤ K ^ 2 * lam ^ 2 := by
    intro lam
    have hconv : ConvexOn ℝ Set.univ (fun x : ℝ => Real.exp (lam * x)) := by
      have hcomp := convexOn_exp.comp_linearMap ((LinearMap.mul ℝ ℝ) lam)
      simpa [Function.comp_def] using hcomp
    have hjensen :=
      NumStability.HDP.Scalar.Preliminaries.jensenIntegral hconv hX (hMGF lam).1
    have hexp : Real.exp (lam * m) ≤ Real.exp (K ^ 2 * lam ^ 2) := by
      calc
        Real.exp (lam * m) ≤
            ∫ ω, Real.exp (lam * X ω) ∂μ := by
          simpa [m, NumStability.HDP.Scalar.Preliminaries.expectation,
            Function.comp_def] using hjensen
        _ ≤ Real.exp (K ^ 2 * lam ^ 2) := (hMGF lam).2
    exact Real.exp_le_exp.mp hexp
  by_contra hm
  have hm2 : 0 < m ^ 2 := sq_pos_of_ne_zero hm
  let d : ℝ := 2 * (K ^ 2 + 1)
  have hd : 0 < d := by
    dsimp [d]
    nlinarith [sq_nonneg K]
  have hbad := hquad (m / d)
  dsimp [d] at hbad
  field_simp [ne_of_gt hd] at hbad
  nlinarith [hm2, sq_nonneg K]

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

/-! The `L²` interpolation estimate used in Exercise 2.6.6. -/
theorem lpExtrapolation
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {Z : Ω → ℝ}
    (hZ1 : MemLp Z 1 μ) (hZ3 : MemLp Z 3 μ) :
    (∫ ω, |Z ω| ^ (2 : ℝ) ∂μ) ^ (1 / 2 : ℝ) ≤
      (∫ ω, |Z ω| ∂μ) ^ (1 / 4 : ℝ) *
        (∫ ω, |Z ω| ^ (3 : ℕ) ∂μ) ^ (1 / 4 : ℝ) := by
  have hf0 := hZ1.norm_rpow_div (q := (1 / 2 : ENNReal))
  have hg0 := hZ3.norm_rpow_div (q := (3 / 2 : ENNReal))
  have hq : (3 : ENNReal) / (3 / 2 : ENNReal) = 2 := by
    rw [ENNReal.div_eq_inv_mul, ENNReal.div_eq_inv_mul]
    rw [ENNReal.mul_inv (by norm_num) (by norm_num)]
    simp only [inv_inv]
    rw [mul_assoc, ENNReal.inv_mul_cancel (by norm_num) (by norm_num), mul_one]
  have hf : MemLp (fun ω => |Z ω| ^ (1 / 2 : ℝ)) 2 μ := by
    convert hf0 using 1 <;> norm_num
  have hg : MemLp (fun ω => |Z ω| ^ (3 / 2 : ℝ)) 2 μ := by
    rw [hq] at hg0
    convert hg0 using 1 <;> norm_num
  have hc := integral_mul_le_Lp_mul_Lq_of_nonneg
    (μ := μ) (p := (2 : ℝ)) (q := (2 : ℝ))
    (f := fun ω => |Z ω| ^ (1 / 2 : ℝ))
    (g := fun ω => |Z ω| ^ (3 / 2 : ℝ)) Real.HolderConjugate.two_two
    (Filter.Eventually.of_forall (fun ω => Real.rpow_nonneg (abs_nonneg _) _))
    (Filter.Eventually.of_forall (fun ω => Real.rpow_nonneg (abs_nonneg _) _))
    (by simpa using hf) (by simpa using hg)
  have hfg : (fun ω =>
      (|Z ω| ^ (1 / 2 : ℝ)) * (|Z ω| ^ (3 / 2 : ℝ))) =
      (fun ω => |Z ω| ^ (2 : ℝ)) := by
    funext ω
    rw [← Real.rpow_add_of_nonneg (abs_nonneg _) (by positivity) (by positivity)]
    have h : (1 / 2 : ℝ) + 3 / 2 = 2 := by ring
    rw [h]
  have hff : (fun ω =>
      (|Z ω| ^ (1 / 2 : ℝ)) ^ (2 : ℝ)) =
      (fun ω => |Z ω|) := by
    funext ω
    rw [← Real.rpow_mul (abs_nonneg _)]
    have h : (1 / 2 : ℝ) * 2 = 1 := by ring
    rw [h, Real.rpow_one]
  have hgg : (fun ω =>
      (|Z ω| ^ (3 / 2 : ℝ)) ^ (2 : ℝ)) =
      (fun ω => |Z ω| ^ (3 : ℕ)) := by
    funext ω
    rw [← Real.rpow_mul (abs_nonneg _)]
    have h : (3 / 2 : ℝ) * 2 = 3 := by ring
    rw [h]
    exact Real.rpow_natCast _ 3
  rw [hfg, hff, hgg] at hc
  have hpow := Real.rpow_le_rpow
    (integral_nonneg_of_ae (Filter.Eventually.of_forall (fun ω => by positivity)))
    hc (by norm_num : (0 : ℝ) ≤ 1 / 2)
  have hA : 0 ≤ ∫ ω, |Z ω| ∂μ :=
    integral_nonneg_of_ae (Filter.Eventually.of_forall (fun ω => by positivity))
  have hB : 0 ≤ ∫ ω, |Z ω| ^ (3 : ℕ) ∂μ :=
    integral_nonneg_of_ae (Filter.Eventually.of_forall (fun ω => by positivity))
  calc
    (∫ ω, |Z ω| ^ (2 : ℝ) ∂μ) ^ (1 / 2 : ℝ) ≤
        ((∫ ω, |Z ω| ∂μ) ^ (1 / 2 : ℝ) *
          (∫ ω, |Z ω| ^ (3 : ℕ) ∂μ) ^ (1 / 2 : ℝ)) ^ (1 / 2 : ℝ) := hpow
    _ = (∫ ω, |Z ω| ∂μ) ^ (1 / 4 : ℝ) *
        (∫ ω, |Z ω| ^ (3 : ℕ) ∂μ) ^ (1 / 4 : ℝ) := by
      rw [← Real.mul_rpow hA hB]
      rw [← Real.rpow_mul (mul_nonneg hA hB)]
      norm_num
      rw [Real.mul_rpow hA hB]

/-! The Gaussian sum law in equation (2.18), together with its weighted form. -/
theorem independentGaussianSumLaw {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {σ : ι → ℝ≥0}
    (hLaw : ∀ i, HasLaw (X i) (gaussianReal 0 (σ i)) μ)
    (hIndep : iIndepFun X μ) :
    HasLaw (fun ω => ∑ i, X i ω)
      (gaussianReal 0 (∑ i, σ i)) μ := by
  have hGaussian : ∀ i, HasGaussianLaw (X i) μ := fun i =>
    (hLaw i).hasGaussianLaw
  have hSumGaussian : HasGaussianLaw (fun ω => ∑ i, X i ω) μ :=
    hIndep.hasGaussianLaw_fun_sum hGaussian
  have hLp : ∀ i, MemLp (X i) 2 μ := fun i => (hGaussian i).memLp_two
  have hPair : (↑(Finset.univ : Finset ι) : Set ι).Pairwise
      (fun i j => X i ⟂ᵢ[μ] X j) := by
    intro i hi j hj hij
    exact hIndep.indepFun hij
  have hVar_i : ∀ i, Var[X i; μ] = (σ i : ℝ) := by
    intro i
    calc
      Var[X i; μ] = Var[id; μ.map (X i)] := by
        symm
        simpa using (variance_map (X := id) (Y := X i)
          (μ := μ) (by fun_prop) (hLaw i).aemeasurable)
      _ = Var[id; gaussianReal 0 (σ i)] := by rw [hLaw i |>.map_eq]
      _ = (σ i : ℝ) := by simp [variance_id_gaussianReal]
  have hsum_fun : (fun ω => ∑ i, X i ω) = ∑ i, X i := by
    funext ω
    simp
  have hVar : Var[fun ω => ∑ i, X i ω; μ] = ∑ i, (σ i : ℝ) := by
    have hVar' := IndepFun.variance_sum (s := Finset.univ) (fun i _ => hLp i) hPair
    calc
      Var[fun ω => ∑ i, X i ω; μ] = Var[∑ i, X i; μ] := by rw [hsum_fun]
      _ = ∑ i, Var[X i; μ] := by simpa using hVar'
      _ = ∑ i, (σ i : ℝ) := by simp [hVar_i]
  have hMean_i : ∀ i, (∫ ω, X i ω ∂μ) = 0 := by
    intro i
    calc
      (∫ ω, X i ω ∂μ) = ∫ x, id x ∂(μ.map (X i)) := by
        symm
        simpa using (integral_map (hLaw i).aemeasurable aestronglyMeasurable_id)
      _ = ∫ x, id x ∂(gaussianReal 0 (σ i)) := by rw [hLaw i |>.map_eq]
      _ = 0 := by simp
  have hMean : (∫ ω, (∑ i, X i ω) ∂μ) = 0 := by
    rw [integral_finset_sum]
    · simp [hMean_i]
    · intro i hi
      exact (hGaussian i).integrable
  have hEq := hSumGaussian.isGaussian_map.eq_gaussianReal (μ.map (fun ω => ∑ i, X i ω))
  refine { aemeasurable := hSumGaussian.aemeasurable, map_eq := ?_ }
  calc
    μ.map (fun ω => ∑ i, X i ω) =
        gaussianReal (∫ x, id x ∂μ.map (fun ω => ∑ i, X i ω))
          Var[id; μ.map (fun ω => ∑ i, X i ω)].toNNReal := hEq
    _ = gaussianReal 0 (∑ i, σ i) := by
      rw [integral_map hSumGaussian.aemeasurable aestronglyMeasurable_id]
      rw [variance_map aemeasurable_id hSumGaussian.aemeasurable]
      simp only [id_eq, Function.id_comp]
      rw [hMean, hVar]
      congr 2
      apply NNReal.eq
      have hnonneg : 0 ≤ ∑ i, (σ i : ℝ) :=
        Finset.sum_nonneg fun i _ => (σ i).property
      rw [Real.coe_toNNReal _ hnonneg]
      simp

/-! Parameterized five-way interface for Proposition 2.5.2. -/
def SubGaussianTailBound {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (K : ℝ) : Prop :=
  Measurable X ∧ 0 < K ∧
    ∀ t : ℝ, 0 ≤ t →
      μ.real {ω | |X ω| ≥ t} ≤ 2 * Real.exp (-t ^ 2 / K ^ 2)

def SubGaussianMomentBound {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (K : ℝ) : Prop :=
  Measurable X ∧ 0 < K ∧ LpMomentGrowth μ X K

def SubGaussianSquareWindow {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (K : ℝ) : Prop :=
  Measurable X ∧ 0 < K ∧
    ∀ lam : ℝ, |lam| ≤ K⁻¹ →
      Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
        (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤
          Real.exp (K ^ 2 * lam ^ 2)

def SubGaussianSquarePoint {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (K : ℝ) : Prop :=
  Measurable X ∧ 0 < K ∧
    Integrable (fun ω => Real.exp (X ω ^ 2 / K ^ 2)) μ ∧
      (∫ ω, Real.exp (X ω ^ 2 / K ^ 2) ∂μ) ≤ 2

/-! Threshold-parametrized versions of the tail and point square-MGF clauses.

Remark 2.5.3 says that the printed threshold `2` can be replaced by any fixed
`A > 1`, at the cost of changing the scale by a constant depending only on
`A`.  These predicates expose that threshold so the rescaling statement can be
checked directly rather than being hidden in prose. -/
def SubGaussianTailBoundWithThreshold {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (K A : ℝ) : Prop :=
  Measurable X ∧ 0 < K ∧
    ∀ t : ℝ, 0 ≤ t →
      μ.real {ω | |X ω| ≥ t} ≤ A * Real.exp (-t ^ 2 / K ^ 2)

def SubGaussianSquarePointWithThreshold {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (K A : ℝ) : Prop :=
  Measurable X ∧ 0 < K ∧
    Integrable (fun ω => Real.exp (X ω ^ 2 / K ^ 2)) μ ∧
      (∫ ω, Real.exp (X ω ^ 2 / K ^ 2) ∂μ) ≤ A

private lemma subGaussianTailThreshold_rescale
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K A B : ℝ} (hA : 1 < A) (hB : 1 < B) (hK : 0 < K)
    (hTail : ∀ t : ℝ, 0 ≤ t →
      μ.real {ω | |X ω| ≥ t} ≤ A * Real.exp (-t ^ 2 / K ^ 2)) :
    ∃ K' : ℝ, 0 < K' ∧
      ∀ t : ℝ, 0 ≤ t →
        μ.real {ω | |X ω| ≥ t} ≤ B * Real.exp (-t ^ 2 / K' ^ 2) := by
  by_cases hAB : A ≤ B
  · refine ⟨K, hK, fun t ht => ?_⟩
    calc
      μ.real {ω | |X ω| ≥ t} ≤ A * Real.exp (-t ^ 2 / K ^ 2) := hTail t ht
      _ ≤ B * Real.exp (-t ^ 2 / K ^ 2) := by
        exact mul_le_mul_of_nonneg_right hAB (le_of_lt (Real.exp_pos _))
  · have hBA : B < A := lt_of_not_ge hAB
    have hLogA : 0 < Real.log A := Real.log_pos hA
    have hLogB : 0 < Real.log B := Real.log_pos hB
    have hLogBA : Real.log B < Real.log A := Real.log_lt_log (by linarith) hBA
    let c : ℝ := Real.log B / Real.log A
    have hc : 0 < c := div_pos hLogB hLogA
    have hc1 : c < 1 := (div_lt_one hLogA).2 hLogBA
    let K' : ℝ := K / Real.sqrt c
    have hK' : 0 < K' := div_pos hK (Real.sqrt_pos.2 hc)
    have hSqSqrt : (Real.sqrt c) ^ 2 = c := Real.sq_sqrt hc.le
    have hKsq : K' ^ 2 = K ^ 2 / c := by
      dsimp [K']
      field_simp [ne_of_gt hK, ne_of_gt (Real.sqrt_pos.2 hc)]
      exact hSqSqrt.symm
    have hScale (t : ℝ) : t ^ 2 / K' ^ 2 = c * (t ^ 2 / K ^ 2) := by
      rw [hKsq]
      field_simp [ne_of_gt hK, ne_of_gt hc]
    have hSourceExponent (t : ℝ) : -t ^ 2 / K ^ 2 =
        -(t ^ 2 / K ^ 2) := by ring
    have hTargetExponent (t : ℝ) : -t ^ 2 / K' ^ 2 =
        -(c * (t ^ 2 / K ^ 2)) := by
      calc
        -t ^ 2 / K' ^ 2 = -(t ^ 2 / K' ^ 2) := by ring
        _ = -(c * (t ^ 2 / K ^ 2)) := by rw [hScale]
    have hProb (s : Set Ω) : μ.real s ≤ 1 := by
      calc
        μ.real s ≤ μ.real Set.univ := measureReal_mono (Set.subset_univ _)
        _ = 1 := probReal_univ
    refine ⟨K', hK', fun t ht => ?_⟩
    let u : ℝ := t ^ 2 / K ^ 2
    by_cases hu : u ≤ Real.log A
    · have hcu : c * u ≤ Real.log B := by
        have hcLog : c * Real.log A = Real.log B := by
          dsimp [c]
          field_simp [ne_of_gt hLogA]
        nlinarith
      have hExp : B⁻¹ ≤ Real.exp (-(c * u)) := by
        calc
          B⁻¹ = Real.exp (-Real.log B) := by
            rw [Real.exp_neg, Real.exp_log (by linarith)]
          _ ≤ Real.exp (-(c * u)) := by
            apply Real.exp_le_exp.mpr
            linarith
      have hOne : (1 : ℝ) ≤ B * Real.exp (-(c * u)) := by
        calc
          (1 : ℝ) = B * B⁻¹ := by field_simp [ne_of_gt hB]
          _ ≤ B * Real.exp (-(c * u)) :=
            mul_le_mul_of_nonneg_left hExp (by linarith)
      calc
        μ.real {ω | |X ω| ≥ t} ≤ 1 := hProb _
        _ ≤ B * Real.exp (-(c * u)) := hOne
        _ = B * Real.exp (-t ^ 2 / K' ^ 2) := by
          rw [hTargetExponent, show u = t ^ 2 / K ^ 2 by rfl]
    · have hu' : Real.log A < u := lt_of_not_ge hu
      have hExpCmp : A * Real.exp (-u) ≤ B * Real.exp (-(c * u)) := by
        rw [← Real.exp_log (by linarith : 0 < A), ← Real.exp_log (by linarith : 0 < B)]
        rw [← Real.exp_add, ← Real.exp_add]
        apply Real.exp_le_exp.mpr
        have hnonneg : 0 ≤ (1 - c) * (u - Real.log A) :=
          mul_nonneg (by linarith) (by linarith)
        have hcLog : c * Real.log A = Real.log B := by
          dsimp [c]
          field_simp [ne_of_gt hLogA]
        nlinarith
      calc
        μ.real {ω | |X ω| ≥ t} ≤ A * Real.exp (-u) := by
          calc
            μ.real {ω | |X ω| ≥ t} ≤ A * Real.exp (-t ^ 2 / K ^ 2) := hTail t ht
            _ = A * Real.exp (-u) := by rw [hSourceExponent, show u = t ^ 2 / K ^ 2 by rfl]
        _ ≤ B * Real.exp (-(c * u)) := hExpCmp
        _ = B * Real.exp (-t ^ 2 / K' ^ 2) := by
          rw [hTargetExponent, show u = t ^ 2 / K ^ 2 by rfl]

private lemma subGaussianSquarePointThreshold_rescale
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K A B : ℝ} (hX : Measurable X)
    (hA : 1 < A) (hB : 1 < B) (hK : 0 < K)
    (hInt : Integrable (fun ω => Real.exp (X ω ^ 2 / K ^ 2)) μ)
    (hBound : (∫ ω, Real.exp (X ω ^ 2 / K ^ 2) ∂μ) ≤ A) :
    ∃ K' : ℝ, 0 < K' ∧
      Integrable (fun ω => Real.exp (X ω ^ 2 / K' ^ 2)) μ ∧
        (∫ ω, Real.exp (X ω ^ 2 / K' ^ 2) ∂μ) ≤ B := by
  by_cases hAB : A ≤ B
  · refine ⟨K, hK, hInt, hBound.trans hAB⟩
  · have hBA : B < A := lt_of_not_ge hAB
    have hA1 : 0 < A - 1 := by linarith
    have hB1 : 0 < B - 1 := by linarith
    let c : ℝ := (B - 1) / (A - 1)
    have hc : 0 < c := div_pos hB1 hA1
    have hc1 : c < 1 := (div_lt_one hA1).2 (by linarith)
    let K' : ℝ := K / Real.sqrt c
    have hK' : 0 < K' := div_pos hK (Real.sqrt_pos.2 hc)
    have hSqSqrt : (Real.sqrt c) ^ 2 = c := Real.sq_sqrt hc.le
    have hKsq : K' ^ 2 = K ^ 2 / c := by
      dsimp [K']
      field_simp [ne_of_gt hK, ne_of_gt (Real.sqrt_pos.2 hc)]
      exact hSqSqrt.symm
    have hScale (ω : Ω) : X ω ^ 2 / K' ^ 2 =
        c * (X ω ^ 2 / K ^ 2) := by
      rw [hKsq]
      field_simp [ne_of_gt hK, ne_of_gt hc]
    have hChord (y : ℝ) : Real.exp (c * y) ≤ (1 - c) + c * Real.exp y := by
      have hConv := convexOn_exp.2 (Set.mem_univ (0 : ℝ))
        (Set.mem_univ y) (sub_nonneg.mpr hc1.le) hc.le (by ring)
      simpa only [smul_eq_mul, zero_mul, mul_zero, add_zero, zero_add, Real.exp_zero,
        mul_one] using hConv
    let f : Ω → ℝ := fun ω => Real.exp (X ω ^ 2 / K ^ 2)
    let g : Ω → ℝ := fun ω => (1 - c) + c * f ω
    have hGInt : Integrable g μ := by
      dsimp [g]
      exact (integrable_const (1 - c)).add (hInt.const_mul c)
    have hTargetInt : Integrable (fun ω => Real.exp (X ω ^ 2 / K' ^ 2)) μ := by
      refine hGInt.mono' ?_ ?_
      · fun_prop
      · filter_upwards [] with ω
        rw [hScale]
        simpa [f, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)] using
          hChord (X ω ^ 2 / K ^ 2)
    have hTargetBound :
        (∫ ω, Real.exp (X ω ^ 2 / K' ^ 2) ∂μ) ≤ B := by
      have hPoint : ∀ᵐ ω ∂μ,
          Real.exp (X ω ^ 2 / K' ^ 2) ≤ g ω := by
        filter_upwards [] with ω
        rw [hScale]
        simpa [f] using hChord (X ω ^ 2 / K ^ 2)
      calc
        (∫ ω, Real.exp (X ω ^ 2 / K' ^ 2) ∂μ) ≤ ∫ ω, g ω ∂μ :=
          integral_mono_ae hTargetInt hGInt hPoint
        _ = (1 - c) + c * (∫ ω, f ω ∂μ) := by
          dsimp [g]
          rw [integral_add (integrable_const (1 - c)) (hInt.const_mul c)]
          simp [f, integral_const_mul, probReal_univ]
        _ ≤ B := by
          have hBoundF : (∫ ω, f ω ∂μ) ≤ A := by simpa [f] using hBound
          have hMul := mul_le_mul_of_nonneg_left hBoundF hc.le
          calc
            (1 - c) + c * (∫ ω, f ω ∂μ) ≤ (1 - c) + c * A := by linarith
            _ = B := by
              dsimp [c]
              field_simp [ne_of_gt hA1]
              ring
    exact ⟨K', hK', hTargetInt, hTargetBound⟩

/-! Remark 2.5.3: the fixed threshold `2` in the tail and point square-MGF
clauses may be replaced by any fixed `A > 1`, with only an `A`-dependent
rescaling of the positive parameter. -/
theorem subGaussianThresholdRemark
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (A : ℝ) (hA : 1 < A) :
    ((∃ K : ℝ, 0 < K ∧ SubGaussianTailBoundWithThreshold μ X K 2) ↔
      ∃ K : ℝ, 0 < K ∧ SubGaussianTailBoundWithThreshold μ X K A) ∧
    ((∃ K : ℝ, 0 < K ∧ SubGaussianSquarePointWithThreshold μ X K 2) ↔
      ∃ K : ℝ, 0 < K ∧ SubGaussianSquarePointWithThreshold μ X K A) := by
  constructor
  · constructor
    · rintro ⟨K, hK, hTail⟩
      rcases subGaussianTailThreshold_rescale (A := 2) (B := A)
          (by norm_num) hA hK hTail.2.2 with ⟨K', hK', hTail'⟩
      exact ⟨K', hK', hTail.1, hK', hTail',⟩
    · rintro ⟨K, hK, hTail⟩
      rcases subGaussianTailThreshold_rescale (A := A) (B := 2)
          hA (by norm_num) hK hTail.2.2 with ⟨K', hK', hTail'⟩
      exact ⟨K', hK', hTail.1, hK', hTail',⟩
  · constructor
    · rintro ⟨K, hK, hPoint⟩
      rcases subGaussianSquarePointThreshold_rescale (A := 2) (B := A)
          hPoint.1 (by norm_num) hA hK hPoint.2.2.1 hPoint.2.2.2 with
        ⟨K', hK', hInt', hBound'⟩
      exact ⟨K', hK', hPoint.1, hK', hInt', hBound'⟩
    · rintro ⟨K, hK, hPoint⟩
      rcases subGaussianSquarePointThreshold_rescale (A := A) (B := 2)
          hPoint.1 hA (by norm_num) hK hPoint.2.2.1 hPoint.2.2.2 with
        ⟨K', hK', hInt', hBound'⟩
      exact ⟨K', hK', hPoint.1, hK', hInt', hBound'⟩

def SubGaussianLinearMGF {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (K : ℝ) : Prop :=
  Measurable X ∧ 0 < K ∧ Integrable X μ ∧
    (∫ ω, X ω ∂μ) = 0 ∧
      ∀ lam : ℝ,
        Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
          (∫ ω, Real.exp (lam * X ω) ∂μ) ≤ Real.exp (K ^ 2 * lam ^ 2)

inductive SubGaussianPropertyKind
  | tail
  | moment
  | squareWindow
  | squarePoint
  | linearMGF

def SubGaussianProperty {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) :
    SubGaussianPropertyKind → ℝ → Prop
  | .tail => SubGaussianTailBound μ X
  | .moment => SubGaussianMomentBound μ X
  | .squareWindow => SubGaussianSquareWindow μ X
  | .squarePoint => SubGaussianSquarePoint μ X
  | .linearMGF => SubGaussianLinearMGF μ X

private theorem subGaussianMomentToSquareWindow
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hMom : SubGaussianMomentBound μ X K) :
    SubGaussianSquareWindow μ X (8 * K) := by
  have he : Real.exp 1 ≤ 4 := by
    exact le_trans (le_of_lt Real.exp_one_lt_d9) (by norm_num)
  refine ⟨hMom.1, by positivity, ?_⟩
  intro lam hlam
  have hsmall : |lam| ≤ (4 * K)⁻¹ := by
    calc
      |lam| ≤ (8 * K)⁻¹ := hlam
      _ ≤ (4 * K)⁻¹ := by
        have h := one_div_le_one_div_of_le (by positivity : (0 : ℝ) < 4 * K)
          (by nlinarith : 4 * K ≤ 8 * K)
        simpa [one_div] using h
  have h := momentToSquareMGF hK hMom.2.2 lam hsmall
  refine ⟨h.1, ?_⟩
  calc
    (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤
        Real.exp (4 * Real.exp 1 * (lam * K) ^ 2) := h.2
    _ ≤ Real.exp ((8 * K) ^ 2 * lam ^ 2) := by
      apply Real.exp_le_exp.mpr
      have hmul := mul_le_mul_of_nonneg_right he
        (by positivity : 0 ≤ 4 * (lam * K) ^ 2)
      calc
        4 * Real.exp 1 * (lam * K) ^ 2 ≤ 16 * (lam * K) ^ 2 := by
          nlinarith
        _ ≤ 64 * (lam * K) ^ 2 := by
          nlinarith [sq_nonneg (lam * K)]
        _ = (8 * K) ^ 2 * lam ^ 2 := by ring

private theorem subGaussianSquareWindowToPoint
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hSquare : SubGaussianSquareWindow μ X K) :
    SubGaussianSquarePoint μ X (2 * K) := by
  have hparam : |(2 * K)⁻¹| ≤ K⁻¹ := by
    rw [abs_of_pos (by positivity)]
    have htwo : (0 : ℝ) < 2 * K := by positivity
    have h := one_div_le_one_div_of_le hK (by nlinarith : K ≤ 2 * K)
    simpa [one_div, abs_of_pos htwo] using h
  have h := hSquare.2.2 ((2 * K)⁻¹) hparam
  have hEq : (fun ω => Real.exp (((2 * K)⁻¹) ^ 2 * X ω ^ 2)) =
      (fun ω => Real.exp (X ω ^ 2 / (2 * K) ^ 2)) := by
    funext ω
    congr 1
    field_simp
  refine ⟨hSquare.1, by positivity, ?_, ?_⟩
  · rw [hEq] at h
    exact h.1
  · calc
      (∫ ω, Real.exp (X ω ^ 2 / (2 * K) ^ 2) ∂μ) =
          ∫ ω, Real.exp (((2 * K)⁻¹) ^ 2 * X ω ^ 2) ∂μ := by
            rw [hEq]
      _ ≤ Real.exp (K ^ 2 * ((2 * K)⁻¹) ^ 2) := h.2
      _ = Real.exp (1 / 4) := by
        congr 1
        field_simp
        norm_num
      _ ≤ 2 := by
        apply le_trans (Real.exp_bound_div_one_sub_of_interval (by norm_num) (by norm_num))
        norm_num

private theorem subGaussianSquarePointToTail
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hPoint : SubGaussianSquarePoint μ X K) :
    SubGaussianTailBound μ X K := by
  refine ⟨hPoint.1, hPoint.2.1, ?_⟩
  intro t ht
  exact squareMGFToTail hPoint.1 hPoint.2.1
    ⟨hPoint.2.2.1, hPoint.2.2.2⟩ ht

private theorem subGaussianTailToMoment
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hTail : SubGaussianTailBound μ X K) :
    SubGaussianMomentBound μ X (8 * Real.exp 1 * K) := by
  exact ⟨hTail.1,
    mul_pos (mul_pos (by norm_num) (Real.exp_pos 1)) hTail.2.1,
    tailToLpMomentGrowth hTail.1 hTail.2.1 hTail.2.2⟩

private theorem subGaussianSquareWindowToLinear
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0)
    (hSquare : SubGaussianSquareWindow μ X K) :
    SubGaussianLinearMGF μ X (2 * K) := by
  let Y : Ω → ℝ := fun ω => X ω / K
  have hY : Measurable Y := by
    simpa [Y] using hSquare.1.div_const K
  have hSquareY : SquareMGFLocal μ Y 1 := by
    refine ⟨hY.aemeasurable, ?_⟩
    intro t ht
    have hparam : |t / K| ≤ K⁻¹ := by
      calc
        |t / K| = |t| / K := by rw [abs_div, abs_of_pos hK]
        _ ≤ 1 / K := div_le_div_of_nonneg_right ht hK.le
        _ = K⁻¹ := by rw [one_div]
    have h := hSquare.2.2 (t / K) hparam
    have hEq : (fun ω => Real.exp (t ^ 2 * Y ω ^ 2)) =
        (fun ω => Real.exp ((t / K) ^ 2 * X ω ^ 2)) := by
      funext ω
      congr 1
      dsimp [Y]
      field_simp
    refine ⟨?_, ?_⟩
    · rw [← hEq] at h
      exact h.1
    · calc
        (∫ ω, Real.exp (t ^ 2 * Y ω ^ 2) ∂μ) =
            ∫ ω, Real.exp ((t / K) ^ 2 * X ω ^ 2) ∂μ := by rw [hEq]
        _ ≤ Real.exp (K ^ 2 * (t / K) ^ 2) := h.2
        _ = Real.exp (1 * t ^ 2) := by
          congr 1
          field_simp
  have hYCenter : Integrable Y μ ∧ (∫ ω, Y ω ∂μ) = 0 := by
    refine ⟨?_, ?_⟩
    · simpa [Y, div_eq_inv_mul] using hCenter.1.const_mul K⁻¹
    · have hInt := hCenter.1.const_mul K⁻¹
      calc
        (∫ ω, Y ω ∂μ) = ∫ ω, K⁻¹ * X ω ∂μ := by
          congr 1
          funext ω
          dsimp [Y]
          field_simp
        _ = K⁻¹ * (∫ ω, X ω ∂μ) := by rw [integral_const_mul]
        _ = 0 := by rw [hCenter.2]; ring
  have h := squareMGFToMGF (by norm_num : (0 : ℝ) ≤ 1)
    hYCenter hSquareY
  refine ⟨hSquare.1, by positivity, hCenter.1, hCenter.2, ?_⟩
  intro lam
  have h' := h (lam * K)
  have hEq : (fun ω => Real.exp ((lam * K) * Y ω)) =
      (fun ω => Real.exp (lam * X ω)) := by
    funext ω
    congr 1
    dsimp [Y]
    field_simp
  refine ⟨?_, ?_⟩
  · simpa [hEq] using h'.1
  · calc
      (∫ ω, Real.exp (lam * X ω) ∂μ) =
          ∫ ω, Real.exp ((lam * K) * Y ω) ∂μ := by rw [hEq]
      _ ≤ Real.exp ((1 + 1 / 2) * (lam * K) ^ 2) := h'.2
      _ ≤ Real.exp ((2 * K) ^ 2 * lam ^ 2) := by
        apply Real.exp_le_exp.mpr
        nlinarith [sq_nonneg (lam * K)]

private theorem subGaussianLinearToTail
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hLinear : SubGaussianLinearMGF μ X K) :
    SubGaussianTailBound μ X (2 * K) := by
  refine ⟨hLinear.1, ?_, ?_⟩
  · nlinarith [hLinear.2.1]
  · intro t ht
    convert mgfToTail hLinear.1 hLinear.2.1 hLinear.2.2.2.2 ht using 1 <;> ring

private theorem subGaussianToTail
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (i : SubGaussianPropertyKind) {K : ℝ} (hK : 0 < K)
    (hProp : SubGaussianProperty μ X i K) :
    ∃ T : ℝ, 0 < T ∧ T ≤ 16 * K ∧ SubGaussianTailBound μ X T := by
  cases i with
  | tail => exact ⟨K, hK, by nlinarith, hProp⟩
  | moment =>
      have hSq := subGaussianMomentToSquareWindow hK hProp
      have hPoint := subGaussianSquareWindowToPoint (by positivity) hSq
      have hTail := subGaussianSquarePointToTail hPoint
      refine ⟨16 * K, by positivity, le_rfl, ?_⟩
      convert hTail using 1 <;> ring
  | squareWindow =>
      have hPoint := subGaussianSquareWindowToPoint hK hProp
      have hTail := subGaussianSquarePointToTail hPoint
      refine ⟨2 * K, by positivity, by nlinarith, ?_⟩
      simpa [SubGaussianProperty] using hTail
  | squarePoint =>
      have hTail := subGaussianSquarePointToTail hProp
      refine ⟨K, hK, by nlinarith, ?_⟩
      simpa [SubGaussianProperty] using hTail
  | linearMGF =>
      have hTail := subGaussianLinearToTail hProp
      refine ⟨2 * K, by positivity, by nlinarith, ?_⟩
      simpa [SubGaussianProperty] using hTail

private theorem subGaussianFromTail
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0)
    (i : SubGaussianPropertyKind) {T : ℝ} (hT : 0 < T)
    (hTail : SubGaussianTailBound μ X T) :
    ∃ K : ℝ, 0 < K ∧ K ≤ 128 * Real.exp 1 * T ∧
      SubGaussianProperty μ X i K := by
  cases i with
  | tail =>
      refine ⟨T, hT, ?_, hTail⟩
      have he : (1 : ℝ) ≤ Real.exp 1 := Real.one_le_exp (by norm_num)
      have h := mul_le_mul_of_nonneg_right
        (show (1 : ℝ) ≤ 128 * Real.exp 1 by nlinarith) hT.le
      simpa using h
  | moment =>
      let K := 8 * Real.exp 1 * T
      have hMom := subGaussianTailToMoment hTail
      refine ⟨K, by dsimp [K]; positivity, ?_, ?_⟩
      · have h : (8 : ℝ) ≤ 128 := by norm_num
        have he : 0 ≤ Real.exp 1 * T := by positivity
        have hbound := mul_le_mul_of_nonneg_right h he
        simpa [K, mul_assoc] using hbound
      · simpa [SubGaussianProperty, K] using hMom
  | squareWindow =>
      let K := 64 * Real.exp 1 * T
      have hMom := subGaussianTailToMoment hTail
      have hSq := subGaussianMomentToSquareWindow (by
        positivity) hMom
      refine ⟨K, by dsimp [K]; positivity, ?_, ?_⟩
      · have h : (64 : ℝ) ≤ 128 := by norm_num
        have he : 0 ≤ Real.exp 1 * T := by positivity
        have hbound := mul_le_mul_of_nonneg_right h he
        simpa [K, mul_assoc] using hbound
      · convert hSq using 1 <;> simp [SubGaussianProperty, K] <;> ring
  | squarePoint =>
      let K := 128 * Real.exp 1 * T
      have hMom := subGaussianTailToMoment hTail
      have hSq := subGaussianMomentToSquareWindow (by
        positivity) hMom
      have hPoint := subGaussianSquareWindowToPoint (by
        positivity) hSq
      refine ⟨K, by dsimp [K]; positivity, le_rfl, ?_⟩
      convert hPoint using 1 <;> simp [SubGaussianProperty, K] <;> ring
  | linearMGF =>
      let K₀ := 64 * Real.exp 1 * T
      let K := 2 * K₀
      have hMom := subGaussianTailToMoment hTail
      have hSq := subGaussianMomentToSquareWindow (by
        positivity) hMom
      have hLinear := subGaussianSquareWindowToLinear (by
        positivity) hCenter hSq
      refine ⟨K, by dsimp [K, K₀]; positivity, ?_, ?_⟩
      · dsimp [K, K₀]
        exact le_of_eq (by ring)
      · convert hLinear using 1 <;> simp [SubGaussianProperty, K, K₀] <;> ring

/-! Stable compositional form of Proposition 2.5.2. -/
theorem subGaussianCharacterization
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0) :
    ∃ C : ℝ, 1 ≤ C ∧
      ∀ i j : SubGaussianPropertyKind, ∀ {Ki : ℝ}, 0 < Ki →
        SubGaussianProperty μ X i Ki →
          ∃ Kj : ℝ, 0 < Kj ∧ Kj ≤ C * Ki ∧
            SubGaussianProperty μ X j Kj := by
  have he : (1 : ℝ) ≤ Real.exp 1 := Real.one_le_exp (by norm_num)
  refine ⟨4096 * Real.exp 1, by nlinarith, ?_⟩
  intro i j Ki hKi hProp
  rcases subGaussianToTail i hKi hProp with
    ⟨T, hT, hTbound, hTail⟩
  rcases subGaussianFromTail hCenter j hT hTail with
    ⟨Kj, hKj, hKjbound, hResult⟩
  refine ⟨Kj, hKj, ?_, hResult⟩
  calc
    Kj ≤ 128 * Real.exp 1 * T := hKjbound
    _ ≤ 128 * Real.exp 1 * (16 * Ki) := by
      exact mul_le_mul_of_nonneg_left hTbound (by positivity)
    _ = 2048 * Real.exp 1 * Ki := by ring
    _ ≤ 4096 * Real.exp 1 * Ki := by
      have hpos : 0 < Real.exp 1 * Ki := mul_pos (Real.exp_pos 1) hKi
      nlinarith

/-! The extended `ψ₂` gauge from Definition 2.5.6. -/
def PsiTwoAdmissible {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) (t : ℝ≥0∞) : Prop :=
  Measurable X ∧ t ≠ 0 ∧ t ≠ ∞ ∧
    Integrable (fun ω => Real.exp (X ω ^ 2 / t.toReal ^ 2)) μ ∧
      (∫ ω, Real.exp (X ω ^ 2 / t.toReal ^ 2) ∂μ) ≤ 2

noncomputable def PsiTwoGauge {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : ℝ≥0∞ :=
  sInf {t : ℝ≥0∞ | PsiTwoAdmissible μ X t}

theorem psiTwoGauge_finite_iff
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {X : Ω → ℝ} :
    PsiTwoGauge μ X < ∞ ↔
      ∃ K : ℝ, 0 < K ∧ SubGaussianSquarePoint μ X K := by
  constructor
  · intro hGauge
    by_cases hNonempty : Set.Nonempty {t : ℝ≥0∞ | PsiTwoAdmissible μ X t}
    · rcases hNonempty with ⟨t, ht⟩
      rcases ht with ⟨hMeas, ht0, htTop, hInt, hBound⟩
      have htPos : 0 < t.toReal := ENNReal.toReal_pos ht0 htTop
      refine ⟨t.toReal, htPos, ?_⟩
      exact ⟨hMeas, htPos, hInt, hBound⟩
    · have hEmpty : {t : ℝ≥0∞ | PsiTwoAdmissible μ X t} = ∅ :=
        Set.not_nonempty_iff_eq_empty.mp hNonempty
      rw [PsiTwoGauge, hEmpty] at hGauge
      have : False := by simpa using hGauge
      exact this.elim
  · rintro ⟨K, hK, hPoint⟩
    have ht0 : ENNReal.ofReal K ≠ 0 := (ENNReal.ofReal_ne_zero_iff).2 hK
    have htTop : ENNReal.ofReal K ≠ ∞ := ENNReal.ofReal_ne_top
    have htAdmissible : PsiTwoAdmissible μ X (ENNReal.ofReal K) := by
      refine ⟨hPoint.1, ht0, htTop, ?_, ?_⟩
      · simpa [ENNReal.toReal_ofReal hK.le] using hPoint.2.2.1
      · simpa [ENNReal.toReal_ofReal hK.le] using hPoint.2.2.2
    have hInf : PsiTwoGauge μ X ≤ ENNReal.ofReal K :=
      sInf_le htAdmissible
    exact lt_of_le_of_lt hInf ENNReal.ofReal_lt_top

/-! Example 2.5.8(c): an essentially bounded variable has finite `ψ₂` gauge.

The positive real `B` is an arbitrary essential bound for `|X|`; taking the
infimum over such bounds recovers the printed essential-supremum estimate. -/
theorem essentiallyBoundedPsiTwoGauge
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {X : Ω → ℝ} {B : ℝ}
    (hX : Measurable X) (hB : 0 < B)
    (hBound : ∀ᵐ ω ∂μ, |X ω| ≤ B) :
    PsiTwoGauge μ X ≤
      ENNReal.ofReal (B / Real.sqrt (Real.log 2)) := by
  have hLog : 0 < Real.log 2 := by positivity
  have hSqrt : 0 < Real.sqrt (Real.log 2) := Real.sqrt_pos.2 hLog
  let K : ℝ := B / Real.sqrt (Real.log 2)
  have hK : 0 < K := div_pos hB hSqrt
  have hSqSqrt : (Real.sqrt (Real.log 2)) ^ 2 = Real.log 2 :=
    Real.sq_sqrt hLog.le
  have hPointwise : ∀ᵐ ω ∂μ,
      Real.exp (X ω ^ 2 / K ^ 2) ≤ (2 : ℝ) := by
    filter_upwards [hBound] with ω hω
    have hSq : X ω ^ 2 ≤ B ^ 2 := by
      rw [← sq_abs]
      exact (sq_le_sq₀ (abs_nonneg (X ω)) hB.le).2 hω
    have hArg : X ω ^ 2 / K ^ 2 ≤ Real.log 2 := by
      dsimp [K]
      calc
        X ω ^ 2 / (B / Real.sqrt (Real.log 2)) ^ 2 =
            X ω ^ 2 * (Real.sqrt (Real.log 2)) ^ 2 / B ^ 2 := by
              field_simp [ne_of_gt hB, ne_of_gt hSqrt]
        _ ≤ B ^ 2 * (Real.sqrt (Real.log 2)) ^ 2 / B ^ 2 := by
              gcongr
        _ = (Real.sqrt (Real.log 2)) ^ 2 := by
              field_simp [ne_of_gt hB]
        _ = Real.log 2 := hSqSqrt
    calc
      Real.exp (X ω ^ 2 / K ^ 2) ≤ Real.exp (Real.log 2) :=
        Real.exp_le_exp.mpr hArg
      _ = 2 := by rw [Real.exp_log (by norm_num)]
  have hInt : Integrable (fun ω => Real.exp (X ω ^ 2 / K ^ 2)) μ := by
    refine MeasureTheory.Integrable.mono' (integrable_const (2 : ℝ)) ?_ ?_
    · fun_prop
    · filter_upwards [hPointwise] with ω hω
      simpa only [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)] using hω
  have hBoundIntegral :
      (∫ ω, Real.exp (X ω ^ 2 / K ^ 2) ∂μ) ≤ 2 := by
    calc
      (∫ ω, Real.exp (X ω ^ 2 / K ^ 2) ∂μ) ≤
          ∫ _ : Ω, (2 : ℝ) ∂μ :=
        MeasureTheory.integral_mono_ae hInt (integrable_const (2 : ℝ))
          hPointwise
      _ = 2 := by simp [probReal_univ]
  have hAdmissible : PsiTwoAdmissible μ X (ENNReal.ofReal K) := by
    refine ⟨hX, (ENNReal.ofReal_ne_zero_iff).2 hK,
      ENNReal.ofReal_ne_top, ?_, ?_⟩
    · simpa [ENNReal.toReal_ofReal hK.le] using hInt
    · simpa [ENNReal.toReal_ofReal hK.le] using hBoundIntegral
  have hInf : PsiTwoGauge μ X ≤ ENNReal.ofReal K := sInf_le hAdmissible
  simpa [K] using hInf

theorem independentGaussianWeightedSumLaw {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {σ : ι → ℝ≥0} (a : ι → ℝ)
    (hLaw : ∀ i, HasLaw (X i) (gaussianReal 0 (σ i)) μ)
    (hIndep : iIndepFun X μ) :
    HasLaw (fun ω => ∑ i, a i * X i ω)
      (gaussianReal 0 (∑ i, Real.toNNReal ((a i) ^ 2) * σ i)) μ := by
  let Y : ι → Ω → ℝ := fun i ω => a i * X i ω
  let τ : ι → ℝ≥0 := fun i => Real.toNNReal ((a i) ^ 2) * σ i
  have hLawY : ∀ i, HasLaw (Y i) (gaussianReal 0 (τ i)) μ := by
    intro i
    simpa [Y, τ, Real.toNNReal_of_nonneg (sq_nonneg (a i))] using
      ProbabilityTheory.gaussianReal_const_mul (hLaw i) (a i)
  have hIndepY : iIndepFun Y μ := by
    have h := hIndep.comp (fun i x => a i * x) (fun i => by fun_prop)
    simpa [Y, Function.comp_def] using h
  have h := independentGaussianSumLaw hLawY hIndepY
  simpa [Y, τ] using h

end NumStability.HDP.Scalar.SubGaussian

namespace NumStability.HDP.Contract

/-! Stable Chapter 2 alias for Proposition 2.5.2. -/
theorem hdp_02_hprop_h2_d5_d2
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0) :
    ∃ C : ℝ, 1 ≤ C ∧
      ∀ i j : NumStability.HDP.Scalar.SubGaussian.SubGaussianPropertyKind,
        ∀ {Ki : ℝ}, 0 < Ki →
          NumStability.HDP.Scalar.SubGaussian.SubGaussianProperty μ X i Ki →
            ∃ Kj : ℝ, 0 < Kj ∧ Kj ≤ C * Ki ∧
              NumStability.HDP.Scalar.SubGaussian.SubGaussianProperty μ X j Kj :=
  NumStability.HDP.Scalar.SubGaussian.subGaussianCharacterization hCenter

/-! Stable Chapter 2 alias for Remark 2.5.3. -/
theorem hdp_02_hrem_h2_d5_d3
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (A : ℝ) (hA : 1 < A) :
    ((∃ K : ℝ, 0 < K ∧
        NumStability.HDP.Scalar.SubGaussian.SubGaussianTailBoundWithThreshold μ X K 2) ↔
      ∃ K : ℝ, 0 < K ∧
        NumStability.HDP.Scalar.SubGaussian.SubGaussianTailBoundWithThreshold μ X K A) ∧
    ((∃ K : ℝ, 0 < K ∧
        NumStability.HDP.Scalar.SubGaussian.SubGaussianSquarePointWithThreshold μ X K 2) ↔
      ∃ K : ℝ, 0 < K ∧
        NumStability.HDP.Scalar.SubGaussian.SubGaussianSquarePointWithThreshold μ X K A) :=
  NumStability.HDP.Scalar.SubGaussian.subGaussianThresholdRemark A hA

/-! Stable Chapter 2 alias for Definition 2.5.6 and the `ψ₂` finiteness test. -/
theorem hdp_02_hdef_h2_d5_d6
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {X : Ω → ℝ} :
    NumStability.HDP.Scalar.SubGaussian.PsiTwoGauge μ X < ∞ ↔
      ∃ K : ℝ, 0 < K ∧
        NumStability.HDP.Scalar.SubGaussian.SubGaussianSquarePoint μ X K :=
  NumStability.HDP.Scalar.SubGaussian.psiTwoGauge_finite_iff

/-! Stable Chapter 2 alias for the essentially bounded `ψ₂` estimate. -/
theorem hdp_02_hexample_h2_d5_d8c
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {X : Ω → ℝ} {B : ℝ}
    (hX : Measurable X) (hB : 0 < B)
    (hBound : ∀ᵐ ω ∂μ, |X ω| ≤ B) :
    NumStability.HDP.Scalar.SubGaussian.PsiTwoGauge μ X ≤
      ENNReal.ofReal (B / Real.sqrt (Real.log 2)) :=
  NumStability.HDP.Scalar.SubGaussian.essentiallyBoundedPsiTwoGauge hX hB hBound

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

/-! Stable Chapter 2 alias for the tail-to-moment direction. -/
theorem hdp_02_hlem_hsg_htail_hto_hmoment
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hX : Measurable X) (hK : 0 < K)
    (hTail : ∀ t : ℝ, 0 ≤ t →
      μ.real {ω | |X ω| ≥ t} ≤ 2 * Real.exp (-t ^ 2 / K ^ 2)) :
    NumStability.HDP.Scalar.SubGaussian.LpMomentGrowth μ X
      (8 * Real.exp 1 * K) :=
  NumStability.HDP.Scalar.SubGaussian.tailToLpMomentGrowth hX hK hTail

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

/-! Stable Chapter 2 alias for Exercise 2.5.4. -/
theorem hdp_02_hex_h2_d5_d4
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ}
    (hX : Integrable X μ)
    (hMGF : ∀ lam : ℝ,
      Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
        (∫ ω, Real.exp (lam * X ω) ∂μ) ≤ Real.exp (K ^ 2 * lam ^ 2)) :
    (∫ ω, X ω ∂μ) = 0 :=
  NumStability.HDP.Scalar.SubGaussian.mgfBoundForcesMeanZero hX hMGF

/-! Stable Chapter 2 alias for Exercise 2.6.9. -/
theorem hdp_02_hex_h2_d6_d9 : hdp_02_hex_h2_d6_d9__contract_type := by
  simpa [hdp_02_hex_h2_d6_d9__contract_type,
    NumStability.HDP.Scalar.SubGaussian.exercise269Law,
    NumStability.HDP.Scalar.SubGaussian.exercise269Mean,
    NumStability.HDP.Scalar.SubGaussian.twoPointPsiTwoNorm,
    NumStability.HDP.Scalar.SubGaussian.twoPointPsiTwoAdmissible] using
    NumStability.HDP.Scalar.SubGaussian.exercise269_counterexample

/-! Stable Chapter 2 alias for the `L²` interpolation estimate. -/
theorem hdp_02_hlem_hlp_hextrapolation
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] {Z : Ω → ℝ}
    (hZ1 : MemLp Z 1 μ) (hZ3 : MemLp Z 3 μ) :
    (∫ ω, |Z ω| ^ (2 : ℝ) ∂μ) ^ (1 / 2 : ℝ) ≤
      (∫ ω, |Z ω| ∂μ) ^ (1 / 4 : ℝ) *
        (∫ ω, |Z ω| ^ (3 : ℕ) ∂μ) ^ (1 / 4 : ℝ) :=
  NumStability.HDP.Scalar.SubGaussian.lpExtrapolation hZ1 hZ3

end NumStability.HDP.Contract
