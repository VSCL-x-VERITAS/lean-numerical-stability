import Mathlib.Analysis.Asymptotics.Theta
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.Data.Real.Basic
import Mathlib.MeasureTheory.Integral.IntegralEqImproper
import Mathlib.Probability.Distributions.Gaussian.Real
import NumStability.HDP.Contracts.C_01_hdef_hcdf_htail
import NumStability.HDP.Contracts.C_01_hdef_hexpectation_hvariance

/-!
# Scalar tail and comparison interfaces

The comparison conventions below make the filter or domain explicit.  This
removes the deliberate contextual ambiguity of the book's informal symbols.
-/

open Filter
open MeasureTheory
open scoped Topology

namespace NumStability.HDP.Scalar.NormalTail

/-! The opening convention of Chapter 2.1: concentration is measured around
the expectation and is recorded as an upper tail of the absolute centered
variable.  The Chapter 1 CDF and expectation interfaces are used here rather
than introducing a second probability or mean notation. -/

noncomputable def concentrationTailProbability
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : MeasureTheory.Integrable X μ) (t : ℝ) : ENNReal :=
  (NumStability.HDP.Contract.hdp_01_hdef_hcdf_htail μ
      (fun ω ↦ |X ω -
        (NumStability.HDP.Contract.hdp_01_hdef_hexpectation_hvariance μ X hX).mean|)).upperTail t

noncomputable def concentrationTailClosedProbability
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : MeasureTheory.Integrable X μ) (t : ℝ) : ENNReal :=
  (NumStability.HDP.Contract.hdp_01_hdef_hcdf_htail μ
      (fun ω ↦ |X ω -
        (NumStability.HDP.Contract.hdp_01_hdef_hexpectation_hvariance μ X hX).mean|)).distribution
    (Set.Ici t)

theorem concentrationTailProbability_le_closed
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : MeasureTheory.Integrable X μ) (t : ℝ) :
    concentrationTailProbability μ X hX t ≤
      concentrationTailClosedProbability μ X hX t := by
  unfold concentrationTailProbability concentrationTailClosedProbability
  exact measure_mono (Set.Ioi_subset_Ici le_rfl)

theorem concentrationTailClosed_le_probability
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : MeasureTheory.Integrable X μ) {s t : ℝ} (hst : s < t) :
    concentrationTailClosedProbability μ X hX t ≤
      concentrationTailProbability μ X hX s := by
  unfold concentrationTailClosedProbability concentrationTailProbability
  apply measure_mono
  intro x hx
  exact lt_of_lt_of_le hst hx

/-- The unnormalized standard Gaussian density kernel. -/
noncomputable def gaussianKernel (x : ℝ) : ℝ :=
  Real.exp (-(1 / 2 : ℝ) * x ^ 2)

/-- The residual kernel after shifting `x = t + y` in a Gaussian tail. -/
noncomputable def shiftedGaussianKernel (t y : ℝ) : ℝ :=
  Real.exp (-t * y - (1 / 2 : ℝ) * y ^ 2)

/-- The shifted Gaussian-tail integral is bounded by the elementary
exponential integral `1 / t`.

Source: Vershynin, proof of Proposition 2.1.2, printed page 13
(`HDP-02-LEM-NORMAL-TAIL-CALCULUS`). -/
theorem integral_shiftedGaussianKernel_le_inv {t : ℝ} (ht : 0 < t) :
    (∫ y in Set.Ioi 0, shiftedGaussianKernel t y) ≤ 1 / t := by
  let f : ℝ → ℝ := fun y ↦ shiftedGaussianKernel t y
  let g : ℝ → ℝ := fun y ↦ Real.exp (-t * y)
  have hg : MeasureTheory.IntegrableOn g (Set.Ioi 0) := by
    simpa [g] using integrableOn_exp_mul_Ioi (a := -t) (by linarith) 0
  have hf : MeasureTheory.IntegrableOn f (Set.Ioi 0) := by
    have hfcont : Continuous f := by
      dsimp [f, shiftedGaussianKernel]
      fun_prop
    refine MeasureTheory.Integrable.mono hg hfcont.aestronglyMeasurable ?_
    filter_upwards with y
    change |shiftedGaussianKernel t y| ≤ |Real.exp (-t * y)|
    rw [shiftedGaussianKernel, abs_of_pos (Real.exp_pos _)]
    rw [abs_of_pos (Real.exp_pos _)]
    exact Real.exp_le_exp.mpr (by
      nlinarith [sq_nonneg y])
  calc
    (∫ y in Set.Ioi 0, shiftedGaussianKernel t y) = ∫ y in Set.Ioi 0, f y := rfl
    _ ≤ ∫ y in Set.Ioi 0, g y := by
      refine MeasureTheory.setIntegral_mono_on hf hg measurableSet_Ioi ?_
      intro y _
      exact Real.exp_le_exp.mpr (by
        nlinarith [sq_nonneg y])
    _ = 1 / t := by
      dsimp [g]
      rw [integral_exp_mul_Ioi (a := -t) (by linarith) 0]
      simp

