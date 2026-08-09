import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Tactic

/-!
# Standard-normal MGF

This module proves the standard-normal moment-generating-function identity
used by the Chapter 2 sub-Gaussian development.
-/

noncomputable section

open MeasureTheory
open ProbabilityTheory

namespace NumStability.HDP.Scalar.SubGaussian

/-- The standard-normal MGF is `exp (lam ^ 2 / 2)`. -/
theorem standardNormalMGF (lam : ℝ) :
    ∫ x, Real.exp (lam * x) ∂(gaussianReal 0 1) =
      Real.exp (lam ^ 2 / 2) := by
  rw [integral_gaussianReal_eq_integral_smul (μ := (0 : ℝ)) (v := (1 : NNReal))
    (f := fun x : ℝ => Real.exp (lam * x)) (by norm_num)]
  simp only [smul_eq_mul]
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
    convert integral_gaussian (1 / 2) using 1 <;> ring
  rw [hpoint, integral_const_mul, integral_const_mul, hshift, hgauss]
  norm_num [Real.sqrt_eq_rpow]
  field_simp

end NumStability.HDP.Scalar.SubGaussian
