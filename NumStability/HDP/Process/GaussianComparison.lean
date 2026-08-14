import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.Calculus.LineDeriv.IntegrationByParts
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Data.Finset.Max
import Mathlib.MeasureTheory.Function.L1Space.Integrable
import Mathlib.MeasureTheory.Integral.Pi
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar
import Mathlib.MeasureTheory.Order.Lattice
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Probability.Independence.Basic
import Mathlib.Probability.Moments.Covariance
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import NumStability.HDP.Contracts.C_01_hdef_hexpectation_hvariance
import NumStability.HDP.Source.Packages.Split3.BrownianFoundation.Gaussian.BrownianMotion

/-!
# Deterministic interfaces for Gaussian comparison

This file begins with the finite-dimensional log-sum-exp smoothing used in
the proof of the Sudakov--Fernique comparison theorem.
-/

open scoped BigOperators

namespace NumStability.HDP.Process.GaussianComparison

variable {ι : Type*} [Fintype ι]

/-! ### Finite-marginal random-process interface -/

/-
The book's footnote convention for a general index set is deliberately
finite-dimensional: the expected supremum is the supremum of the expected
maximum over nonempty finite subsets.  Keeping the finite maximum and its
tail event explicit avoids introducing an unmeasurable pointwise supremum.
-/