/-- The unnormalized Gaussian upper-tail integral. -/
noncomputable def gaussianTailIntegral (t : ℝ) : ℝ :=
  ∫ x in Set.Ioi t, gaussianKernel x

theorem continuous_gaussianKernel : Continuous gaussianKernel := by
  unfold gaussianKernel
  fun_prop

theorem hasDerivAt_gaussianKernel (x : ℝ) :
    HasDerivAt gaussianKernel (-x * gaussianKernel x) x := by
  convert (((hasDerivAt_id x).pow 2).const_mul (1 / 2 : ℝ)).neg.exp using 1
  · funext y
    simp [gaussianKernel]
  · simp [gaussianKernel]
    ring

theorem tendsto_gaussianKernel_atTop :
    Tendsto gaussianKernel atTop (𝓝 0) := by
  unfold gaussianKernel
  exact Real.tendsto_exp_atBot.comp
    (Tendsto.const_mul_atTop_of_neg (r := -(1 / 2 : ℝ)) (by norm_num)
      (tendsto_pow_atTop two_ne_zero))

theorem integrableOn_gaussianKernel_Ioi (t : ℝ) :
    MeasureTheory.IntegrableOn gaussianKernel (Set.Ioi t) := by
  change MeasureTheory.IntegrableOn
    (fun x : ℝ ↦ Real.exp (-(1 / 2 : ℝ) * x ^ 2)) (Set.Ioi t)
  exact (integrable_exp_neg_mul_sq (b := (1 / 2 : ℝ)) (by norm_num)).integrableOn

theorem integrableOn_mul_gaussianKernel_Ioi (t : ℝ) :
    MeasureTheory.IntegrableOn (fun x ↦ x * gaussianKernel x) (Set.Ioi t) := by
  change MeasureTheory.IntegrableOn
    (fun x : ℝ ↦ x * Real.exp (-(1 / 2 : ℝ) * x ^ 2)) (Set.Ioi t)
  exact (integrable_mul_exp_neg_mul_sq (b := (1 / 2 : ℝ)) (by norm_num)).integrableOn

/-- The elementary antiderivative of `x exp (-x²/2)` on a positive
half-line. -/
theorem integral_mul_gaussianKernel_Ioi {t : ℝ} (ht : 0 < t) :
    (∫ x in Set.Ioi t, x * gaussianKernel x) = gaussianKernel t := by
  have hderiv : ∀ x ∈ Set.Ici t,
      HasDerivAt (fun z ↦ -gaussianKernel z) (x * gaussianKernel x) x := by
    intro x _
    convert (hasDerivAt_gaussianKernel x).neg using 1 <;> ring
  have hnonneg : ∀ x ∈ Set.Ioi t, 0 ≤ x * gaussianKernel x := by
    intro x hx
    exact mul_nonneg (le_of_lt (ht.trans hx)) (Real.exp_pos _).le
  have hlim : Tendsto (fun x ↦ -gaussianKernel x) atTop (𝓝 0) := by
    simpa using tendsto_gaussianKernel_atTop.neg
  simpa using MeasureTheory.integral_Ioi_of_hasDerivAt_of_nonneg'
    hderiv hnonneg hlim

