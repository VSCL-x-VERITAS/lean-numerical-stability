import Mathlib.Probability.Independence.Integration
import Mathlib.Probability.Moments.SubGaussian
import Mathlib.Tactic

/-!
# MGF tensorization for independent sums

This module records the finite mutual-independence bridge behind the MGF
calculation in Chapter 2.  The exponential integrability hypotheses keep the
real-valued expectation interface honest; the weighted form includes the
unweighted sum by taking every coefficient to be one.
-/

noncomputable section

open MeasureTheory
open ProbabilityTheory

namespace NumStability.HDP.Scalar.IndependentSums.Hoeffding

/-- The MGF of a weighted finite sum factors under mutual independence. -/
theorem mgfIndependentSum
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} (lam : ℝ) (a : ι → ℝ)
    (hX : iIndepFun X μ)
    (hExp : ∀ i, Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ) :
    ∫ ω, Real.exp (lam * ∑ i, a i * X i ω) ∂μ =
      ∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ := by
  let Y : ι → Ω → ℝ := fun i ω => Real.exp (lam * (a i * X i ω))
  have hY : iIndepFun Y μ := by
    let g : ∀ i, ℝ → ℝ := fun i x => Real.exp (lam * (a i * x))
    have hg : ∀ i, Measurable (g i) := by
      intro i
      fun_prop
    have h := hX.comp g hg
    simpa [Y, g, Function.comp_def] using h
  have hY_meas : ∀ i, AEStronglyMeasurable (Y i) μ := by
    intro i
    exact (hExp i).aestronglyMeasurable
  calc
    ∫ ω, Real.exp (lam * ∑ i, a i * X i ω) ∂μ =
        ∫ ω, ∏ i, Y i ω ∂μ := by
          apply integral_congr_ae
          filter_upwards [] with ω
          simp only [Y]
          rw [Finset.mul_sum, Real.exp_sum]
    _ = ∏ i, ∫ ω, Y i ω ∂μ := by
      simpa only [Finset.prod_apply] using
        hY.integral_prod_eq_prod_integral hY_meas
    _ = ∏ i, ∫ ω, Real.exp (lam * (a i * X i ω)) ∂μ := by
      rfl

/-- The centered bounded-variable Hoeffding lemma, with all real MGF
parameters bundled by Mathlib's sub-Gaussian interface. -/
theorem hoeffdingBoundedMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b)
    (hmean : ∫ ω, X ω ∂μ = 0) :
    HasSubgaussianMGF X ((‖b - a‖₊ / 2) ^ 2) μ :=
  ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero
    hX hbound hmean

/-- The noncentered bounded-variable form, obtained by subtracting the mean. -/
theorem hoeffdingCenteredMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b) :
    HasSubgaussianMGF (fun ω => X ω - ∫ y, X y ∂μ)
      ((‖b - a‖₊ / 2) ^ 2) μ :=
  ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc hX hbound

/-- Stable Chapter 2 alias for the centered bounded-variable Hoeffding lemma. -/
theorem hdp_02_hlem_hhoeffding_hbounded_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b)
    (hmean : ∫ ω, X ω ∂μ = 0) :
    HasSubgaussianMGF X ((‖b - a‖₊ / 2) ^ 2) μ :=
  hoeffdingBoundedMGF hX hbound hmean

end NumStability.HDP.Scalar.IndependentSums.Hoeffding
