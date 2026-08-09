import Mathlib.Probability.Independence.Integration
import Mathlib.Probability.Moments.SubGaussian
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
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

/-! The one-variable quadratic optimization used by the Hoeffding tail proof. -/
theorem hoeffdingOptimization {v t : ℝ} (hv : 0 < v) (ht : 0 ≤ t) :
    (∀ u : ℝ, 0 ≤ u →
      -t ^ 2 / (2 * v) ≤ -u * t + u ^ 2 * v / 2) ∧
      (-(t / v) * t + (t / v) ^ 2 * v / 2 = -t ^ 2 / (2 * v)) := by
  constructor
  · intro u hu
    have hsq : 0 ≤ (u * v - t) ^ 2 := sq_nonneg (u * v - t)
    field_simp
    nlinarith
  · field_simp
    ring

/-! The coefficientwise hyperbolic-cosine estimate used by Rademacher MGF bounds. -/
theorem coshLeExpHalfSq (x : ℝ) :
    Real.cosh x ≤ Real.exp (x ^ 2 / 2) :=
  Real.cosh_le_exp_half_sq x

/-- A probability density supported on the nonnegative half-line and bounded by one. -/
structure BoundedDensityOnNonnegative (f : ℝ → ℝ) : Prop where
  nonnegative : ∀ᵐ x ∂(volume : Measure ℝ), 0 ≤ f x
  supported : ∀ᵐ x ∂(volume : Measure ℝ), x < 0 → f x = 0
  bounded : ∀ᵐ x ∂(volume : Measure ℝ), 0 ≤ x → f x ≤ 1
  integrable : Integrable f volume
  normalized : ∫ x, f x ∂volume = 1

/-- The Laplace transform of a nonnegative density bounded by one is at most `1 / t`. -/
theorem laplaceTransformLeInv {f : ℝ → ℝ}
    (hf : BoundedDensityOnNonnegative f) {t : ℝ} (ht : 0 < t) :
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ) ≤ 1 / t := by
  let g : ℝ → ℝ := Set.indicator (Set.Ioi 0) (fun x => Real.exp (-t * x))
  have hg_on : IntegrableOn (fun x : ℝ => Real.exp (-t * x)) (Set.Ioi 0) := by
    simpa [mul_comm] using
      (integrableOn_exp_mul_Ioi (a := -t) (by linarith) (0 : ℝ))
  have hg : Integrable g (volume : Measure ℝ) :=
    hg_on.integrable_indicator measurableSet_Ioi
  have hnonneg : 0 ≤ᵐ[(volume : Measure ℝ)] fun x => Real.exp (-t * x) * f x := by
    filter_upwards [hf.nonnegative] with x hfx
    exact mul_nonneg (Real.exp_nonneg _) hfx
  have hle : (fun x => Real.exp (-t * x) * f x) ≤ᵐ[(volume : Measure ℝ)] g := by
    filter_upwards [hf.supported, hf.bounded, (volume : Measure ℝ).ae_ne 0] with x hs hb hx0
    by_cases hx : 0 ≤ x
    · have hx' : 0 < x := lt_of_le_of_ne hx (Ne.symm hx0)
      rw [show g x = Real.exp (-t * x) by simp [g, Set.mem_Ioi.mpr hx']]
      simpa using mul_le_mul_of_nonneg_left (hb hx) (Real.exp_nonneg (-t * x))
    · have hx' : x < 0 := lt_of_not_ge hx
      rw [show g x = 0 by simp [g, Set.mem_Ioi, not_lt.mpr (le_of_lt hx')], hs hx', mul_zero]
  calc
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ)
        ≤ ∫ x, g x ∂(volume : Measure ℝ) :=
      integral_mono_of_nonneg hnonneg hg hle
    _ = ∫ x in Set.Ioi 0, Real.exp (-t * x) ∂(volume : Measure ℝ) := by
      simp [g, integral_indicator measurableSet_Ioi]
    _ = -Real.exp ((-t) * 0) / (-t) :=
      integral_exp_mul_Ioi (by linarith) 0
    _ = 1 / t := by simp

end NumStability.HDP.Scalar.IndependentSums.Hoeffding

namespace NumStability.HDP.Contract

/-- Stable Chapter 2 alias for the centered bounded-variable Hoeffding lemma. -/
theorem hdp_02_hlem_hhoeffding_hbounded_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {a b : ℝ}
    (hX : AEMeasurable X μ)
    (hbound : ∀ᵐ ω ∂μ, X ω ∈ Set.Icc a b)
    (hmean : ∫ ω, X ω ∂μ = 0) :
    HasSubgaussianMGF X ((‖b - a‖₊ / 2) ^ 2) μ :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.hoeffdingBoundedMGF
    hX hbound hmean

theorem hdp_02_hlem_hhoeffding_hoptimization {v t : ℝ} (hv : 0 < v)
    (ht : 0 ≤ t) :
    (∀ u : ℝ, 0 ≤ u →
      -t ^ 2 / (2 * v) ≤ -u * t + u ^ 2 * v / 2) ∧
      (-(t / v) * t + (t / v) ^ 2 * v / 2 = -t ^ 2 / (2 * v)) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.hoeffdingOptimization hv ht

/-- Stable Chapter 2 alias for Exercise 2.2.3. -/
theorem hdp_02_hex_h2_d2_d3 (x : ℝ) :
    Real.cosh x ≤ Real.exp (x ^ 2 / 2) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.coshLeExpHalfSq x

/-- Stable Chapter 2 alias for Exercise 2.2.10(a). -/
theorem hdp_02_hex_h2_d2_d10a {f : ℝ → ℝ}
    (hf : NumStability.HDP.Scalar.IndependentSums.Hoeffding.BoundedDensityOnNonnegative f)
    {t : ℝ} (ht : 0 < t) :
    ∫ x, Real.exp (-t * x) * f x ∂(volume : Measure ℝ) ≤ 1 / t :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.laplaceTransformLeInv hf ht

end NumStability.HDP.Contract