/-- The direct Mills upper estimate for the unnormalized Gaussian tail. -/
theorem gaussianTailIntegral_le {t : ℝ} (ht : 0 < t) :
    gaussianTailIntegral t ≤ (1 / t) * gaussianKernel t := by
  have hg := integrableOn_gaussianKernel_Ioi t
  have hxg := integrableOn_mul_gaussianKernel_Ioi t
  have hscaled : MeasureTheory.IntegrableOn
      (fun x ↦ (1 / t) * (x * gaussianKernel x)) (Set.Ioi t) :=
    hxg.const_mul (1 / t)
  calc
    gaussianTailIntegral t ≤
        ∫ x in Set.Ioi t, (1 / t) * (x * gaussianKernel x) := by
      unfold gaussianTailIntegral
      refine MeasureTheory.setIntegral_mono_on hg hscaled measurableSet_Ioi ?_
      intro x hx
      have hxt : t ≤ x := hx.le
      calc
        gaussianKernel x = 1 * gaussianKernel x := by ring
        _ ≤ (x / t) * gaussianKernel x := by
          exact mul_le_mul_of_nonneg_right ((one_le_div ht).2 hxt) (Real.exp_pos _).le
        _ = (1 / t) * (x * gaussianKernel x) := by ring
    _ = (1 / t) * gaussianKernel t := by
      rw [MeasureTheory.integral_const_mul, integral_mul_gaussianKernel_Ioi ht]

/-- The positive remainder in the integration-by-parts formula for a Gaussian
tail. -/
noncomputable def gaussianRemainder (x : ℝ) : ℝ :=
  gaussianKernel x / x ^ 2

theorem integrableOn_gaussianRemainder_Ioi {t : ℝ} (ht : 0 < t) :
    MeasureTheory.IntegrableOn gaussianRemainder (Set.Ioi t) := by
  have hg := integrableOn_gaussianKernel_Ioi t
  have hdom : MeasureTheory.IntegrableOn
      (fun x ↦ (1 / t ^ 2) * gaussianKernel x) (Set.Ioi t) :=
    hg.const_mul (1 / t ^ 2)
  have hcont : ContinuousOn gaussianRemainder (Set.Ioi t) := by
    intro x hx
    have hx0 : x ≠ 0 := ne_of_gt (ht.trans hx)
    exact continuous_gaussianKernel.continuousAt.div
      (continuousAt_id.pow 2) (pow_ne_zero 2 hx0) |>.continuousWithinAt
  refine MeasureTheory.Integrable.mono hdom
    (hcont.aestronglyMeasurable measurableSet_Ioi) ?_
  filter_upwards [MeasureTheory.ae_restrict_mem measurableSet_Ioi] with x hx
  have hxpos : 0 < x := ht.trans hx
  have hsq : t ^ 2 ≤ x ^ 2 := (sq_le_sq₀ ht.le hxpos.le).2 hx.le
  have hinv : 1 / x ^ 2 ≤ 1 / t ^ 2 :=
    one_div_le_one_div_of_le (sq_pos_of_pos ht) hsq
  have hg_nonneg : 0 ≤ gaussianKernel x := (Real.exp_pos _).le
  calc
    ‖gaussianRemainder x‖ = gaussianKernel x / x ^ 2 := by
      simp only [gaussianRemainder, Real.norm_eq_abs,
        abs_of_nonneg (div_nonneg hg_nonneg (sq_nonneg x))]
    _ ≤ (1 / t ^ 2) * gaussianKernel x := by
      rw [div_eq_mul_inv, mul_comm (1 / t ^ 2)]
      exact mul_le_mul_of_nonneg_left (by simpa [one_div] using hinv) hg_nonneg
    _ = ‖(1 / t ^ 2) * gaussianKernel x‖ := by
      rw [Real.norm_eq_abs, abs_of_nonneg]
      exact mul_nonneg (one_div_nonneg.mpr (sq_nonneg t)) hg_nonneg

