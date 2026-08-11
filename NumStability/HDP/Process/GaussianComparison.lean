import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Data.Finset.Max
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Deterministic interfaces for Gaussian comparison

This file begins with the finite-dimensional log-sum-exp smoothing used in
the proof of the Sudakov--Fernique comparison theorem.
-/

open scoped BigOperators

namespace NumStability.HDP.Process.GaussianComparison

variable {ι : Type*} [Fintype ι]

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

end NumStability.HDP.Process.GaussianComparison

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-07-DEF-LOGSUMEXP`. -/
noncomputable def hdp_07_hdef_hlogsumexp {ι : Type*} [Fintype ι] :
    ℝ → (ι → ℝ) → ℝ :=
  Process.GaussianComparison.logSumExp

end NumStability.HDP.Contract