/-- The nonempty finite index sets used by the finite-marginal convention. -/
abbrev NonemptyFiniteIndex (T : Type*) := {s : Finset T // s.Nonempty}

/-- The restriction of a process to a finite index set. -/
def finiteProcessRestriction {T Ω : Type*}
    (X : T → Ω → ℝ) (s : NonemptyFiniteIndex T) : s.1 → Ω → ℝ :=
  fun t ω ↦ X t.1 ω

/-- The pointwise maximum of a process over a finite index set. -/
noncomputable def finiteProcessMaximum {T Ω : Type*}
    (X : T → Ω → ℝ) (s : NonemptyFiniteIndex T) : Ω → ℝ := by
  classical
  exact fun ω ↦ (s.1.sup (fun t ↦ (X t ω : WithBot ℝ))).unbotD 0

/-- The finite-index tail event used by the process-supremum convention. -/
def finiteProcessSupEvent {T Ω : Type*}
    (X : T → Ω → ℝ) (s : NonemptyFiniteIndex T) (τ : ℝ) : Set Ω :=
  {ω | τ ≤ finiteProcessMaximum X s ω}

/-- Expected finite maximum, using the Chapter 1 expectation contract. -/
noncomputable def finiteProcessExpectedMaximum {T Ω : Type*}
    [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
    [MeasureTheory.IsProbabilityMeasure μ] (X : T → Ω → ℝ)
    (s : NonemptyFiniteIndex T)
    (hmax : MeasureTheory.Integrable (finiteProcessMaximum X s) μ) : ℝ :=
  (NumStability.HDP.Contract.hdp_01_hdef_hexpectation_hvariance μ
      (finiteProcessMaximum X s) hmax).mean

/--
The finite-marginal process-supremum data used throughout Chapter 7.

The `expectedSupremum` field is a supremum over finite subsets, rather than a
pointwise supremum random variable.  This is the measurability convention
stated in footnote 3 on printed page 161.
-/
structure ProcessSupremumData {T Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) (X : T → Ω → ℝ)
    (hmax : ∀ s : NonemptyFiniteIndex T,
      MeasureTheory.Integrable (finiteProcessMaximum X s) μ) where
  finiteRestriction : ∀ s : NonemptyFiniteIndex T, s.1 → Ω → ℝ
  finiteMaximum : ∀ s : NonemptyFiniteIndex T, Ω → ℝ
  finiteTailEvent : ∀ s : NonemptyFiniteIndex T, ℝ → Set Ω
  finiteExpectedMaximum : ∀ s : NonemptyFiniteIndex T, ℝ
  expectedSupremum : ℝ

/-- Semantic construction of the finite-marginal process-supremum interface. -/
noncomputable def processSupremumData {T Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X : T → Ω → ℝ)
    (hmax : ∀ s : NonemptyFiniteIndex T,
      MeasureTheory.Integrable (finiteProcessMaximum X s) μ) :
    ProcessSupremumData μ X hmax := by
  classical
  exact {
    finiteRestriction := finiteProcessRestriction X
    finiteMaximum := finiteProcessMaximum X
    finiteTailEvent := finiteProcessSupEvent X
    finiteExpectedMaximum := fun s ↦ finiteProcessExpectedMaximum μ X s (hmax s)
    expectedSupremum := sSup (Set.range (fun s : NonemptyFiniteIndex T ↦
      finiteProcessExpectedMaximum μ X s (hmax s))) }

/-! ### Covariance of Gaussian interpolation -/

/-- The covariance matrix of a finite real random vector. -/
noncomputable def randomVectorCovariance {Ω : Type*} [MeasurableSpace Ω]
    {n : ℕ} (X : Ω → Fin n → ℝ) (μ : MeasureTheory.Measure Ω) :
    Matrix (Fin n) (Fin n) ℝ :=
  fun i j ↦ ProbabilityTheory.covariance (fun ω ↦ X ω i) (fun ω ↦ X ω j) μ

/-- The interpolation `√u X + √(1-u) Y` between two finite random vectors. -/
noncomputable def gaussianInterpolation {Ω : Type*} {n : ℕ}
    (u : ℝ) (X Y : Ω → Fin n → ℝ) : Ω → Fin n → ℝ :=
  fun ω ↦ Real.sqrt u • X ω + Real.sqrt (1 - u) • Y ω

/-- The covariance matrix of the interpolation is the linear interpolation of
the covariance matrices.  The argument only needs independence and second
moments, so it applies in particular to the independent centered Gaussian
vectors in the source.

Source: Vershynin, *High-Dimensional Probability*, Exercise 7.2.2,
printed page 162 (`HDP-07-EX-7.2.2`). -/
theorem covariance_gaussianInterpolation {Ω : Type*} [MeasurableSpace Ω]
    {n : ℕ} (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X Y : Ω → Fin n → ℝ)
    (hX : ∀ i, MeasureTheory.MemLp (fun ω ↦ X ω i) 2 μ)
    (hY : ∀ i, MeasureTheory.MemLp (fun ω ↦ Y ω i) 2 μ)
    (hXY : ProbabilityTheory.IndepFun X Y μ)
    (u : ℝ) (hu : 0 ≤ u) (hu1 : u ≤ 1) :
    randomVectorCovariance (gaussianInterpolation u X Y) μ =
      u • randomVectorCovariance X μ + (1 - u) • randomVectorCovariance Y μ := by
  ext i j
  let Xi : Ω → ℝ := fun ω ↦ X ω i
  let Xj : Ω → ℝ := fun ω ↦ X ω j
  let Yi : Ω → ℝ := fun ω ↦ Y ω i
  let Yj : Ω → ℝ := fun ω ↦ Y ω j
  let a := Real.sqrt u
  let b := Real.sqrt (1 - u)
  have hXi : MeasureTheory.MemLp Xi 2 μ := hX i
  have hXj : MeasureTheory.MemLp Xj 2 μ := hX j
  have hYi : MeasureTheory.MemLp Yi 2 μ := hY i
  have hYj : MeasureTheory.MemLp Yj 2 μ := hY j
  have hXYij : ProbabilityTheory.IndepFun Xi Yj μ := by
    simpa only [Xi, Yj, Function.comp_apply] using
      hXY.comp (measurable_pi_apply i) (measurable_pi_apply j)
  have hXYji : ProbabilityTheory.IndepFun Xj Yi μ := by
    simpa only [Xj, Yi, Function.comp_apply] using
      hXY.comp (measurable_pi_apply j) (measurable_pi_apply i)
  have hcrossXY : ProbabilityTheory.covariance Xi Yj μ = 0 :=
    hXYij.covariance_eq_zero hXi hYj
  have hcrossYX : ProbabilityTheory.covariance Yi Xj μ = 0 := by
    rw [ProbabilityTheory.covariance_comm]
    exact hXYji.covariance_eq_zero hXj hYi
  have haXi := hXi.const_smul a
  have haXj := hXj.const_smul a
  have hbYi := hYi.const_smul b
  have hbYj := hYj.const_smul b
  change ProbabilityTheory.covariance (a • Xi + b • Yi) (a • Xj + b • Yj) μ =
    u * ProbabilityTheory.covariance Xi Xj μ +
      (1 - u) * ProbabilityTheory.covariance Yi Yj μ
  rw [ProbabilityTheory.covariance_add_left haXi hbYi (haXj.add hbYj),
    ProbabilityTheory.covariance_add_right haXi haXj hbYj,
    ProbabilityTheory.covariance_add_right hbYi haXj hbYj]
  simp_rw [ProbabilityTheory.covariance_smul_left,
    ProbabilityTheory.covariance_smul_right]
  rw [hcrossXY, hcrossYX]
  simp only [mul_zero, add_zero, zero_add]
  have ha_sq : a * a = u := by
    simpa only [a, pow_two] using Real.sq_sqrt hu
  have hb_sq : b * b = 1 - u := by
    simpa only [b, pow_two] using Real.sq_sqrt (sub_nonneg.mpr hu1)
  calc
    a * (a * ProbabilityTheory.covariance Xi Xj μ) +
        b * (b * ProbabilityTheory.covariance Yi Yj μ) =
      (a * a) * ProbabilityTheory.covariance Xi Xj μ +
        (b * b) * ProbabilityTheory.covariance Yi Yj μ := by ring
    _ = u * ProbabilityTheory.covariance Xi Xj μ +
        (1 - u) * ProbabilityTheory.covariance Yi Yj μ := by rw [ha_sq, hb_sq]

/-- The partition function in the log-sum-exp smoothing. -/
noncomputable def logSumExpPartition (β : ℝ) (x : ι → ℝ) : ℝ :=
  ∑ i, Real.exp (β * x i)

/-- The finite-dimensional log-sum-exp smoothing
`β⁻¹ log (∑ i, exp (β xᵢ))` from equation (7.11). -/
noncomputable def logSumExp (β : ℝ) (x : ι → ℝ) : ℝ :=
  β⁻¹ * Real.log (logSumExpPartition β x)

/-- The softmax weight associated to coordinate `i`. -/
noncomputable def softmaxWeight (β : ℝ) (x : ι → ℝ) (i : ι) : ℝ :=
  Real.exp (β * x i) / logSumExpPartition β x

theorem logSumExpPartition_pos [Nonempty ι] (β : ℝ) (x : ι → ℝ) :
    0 < logSumExpPartition β x := by
  exact Finset.sum_pos (fun i _ ↦ Real.exp_pos (β * x i)) Finset.univ_nonempty

theorem softmaxWeight_pos [Nonempty ι] (β : ℝ) (x : ι → ℝ) (i : ι) :
    0 < softmaxWeight β x i := by
  exact div_pos (Real.exp_pos _) (logSumExpPartition_pos β x)

theorem sum_softmaxWeight [Nonempty ι] (β : ℝ) (x : ι → ℝ) :
    ∑ i, softmaxWeight β x i = 1 := by
  simp only [softmaxWeight]
  rw [← Finset.sum_div]
  exact div_self (ne_of_gt (logSumExpPartition_pos β x))

/-- The largest coordinate of a nonempty finite vector. -/
noncomputable def coordinateMax [Nonempty ι] (x : ι → ℝ) : ℝ :=
  Finset.univ.sup' Finset.univ_nonempty x

theorem le_coordinateMax [Nonempty ι] (x : ι → ℝ) (i : ι) :
    x i ≤ coordinateMax x :=
  Finset.le_sup' _ (Finset.mem_univ i)

theorem exp_beta_coordinateMax_le_partition [Nonempty ι]
    (β : ℝ) (x : ι → ℝ) :
    Real.exp (β * coordinateMax x) ≤ logSumExpPartition β x := by
  obtain ⟨i, hi, hmax⟩ :=
    (Finset.le_sup'_iff (s := Finset.univ) (H := Finset.univ_nonempty) (f := x)).mp le_rfl
  have hxi : x i = coordinateMax x :=
    le_antisymm (le_coordinateMax x i) hmax
  rw [← hxi]
  exact Finset.single_le_sum (fun j _ ↦ (Real.exp_pos (β * x j)).le) hi

theorem partition_le_card_mul_exp_beta_coordinateMax [Nonempty ι]
    {β : ℝ} (hβ : 0 ≤ β) (x : ι → ℝ) :
    logSumExpPartition β x ≤
      (Fintype.card ι : ℝ) * Real.exp (β * coordinateMax x) := by
  calc
    logSumExpPartition β x
        ≤ ∑ _i : ι, Real.exp (β * coordinateMax x) := by
          exact Finset.sum_le_sum fun i _ ↦ Real.exp_le_exp.mpr <|
            mul_le_mul_of_nonneg_left (le_coordinateMax x i) hβ
    _ = (Fintype.card ι : ℝ) * Real.exp (β * coordinateMax x) := by simp

/-- The maximum is bounded above by its log-sum-exp smoothing. -/
theorem coordinateMax_le_logSumExp [Nonempty ι]
    {β : ℝ} (hβ : 0 < β) (x : ι → ℝ) :
    coordinateMax x ≤ logSumExp β x := by
  have hlog : β * coordinateMax x ≤ Real.log (logSumExpPartition β x) := by
    rw [← Real.log_exp (β * coordinateMax x)]
    exact (Real.log_le_log_iff (Real.exp_pos _)
      (logSumExpPartition_pos β x)).2 (exp_beta_coordinateMax_le_partition β x)
  calc
    coordinateMax x = β⁻¹ * (β * coordinateMax x) := by
      field_simp [ne_of_gt hβ]
    _ ≤ β⁻¹ * Real.log (logSumExpPartition β x) :=
      mul_le_mul_of_nonneg_left hlog (inv_nonneg.2 hβ.le)
    _ = logSumExp β x := rfl

/-- The log-sum-exp smoothing exceeds the maximum by at most
`log(card ι) / β`. -/
theorem logSumExp_le_coordinateMax_add [Nonempty ι]
    {β : ℝ} (hβ : 0 < β) (x : ι → ℝ) :
    logSumExp β x ≤
      coordinateMax x + Real.log (Fintype.card ι : ℝ) / β := by
  have hcard : 0 < (Fintype.card ι : ℝ) := by
    exact_mod_cast Fintype.card_pos
  have hprod :
      0 < (Fintype.card ι : ℝ) * Real.exp (β * coordinateMax x) :=
    mul_pos hcard (Real.exp_pos _)
  have hlog : Real.log (logSumExpPartition β x) ≤
      Real.log (Fintype.card ι : ℝ) + β * coordinateMax x := by
    calc
      Real.log (logSumExpPartition β x)
          ≤ Real.log ((Fintype.card ι : ℝ) *
              Real.exp (β * coordinateMax x)) :=
        (Real.log_le_log_iff (logSumExpPartition_pos β x) hprod).2
          (partition_le_card_mul_exp_beta_coordinateMax hβ.le x)
      _ = Real.log (Fintype.card ι : ℝ) + β * coordinateMax x := by
        rw [Real.log_mul (ne_of_gt hcard) (Real.exp_ne_zero _), Real.log_exp]
  calc
    logSumExp β x = β⁻¹ * Real.log (logSumExpPartition β x) := rfl
    _ ≤ β⁻¹ * (Real.log (Fintype.card ι : ℝ) + β * coordinateMax x) :=
      mul_le_mul_of_nonneg_left hlog (inv_nonneg.2 hβ.le)
    _ = coordinateMax x + Real.log (Fintype.card ι : ℝ) / β := by
      field_simp [ne_of_gt hβ]
      ring

/-- The two-sided approximation bound stated after equation (7.11). -/
theorem logSumExp_bounds [Nonempty ι]
    {β : ℝ} (hβ : 0 < β) (x : ι → ℝ) :
    coordinateMax x ≤ logSumExp β x ∧
      logSumExp β x ≤ coordinateMax x + Real.log (Fintype.card ι : ℝ) / β :=
  ⟨coordinateMax_le_logSumExp hβ x, logSumExp_le_coordinateMax_add hβ x⟩

section Derivatives

variable [Nonempty ι] [DecidableEq ι]

omit [Nonempty ι] in
/-- Replacing one coordinate decomposes the partition function into its
varying exponential term and a constant remainder. -/
theorem logSumExpPartition_update (β : ℝ) (x : ι → ℝ) (i : ι) (t : ℝ) :
    logSumExpPartition β (Function.update x i t) =
      Real.exp (β * t) +
        ∑ j ∈ (Finset.univ : Finset ι).erase i, Real.exp (β * x j) := by
  rw [logSumExpPartition]
  calc
    (∑ j, Real.exp (β * Function.update x i t j)) =
        Real.exp (β * Function.update x i t i) +
          ∑ j ∈ (Finset.univ : Finset ι).erase i,
            Real.exp (β * Function.update x i t j) :=
      (Finset.add_sum_erase Finset.univ
        (fun j ↦ Real.exp (β * Function.update x i t j)) (Finset.mem_univ i)).symm
    _ = Real.exp (β * t) +
          ∑ j ∈ (Finset.univ : Finset ι).erase i, Real.exp (β * x j) := by
      simp only [Function.update_self]
      congr 1
      apply Finset.sum_congr rfl
      intro j hj
      rw [Function.update_of_ne (Finset.ne_of_mem_erase hj)]

omit [Nonempty ι] in
/-- Coordinate derivative of the partition function. -/
theorem hasDerivAt_logSumExpPartition_update (β : ℝ) (x : ι → ℝ) (i : ι) :
    HasDerivAt (fun t ↦ logSumExpPartition β (Function.update x i t))
      (β * Real.exp (β * x i)) (x i) := by
  convert (((hasDerivAt_id (x i)).const_mul β).exp.add_const
    (∑ j ∈ (Finset.univ : Finset ι).erase i, Real.exp (β * x j))) using 1
  · funext t
    exact logSumExpPartition_update β x i t
  · simp only [id_eq]
    ring

/-- The `i`-th coordinate derivative of log-sum-exp is the softmax weight
`pᵢ`. -/
theorem hasDerivAt_logSumExp_update {β : ℝ} (hβ : 0 < β)
    (x : ι → ℝ) (i : ι) :
    HasDerivAt (fun t ↦ logSumExp β (Function.update x i t))
      (softmaxWeight β x i) (x i) := by
  have hpart := hasDerivAt_logSumExpPartition_update β x i
  have hlog := hpart.log (ne_of_gt <|
    logSumExpPartition_pos β (Function.update x i (x i)))
  have hscaled := hlog.const_mul β⁻¹
  convert hscaled using 1
  · simp only [softmaxWeight, Function.update_eq_self]
    field_simp [ne_of_gt hβ]

omit [Fintype ι] [Nonempty ι] in
/-- Derivative of one exponential numerator when coordinate `i` varies. -/
theorem hasDerivAt_exp_update (β : ℝ) (x : ι → ℝ) (i j : ι) :
    HasDerivAt (fun t ↦ Real.exp (β * Function.update x i t j))
      (if i = j then β * Real.exp (β * x i) else 0) (x i) := by
  by_cases hij : i = j
  · subst j
    simp only [Function.update_self, if_pos]
    convert ((hasDerivAt_id (x i)).const_mul β).exp using 1
    simp only [id_eq]
    ring
  · have hconst :
        (fun t ↦ Real.exp (β * Function.update x i t j)) =
          fun _t ↦ Real.exp (β * x j) := by
      funext t
      rw [Function.update_of_ne (Ne.symm hij)]
    rw [hconst]
    simpa [hij] using hasDerivAt_const (x i) (Real.exp (β * x j))

/-- Coordinate derivative of a softmax weight.  Together with
`hasDerivAt_logSumExp_update`, this is the Hessian formula
`∂ᵢ∂ⱼ f = β(δᵢⱼ pᵢ - pᵢpⱼ)` from Exercise 7.2.12. -/
theorem hasDerivAt_softmaxWeight_update (β : ℝ) (x : ι → ℝ) (i j : ι) :
    HasDerivAt (fun t ↦ softmaxWeight β (Function.update x i t) j)
      (β * ((if i = j then softmaxWeight β x i else 0) -
        softmaxWeight β x i * softmaxWeight β x j)) (x i) := by
  have hnum := hasDerivAt_exp_update β x i j
  have hden := hasDerivAt_logSumExpPartition_update β x i
  have hquot := hnum.div hden (ne_of_gt <|
    logSumExpPartition_pos β (Function.update x i (x i)))
  convert hquot using 1
  simp only [softmaxWeight, Function.update_eq_self]
  have hZ : logSumExpPartition β x ≠ 0 :=
    ne_of_gt (logSumExpPartition_pos β x)
  by_cases hij : i = j
  · subst j
    simp only [if_pos]
    field_simp [hZ]
  · simp only [if_neg hij]
    field_simp [hZ]
    ring

end Derivatives

/-! ### Finite-dimensional Gaussian integration by parts -/

open scoped InnerProductSpace

section GaussianIntegrationByParts

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The unnormalized standard Gaussian density on a real inner-product space. -/
noncomputable def euclideanGaussianKernel (x : E) : ℝ :=
  Real.exp (-(1 / 2 : ℝ) * ‖x‖ ^ 2)

theorem hasLineDerivAt_euclideanGaussianKernel (x v : E) :
    HasLineDerivAt ℝ euclideanGaussianKernel
      (-⟪x, v⟫_ℝ * euclideanGaussianKernel x) x v := by
  have hnorm := (hasFDerivAt_id x).norm_sq
  have hscaled := hnorm.const_mul (-(1 / 2 : ℝ))
  have hexp := hscaled.exp
  have hline := hexp.hasLineDerivAt v
  convert hline using 1 <;> simp [euclideanGaussianKernel, smul_eq_mul] <;> ring

/-- Gaussian integration by parts in an arbitrary direction.  The three
integrability hypotheses are exactly those required by the underlying
Lebesgue integration-by-parts theorem. -/
theorem integral_mul_inner_euclideanGaussianKernel
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {f f' : E → ℝ} (v : E)
    (hf'g : MeasureTheory.Integrable (fun x ↦ f' x * euclideanGaussianKernel x))
    (hfxg : MeasureTheory.Integrable
      (fun x ↦ f x * ⟪x, v⟫_ℝ * euclideanGaussianKernel x))
    (hfg : MeasureTheory.Integrable (fun x ↦ f x * euclideanGaussianKernel x))
    (hf : ∀ x, HasLineDerivAt ℝ f (f' x) x v) :
    ∫ x, f x * ⟪x, v⟫_ℝ * euclideanGaussianKernel x =
      ∫ x, f' x * euclideanGaussianKernel x := by
  let B : ℝ →L[ℝ] ℝ →L[ℝ] ℝ := ContinuousLinearMap.mul ℝ ℝ
  have hibp := integral_bilinear_hasLineDerivAt_right_eq_neg_left_of_integrable
    (v := v) (B := B) (f := f) (f' := f') (g := euclideanGaussianKernel)
    (g' := fun x ↦ -⟪x, v⟫_ℝ * euclideanGaussianKernel x)
    hf'g (by
      change MeasureTheory.Integrable
        (fun x ↦ f x * (-⟪x, v⟫_ℝ * euclideanGaussianKernel x))
      convert hfxg.neg using 1
      funext x
      simp only [Pi.neg_apply]
      ring) hfg
    (fun x _ ↦ hf x) (fun x _ ↦ hasLineDerivAt_euclideanGaussianKernel x v)
  dsimp only [B] at hibp
  simp only [ContinuousLinearMap.mul_apply'] at hibp
  have heq : (fun x ↦ f x * (-⟪x, v⟫_ℝ * euclideanGaussianKernel x)) =
      fun x ↦ -(f x * ⟪x, v⟫_ℝ * euclideanGaussianKernel x) := by
    funext x
    ring
  rw [heq, MeasureTheory.integral_neg] at hibp
  linarith

end GaussianIntegrationByParts

/-! ### Finite min--max smoothing -/

section GordonSmoothing

variable {U T : Type*} [Fintype U] [Nonempty U] [Fintype T] [Nonempty T]

/-- The smallest coordinate of a nonempty finite vector. -/
noncomputable def coordinateMin (x : U → ℝ) : ℝ :=
  -coordinateMax (fun u ↦ -x u)

/-- The finite hard min--max functional `min_u max_t x_{u,t}`. -/
noncomputable def finiteMinMax (x : U → T → ℝ) : ℝ :=
  coordinateMin (fun u ↦ coordinateMax (x u))

/-- Soft maximum within row `u`. -/
noncomputable def rowSoftMax (β : ℝ) (x : U → T → ℝ) (u : U) : ℝ :=
  logSumExp β (x u)

/-- Soft minimum over the row-wise soft maxima.  The two temperatures are
kept separate because both approximation errors must vanish. -/
noncomputable def softMinMax (α β : ℝ) (x : U → T → ℝ) : ℝ :=
  -logSumExp α (fun u ↦ -rowSoftMax β x u)

theorem coordinateMin_le (x : U → ℝ) (u : U) : coordinateMin x ≤ x u := by
  have h := le_coordinateMax (fun v ↦ -x v) u
  dsimp only [coordinateMin]
  linarith

theorem exists_eq_coordinateMin (x : U → ℝ) : ∃ u, x u = coordinateMin x := by
  obtain ⟨u, _hu, hmin⟩ := (Finset.le_sup'_iff (s := Finset.univ)
    (H := Finset.univ_nonempty) (f := fun v ↦ -x v)).mp le_rfl
  have hmin' : coordinateMax (fun v ↦ -x v) ≤ -x u := hmin
  refine ⟨u, ?_⟩
  apply le_antisymm
  · dsimp only [coordinateMin]
    linarith
  · exact coordinateMin_le x u

theorem coordinateMin_mono {x y : U → ℝ} (hxy : ∀ u, x u ≤ y u) :
    coordinateMin x ≤ coordinateMin y := by
  dsimp only [coordinateMin]
  exact neg_le_neg (Finset.sup'_mono_fun fun u _ ↦ neg_le_neg (hxy u))

/-- The soft minimum is below the hard minimum of its row inputs. -/
theorem softMinMax_le_coordinateMin_rowSoft { α : ℝ} (hα : 0 < α)
    (β : ℝ) (x : U → T → ℝ) :
    softMinMax α β x ≤ coordinateMin (fun u ↦ rowSoftMax β x u) := by
  have h := coordinateMax_le_logSumExp hα (fun u ↦ -rowSoftMax β x u)
  dsimp only [softMinMax, coordinateMin]
  linarith

/-- The soft minimum loses at most `log(card U) / α`. -/
theorem coordinateMin_rowSoft_sub_le_softMinMax {α : ℝ} (hα : 0 < α)
    (β : ℝ) (x : U → T → ℝ) :
    coordinateMin (fun u ↦ rowSoftMax β x u) -
        Real.log (Fintype.card U : ℝ) / α ≤ softMinMax α β x := by
  have h := logSumExp_le_coordinateMax_add hα
    (fun u ↦ -rowSoftMax β x u)
  dsimp only [softMinMax, coordinateMin]
  linarith

/-- Two-sided approximation of hard finite min--max by nested log-sum-exp. -/
theorem softMinMax_bounds {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (x : U → T → ℝ) :
    finiteMinMax x - Real.log (Fintype.card U : ℝ) / α ≤
        softMinMax α β x ∧
      softMinMax α β x ≤
        finiteMinMax x + Real.log (Fintype.card T : ℝ) / β := by
  have hrowLower : ∀ u, coordinateMax (x u) ≤ rowSoftMax β x u :=
    fun u ↦ coordinateMax_le_logSumExp hβ (x u)
  have hrowUpper : ∀ u, rowSoftMax β x u ≤
      coordinateMax (x u) + Real.log (Fintype.card T : ℝ) / β :=
    fun u ↦ logSumExp_le_coordinateMax_add hβ (x u)
  constructor
  · exact (sub_le_sub_right (coordinateMin_mono hrowLower)
      (Real.log (Fintype.card U : ℝ) / α)).trans
        (coordinateMin_rowSoft_sub_le_softMinMax hα β x)
  · obtain ⟨u, hu⟩ := exists_eq_coordinateMin (fun u ↦ coordinateMax (x u))
    calc
      softMinMax α β x ≤ coordinateMin (fun v ↦ rowSoftMax β x v) :=
        softMinMax_le_coordinateMin_rowSoft hα β x
      _ ≤ rowSoftMax β x u := coordinateMin_le _ u
      _ ≤ coordinateMax (x u) + Real.log (Fintype.card T : ℝ) / β := hrowUpper u
      _ = finiteMinMax x + Real.log (Fintype.card T : ℝ) / β := by
        rw [hu]
        rfl

/-- Softmax probability inside row `u`. -/
noncomputable def rowWeight (β : ℝ) (x : U → T → ℝ) (u : U) (t : T) : ℝ :=
  softmaxWeight β (x u) t

/-- Softmin probability of row `u`. -/
noncomputable def outerWeight (α β : ℝ) (x : U → T → ℝ) (u : U) : ℝ :=
  softmaxWeight α (fun v ↦ -rowSoftMax β x v) u

/-- Gradient weight of the soft min--max functional at coordinate `(u,t)`. -/
noncomputable def minMaxWeight (α β : ℝ) (x : U → T → ℝ)
    (u : U) (t : T) : ℝ :=
  outerWeight α β x u * rowWeight β x u t

theorem rowWeight_pos (β : ℝ) (x : U → T → ℝ) (u : U) (t : T) :
    0 < rowWeight β x u t :=
  softmaxWeight_pos β (x u) t

theorem outerWeight_pos (α β : ℝ) (x : U → T → ℝ) (u : U) :
    0 < outerWeight α β x u :=
  softmaxWeight_pos α (fun v ↦ -rowSoftMax β x v) u

theorem minMaxWeight_pos (α β : ℝ) (x : U → T → ℝ) (u : U) (t : T) :
    0 < minMaxWeight α β x u t :=
  mul_pos (outerWeight_pos α β x u) (rowWeight_pos β x u t)

theorem sum_rowWeight (β : ℝ) (x : U → T → ℝ) (u : U) :
    ∑ t, rowWeight β x u t = 1 :=
  sum_softmaxWeight β (x u)

theorem sum_outerWeight (α β : ℝ) (x : U → T → ℝ) :
    ∑ u, outerWeight α β x u = 1 :=
  sum_softmaxWeight α (fun v ↦ -rowSoftMax β x v)

theorem sum_minMaxWeight (α β : ℝ) (x : U → T → ℝ) :
    ∑ u, ∑ t, minMaxWeight α β x u t = 1 := by
  simp_rw [minMaxWeight, ← Finset.mul_sum, sum_rowWeight, mul_one]
  exact sum_outerWeight α β x

/-- Chain rule for log-sum-exp along a differentiable finite-dimensional
path. -/
theorem hasDerivAt_logSumExp_comp {I : Type*} [Fintype I] [Nonempty I]
    {β s : ℝ} (hβ : 0 < β) (z : ℝ → I → ℝ) (z' : I → ℝ)
    (hz : ∀ i, HasDerivAt (fun r ↦ z r i) (z' i) s) :
    HasDerivAt (fun r ↦ logSumExp β (z r))
      (∑ i, softmaxWeight β (z s) i * z' i) s := by
  have hpart : HasDerivAt (fun r ↦ logSumExpPartition β (z r))
      (∑ i, β * z' i * Real.exp (β * z s i)) s := by
    convert (HasDerivAt.sum (u := Finset.univ)
      fun i _ ↦ ((hz i).const_mul β).exp) using 1
    · funext r
      simp [logSumExpPartition]
    · apply Finset.sum_congr rfl
      intro i _
      ring
  have hZ : logSumExpPartition β (z s) ≠ 0 :=
    ne_of_gt (logSumExpPartition_pos β (z s))
  have hlog := hpart.log hZ
  have hscaled := hlog.const_mul β⁻¹
  convert hscaled using 1
  simp only [softmaxWeight]
  rw [div_eq_mul_inv, Finset.sum_mul, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  field_simp [ne_of_gt hβ, hZ]

/-- Chain rule for a softmax coordinate along a differentiable path. -/
theorem hasDerivAt_softmaxWeight_comp {I : Type*} [Fintype I] [Nonempty I]
    (β : ℝ) (z : ℝ → I → ℝ) (z' : I → ℝ) (s : ℝ) (i : I)
    (hz : ∀ j, HasDerivAt (fun r ↦ z r j) (z' j) s) :
    HasDerivAt (fun r ↦ softmaxWeight β (z r) i)
      (β * softmaxWeight β (z s) i *
        (z' i - ∑ j, softmaxWeight β (z s) j * z' j)) s := by
  have hnum : HasDerivAt (fun r ↦ Real.exp (β * z r i))
      (β * z' i * Real.exp (β * z s i)) s := by
    convert ((hz i).const_mul β).exp using 1 <;> ring
  have hden : HasDerivAt (fun r ↦ logSumExpPartition β (z r))
      (∑ j, β * z' j * Real.exp (β * z s j)) s := by
    convert (HasDerivAt.sum (u := Finset.univ)
      fun j _ ↦ ((hz j).const_mul β).exp) using 1
    · funext r
      simp [logSumExpPartition]
    · apply Finset.sum_congr rfl
      intro j _
      ring
  have hZ : logSumExpPartition β (z s) ≠ 0 :=
    ne_of_gt (logSumExpPartition_pos β (z s))
  have hquot := hnum.div hden hZ
  convert hquot using 1
  simp only [softmaxWeight]
  have hsum :
      ∑ j, Real.exp (β * z s j) / logSumExpPartition β (z s) * z' j =
        (∑ j, Real.exp (β * z s j) * z' j) / logSumExpPartition β (z s) := by
    rw [div_eq_mul_inv, Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro j _
    ring
  have hβsum :
      (∑ j, β * z' j * Real.exp (β * z s j)) =
        β * ∑ j, Real.exp (β * z s j) * z' j := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro j _
    ring
  rw [hsum, hβsum]
  field_simp [hZ]

theorem hasDerivAt_rowSoftMax_comp {β s : ℝ} (hβ : 0 < β)
    (z : ℝ → U → T → ℝ) (z' : U → T → ℝ) (u : U)
    (hz : ∀ u t, HasDerivAt (fun r ↦ z r u t) (z' u t) s) :
    HasDerivAt (fun r ↦ rowSoftMax β (z r) u)
      (∑ t, rowWeight β (z s) u t * z' u t) s :=
  hasDerivAt_logSumExp_comp hβ (fun r ↦ z r u) (z' u) (hz u)

/-- Gradient formula for the soft min--max along an arbitrary differentiable
array path. -/
theorem hasDerivAt_softMinMax_comp {α β s : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (z : ℝ → U → T → ℝ) (z' : U → T → ℝ)
    (hz : ∀ u t, HasDerivAt (fun r ↦ z r u t) (z' u t) s) :
    HasDerivAt (fun r ↦ softMinMax α β (z r))
      (∑ u, ∑ t, minMaxWeight α β (z s) u t * z' u t) s := by
  let dm : U → ℝ := fun u ↦ ∑ t, rowWeight β (z s) u t * z' u t
  have hrow (u : U) :
      HasDerivAt (fun r ↦ rowSoftMax β (z r) u) (dm u) s :=
    hasDerivAt_rowSoftMax_comp hβ z z' u hz
  have houter := hasDerivAt_logSumExp_comp hα
    (fun r u ↦ -rowSoftMax β (z r) u) (fun u ↦ -dm u) (fun u ↦ (hrow u).neg)
  have hneg := houter.neg
  convert hneg using 1
  simp only [outerWeight, minMaxWeight, dm]
  simp_rw [mul_neg, Finset.sum_neg_distrib, neg_neg, Finset.mul_sum]
  ring

/-- Directional derivative of a gradient weight.  This is the Hessian
formula before collecting its coefficients into `minMaxHessian`. -/
theorem hasDerivAt_minMaxWeight_comp {α β s : ℝ} (hβ : 0 < β)
    (z : ℝ → U → T → ℝ) (z' : U → T → ℝ) (u : U) (t : T)
    (hz : ∀ v q, HasDerivAt (fun r ↦ z r v q) (z' v q) s) :
    HasDerivAt (fun r ↦ minMaxWeight α β (z r) u t)
      (minMaxWeight α β (z s) u t *
        (β * (z' u t - ∑ q, rowWeight β (z s) u q * z' u q) -
          α * ((∑ q, rowWeight β (z s) u q * z' u q) -
            ∑ v, ∑ q, minMaxWeight α β (z s) v q * z' v q))) s := by
  let dm : U → ℝ := fun v ↦ ∑ q, rowWeight β (z s) v q * z' v q
  have hrow (v : U) :
      HasDerivAt (fun r ↦ rowSoftMax β (z r) v) (dm v) s :=
    hasDerivAt_rowSoftMax_comp hβ z z' v hz
  have hq := hasDerivAt_softmaxWeight_comp α
    (fun r v ↦ -rowSoftMax β (z r) v) (fun v ↦ -dm v) s u
    (fun v ↦ (hrow v).neg)
  have hr := hasDerivAt_softmaxWeight_comp β (fun r ↦ z r u) (z' u) s t (hz u)
  have hp := hq.mul hr
  convert hp using 1
  simp only [minMaxWeight, outerWeight, rowWeight, dm]
  have hglobal :
      ∑ v, softmaxWeight α (fun w ↦ -rowSoftMax β (z s) w) v *
          -(∑ q, softmaxWeight β (z s v) q * z' v q) =
        -∑ v, ∑ q,
          (softmaxWeight α (fun w ↦ -rowSoftMax β (z s) w) v *
            softmaxWeight β (z s v) q) * z' v q := by
    simp_rw [mul_neg, Finset.sum_neg_distrib, Finset.mul_sum]
    ring
  rw [hglobal]
  ring

/-- The Hessian kernel of `softMinMax`.  Its mixed entries are nonpositive
inside a row and nonnegative across distinct rows, which is the sign pattern
behind Gordon's comparison inequality. -/
noncomputable def minMaxHessian (α β : ℝ) (x : U → T → ℝ)
    (i j : U × T) : ℝ := by
  classical
  exact minMaxWeight α β x i.1 i.2 *
      (β * ((if i = j then 1 else 0) -
        if i.1 = j.1 then rowWeight β x j.1 j.2 else 0) -
      α * ((if i.1 = j.1 then rowWeight β x j.1 j.2 else 0) -
        minMaxWeight α β x j.1 j.2))

theorem minMaxHessian_symm (α β : ℝ) (x : U → T → ℝ) (i j : U × T) :
    minMaxHessian α β x i j = minMaxHessian α β x j i := by
  classical
  rcases i with ⟨u, t⟩
  rcases j with ⟨v, s⟩
  by_cases huv : u = v
  · subst v
    by_cases hts : t = s
    · subst s
      rfl
    · simp only [minMaxHessian, Prod.mk.injEq, true_and, hts, Ne.symm hts,
        if_false, if_true, minMaxWeight]
      ring
  · simp only [minMaxHessian, Prod.mk.injEq, huv, Ne.symm huv, false_and,
      if_false, sub_zero, zero_sub, mul_neg, minMaxWeight]
    ring

theorem sum_minMaxHessian_right (α β : ℝ) (x : U → T → ℝ) (i : U × T) :
    ∑ j, minMaxHessian α β x i j = 0 := by
  classical
  rcases i with ⟨u, t⟩
  rw [Fintype.sum_prod_type]
  simp only [minMaxHessian, Prod.mk.injEq]
  simp_rw [ite_and]
  simp only [mul_sub, mul_add, Finset.sum_sub_distrib, Finset.sum_add_distrib,
    Finset.sum_neg_distrib]
  simp [sum_rowWeight, sum_minMaxWeight]
  have hrowβ :
      (∑ q, minMaxWeight α β x u t * (β * rowWeight β x u q)) =
        minMaxWeight α β x u t * β := by
    rw [← Finset.mul_sum, ← Finset.mul_sum, sum_rowWeight, mul_one]
  have hrowα :
      (∑ q, minMaxWeight α β x u t * (α * rowWeight β x u q)) =
        minMaxWeight α β x u t * α := by
    rw [← Finset.mul_sum, ← Finset.mul_sum, sum_rowWeight, mul_one]
  have hall :
      (∑ v, ∑ q, minMaxWeight α β x u t * (α * minMaxWeight α β x v q)) =
        minMaxWeight α β x u t * α := by
    simp_rw [← Finset.mul_sum]
    rw [sum_minMaxWeight, mul_one]
  rw [hrowβ, hrowα, hall]
  ring

theorem sum_minMaxHessian_left (α β : ℝ) (x : U → T → ℝ) (j : U × T) :
    ∑ i, minMaxHessian α β x i j = 0 := by
  calc
    ∑ i, minMaxHessian α β x i j = ∑ i, minMaxHessian α β x j i := by
      apply Finset.sum_congr rfl
      intro i _
      exact minMaxHessian_symm α β x i j
    _ = 0 := sum_minMaxHessian_right α β x j

/-- The coefficient-collected Hessian form of
`hasDerivAt_minMaxWeight_comp`. -/
theorem hasDerivAt_minMaxWeight_comp_hessian {α β s : ℝ} (hβ : 0 < β)
    (z : ℝ → U → T → ℝ) (z' : U → T → ℝ) (u : U) (t : T)
    (hz : ∀ v q, HasDerivAt (fun r ↦ z r v q) (z' v q) s) :
    HasDerivAt (fun r ↦ minMaxWeight α β (z r) u t)
      (∑ j : U × T, minMaxHessian α β (z s) (u, t) j * z' j.1 j.2) s := by
  convert hasDerivAt_minMaxWeight_comp hβ z z' u t hz using 1
  classical
  rw [Fintype.sum_prod_type]
  simp only [minMaxHessian, Prod.mk.injEq]
  simp_rw [ite_and]
  simp only [mul_sub, mul_add, Finset.sum_sub_distrib, Finset.sum_add_distrib,
    Finset.sum_neg_distrib]
  simp
  simp_rw [sub_mul, ite_mul, zero_mul, Finset.sum_sub_distrib]
  simp
  have hβrow :
      (∑ q, minMaxWeight α β (z s) u t * (β * rowWeight β (z s) u q) * z' u q) =
        minMaxWeight α β (z s) u t *
          (β * ∑ q, rowWeight β (z s) u q * z' u q) := by
    simp_rw [Finset.mul_sum]
    ring
  have hαrow :
      (∑ q, minMaxWeight α β (z s) u t * (α * rowWeight β (z s) u q) * z' u q) =
        minMaxWeight α β (z s) u t *
          (α * ∑ q, rowWeight β (z s) u q * z' u q) := by
    simp_rw [Finset.mul_sum]
    ring
  have hglobal :
      (∑ v, ∑ q,
        minMaxWeight α β (z s) u t * (α * minMaxWeight α β (z s) v q) * z' v q) =
        minMaxWeight α β (z s) u t *
          (α * ∑ v, ∑ q, minMaxWeight α β (z s) v q * z' v q) := by
    simp_rw [Finset.mul_sum]
    ring
  rw [hβrow, hαrow, hglobal]
  ring

theorem minMaxHessian_cross_nonneg {α β : ℝ} (hα : 0 ≤ α)
    (x : U → T → ℝ) {u v : U} (huv : u ≠ v) (t s : T) :
    0 ≤ minMaxHessian α β x (u, t) (v, s) := by
  classical
  simp only [minMaxHessian, Prod.mk.injEq, huv, false_and, if_false, sub_zero,
    zero_sub, mul_neg]
  have hp := mul_nonneg (minMaxWeight_pos α β x u t).le <|
    mul_nonneg hα (minMaxWeight_pos α β x v s).le
  convert hp using 1 <;> ring

theorem minMaxHessian_within_nonpos {α β : ℝ} (hα : 0 ≤ α) (hβ : 0 ≤ β)
    (x : U → T → ℝ) (u : U) {t s : T} (hts : t ≠ s) :
    minMaxHessian α β x (u, t) (u, s) ≤ 0 := by
  classical
  have houter_le : outerWeight α β x u ≤ 1 := by
    calc
      outerWeight α β x u ≤ ∑ v, outerWeight α β x v :=
        Finset.single_le_sum (fun v _ ↦ (outerWeight_pos α β x v).le) (Finset.mem_univ u)
      _ = 1 := sum_outerWeight α β x
  have hfactor :
      -(β + α * (1 - outerWeight α β x u)) ≤ 0 := by
    have hone : 0 ≤ 1 - outerWeight α β x u := sub_nonneg.mpr houter_le
    have : 0 ≤ β + α * (1 - outerWeight α β x u) :=
      add_nonneg hβ (mul_nonneg hα hone)
    linarith
  calc
    minMaxHessian α β x (u, t) (u, s) =
        minMaxWeight α β x u t * rowWeight β x u s *
          -(β + α * (1 - outerWeight α β x u)) := by
      simp only [minMaxHessian, Prod.mk.injEq, true_and, hts, if_false, if_true,
        minMaxWeight]
      ring
    _ ≤ 0 := mul_nonpos_of_nonneg_of_nonpos
      (mul_nonneg (minMaxWeight_pos α β x u t).le (rowWeight_pos β x u s).le)
      hfactor

/-! ### Covariance and increment algebra -/

variable {K : Type*} [Fintype K]

/-- Covariance kernel of a finite centered Gaussian array represented as
linear forms in independent standard Gaussian coordinates. -/
noncomputable def linearGaussianCovariance (a : U → T → K → ℝ)
    (i j : U × T) : ℝ :=
  ∑ k, a i.1 i.2 k * a j.1 j.2 k

/-- Variance of an increment in the coefficient representation. -/
noncomputable def linearGaussianIncrementVariance (a : U → T → K → ℝ)
    (i j : U × T) : ℝ :=
  ∑ k, (a i.1 i.2 k - a j.1 j.2 k) ^ 2

theorem covariance_diagonal_sub_eq_incrementVariance (a : U → T → K → ℝ)
    (i j : U × T) :
    linearGaussianCovariance a i i + linearGaussianCovariance a j j -
        2 * linearGaussianCovariance a i j =
      linearGaussianIncrementVariance a i j := by
  simp only [linearGaussianCovariance, linearGaussianIncrementVariance]
  rw [Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro k _
  ring

theorem sum_covariance_mul_hessian_eq_increment
    {I : Type*} [Fintype I] (C H : I → I → ℝ)
    (hrow : ∀ i, ∑ j, H i j = 0) (hcol : ∀ j, ∑ i, H i j = 0) :
    ∑ i, ∑ j, C i j * H i j =
      -(1 / 2 : ℝ) * ∑ i, ∑ j, (C i i + C j j - 2 * C i j) * H i j := by
  have hleft : ∑ i, ∑ j, C i i * H i j = 0 := by
    simp_rw [← Finset.mul_sum, hrow, mul_zero]
    simp
  have hright : ∑ i, ∑ j, C j j * H i j = 0 := by
    rw [Finset.sum_comm]
    simp_rw [← Finset.mul_sum, hcol, mul_zero]
    simp
  have hexpand :
      ∑ i, ∑ j, (C i i + C j j - 2 * C i j) * H i j =
        -2 * ∑ i, ∑ j, C i j * H i j := by
    calc
      ∑ i, ∑ j, (C i i + C j j - 2 * C i j) * H i j =
          (∑ i, ∑ j, C i i * H i j) + (∑ i, ∑ j, C j j * H i j) -
            2 * ∑ i, ∑ j, C i j * H i j := by
              simp only [sub_mul, add_mul, Finset.sum_sub_distrib,
                Finset.sum_add_distrib, Finset.mul_sum]
              ring
      _ = -2 * ∑ i, ∑ j, C i j * H i j := by rw [hleft, hright]; ring
  rw [hexpand]
  ring

/-- The deterministic sign calculation in Gordon interpolation.  The first
hypothesis is the within-row inequality `Var(A_ut-A_us) ≤
Var(B_ut-B_us)`; the second is the reversed cross-row inequality. -/
theorem covarianceInterpolationKernel_nonneg {α β : ℝ}
    {L : Type*} [Fintype L]
    (hα : 0 < α) (hβ : 0 < β) (a : U → T → K → ℝ)
    (b : U → T → L → ℝ)
    (hwithin : ∀ u t s,
      linearGaussianIncrementVariance a (u, t) (u, s) ≤
        linearGaussianIncrementVariance b (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s,
      linearGaussianIncrementVariance b (u, t) (v, s) ≤
        linearGaussianIncrementVariance a (u, t) (v, s))
    (x : U → T → ℝ) :
    0 ≤ ∑ i : U × T, ∑ j : U × T,
      (linearGaussianCovariance b i j - linearGaussianCovariance a i j) *
        minMaxHessian α β x i j := by
  let C : (U × T) → (U × T) → ℝ := fun i j ↦
    linearGaussianCovariance b i j - linearGaussianCovariance a i j
  let H : (U × T) → (U × T) → ℝ := minMaxHessian α β x
  have hid := sum_covariance_mul_hessian_eq_increment C H
    (sum_minMaxHessian_right α β x) (sum_minMaxHessian_left α β x)
  rw [hid]
  apply mul_nonneg_of_nonpos_of_nonpos (by norm_num : -(1 / 2 : ℝ) ≤ 0)
  apply Finset.sum_nonpos
  intro i _
  apply Finset.sum_nonpos
  intro j _
  have hinc :
      C i i + C j j - 2 * C i j =
        linearGaussianIncrementVariance b i j -
          linearGaussianIncrementVariance a i j := by
    dsimp only [C]
    rw [sub_add_sub_comm, mul_sub, sub_sub_sub_comm]
    rw [covariance_diagonal_sub_eq_incrementVariance,
      covariance_diagonal_sub_eq_incrementVariance]
  rw [hinc]
  rcases i with ⟨u, t⟩
  rcases j with ⟨v, s⟩
  by_cases huv : u = v
  · subst v
    by_cases hts : t = s
    · subst s
      simp [linearGaussianIncrementVariance]
    · exact mul_nonpos_of_nonneg_of_nonpos
        (sub_nonneg.mpr (hwithin u t s))
        (minMaxHessian_within_nonpos hα.le hβ.le x u hts)
  · exact mul_nonpos_of_nonpos_of_nonneg
      (sub_nonpos.mpr (hcross u v huv t s))
      (minMaxHessian_cross_nonneg hα.le x huv t s)

/-! ### Gaussian angle interpolation -/

variable {L : Type*} [Fintype L]

/-- Ambient Euclidean space carrying independent standard Gaussian
coordinates for the two arrays. -/
abbrev GaussianPairSpace (K L : Type*) [Fintype K] [Fintype L] :=
  EuclideanSpace ℝ (Sum K L)

/-- Coefficient direction of a coordinate of the left array. -/
noncomputable def leftCoefficientDirection (a : U → T → K → ℝ)
    (i : U × T) : GaussianPairSpace K L :=
  WithLp.toLp 2 (Sum.elim (a i.1 i.2) (fun _ ↦ 0))

/-- Coefficient direction of a coordinate of the right array. -/
noncomputable def rightCoefficientDirection (b : U → T → L → ℝ)
    (i : U × T) : GaussianPairSpace K L :=
  WithLp.toLp 2 (Sum.elim (fun _ ↦ 0) (b i.1 i.2))

/-- A centered finite Gaussian array as linear forms in the left standard
Gaussian block. -/
noncomputable def leftGaussianArray (a : U → T → K → ℝ)
    (z : GaussianPairSpace K L) (i : U × T) : ℝ :=
  ⟪z, leftCoefficientDirection (L := L) a i⟫_ℝ

/-- A centered finite Gaussian array as linear forms in the right standard
Gaussian block. -/
noncomputable def rightGaussianArray (b : U → T → L → ℝ)
    (z : GaussianPairSpace K L) (i : U × T) : ℝ :=
  ⟪z, rightCoefficientDirection (K := K) b i⟫_ℝ

theorem inner_leftCoefficientDirection (a : U → T → K → ℝ)
    (i j : U × T) :
    ⟪leftCoefficientDirection (L := L) a i,
        leftCoefficientDirection (L := L) a j⟫_ℝ =
      linearGaussianCovariance a i j := by
  simp [leftCoefficientDirection, linearGaussianCovariance, PiLp.inner_apply,
    RCLike.inner_apply, mul_comm]
  apply Finset.sum_congr rfl
  intro k _
  simp [real_inner_eq_re_inner ℝ, RCLike.inner_apply]
  ring

theorem inner_rightCoefficientDirection (b : U → T → L → ℝ)
    (i j : U × T) :
    ⟪rightCoefficientDirection (K := K) b i,
        rightCoefficientDirection (K := K) b j⟫_ℝ =
      linearGaussianCovariance b i j := by
  simp [rightCoefficientDirection, linearGaussianCovariance, PiLp.inner_apply,
    RCLike.inner_apply, mul_comm]
  apply Finset.sum_congr rfl
  intro k _
  simp [real_inner_eq_re_inner ℝ, RCLike.inner_apply]
  ring

theorem inner_leftCoefficientDirection_rightCoefficientDirection
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (i j : U × T) :
    ⟪leftCoefficientDirection (L := L) a i,
        rightCoefficientDirection (K := K) b j⟫_ℝ = 0 := by
  simp [leftCoefficientDirection, rightCoefficientDirection, PiLp.inner_apply]

/-- The angle interpolation `cos θ X + sin θ Y` on independent Gaussian
blocks. -/
noncomputable def gordonInterpolation (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (θ : ℝ) (z : GaussianPairSpace K L)
    (i : U × T) : ℝ :=
  Real.cos θ * leftGaussianArray (L := L) a z i +
    Real.sin θ * rightGaussianArray (K := K) b z i

/-- Pointwise derivative of the angle interpolation. -/
noncomputable def gordonInterpolationDerivative (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (θ : ℝ) (z : GaussianPairSpace K L)
    (i : U × T) : ℝ :=
  -Real.sin θ * leftGaussianArray (L := L) a z i +
    Real.cos θ * rightGaussianArray (K := K) b z i

theorem hasDerivAt_gordonInterpolation (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (θ : ℝ) (z : GaussianPairSpace K L)
    (i : U × T) :
    HasDerivAt (fun r ↦ gordonInterpolation a b r z i)
      (gordonInterpolationDerivative a b θ z i) θ := by
  convert (Real.hasDerivAt_cos θ).mul_const (leftGaussianArray (L := L) a z i) |>.add
    ((Real.hasDerivAt_sin θ).mul_const (rightGaussianArray (K := K) b z i)) using 1 <;>
    simp [gordonInterpolation, gordonInterpolationDerivative] <;> ring

theorem gordonInterpolation_add_leftDirection (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (θ r : ℝ) (z : GaussianPairSpace K L)
    (i j : U × T) :
    gordonInterpolation a b θ
        (z + r • leftCoefficientDirection (L := L) a i) j =
      gordonInterpolation a b θ z j +
        r * (Real.cos θ * linearGaussianCovariance a i j) := by
  simp only [gordonInterpolation, leftGaussianArray, rightGaussianArray, inner_add_left,
    inner_smul_left, real_inner_comm]
  rw [inner_leftCoefficientDirection]
  rw [inner_leftCoefficientDirection_rightCoefficientDirection]
  simp only [starRingEnd_apply, star_trivial]
  ring

theorem gordonInterpolation_add_rightDirection (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (θ r : ℝ) (z : GaussianPairSpace K L)
    (i j : U × T) :
    gordonInterpolation a b θ
        (z + r • rightCoefficientDirection (K := K) b i) j =
      gordonInterpolation a b θ z j +
        r * (Real.sin θ * linearGaussianCovariance b i j) := by
  simp only [gordonInterpolation, leftGaussianArray, rightGaussianArray, inner_add_left,
    inner_smul_left, real_inner_comm]
  rw [inner_rightCoefficientDirection]
  rw [real_inner_comm, inner_leftCoefficientDirection_rightCoefficientDirection]
  simp only [starRingEnd_apply, star_trivial]
  ring

/-- Smooth min--max evaluated along the Gaussian angle interpolation. -/
noncomputable def gordonSmoothValue (α β : ℝ) (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (θ : ℝ) (z : GaussianPairSpace K L) : ℝ :=
  softMinMax α β (fun u t ↦ gordonInterpolation a b θ z (u, t))

/-- Pointwise angle derivative of the smooth min--max interpolation. -/
noncomputable def gordonSmoothDerivative (α β : ℝ)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ)
    (z : GaussianPairSpace K L) : ℝ :=
  ∑ u, ∑ t,
    minMaxWeight α β (fun v s ↦ gordonInterpolation a b θ z (v, s)) u t *
      gordonInterpolationDerivative a b θ z (u, t)

theorem hasDerivAt_gordonSmoothValue {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ)
    (z : GaussianPairSpace K L) :
    HasDerivAt (fun r ↦ gordonSmoothValue α β a b r z)
      (gordonSmoothDerivative α β a b θ z) θ := by
  exact hasDerivAt_softMinMax_comp hα hβ
    (fun r u t ↦ gordonInterpolation a b r z (u, t))
    (fun u t ↦ gordonInterpolationDerivative a b θ z (u, t))
    (fun u t ↦ hasDerivAt_gordonInterpolation a b θ z (u, t))

/-- Directional derivative of a smooth min--max gradient weight along the
coefficient direction of the left coordinate `i`. -/
noncomputable def leftWeightDerivative (α β : ℝ)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ)
    (z : GaussianPairSpace K L) (i : U × T) : ℝ :=
  ∑ j : U × T,
    minMaxHessian α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i j *
      (Real.cos θ * linearGaussianCovariance a i j)

/-- Directional derivative of a smooth min--max gradient weight along the
coefficient direction of the right coordinate `i`. -/
noncomputable def rightWeightDerivative (α β : ℝ)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ)
    (z : GaussianPairSpace K L) (i : U × T) : ℝ :=
  ∑ j : U × T,
    minMaxHessian α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i j *
      (Real.sin θ * linearGaussianCovariance b i j)

theorem hasLineDerivAt_minMaxWeight_left {α β : ℝ} (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ)
    (z : GaussianPairSpace K L) (i : U × T) :
    HasLineDerivAt ℝ
      (fun w ↦ minMaxWeight α β
        (fun u t ↦ gordonInterpolation a b θ w (u, t)) i.1 i.2)
      (leftWeightDerivative α β a b θ z i) z
      (leftCoefficientDirection (L := L) a i) := by
  change HasDerivAt
    (fun (r : ℝ) ↦ minMaxWeight α β
      (fun u t ↦ gordonInterpolation a b θ
        (z + r • leftCoefficientDirection (L := L) a i) (u, t)) i.1 i.2)
    (leftWeightDerivative α β a b θ z i) 0
  have hz : ∀ u t, HasDerivAt
      (fun (r : ℝ) ↦ gordonInterpolation a b θ
        (z + r • leftCoefficientDirection (L := L) a i) (u, t))
      (Real.cos θ * linearGaussianCovariance a i (u, t)) 0 := by
    intro u t
    convert (hasDerivAt_const (x := (0 : ℝ))
      (gordonInterpolation a b θ z (u, t))).add
        ((hasDerivAt_id (0 : ℝ)).mul_const
          (Real.cos θ * linearGaussianCovariance a i (u, t))) using 1
    · funext r
      exact gordonInterpolation_add_leftDirection a b θ r z i (u, t)
    · simp
  simpa only [leftWeightDerivative, zero_smul, add_zero] using
    (hasDerivAt_minMaxWeight_comp_hessian (α := α) (β := β) (s := 0) hβ
      (fun r u t ↦ gordonInterpolation a b θ
        (z + r • leftCoefficientDirection (L := L) a i) (u, t))
      (fun u t ↦ Real.cos θ * linearGaussianCovariance a i (u, t))
      i.1 i.2 hz)

theorem hasLineDerivAt_minMaxWeight_right {α β : ℝ} (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ)
    (z : GaussianPairSpace K L) (i : U × T) :
    HasLineDerivAt ℝ
      (fun w ↦ minMaxWeight α β
        (fun u t ↦ gordonInterpolation a b θ w (u, t)) i.1 i.2)
      (rightWeightDerivative α β a b θ z i) z
      (rightCoefficientDirection (K := K) b i) := by
  change HasDerivAt
    (fun (r : ℝ) ↦ minMaxWeight α β
      (fun u t ↦ gordonInterpolation a b θ
        (z + r • rightCoefficientDirection (K := K) b i) (u, t)) i.1 i.2)
    (rightWeightDerivative α β a b θ z i) 0
  have hz : ∀ u t, HasDerivAt
      (fun (r : ℝ) ↦ gordonInterpolation a b θ
        (z + r • rightCoefficientDirection (K := K) b i) (u, t))
      (Real.sin θ * linearGaussianCovariance b i (u, t)) 0 := by
    intro u t
    convert (hasDerivAt_const (x := (0 : ℝ))
      (gordonInterpolation a b θ z (u, t))).add
        ((hasDerivAt_id (0 : ℝ)).mul_const
          (Real.sin θ * linearGaussianCovariance b i (u, t))) using 1
    · funext r
      exact gordonInterpolation_add_rightDirection a b θ r z i (u, t)
    · simp
  simpa only [rightWeightDerivative, zero_smul, add_zero] using
    (hasDerivAt_minMaxWeight_comp_hessian (α := α) (β := β) (s := 0) hβ
      (fun r u t ↦ gordonInterpolation a b θ
        (z + r • rightCoefficientDirection (K := K) b i) (u, t))
      (fun u t ↦ Real.sin θ * linearGaussianCovariance b i (u, t))
      i.1 i.2 hz)

/-- Hard min--max of the left Gaussian array. -/
noncomputable def leftGaussianMinMax (a : U → T → K → ℝ)
    (z : GaussianPairSpace K L) : ℝ :=
  finiteMinMax (fun u t ↦ leftGaussianArray (L := L) a z (u, t))

/-- Hard min--max of the right Gaussian array. -/
noncomputable def rightGaussianMinMax (b : U → T → L → ℝ)
    (z : GaussianPairSpace K L) : ℝ :=
  finiteMinMax (fun u t ↦ rightGaussianArray (K := K) b z (u, t))

/-- The standard Gaussian normalizing constant in `card K + card L`
dimensions, written as a positive natural power. -/
noncomputable def gaussianPairNormalization (K L : Type*) [Fintype K] [Fintype L] : ℝ :=
  (Real.sqrt (2 * Real.pi))⁻¹ ^ (Fintype.card K + Fintype.card L)

theorem gaussianPairNormalization_pos : 0 < gaussianPairNormalization K L := by
  apply pow_pos
  exact inv_pos.mpr (Real.sqrt_pos.2 (mul_pos (by norm_num) Real.pi_pos))

/-- Expectation of the left min--max under two independent standard
Gaussian coordinate blocks.  The right block is unused but provides a
common probability space for interpolation. -/
noncomputable def leftGaussianMinMaxExpectation (a : U → T → K → ℝ) : ℝ :=
  gaussianPairNormalization K L *
    ∫ z : GaussianPairSpace K L,
      leftGaussianMinMax (L := L) a z * euclideanGaussianKernel z

/-- Expectation of the right min--max on the same product Gaussian space. -/
noncomputable def rightGaussianMinMaxExpectation (b : U → T → L → ℝ) : ℝ :=
  gaussianPairNormalization K L *
    ∫ z : GaussianPairSpace K L,
      rightGaussianMinMax (K := K) b z * euclideanGaussianKernel z

/-- Analytic integrability and domination conditions for the finite Gordon
interpolation.  These are the concrete hypotheses used to justify
differentiation under the integral and Gaussian integration by parts; no
comparison conclusion is included. -/
structure GordonIntegrable (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) where
  kernel : MeasureTheory.Integrable
    (fun z : GaussianPairSpace K L ↦ euclideanGaussianKernel z)
  hardLeft : MeasureTheory.Integrable
    (fun z : GaussianPairSpace K L ↦
      leftGaussianMinMax (L := L) a z * euclideanGaussianKernel z)
  hardRight : MeasureTheory.Integrable
    (fun z : GaussianPairSpace K L ↦
      rightGaussianMinMax (K := K) b z * euclideanGaussianKernel z)
  smooth : ∀ {α β : ℝ}, 0 < α → 0 < β → ∀ (θ : ℝ),
    MeasureTheory.Integrable (fun z : GaussianPairSpace K L ↦
      gordonSmoothValue α β a b θ z * euclideanGaussianKernel z)
  smoothMeasurable : ∀ {α β : ℝ}, 0 < α → 0 < β → ∀ (θ : ℝ),
    MeasureTheory.AEStronglyMeasurable (fun z : GaussianPairSpace K L ↦
      gordonSmoothValue α β a b θ z * euclideanGaussianKernel z)
  smoothDerivativeMeasurable : ∀ {α β : ℝ}, 0 < α → 0 < β → ∀ (θ : ℝ),
    MeasureTheory.AEStronglyMeasurable (fun z : GaussianPairSpace K L ↦
      gordonSmoothDerivative α β a b θ z * euclideanGaussianKernel z)
  derivativeBound : GaussianPairSpace K L → ℝ
  derivativeBoundIntegrable : MeasureTheory.Integrable derivativeBound
  derivative_le_bound : ∀ {α β : ℝ}, 0 < α → 0 < β →
    ∀ (θ : ℝ) (z : GaussianPairSpace K L),
    ‖gordonSmoothDerivative α β a b θ z * euclideanGaussianKernel z‖ ≤
      derivativeBound z
  weightKernel : ∀ {α β : ℝ}, 0 < α → 0 < β → ∀ (θ : ℝ) (i : U × T),
    MeasureTheory.Integrable (fun z : GaussianPairSpace K L ↦
      minMaxWeight α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
        euclideanGaussianKernel z)
  leftWeighted : ∀ {α β : ℝ}, 0 < α → 0 < β → ∀ (θ : ℝ) (i : U × T),
    MeasureTheory.Integrable (fun z : GaussianPairSpace K L ↦
      minMaxWeight α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
        leftGaussianArray (L := L) a z i * euclideanGaussianKernel z)
  rightWeighted : ∀ {α β : ℝ}, 0 < α → 0 < β → ∀ (θ : ℝ) (i : U × T),
    MeasureTheory.Integrable (fun z : GaussianPairSpace K L ↦
      minMaxWeight α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
        rightGaussianArray (K := K) b z i * euclideanGaussianKernel z)
  leftDerivative : ∀ {α β : ℝ}, 0 < α → 0 < β → ∀ (θ : ℝ) (i : U × T),
    MeasureTheory.Integrable (fun z : GaussianPairSpace K L ↦
      leftWeightDerivative α β a b θ z i * euclideanGaussianKernel z)
  rightDerivative : ∀ {α β : ℝ}, 0 < α → 0 < β → ∀ (θ : ℝ) (i : U × T),
    MeasureTheory.Integrable (fun z : GaussianPairSpace K L ↦
      rightWeightDerivative α β a b θ z i * euclideanGaussianKernel z)

theorem gordonStein_left {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b) (θ : ℝ) (i : U × T) :
    (∫ z : GaussianPairSpace K L,
      minMaxWeight α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
        leftGaussianArray (L := L) a z i * euclideanGaussianKernel z) =
      ∫ z : GaussianPairSpace K L,
        leftWeightDerivative α β a b θ z i * euclideanGaussianKernel z := by
  exact integral_mul_inner_euclideanGaussianKernel
    (leftCoefficientDirection (L := L) a i)
    (hI.leftDerivative hα hβ θ i) (hI.leftWeighted hα hβ θ i)
    (hI.weightKernel hα hβ θ i)
    (fun z ↦ hasLineDerivAt_minMaxWeight_left hβ a b θ z i)

theorem gordonStein_right {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b) (θ : ℝ) (i : U × T) :
    (∫ z : GaussianPairSpace K L,
      minMaxWeight α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
        rightGaussianArray (K := K) b z i * euclideanGaussianKernel z) =
      ∫ z : GaussianPairSpace K L,
        rightWeightDerivative α β a b θ z i * euclideanGaussianKernel z := by
  exact integral_mul_inner_euclideanGaussianKernel
    (rightCoefficientDirection (K := K) b i)
    (hI.rightDerivative hα hβ θ i) (hI.rightWeighted hα hβ θ i)
    (hI.weightKernel hα hβ θ i)
    (fun z ↦ hasLineDerivAt_minMaxWeight_right hβ a b θ z i)

/-- The unnormalized expected smooth min--max along the angle interpolation. -/
noncomputable def gordonSmoothIntegral (α β : ℝ)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ) : ℝ :=
  ∫ z : GaussianPairSpace K L,
    gordonSmoothValue α β a b θ z * euclideanGaussianKernel z

theorem hasDerivAt_gordonSmoothIntegral {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b) (θ : ℝ) :
    HasDerivAt (gordonSmoothIntegral α β a b)
      (∫ z : GaussianPairSpace K L,
        gordonSmoothDerivative α β a b θ z * euclideanGaussianKernel z) θ := by
  have hmeas : Filter.Eventually
      (fun r ↦ MeasureTheory.AEStronglyMeasurable
        (fun z : GaussianPairSpace K L ↦
          gordonSmoothValue α β a b r z * euclideanGaussianKernel z))
      (nhds θ) :=
    Filter.Eventually.of_forall (fun r ↦ hI.smoothMeasurable hα hβ r)
  have hbound : ∀ᵐ z : GaussianPairSpace K L, ∀ r ∈ (Set.univ : Set ℝ),
      ‖gordonSmoothDerivative α β a b r z * euclideanGaussianKernel z‖ ≤
        hI.derivativeBound z :=
    Filter.Eventually.of_forall fun z r _ ↦ hI.derivative_le_bound hα hβ r z
  have hdiff : ∀ᵐ z : GaussianPairSpace K L, ∀ r ∈ (Set.univ : Set ℝ),
      HasDerivAt
        (fun q ↦ gordonSmoothValue α β a b q z * euclideanGaussianKernel z)
        (gordonSmoothDerivative α β a b r z * euclideanGaussianKernel z) r :=
    Filter.Eventually.of_forall fun z r _ ↦
      (hasDerivAt_gordonSmoothValue hα hβ a b r z).mul_const
        (euclideanGaussianKernel z)
  exact (hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (F := fun (r : ℝ) (z : GaussianPairSpace K L) ↦
      gordonSmoothValue α β a b r z * euclideanGaussianKernel z)
    (F' := fun (r : ℝ) (z : GaussianPairSpace K L) ↦
      gordonSmoothDerivative α β a b r z * euclideanGaussianKernel z)
    (bound := hI.derivativeBound) (s := Set.univ) (x₀ := θ)
    Filter.univ_mem hmeas (hI.smooth hα hβ θ)
    (hI.smoothDerivativeMeasurable hα hβ θ) hbound
    hI.derivativeBoundIntegrable hdiff).2

theorem gordonSmoothDerivative_mul_kernel_expand (α β : ℝ)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ)
    (z : GaussianPairSpace K L) :
    gordonSmoothDerivative α β a b θ z * euclideanGaussianKernel z =
      ∑ i : U × T,
        ((-Real.sin θ) *
            (minMaxWeight α β
              (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
              leftGaussianArray (L := L) a z i * euclideanGaussianKernel z) +
          Real.cos θ *
            (minMaxWeight α β
              (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
              rightGaussianArray (K := K) b z i * euclideanGaussianKernel z)) := by
  rw [gordonSmoothDerivative]
  calc
    (∑ u, ∑ t,
        minMaxWeight α β (fun v s ↦ gordonInterpolation a b θ z (v, s)) u t *
          gordonInterpolationDerivative a b θ z (u, t)) * euclideanGaussianKernel z =
        ∑ u, ∑ t,
          ((-Real.sin θ) *
              (minMaxWeight α β
                (fun v s ↦ gordonInterpolation a b θ z (v, s)) u t *
                leftGaussianArray (L := L) a z (u, t) * euclideanGaussianKernel z) +
            Real.cos θ *
              (minMaxWeight α β
                (fun v s ↦ gordonInterpolation a b θ z (v, s)) u t *
                rightGaussianArray (K := K) b z (u, t) * euclideanGaussianKernel z)) := by
          simp only [gordonInterpolationDerivative, mul_add, Finset.sum_add_distrib]
          rw [add_mul]
          simp_rw [Finset.sum_mul]
          congr 1 <;>
            apply Finset.sum_congr rfl <;> intro u _ <;>
            apply Finset.sum_congr rfl <;> intro t _ <;> ring
    _ = ∑ i : U × T,
        ((-Real.sin θ) *
            (minMaxWeight α β
              (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
              leftGaussianArray (L := L) a z i * euclideanGaussianKernel z) +
          Real.cos θ *
            (minMaxWeight α β
              (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
              rightGaussianArray (K := K) b z i * euclideanGaussianKernel z)) := by
          rw [Fintype.sum_prod_type]

theorem left_rightWeightDerivative_combination (α β : ℝ)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ) (θ : ℝ)
    (z : GaussianPairSpace K L) (i : U × T) :
    (-Real.sin θ) * leftWeightDerivative α β a b θ z i +
        Real.cos θ * rightWeightDerivative α β a b θ z i =
      Real.sin θ * Real.cos θ *
        ∑ j : U × T,
          (linearGaussianCovariance b i j - linearGaussianCovariance a i j) *
            minMaxHessian α β
              (fun u t ↦ gordonInterpolation a b θ z (u, t)) i j := by
  rw [leftWeightDerivative, rightWeightDerivative, Finset.mul_sum, Finset.mul_sum,
    Finset.mul_sum]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro j _
  ring

/-- Gaussian integration by parts converts the angle derivative into the
covariance-difference/Hessian kernel. -/
theorem integral_gordonSmoothDerivative_eq_covarianceKernel
    {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b) (θ : ℝ) :
    (∫ z : GaussianPairSpace K L,
      gordonSmoothDerivative α β a b θ z * euclideanGaussianKernel z) =
      Real.sin θ * Real.cos θ *
        ∫ z : GaussianPairSpace K L,
          (∑ i : U × T, ∑ j : U × T,
            (linearGaussianCovariance b i j - linearGaussianCovariance a i j) *
              minMaxHessian α β
                (fun u t ↦ gordonInterpolation a b θ z (u, t)) i j) *
            euclideanGaussianKernel z := by
  let Xw : (U × T) → GaussianPairSpace K L → ℝ := fun i z ↦
    minMaxWeight α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
      leftGaussianArray (L := L) a z i * euclideanGaussianKernel z
  let Yw : (U × T) → GaussianPairSpace K L → ℝ := fun i z ↦
    minMaxWeight α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i.1 i.2 *
      rightGaussianArray (K := K) b z i * euclideanGaussianKernel z
  let LD : (U × T) → GaussianPairSpace K L → ℝ := fun i z ↦
    leftWeightDerivative α β a b θ z i
  let RD : (U × T) → GaussianPairSpace K L → ℝ := fun i z ↦
    rightWeightDerivative α β a b θ z i
  let Q : GaussianPairSpace K L → (U × T) → (U × T) → ℝ := fun z i j ↦
    (linearGaussianCovariance b i j - linearGaussianCovariance a i j) *
      minMaxHessian α β (fun u t ↦ gordonInterpolation a b θ z (u, t)) i j
  have hX (i : U × T) : MeasureTheory.Integrable (Xw i) := by
    simpa only [Xw] using hI.leftWeighted hα hβ θ i
  have hY (i : U × T) : MeasureTheory.Integrable (Yw i) := by
    simpa only [Yw] using hI.rightWeighted hα hβ θ i
  have hLD (i : U × T) : MeasureTheory.Integrable
      (fun z ↦ LD i z * euclideanGaussianKernel z) := by
    simpa only [LD] using hI.leftDerivative hα hβ θ i
  have hRD (i : U × T) : MeasureTheory.Integrable
      (fun z ↦ RD i z * euclideanGaussianKernel z) := by
    simpa only [RD] using hI.rightDerivative hα hβ θ i
  have hterm (i : U × T) : MeasureTheory.Integrable
      (fun z ↦ (-Real.sin θ) * Xw i z + Real.cos θ * Yw i z) :=
    (hX i).const_mul (-Real.sin θ) |>.add ((hY i).const_mul (Real.cos θ))
  have hcombined (i : U × T) : MeasureTheory.Integrable
      (fun z ↦ (-Real.sin θ) * (LD i z * euclideanGaussianKernel z) +
        Real.cos θ * (RD i z * euclideanGaussianKernel z)) :=
    (hLD i).const_mul (-Real.sin θ) |>.add ((hRD i).const_mul (Real.cos θ))
  have hpoint (i : U × T) (z : GaussianPairSpace K L) :
      (-Real.sin θ) * (LD i z * euclideanGaussianKernel z) +
          Real.cos θ * (RD i z * euclideanGaussianKernel z) =
        (Real.sin θ * Real.cos θ * ∑ j, Q z i j) *
          euclideanGaussianKernel z := by
    have hc : (-Real.sin θ) * LD i z + Real.cos θ * RD i z =
        Real.sin θ * Real.cos θ * ∑ j, Q z i j := by
      simpa only [LD, RD, Q] using
        left_rightWeightDerivative_combination α β a b θ z i
    calc
      (-Real.sin θ) * (LD i z * euclideanGaussianKernel z) +
          Real.cos θ * (RD i z * euclideanGaussianKernel z) =
          ((-Real.sin θ) * LD i z + Real.cos θ * RD i z) *
            euclideanGaussianKernel z := by ring
      _ = (Real.sin θ * Real.cos θ * ∑ j, Q z i j) *
          euclideanGaussianKernel z := by rw [hc]
  have hfinal (i : U × T) : MeasureTheory.Integrable
      (fun z ↦ (Real.sin θ * Real.cos θ * ∑ j, Q z i j) *
        euclideanGaussianKernel z) := by
    exact (hcombined i).congr (Filter.Eventually.of_forall fun z ↦ hpoint i z)
  calc
    (∫ z : GaussianPairSpace K L,
        gordonSmoothDerivative α β a b θ z * euclideanGaussianKernel z) =
        ∫ z : GaussianPairSpace K L,
          ∑ i : U × T, ((-Real.sin θ) * Xw i z + Real.cos θ * Yw i z) := by
      apply MeasureTheory.integral_congr_ae
      exact Filter.Eventually.of_forall fun z ↦ by
        simpa only [Xw, Yw] using
          gordonSmoothDerivative_mul_kernel_expand α β a b θ z
    _ = ∑ i : U × T,
        ∫ z : GaussianPairSpace K L,
          ((-Real.sin θ) * Xw i z + Real.cos θ * Yw i z) := by
      rw [MeasureTheory.integral_finset_sum Finset.univ (fun i _ ↦ hterm i)]
    _ = ∑ i : U × T,
        (((-Real.sin θ) * ∫ z : GaussianPairSpace K L, Xw i z) +
          Real.cos θ * ∫ z : GaussianPairSpace K L, Yw i z) := by
      apply Finset.sum_congr rfl
      intro i _
      rw [MeasureTheory.integral_add ((hX i).const_mul _) ((hY i).const_mul _),
        MeasureTheory.integral_const_mul, MeasureTheory.integral_const_mul]
    _ = ∑ i : U × T,
        (((-Real.sin θ) *
            ∫ z : GaussianPairSpace K L, LD i z * euclideanGaussianKernel z) +
          Real.cos θ *
            ∫ z : GaussianPairSpace K L, RD i z * euclideanGaussianKernel z) := by
      apply Finset.sum_congr rfl
      intro i _
      rw [show (∫ z : GaussianPairSpace K L, Xw i z) =
          ∫ z : GaussianPairSpace K L, LD i z * euclideanGaussianKernel z by
        simpa only [Xw, LD] using gordonStein_left hα hβ a b hI θ i]
      rw [show (∫ z : GaussianPairSpace K L, Yw i z) =
          ∫ z : GaussianPairSpace K L, RD i z * euclideanGaussianKernel z by
        simpa only [Yw, RD] using gordonStein_right hα hβ a b hI θ i]
    _ = ∑ i : U × T,
        ∫ z : GaussianPairSpace K L,
          ((-Real.sin θ) * (LD i z * euclideanGaussianKernel z) +
            Real.cos θ * (RD i z * euclideanGaussianKernel z)) := by
      apply Finset.sum_congr rfl
      intro i _
      rw [MeasureTheory.integral_add ((hLD i).const_mul _) ((hRD i).const_mul _),
        MeasureTheory.integral_const_mul, MeasureTheory.integral_const_mul]
    _ = ∑ i : U × T,
        ∫ z : GaussianPairSpace K L,
          (Real.sin θ * Real.cos θ * ∑ j, Q z i j) *
            euclideanGaussianKernel z := by
      apply Finset.sum_congr rfl
      intro i _
      exact MeasureTheory.integral_congr_ae
        (Filter.Eventually.of_forall fun z ↦ hpoint i z)
    _ = ∫ z : GaussianPairSpace K L,
        ∑ i : U × T,
          (Real.sin θ * Real.cos θ * ∑ j, Q z i j) *
            euclideanGaussianKernel z := by
      rw [MeasureTheory.integral_finset_sum Finset.univ (fun i _ ↦ hfinal i)]
    _ = Real.sin θ * Real.cos θ *
        ∫ z : GaussianPairSpace K L,
          (∑ i : U × T, ∑ j : U × T, Q z i j) *
            euclideanGaussianKernel z := by
      rw [← MeasureTheory.integral_const_mul]
      apply MeasureTheory.integral_congr_ae
      exact Filter.Eventually.of_forall fun z ↦ by
        calc
          ∑ i : U × T,
              (Real.sin θ * Real.cos θ * ∑ j, Q z i j) *
                euclideanGaussianKernel z =
              ∑ i : U × T,
                (Real.sin θ * Real.cos θ * euclideanGaussianKernel z) *
                  ∑ j, Q z i j := by
            apply Finset.sum_congr rfl
            intro i _
            ring
          _ = (Real.sin θ * Real.cos θ * euclideanGaussianKernel z) *
              ∑ i : U × T, ∑ j, Q z i j := by rw [Finset.mul_sum]
          _ = Real.sin θ * Real.cos θ *
              ((∑ i : U × T, ∑ j, Q z i j) * euclideanGaussianKernel z) := by
            ring

theorem integral_gordonSmoothDerivative_nonneg
    {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b)
    (hwithin : ∀ u t s,
      linearGaussianIncrementVariance a (u, t) (u, s) ≤
        linearGaussianIncrementVariance b (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s,
      linearGaussianIncrementVariance b (u, t) (v, s) ≤
        linearGaussianIncrementVariance a (u, t) (v, s))
    {θ : ℝ} (hθ0 : 0 ≤ θ) (hθtop : θ ≤ Real.pi / 2) :
    0 ≤ ∫ z : GaussianPairSpace K L,
      gordonSmoothDerivative α β a b θ z * euclideanGaussianKernel z := by
  rw [integral_gordonSmoothDerivative_eq_covarianceKernel hα hβ a b hI θ]
  apply mul_nonneg
  · exact mul_nonneg
      (Real.sin_nonneg_of_nonneg_of_le_pi hθ0 (hθtop.trans (by linarith [Real.pi_pos])))
      (Real.cos_nonneg_of_mem_Icc ⟨by linarith [Real.pi_pos], hθtop⟩)
  · apply MeasureTheory.integral_nonneg
    intro z
    exact mul_nonneg
      (covarianceInterpolationKernel_nonneg hα hβ a b hwithin hcross
        (fun u t ↦ gordonInterpolation a b θ z (u, t)))
      (Real.exp_pos _).le

/-- Smooth Gordon comparison between the left and right endpoints. -/
theorem gordonSmoothIntegral_left_le_right
    {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b)
    (hwithin : ∀ u t s,
      linearGaussianIncrementVariance a (u, t) (u, s) ≤
        linearGaussianIncrementVariance b (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s,
      linearGaussianIncrementVariance b (u, t) (v, s) ≤
        linearGaussianIncrementVariance a (u, t) (v, s)) :
    gordonSmoothIntegral α β a b 0 ≤
      gordonSmoothIntegral α β a b (Real.pi / 2) := by
  let f : ℝ → ℝ := gordonSmoothIntegral α β a b
  let d : ℝ → ℝ := fun r ↦
    ∫ z : GaussianPairSpace K L,
      gordonSmoothDerivative α β a b r z * euclideanGaussianKernel z
  have hd (r : ℝ) : HasDerivAt f (d r) r :=
    hasDerivAt_gordonSmoothIntegral hα hβ a b hI r
  have hmono : MonotoneOn f (Set.Icc 0 (Real.pi / 2)) := by
    apply monotoneOn_of_deriv_nonneg (convex_Icc 0 (Real.pi / 2))
    · exact (continuous_iff_continuousAt.2 fun r ↦ (hd r).continuousAt).continuousOn
    · intro r _
      exact (hd r).differentiableAt.differentiableWithinAt
    · intro r hr
      rw [interior_Icc] at hr
      rw [(hd r).deriv]
      exact integral_gordonSmoothDerivative_nonneg hα hβ a b hI hwithin hcross
        hr.1.le hr.2.le
  exact hmono ⟨le_rfl, Real.pi_div_two_pos.le⟩
    ⟨Real.pi_div_two_pos.le, le_rfl⟩ Real.pi_div_two_pos.le

theorem gordonInterpolation_zero (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (z : GaussianPairSpace K L) (i : U × T) :
    gordonInterpolation a b 0 z i = leftGaussianArray (L := L) a z i := by
  simp [gordonInterpolation]

theorem gordonInterpolation_pi_div_two (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (z : GaussianPairSpace K L) (i : U × T) :
    gordonInterpolation a b (Real.pi / 2) z i = rightGaussianArray (K := K) b z i := by
  simp [gordonInterpolation]

theorem gordonSmoothValue_zero (α β : ℝ) (a : U → T → K → ℝ)
    (b : U → T → L → ℝ) (z : GaussianPairSpace K L) :
    gordonSmoothValue α β a b 0 z =
      softMinMax α β (fun u t ↦ leftGaussianArray (L := L) a z (u, t)) := by
  simp [gordonSmoothValue, gordonInterpolation_zero]

theorem gordonSmoothValue_pi_div_two (α β : ℝ)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (z : GaussianPairSpace K L) :
    gordonSmoothValue α β a b (Real.pi / 2) z =
      softMinMax α β (fun u t ↦ rightGaussianArray (K := K) b z (u, t)) := by
  simp [gordonSmoothValue, gordonInterpolation_pi_div_two]

/-- Quantitative hard-min--max consequence of the smooth comparison. -/
theorem linearGaussianGordonMinMaxExpectation_approx
    {α β : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b)
    (hwithin : ∀ u t s,
      linearGaussianIncrementVariance a (u, t) (u, s) ≤
        linearGaussianIncrementVariance b (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s,
      linearGaussianIncrementVariance b (u, t) (v, s) ≤
        linearGaussianIncrementVariance a (u, t) (v, s)) :
    leftGaussianMinMaxExpectation (L := L) a ≤
      rightGaussianMinMaxExpectation (K := K) b +
        gaussianPairNormalization K L *
          (Real.log (Fintype.card U : ℝ) / α +
            Real.log (Fintype.card T : ℝ) / β) *
          ∫ z : GaussianPairSpace K L, euclideanGaussianKernel z := by
  let δU : ℝ := Real.log (Fintype.card U : ℝ) / α
  let δT : ℝ := Real.log (Fintype.card T : ℝ) / β
  let Z : ℝ := ∫ z : GaussianPairSpace K L, euclideanGaussianKernel z
  have hsmoothLeft := hI.smooth hα hβ 0
  have hsmoothRight := hI.smooth hα hβ (Real.pi / 2)
  have hleft :
      (∫ z : GaussianPairSpace K L,
        leftGaussianMinMax (L := L) a z * euclideanGaussianKernel z) ≤
        gordonSmoothIntegral α β a b 0 + δU * Z := by
    calc
      (∫ z : GaussianPairSpace K L,
          leftGaussianMinMax (L := L) a z * euclideanGaussianKernel z) ≤
          ∫ z : GaussianPairSpace K L,
            gordonSmoothValue α β a b 0 z * euclideanGaussianKernel z +
              δU * euclideanGaussianKernel z := by
        apply MeasureTheory.integral_mono hI.hardLeft
          (hsmoothLeft.add (hI.kernel.const_mul δU))
        intro z
        have hb := (softMinMax_bounds hα hβ
          (fun u t ↦ leftGaussianArray (L := L) a z (u, t))).1
        have hv : leftGaussianMinMax (L := L) a z ≤
            gordonSmoothValue α β a b 0 z + δU := by
          rw [gordonSmoothValue_zero]
          dsimp only [leftGaussianMinMax, δU]
          linarith
        change leftGaussianMinMax (L := L) a z * euclideanGaussianKernel z ≤
          gordonSmoothValue α β a b 0 z * euclideanGaussianKernel z +
            δU * euclideanGaussianKernel z
        calc
          leftGaussianMinMax (L := L) a z * euclideanGaussianKernel z ≤
              (gordonSmoothValue α β a b 0 z + δU) *
                euclideanGaussianKernel z :=
            mul_le_mul_of_nonneg_right hv (Real.exp_pos _).le
          _ = _ := by ring
      _ = gordonSmoothIntegral α β a b 0 + δU * Z := by
        rw [MeasureTheory.integral_add hsmoothLeft (hI.kernel.const_mul δU),
          MeasureTheory.integral_const_mul]
        rfl
  have hright :
      gordonSmoothIntegral α β a b (Real.pi / 2) ≤
        (∫ z : GaussianPairSpace K L,
          rightGaussianMinMax (K := K) b z * euclideanGaussianKernel z) + δT * Z := by
    calc
      gordonSmoothIntegral α β a b (Real.pi / 2) =
          ∫ z : GaussianPairSpace K L,
            gordonSmoothValue α β a b (Real.pi / 2) z *
              euclideanGaussianKernel z := rfl
      _ ≤ ∫ z : GaussianPairSpace K L,
          rightGaussianMinMax (K := K) b z * euclideanGaussianKernel z +
            δT * euclideanGaussianKernel z := by
        apply MeasureTheory.integral_mono hsmoothRight
          (hI.hardRight.add (hI.kernel.const_mul δT))
        intro z
        have hb := (softMinMax_bounds hα hβ
          (fun u t ↦ rightGaussianArray (K := K) b z (u, t))).2
        have hv : gordonSmoothValue α β a b (Real.pi / 2) z ≤
            rightGaussianMinMax (K := K) b z + δT := by
          rw [gordonSmoothValue_pi_div_two]
          dsimp only [rightGaussianMinMax, δT]
          exact hb
        change gordonSmoothValue α β a b (Real.pi / 2) z * euclideanGaussianKernel z ≤
          rightGaussianMinMax (K := K) b z * euclideanGaussianKernel z +
            δT * euclideanGaussianKernel z
        calc
          gordonSmoothValue α β a b (Real.pi / 2) z * euclideanGaussianKernel z ≤
              (rightGaussianMinMax (K := K) b z + δT) *
                euclideanGaussianKernel z :=
            mul_le_mul_of_nonneg_right hv (Real.exp_pos _).le
          _ = _ := by ring
      _ = (∫ z : GaussianPairSpace K L,
          rightGaussianMinMax (K := K) b z * euclideanGaussianKernel z) +
          δT * Z := by
        rw [MeasureTheory.integral_add hI.hardRight (hI.kernel.const_mul δT),
          MeasureTheory.integral_const_mul]
  have hraw :
      (∫ z : GaussianPairSpace K L,
        leftGaussianMinMax (L := L) a z * euclideanGaussianKernel z) ≤
        (∫ z : GaussianPairSpace K L,
          rightGaussianMinMax (K := K) b z * euclideanGaussianKernel z) +
          (δU + δT) * Z := by
    have hs := gordonSmoothIntegral_left_le_right hα hβ a b hI hwithin hcross
    linarith
  rw [leftGaussianMinMaxExpectation, rightGaussianMinMaxExpectation]
  have hnorm := (gaussianPairNormalization_pos (K := K) (L := L)).le
  have := mul_le_mul_of_nonneg_left hraw hnorm
  dsimp only [δU, δT, Z] at this ⊢
  nlinarith

/-- Finite Gaussian min--max comparison without equal point variances.

The arrays are represented as linear forms in two independent standard
Gaussian coordinate blocks, hence are centered Gaussian arrays.  The
within-row increments of `a` are dominated by those of `b`, while the
cross-row increments have the reversed orientation.  `GordonIntegrable`
records precisely the integrability and domination used by differentiation
under the integral and Gaussian integration by parts.

This is the locally proved foundation theorem bound to
`EXT-GORDON-GAUSSIAN-MINMAX`. -/
theorem linearGaussianGordonMinMaxExpectation
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b)
    (hwithin : ∀ u t s,
      linearGaussianIncrementVariance a (u, t) (u, s) ≤
        linearGaussianIncrementVariance b (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s,
      linearGaussianIncrementVariance b (u, t) (v, s) ≤
        linearGaussianIncrementVariance a (u, t) (v, s)) :
    leftGaussianMinMaxExpectation (L := L) a ≤
      rightGaussianMinMaxExpectation (K := K) b := by
  have hcardU : (1 : ℝ) ≤ Fintype.card U := by
    exact_mod_cast (Fintype.card_pos : 0 < Fintype.card U)
  have hcardT : (1 : ℝ) ≤ Fintype.card T := by
    exact_mod_cast (Fintype.card_pos : 0 < Fintype.card T)
  have hlogU : 0 ≤ Real.log (Fintype.card U : ℝ) := Real.log_nonneg hcardU
  have hlogT : 0 ≤ Real.log (Fintype.card T : ℝ) := Real.log_nonneg hcardT
  have hZ : 0 ≤ ∫ z : GaussianPairSpace K L, euclideanGaussianKernel z :=
    MeasureTheory.integral_nonneg fun z ↦ (Real.exp_pos _).le
  let C : ℝ := gaussianPairNormalization K L *
    (∫ z : GaussianPairSpace K L, euclideanGaussianKernel z) *
      (Real.log (Fintype.card U : ℝ) + Real.log (Fintype.card T : ℝ))
  have hC : 0 ≤ C := by
    dsimp only [C]
    exact mul_nonneg
      (mul_nonneg (gaussianPairNormalization_pos (K := K) (L := L)).le hZ)
      (add_nonneg hlogU hlogT)
  refine le_of_forall_pos_le_add fun ε hε ↦ ?_
  let q : ℝ := C / ε + 1
  have hq : 0 < q := by
    dsimp only [q]
    positivity
  have happ := linearGaussianGordonMinMaxExpectation_approx
    (a := a) (b := b) (hI := hI) (hwithin := hwithin) (hcross := hcross) hq hq
  have herr : gaussianPairNormalization K L *
      (Real.log (Fintype.card U : ℝ) / q +
        Real.log (Fintype.card T : ℝ) / q) *
      (∫ z : GaussianPairSpace K L, euclideanGaussianKernel z) = C / q := by
    dsimp only [C]
    field_simp [ne_of_gt hq]
  rw [herr] at happ
  have heq : ε * q = C + ε := by
    dsimp only [q]
    field_simp [ne_of_gt hε]
  have herrlt : C / q < ε := by
    rw [div_lt_iff₀ hq]
    rw [heq]
    linarith
  linarith

/-- Expectation-only Gordon comparison without equal point variances.

Source: Vershynin, paragraph after Exercise 7.2.14, printed page 168
(`HDP-07-THM-GORDON-EXPECTATION-NOEQVAR`). -/
theorem gordonExpectationComparisonNoEqualVariances
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : GordonIntegrable a b)
    (hwithin : ∀ u t s,
      linearGaussianIncrementVariance a (u, t) (u, s) ≤
        linearGaussianIncrementVariance b (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s,
      linearGaussianIncrementVariance b (u, t) (v, s) ≤
        linearGaussianIncrementVariance a (u, t) (v, s)) :
    leftGaussianMinMaxExpectation (L := L) a ≤
      rightGaussianMinMaxExpectation (K := K) b :=
  linearGaussianGordonMinMaxExpectation a b hI hwithin hcross

end GordonSmoothing

section BrownianCharacterization

/-- Almost-sure continuity of the sample paths of a real process indexed by
nonnegative time. -/
def HasContinuousSamplePaths {Ω : Type*} [MeasurableSpace Ω]
    (X : NNReal → Ω → ℝ) (P : MeasureTheory.Measure Ω) : Prop :=
  ∀ᵐ ω ∂P, Continuous fun t ↦ X t ω

/-- Package a verified sample path in Mathlib's continuous-map path space. -/
def samplePathToContinuousMap {Ω : Type*} (X : NNReal → Ω → ℝ) (ω : Ω)
    (hω : Continuous fun t ↦ X t ω) : C(NNReal, ℝ) :=
  ContinuousMap.mk (fun t ↦ X t ω) hω

theorem continuous_samplePathToContinuousMap {Ω : Type*}
    (X : NNReal → Ω → ℝ) (ω : Ω) (hω : Continuous fun t ↦ X t ω) :
    Continuous ⇑(samplePathToContinuousMap X ω hω) :=
  ContinuousMap.continuous _

/-- The process starts at zero almost surely.  This is the condition omitted
from the printed characterization in Example 7.1.4. -/
def IsAnchoredAtZero {Ω : Type*} [MeasurableSpace Ω]
    (X : NNReal → Ω → ℝ) (P : MeasureTheory.Measure Ω) : Prop :=
  X 0 =ᵐ[P] 0

/-- Every increment has the centered normal law with variance equal to the
elapsed time. -/
def HasBrownianIncrementLaws {Ω : Type*} [MeasurableSpace Ω]
    (X : NNReal → Ω → ℝ) (P : MeasureTheory.Measure Ω) : Prop :=
  ∀ s t, ∀ hst : s ≤ t,
    ProbabilityTheory.HasLaw (fun ω ↦ X t ω - X s ω)
      (ProbabilityTheory.gaussianReal 0 (t - s)) P

/-- Successive increments along every finite increasing time grid are
mutually independent. -/
def HasIndependentIncrements {Ω : Type*} [MeasurableSpace Ω]
    (X : NNReal → Ω → ℝ) (P : MeasureTheory.Measure Ω) : Prop :=
  ∀ (n : ℕ) (t : Fin (n + 1) → NNReal),
    (∀ i : Fin n, t i.castSucc ≤ t i.succ) →
      ProbabilityTheory.iIndepFun
        (fun i : Fin n ↦ fun ω ↦ X (t i.succ) ω - X (t i.castSucc) ω) P

/-- The two increment clauses from the printed characterization. -/
def HasBrownianIncrements {Ω : Type*} [MeasurableSpace Ω]
    (X : NNReal → Ω → ℝ) (P : MeasureTheory.Measure Ω) : Prop :=
  HasIndependentIncrements X P ∧ HasBrownianIncrementLaws X P

/-- Correct source-facing characterization of standard Brownian motion: the
two printed clauses together with the missing zero-time anchor. -/
def IsStandardBrownianMotion {Ω : Type*} [MeasurableSpace Ω]
    (X : NNReal → Ω → ℝ) (P : MeasureTheory.Measure Ω) : Prop :=
  HasContinuousSamplePaths X P ∧ HasBrownianIncrements X P ∧ IsAnchoredAtZero X P

/-- The corrected characterization, making the omitted anchor explicit. -/
theorem standardBrownian_iff {Ω : Type*} [MeasurableSpace Ω]
    (X : NNReal → Ω → ℝ) (P : MeasureTheory.Measure Ω) :
    IsStandardBrownianMotion X P ↔
      HasContinuousSamplePaths X P ∧ HasBrownianIncrements X P ∧
        IsAnchoredAtZero X P :=
  Iff.rfl

/-- Adding a time-independent random offset preserves path continuity. -/
theorem HasContinuousSamplePaths.add_randomOffset
    {Ω : Type*} [MeasurableSpace Ω] {X : NNReal → Ω → ℝ}
    {P : MeasureTheory.Measure Ω} (hX : HasContinuousSamplePaths X P)
    (Z : Ω → ℝ) :
    HasContinuousSamplePaths (fun t ω ↦ X t ω + Z ω) P := by
  filter_upwards [hX] with ω hω
  exact hω.add continuous_const

/-- A time-independent offset cancels from every increment. -/
theorem HasBrownianIncrements.add_randomOffset
    {Ω : Type*} [MeasurableSpace Ω] {X : NNReal → Ω → ℝ}
    {P : MeasureTheory.Measure Ω} (hX : HasBrownianIncrements X P)
    (Z : Ω → ℝ) :
    HasBrownianIncrements (fun t ω ↦ X t ω + Z ω) P := by
  refine ⟨?_, ?_⟩
  · intro n t ht
    simpa only [add_sub_add_right_eq_sub] using hX.1 n t ht
  · intro s t hst
    simpa only [add_sub_add_right_eq_sub] using hX.2 s t hst

/-- A nonzero random offset destroys the zero-time anchor of an anchored
process. -/
theorem not_isAnchoredAtZero_add_randomOffset
    {Ω : Type*} [MeasurableSpace Ω] {X : NNReal → Ω → ℝ}
    {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P] {Z : Ω → ℝ}
    (hX : IsAnchoredAtZero X P) (hZ : ∀ᵐ ω ∂P, Z ω ≠ 0) :
    ¬ IsAnchoredAtZero (fun t ω ↦ X t ω + Z ω) P := by
  intro hXZ
  have hfalse : ∀ᵐ _ω ∂P, False := by
    filter_upwards [hX, hZ, hXZ] with ω hXω hZω hXZω
    simp only [Pi.zero_apply] at hXω hXZω
    rw [hXω, zero_add] at hXZω
    exact hZω hXZω
  exact (Filter.Eventually.exists hfalse).elim fun _ω hω ↦ hω

/-- The random-offset obstruction to the printed two-clause
characterization.  Independence of the offset from the process is more than
is needed: every nonzero time-independent offset cancels from increments. -/
theorem randomOffsetObstruction
    {Ω : Type*} [MeasurableSpace Ω] {X : NNReal → Ω → ℝ}
    {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P] {Z : Ω → ℝ}
    (hX : IsStandardBrownianMotion X P) (hZ : ∀ᵐ ω ∂P, Z ω ≠ 0) :
    HasContinuousSamplePaths (fun t ω ↦ X t ω + Z ω) P ∧
      HasBrownianIncrements (fun t ω ↦ X t ω + Z ω) P ∧
      ¬ IsAnchoredAtZero (fun t ω ↦ X t ω + Z ω) P :=
  ⟨hX.1.add_randomOffset Z, hX.2.1.add_randomOffset Z,
    not_isAnchoredAtZero_add_randomOffset hX.2.2 hZ⟩

/-- A complete probability-space witness for the corrected Brownian
characterization. -/
structure StandardBrownianModel where
  Ω : Type*
  mΩ : MeasurableSpace Ω
  P : @MeasureTheory.Measure Ω mΩ
  probability : @MeasureTheory.IsProbabilityMeasure Ω mΩ P
  X : NNReal → Ω → ℝ
  isBrownian : @IsStandardBrownianMotion Ω mΩ X P

/-- Existence of a standard Brownian model, obtained from the projective-limit
Gaussian process and its continuous modification. -/
theorem standardBrownianModel_nonempty : Nonempty StandardBrownianModel.{0} := by
  refine ⟨{
    Ω := NNReal → ℝ
    mΩ := inferInstance
    P := ProbabilityTheory.gaussianLimit
    probability := inferInstance
    X := ProbabilityTheory.brownian
    isBrownian := ?_ }⟩
  refine ⟨MeasureTheory.ae_of_all _ ProbabilityTheory.continuous_brownian, ⟨?_, ?_⟩, ?_⟩
  · intro n t ht
    exact ProbabilityTheory.hasIndepIncrements_brownian n t
      (Fin.monotone_iff_le_succ.mpr ht)
  · intro s t hst
    have hlaw := ProbabilityTheory.hasLaw_brownian_sub (s := t) (t := s)
    rw [tsub_eq_zero_of_le hst] at hlaw
    have hmax : max (t - s) 0 = t - s := max_eq_left (zero_le _)
    simpa only [hmax, Pi.sub_apply] using hlaw
  · exact ProbabilityTheory.hasLaw_brownian_eval.ae_eq_const_of_gaussianReal

/-- Complete correction of the characterization in Example 7.1.4: a
standard model exists, the missing zero anchor gives the correct statement,
and a nonzero random offset witnesses the failure of the printed statement.
The final field records the bridge to Mathlib's continuous-map path space. -/
structure BrownianCharacterizationCorrection : Prop where
  standardModel : Nonempty StandardBrownianModel.{0}
  correctedCharacterization :
    ∀ {Ω : Type*} [MeasurableSpace Ω] (X : NNReal → Ω → ℝ)
      (P : MeasureTheory.Measure Ω),
      IsStandardBrownianMotion X P ↔
        HasContinuousSamplePaths X P ∧ HasBrownianIncrements X P ∧ IsAnchoredAtZero X P
  randomOffsetCounterexample :
    ∀ {Ω : Type*} [MeasurableSpace Ω] {X : NNReal → Ω → ℝ}
      {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P] {Z : Ω → ℝ},
      IsStandardBrownianMotion X P → (∀ᵐ ω ∂P, Z ω ≠ 0) →
        HasContinuousSamplePaths (fun t ω ↦ X t ω + Z ω) P ∧
          HasBrownianIncrements (fun t ω ↦ X t ω + Z ω) P ∧
          ¬ IsAnchoredAtZero (fun t ω ↦ X t ω + Z ω) P
  pathSpaceBridge :
    ∀ {Ω : Type*} (X : NNReal → Ω → ℝ) (ω : Ω)
      (hω : Continuous fun t ↦ X t ω),
      Continuous ⇑(samplePathToContinuousMap X ω hω)

/-- The proved source correction and existence package for Example 7.1.4. -/
theorem brownianCharacterizationCorrection : BrownianCharacterizationCorrection where
  standardModel := standardBrownianModel_nonempty
  correctedCharacterization := standardBrownian_iff
  randomOffsetCounterexample := fun hX hZ ↦ randomOffsetObstruction hX hZ
  pathSpaceBridge := continuous_samplePathToContinuousMap

end BrownianCharacterization

end NumStability.HDP.Process.GaussianComparison

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-07-DEF-LOGSUMEXP`. -/
noncomputable def hdp_07_hdef_hlogsumexp {ι : Type*} [Fintype ι] :
    ℝ → (ι → ℝ) → ℝ :=
  Process.GaussianComparison.logSumExp

/-- Stable source alias for `HDP-07-THM-GORDON-EXPECTATION-NOEQVAR`. -/
theorem hdp_07_hthm_hgordon_hexpectation_hnoeqvar
    {U T : Type*} [Fintype U] [Nonempty U] [Fintype T] [Nonempty T]
    {K : Type*} [Fintype K] {L : Type*} [Fintype L]
    (a : U → T → K → ℝ) (b : U → T → L → ℝ)
    (hI : Process.GaussianComparison.GordonIntegrable a b)
    (hwithin : ∀ u t s,
      Process.GaussianComparison.linearGaussianIncrementVariance a (u, t) (u, s) ≤
        Process.GaussianComparison.linearGaussianIncrementVariance b (u, t) (u, s))
    (hcross : ∀ u v, u ≠ v → ∀ t s,
      Process.GaussianComparison.linearGaussianIncrementVariance b (u, t) (v, s) ≤
        Process.GaussianComparison.linearGaussianIncrementVariance a (u, t) (v, s)) :
    Process.GaussianComparison.leftGaussianMinMaxExpectation (L := L) a ≤
      Process.GaussianComparison.rightGaussianMinMaxExpectation (K := K) b :=
  Process.GaussianComparison.gordonExpectationComparisonNoEqualVariances
    a b hI hwithin hcross

/-- Stable source alias for `HDP-07-EX-7.2.2`. -/
theorem hdp_07_hex_h7_d2_d2 {Ω : Type*} [MeasurableSpace Ω]
    {n : ℕ} (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X Y : Ω → Fin n → ℝ)
    (hX : ∀ i, MeasureTheory.MemLp (fun ω ↦ X ω i) 2 μ)
    (hY : ∀ i, MeasureTheory.MemLp (fun ω ↦ Y ω i) 2 μ)
    (hXY : ProbabilityTheory.IndepFun X Y μ)
    (u : ℝ) (hu : 0 ≤ u) (hu1 : u ≤ 1) :
    Process.GaussianComparison.randomVectorCovariance
        (Process.GaussianComparison.gaussianInterpolation u X Y) μ =
      u • Process.GaussianComparison.randomVectorCovariance X μ +
        (1 - u) • Process.GaussianComparison.randomVectorCovariance Y μ :=
  Process.GaussianComparison.covariance_gaussianInterpolation
    μ X Y hX hY hXY u hu hu1

/-- Stable source alias for `HDP-07-EXAMPLE-7.1.4`. -/
theorem hdp_07_hexample_h7_d1_d4 :
    Process.GaussianComparison.BrownianCharacterizationCorrection :=
  Process.GaussianComparison.brownianCharacterizationCorrection

/-! The process-supremum interface is definition-like, so the stable alias
forwards the real semantic construction rather than introducing a theorem
wrapper or an axiom-shaped placeholder. -/

/-- Stable source alias for `HDP-07-IFACE-PROCESS-SUP`. -/
noncomputable def hdp_07_hiface_hprocess_hsup {T Ω : Type*}
    [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
    [MeasureTheory.IsProbabilityMeasure μ] (X : T → Ω → ℝ)
    (hmax : ∀ s : Process.GaussianComparison.NonemptyFiniteIndex T,
      MeasureTheory.Integrable
        (Process.GaussianComparison.finiteProcessMaximum X s) μ) :
    Process.GaussianComparison.ProcessSupremumData μ X hmax :=
  Process.GaussianComparison.processSupremumData μ X hmax

end NumStability.HDP.Contract