/-- Integration by parts splits a Gaussian tail into its leading Mills term
minus a positive remainder. -/
theorem gaussianTail_decomposition {t : ℝ} (ht : 0 < t) :
    gaussianTailIntegral t +
        (∫ x in Set.Ioi t, gaussianRemainder x) = gaussianKernel t / t := by
  have hg := integrableOn_gaussianKernel_Ioi t
  have hr := integrableOn_gaussianRemainder_Ioi ht
  have hderiv : ∀ x ∈ Set.Ici t,
      HasDerivAt (fun z ↦ -gaussianKernel z / z)
        (gaussianKernel x + gaussianRemainder x) x := by
    intro x hx
    have hx0 : x ≠ 0 := ne_of_gt (ht.trans_le hx)
    convert (hasDerivAt_gaussianKernel x).neg.div (hasDerivAt_id x) hx0 using 1 <;>
      simp [gaussianRemainder] <;> field_simp [hx0] <;> ring
  have hlim : Tendsto (fun x ↦ -gaussianKernel x / x) atTop (nhds 0) := by
    have hinv : Tendsto (fun x : ℝ ↦ x⁻¹) atTop (nhds 0) := tendsto_inv_atTop_zero
    simpa [div_eq_mul_inv] using tendsto_gaussianKernel_atTop.neg.mul hinv
  have hint := MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto'
    hderiv (hg.add hr) hlim
  rw [MeasureTheory.integral_add hg hr] at hint
  unfold gaussianTailIntegral
  convert hint using 1 <;> ring

/-- The integration-by-parts remainder is no larger than the cubic-order
correction in the lower Mills bound. -/
theorem integral_gaussianRemainder_le {t : ℝ} (ht : 0 < t) :
    (∫ x in Set.Ioi t, gaussianRemainder x) ≤
        gaussianKernel t / t ^ 3 := by
  have hr := integrableOn_gaussianRemainder_Ioi ht
  have hg := integrableOn_gaussianKernel_Ioi t
  have hscaled : MeasureTheory.IntegrableOn
      (fun x ↦ (1 / t ^ 2) * gaussianKernel x) (Set.Ioi t) :=
    hg.const_mul (1 / t ^ 2)
  calc
    (∫ x in Set.Ioi t, gaussianRemainder x) ≤
        ∫ x in Set.Ioi t, (1 / t ^ 2) * gaussianKernel x := by
      refine MeasureTheory.setIntegral_mono_on hr hscaled measurableSet_Ioi ?_
      intro x hx
      have hxpos : 0 < x := ht.trans hx
      have hsq : t ^ 2 ≤ x ^ 2 := (sq_le_sq₀ ht.le hxpos.le).2 hx.le
      have hinv : 1 / x ^ 2 ≤ 1 / t ^ 2 :=
        one_div_le_one_div_of_le (sq_pos_of_pos ht) hsq
      rw [gaussianRemainder, div_eq_mul_inv, mul_comm (1 / t ^ 2)]
      exact mul_le_mul_of_nonneg_left (by simpa [one_div] using hinv) (Real.exp_pos _).le
    _ = (1 / t ^ 2) * gaussianTailIntegral t := by
      rw [MeasureTheory.integral_const_mul]
      rfl
    _ ≤ (1 / t ^ 2) * ((1 / t) * gaussianKernel t) := by
      exact mul_le_mul_of_nonneg_left (gaussianTailIntegral_le ht)
        (one_div_nonneg.mpr (sq_nonneg t))
    _ = gaussianKernel t / t ^ 3 := by
      field_simp [ne_of_gt ht]

/-- The exact upper Mills bound and the integration-by-parts lower bound for
the unnormalized standard Gaussian tail.

Source: Vershynin, Proposition 2.1.2 and its proof, printed pages 13–14
(`HDP-02-LEM-NORMAL-TAIL-CALCULUS`). -/
theorem gaussianTailIntegral_mills_bounds {t : ℝ} (ht : 0 < t) :
    (1 / t - 1 / t ^ 3) * gaussianKernel t ≤ gaussianTailIntegral t ∧
      gaussianTailIntegral t ≤ (1 / t) * gaussianKernel t := by
  constructor
  · have hdecomp := gaussianTail_decomposition ht
    have hrem := integral_gaussianRemainder_le ht
    calc
      (1 / t - 1 / t ^ 3) * gaussianKernel t =
          gaussianKernel t / t - gaussianKernel t / t ^ 3 := by ring
      _ ≤ gaussianTailIntegral t := by linarith
  · exact gaussianTailIntegral_le ht

/-! The source-facing normalized form of Proposition 2.1.2.  The book writes
`ℙ(g ≥ t)` and `φ(t)`; `Ici t` and `gaussianPDFReal 0 1 t` make those two
conventions explicit in Mathlib. -/

