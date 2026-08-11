import NumStability.HDP.Source.Packages.Split3.BrownianFoundation.Gaussian.CovMatrix
import NumStability.HDP.Source.Packages.Split3.BrownianFoundation.Auxiliary.HasLaw
import Mathlib.Probability.Distributions.Gaussian.Fernique
import Mathlib.Probability.Distributions.Gaussian.CharFun
import Mathlib.Probability.Moments.CovarianceBilinDual

/-!
# Facts about Gaussian characteristic function
-/

open Complex MeasureTheory WithLp NormedSpace

open scoped Matrix NNReal Real InnerProductSpace ProbabilityTheory

namespace ProbabilityTheory

private lemma real_inner_eq_mul (x y : ℝ) : ⟪x, y⟫_ℝ = x * y := by
  rw [show x = x • (1 : ℝ) by simp, show y = y • (1 : ℝ) by simp]
  simp only [real_inner_smul_left, real_inner_smul_right]
  simp [mul_comm]

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [SecondCountableTopology E]
  [CompleteSpace E] [MeasurableSpace E] [BorelSpace E] {μ : Measure E}

lemma HasGaussianLaw.map_eq_gaussianReal {Ω : Type*} {mΩ : MeasurableSpace Ω} {P : Measure Ω}
    {X : Ω → ℝ} (h : HasGaussianLaw X P) :
    P.map X = gaussianReal P[X] Var[X; P].toNNReal := by
  rw [IsGaussian.eq_gaussianReal (.map _ _), integral_map, variance_map]
  · rfl
  · fun_prop
  · fun_prop
  · fun_prop
  · fun_prop
  · exact h.isGaussian_map

lemma HasGaussianLaw.charFun_map_real {Ω : Type*} {mΩ : MeasurableSpace Ω} {P : Measure Ω}
    {X : Ω → ℝ} (h : HasGaussianLaw X P) (t : ℝ) :
    charFun (P.map X) t = cexp (t * P[X] * I - t ^ 2 * Var[X; P] / 2) := by
  rw [h.map_eq_gaussianReal, IsGaussian.charFun_eq', covarianceBilin_real_self]
  simp [variance_nonneg, real_inner_eq_mul, mul_comm]
  have h_int : (∫ x, (X x : ℂ) ∂P) = Complex.ofReal (∫ x, X x ∂P) :=
    integral_complex_ofReal
  rw [h_int]

end ProbabilityTheory