noncomputable def standardNormalTail (t : ℝ) : ENNReal :=
  ProbabilityTheory.gaussianReal 0 1 (Set.Ici t)

theorem proposition_2_1_2 :
    (∀ t : ℝ, 0 < t →
      (ENNReal.ofReal
          ((1 / t - 1 / t ^ 3) * ProbabilityTheory.gaussianPDFReal 0 1 t) ≤
          standardNormalTail t ∧
        standardNormalTail t ≤ ENNReal.ofReal
          ((1 / t) * ProbabilityTheory.gaussianPDFReal 0 1 t))) ∧
      (∀ t : ℝ, 1 ≤ t →
        standardNormalTail t ≤
          ENNReal.ofReal (ProbabilityTheory.gaussianPDFReal 0 1 t)) := by
  have hpdf : ∀ x : ℝ,
      ProbabilityTheory.gaussianPDFReal 0 1 x =
        (Real.sqrt (2 * Real.pi))⁻¹ * gaussianKernel x := by
    intro x
    rw [ProbabilityTheory.gaussianPDFReal, gaussianKernel]
    simp only [sub_zero, NNReal.coe_one, mul_one]
    congr 1
    · ring
  have htail_pdf {t : ℝ} :
      (∫ x in Set.Ici t, ProbabilityTheory.gaussianPDFReal 0 1 x) =
        (Real.sqrt (2 * Real.pi))⁻¹ * gaussianTailIntegral t := by
    rw [MeasureTheory.integral_Ici_eq_integral_Ioi]
    simp_rw [hpdf]
    rw [MeasureTheory.integral_const_mul]
    rfl
  have hc : 0 ≤ (Real.sqrt (2 * Real.pi))⁻¹ := by positivity
  have hc_pos : 0 < (Real.sqrt (2 * Real.pi))⁻¹ := by positivity
  have hmain : ∀ {t : ℝ}, 0 < t →
      (ENNReal.ofReal
          ((1 / t - 1 / t ^ 3) * ProbabilityTheory.gaussianPDFReal 0 1 t) ≤
          standardNormalTail t ∧
        standardNormalTail t ≤ ENNReal.ofReal
          ((1 / t) * ProbabilityTheory.gaussianPDFReal 0 1 t)) := by
    intro t ht
    change ENNReal.ofReal
        ((1 / t - 1 / t ^ 3) * ProbabilityTheory.gaussianPDFReal 0 1 t) ≤
        ProbabilityTheory.gaussianReal 0 1 (Set.Ici t) ∧
      ProbabilityTheory.gaussianReal 0 1 (Set.Ici t) ≤ ENNReal.ofReal
        ((1 / t) * ProbabilityTheory.gaussianPDFReal 0 1 t)
    rw [ProbabilityTheory.gaussianReal_apply_eq_integral 0
      (show (1 : NNReal) ≠ 0 by norm_num) (Set.Ici t), htail_pdf]
    have hmills := gaussianTailIntegral_mills_bounds ht
    have hlow := mul_le_mul_of_nonneg_left hmills.1 hc
    have hupp := mul_le_mul_of_nonneg_left hmills.2 hc
    constructor
    · apply ENNReal.ofReal_le_ofReal
      calc
        (1 / t - 1 / t ^ 3) * ProbabilityTheory.gaussianPDFReal 0 1 t =
            (Real.sqrt (2 * Real.pi))⁻¹ *
              ((1 / t - 1 / t ^ 3) * gaussianKernel t) := by rw [hpdf]; ring
        _ ≤ (Real.sqrt (2 * Real.pi))⁻¹ * gaussianTailIntegral t := hlow
    · apply ENNReal.ofReal_le_ofReal
      calc
        (Real.sqrt (2 * Real.pi))⁻¹ * gaussianTailIntegral t ≤
            (Real.sqrt (2 * Real.pi))⁻¹ * ((1 / t) * gaussianKernel t) := hupp
        _ = (1 / t) * ProbabilityTheory.gaussianPDFReal 0 1 t := by rw [hpdf]; ring
  constructor
  · intro t ht
    exact hmain ht
  · intro t ht
    have hupper := hmain (lt_of_lt_of_le (by norm_num) ht)
    apply le_trans hupper.2
    apply ENNReal.ofReal_le_ofReal
    rw [hpdf]
    have hdiv : 1 / t ≤ (1 : ℝ) := by
      apply (div_le_iff₀ (lt_of_lt_of_le zero_lt_one ht)).2
      simpa using ht
    have hnonneg : 0 ≤ (Real.sqrt (2 * Real.pi))⁻¹ * gaussianKernel t :=
      mul_nonneg hc (Real.exp_pos _).le
    simpa using mul_le_mul_of_nonneg_right hdiv hnonneg

/-- The two reusable calculus conclusions in the proof of the standard-normal
tail estimate: the shifted upper integral and the equivalent
integration-by-parts Mills bounds. -/
theorem normalTailCalculus {t : ℝ} (ht : 0 < t) :
    (∫ y in Set.Ioi 0, shiftedGaussianKernel t y) ≤ 1 / t ∧
      ((1 / t - 1 / t ^ 3) * gaussianKernel t ≤ gaussianTailIntegral t ∧
        gaussianTailIntegral t ≤ (1 / t) * gaussianKernel t) :=
  ⟨integral_shiftedGaussianKernel_le_inv ht, gaussianTailIntegral_mills_bounds ht⟩

/-- Canonical Mathlib interpretation of equivalence up to constant factors
along a specified filter. -/
def comparisonTheta {α : Type*} (l : Filter α) (f g : α → ℝ) : Prop :=
  Asymptotics.IsTheta l f g

/-- Eventually, `f` is at most a positive constant times `g` (`f ≲ g`). -/
def EventuallyLesssim {α : Type*} (l : Filter α) (f g : α → ℝ) : Prop :=
  ∃ C > 0, ∀ᶠ x in l, f x ≤ C * g x

/-- Eventually, `f` is at least a positive constant times `g` (`f ≳ g`). -/
def EventuallyGreatersim {α : Type*} (l : Filter α) (f g : α → ℝ) : Prop :=
  EventuallyLesssim l g f

/-- Explicit positive-constant form of `f ≍ g` along a filter. -/
def EventuallyComparable {α : Type*} (l : Filter α) (f g : α → ℝ) : Prop :=
  ∃ c > 0, ∃ C > 0, ∀ᶠ x in l, c * f x ≤ g x ∧ g x ≤ C * f x

/-- Global one-sided comparison on a specified domain. -/
def GloballyLesssimOn {α : Type*} (s : Set α) (f g : α → ℝ) : Prop :=
  EventuallyLesssim (Filter.principal s) f g

/-- Global reverse one-sided comparison on a specified domain. -/
def GloballyGreatersimOn {α : Type*} (s : Set α) (f g : α → ℝ) : Prop :=
  EventuallyGreatersim (Filter.principal s) f g

/-- Global two-sided comparison on a specified domain. -/
def GloballyComparableOn {α : Type*} (s : Set α) (f g : α → ℝ) : Prop :=
  EventuallyComparable (Filter.principal s) f g

theorem globallyLesssimOn_iff {α : Type*} {s : Set α} {f g : α → ℝ} :
    GloballyLesssimOn s f g ↔ ∃ C > 0, ∀ x ∈ s, f x ≤ C * g x := by
  simp only [GloballyLesssimOn, EventuallyLesssim, Filter.eventually_principal]

theorem globallyGreatersimOn_iff {α : Type*} {s : Set α} {f g : α → ℝ} :
    GloballyGreatersimOn s f g ↔ ∃ C > 0, ∀ x ∈ s, g x ≤ C * f x := by
  simp only [GloballyGreatersimOn, EventuallyGreatersim, EventuallyLesssim,
    Filter.eventually_principal]

theorem globallyComparableOn_iff {α : Type*} {s : Set α} {f g : α → ℝ} :
    GloballyComparableOn s f g ↔
      ∃ c > 0, ∃ C > 0, ∀ x ∈ s, c * f x ≤ g x ∧ g x ≤ C * f x := by
  simp only [GloballyComparableOn, EventuallyComparable, Filter.eventually_principal]

/-- On eventually nonnegative functions, the explicit positive-constant
definition from the footnote is equivalent to Mathlib's norm-based `IsTheta`.
This is the reusable bridge from book notation to formal asymptotics. -/
theorem eventuallyComparable_iff_comparisonTheta
    {α : Type*} {l : Filter α} {f g : α → ℝ}
    (hnonneg : ∀ᶠ x in l, 0 ≤ f x ∧ 0 ≤ g x) :
    EventuallyComparable l f g ↔ comparisonTheta l f g := by
  constructor
  · rintro ⟨c, hc, C, hC, hbounds⟩
    refine ⟨?_, ?_⟩
    · rw [Asymptotics.isBigO_iff'']
      refine ⟨c, hc, ?_⟩
      filter_upwards [hbounds, hnonneg] with x hx hnn
      simpa only [Real.norm_eq_abs, abs_of_nonneg hnn.1, abs_of_nonneg hnn.2] using hx.1
    · rw [Asymptotics.isBigO_iff']
      refine ⟨C, hC, ?_⟩
      filter_upwards [hbounds, hnonneg] with x hx hnn
      simpa only [Real.norm_eq_abs, abs_of_nonneg hnn.1, abs_of_nonneg hnn.2] using hx.2
  · rintro ⟨hfg, hgf⟩
    rw [Asymptotics.isBigO_iff''] at hfg
    rw [Asymptotics.isBigO_iff'] at hgf
    obtain ⟨c, hc, hcf⟩ := hfg
    obtain ⟨C, hC, hgC⟩ := hgf
    refine ⟨c, hc, C, hC, ?_⟩
    filter_upwards [hcf, hgC, hnonneg] with x hxlower hxupper hnn
    simpa only [Real.norm_eq_abs, abs_of_nonneg hnn.1, abs_of_nonneg hnn.2] using
      And.intro hxlower hxupper

end NumStability.HDP.Scalar.NormalTail

namespace NumStability.HDP.Contract

/-- Stable source alias for Proposition 2.1.2, the normalized Gaussian Mills
tail bounds and their `t ≥ 1` corollary. -/
theorem hdp_02_hprop_h2_d1_d2 :
    (∀ t : ℝ, 0 < t →
      (ENNReal.ofReal
          ((1 / t - 1 / t ^ 3) * ProbabilityTheory.gaussianPDFReal 0 1 t) ≤
          Scalar.NormalTail.standardNormalTail t ∧
        Scalar.NormalTail.standardNormalTail t ≤ ENNReal.ofReal
          ((1 / t) * ProbabilityTheory.gaussianPDFReal 0 1 t))) ∧
      (∀ t : ℝ, 1 ≤ t →
        Scalar.NormalTail.standardNormalTail t ≤
          ENNReal.ofReal (ProbabilityTheory.gaussianPDFReal 0 1 t)) :=
  Scalar.NormalTail.proposition_2_1_2

/-- Stable source alias for `HDP-02-LEM-NORMAL-TAIL-CALCULUS`. -/
theorem hdp_02_hlem_hnormal_htail_hcalculus {t : ℝ} (ht : 0 < t) :
    (∫ y in Set.Ioi 0, Scalar.NormalTail.shiftedGaussianKernel t y) ≤ 1 / t ∧
      ((1 / t - 1 / t ^ 3) * Scalar.NormalTail.gaussianKernel t ≤
          Scalar.NormalTail.gaussianTailIntegral t ∧
        Scalar.NormalTail.gaussianTailIntegral t ≤
          (1 / t) * Scalar.NormalTail.gaussianKernel t) :=
  Scalar.NormalTail.normalTailCalculus ht

/-- Stable source alias for `HDP-02-DEF-COMPARISON-NOTATION`. -/
def hdp_02_hdef_hcomparison_hnotation {α : Type*} :
    Filter α → (α → ℝ) → (α → ℝ) → Prop :=
  Scalar.NormalTail.comparisonTheta

/-! Stable source alias for the Chapter 2 concentration-tail convention. -/
noncomputable def hdp_02_hdef_hconcentration_htail
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : MeasureTheory.Integrable X μ) (t : ℝ) : ENNReal :=
  Scalar.NormalTail.concentrationTailProbability μ X hX t

end NumStability.HDP.Contract
