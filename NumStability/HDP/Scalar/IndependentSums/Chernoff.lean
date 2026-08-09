import Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Probability.HasLaw
import Mathlib.Probability.Independence.Integration
import Mathlib.Probability.Distributions.Poisson
import Mathlib.MeasureTheory.Integral.Lebesgue.Countable
import Mathlib.Analysis.Asymptotics.AsymptoticEquivalent
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Tactic
import NumStability.HDP.Scalar.IndependentSums.Hoeffding
import NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw

/-!
# The Erdős--Rényi random graph interface

This module uses Mathlib's canonical binomial random graph law on finite simple
graphs and exposes the vertex-degree observable used by the Chapter 2
application.
-/

noncomputable section

open MeasureTheory
open ProbabilityTheory
open scoped BigOperators
open scoped ENNReal
open scoped NNReal
open scoped Asymptotics

namespace NumStability.HDP.Scalar.IndependentSums.Chernoff

theorem bernoulliMgfExact (p : ℝ≥0) (hp : p ≤ 1) (lam : ℝ) :
    (∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
      (PMF.bernoulli p hp).toMeasure) =
      1 + (Real.exp lam - 1) * (p : ℝ) := by
  rw [PMF.integral_eq_sum]
  simp [PMF.bernoulli_apply]
  rw [NNReal.coe_sub hp]
  norm_num
  ring

theorem bernoulliMgfBound (p : ℝ≥0) (hp : p ≤ 1) (lam : ℝ) :
    ((∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
        (PMF.bernoulli p hp).toMeasure) =
        1 + (Real.exp lam - 1) * (p : ℝ)) ∧
      (1 + (Real.exp lam - 1) * (p : ℝ) ≤
        Real.exp ((Real.exp lam - 1) * (p : ℝ))) := by
  refine ⟨bernoulliMgfExact p hp lam, ?_⟩
  simpa [add_comm] using Real.add_one_le_exp ((Real.exp lam - 1) * (p : ℝ))

theorem poissonBinomialMgfBound
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (lam : ℝ)
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp (lam * (if B i ω then 1 else 0))) μ) :
    (∫ ω, Real.exp (lam * ∑ i, (if B i ω then 1 else 0)) ∂μ) ≤
      Real.exp ((Real.exp lam - 1) * ∑ i, (p i : ℝ)) := by
  let Y : ι → Ω → ℝ := fun i ω => if B i ω then 1 else 0
  have hY : iIndepFun Y μ := by
    let g : ∀ _ : ι, Bool → ℝ := fun _ b => if b then 1 else 0
    have h := hB.comp g (fun _ => by fun_prop)
    simpa [Y, g, Function.comp_def] using h
  have hExpY : ∀ i, Integrable (fun ω => Real.exp (lam * (1 * Y i ω))) μ := by
    intro i
    simpa [Y, one_mul] using hExp i
  have hFactor : ∀ i, (∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) ≤
      Real.exp ((Real.exp lam - 1) * (p i : ℝ)) := by
    intro i
    have hcomp := (hLaw i).integral_comp
      (f := fun b : Bool => Real.exp (lam * (if b then 1 else 0))) (by fun_prop)
    calc
      (∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ) =
          ∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
            (PMF.bernoulli (p i) (hp i)).toMeasure := by
        simpa [Y, Function.comp_def] using hcomp
      _ = 1 + (Real.exp lam - 1) * (p i : ℝ) := bernoulliMgfExact (p i) (hp i) lam
      _ ≤ Real.exp ((Real.exp lam - 1) * (p i : ℝ)) :=
        (bernoulliMgfBound (p i) (hp i) lam).2
  calc
    (∫ ω, Real.exp (lam * ∑ i, (if B i ω then 1 else 0)) ∂μ) =
        ∏ i, ∫ ω, Real.exp (lam * (1 * Y i ω)) ∂μ := by
      simpa [Y] using
          (NumStability.HDP.Scalar.IndependentSums.Hoeffding.mgfIndependentSum
          (μ := μ) (X := Y) lam (fun _ => 1) hY hExpY)
    _ ≤ ∏ i, Real.exp ((Real.exp lam - 1) * (p i : ℝ)) := by
      apply Finset.prod_le_prod
      · intro i _
        exact integral_nonneg (fun _ => Real.exp_nonneg _)
      · intro i _
        exact hFactor i
    _ = Real.exp ((Real.exp lam - 1) * ∑ i, (p i : ℝ)) := by
      rw [← Real.exp_sum]
      congr 1
      rw [Finset.mul_sum]

theorem poissonBinomialChernoffBound
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {t : ℝ}
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp (Real.log (t / (∑ i, (p i : ℝ))) *
        (if B i ω then 1 else 0))) μ)
    (ht : ∑ i, (p i : ℝ) < t)
    (hμ : 0 < ∑ i, (p i : ℝ))
    (hExpS : Integrable
      (fun ω => Real.exp (Real.log (t / (∑ i, (p i : ℝ))) *
        ∑ i, (if B i ω then 1 else 0))) μ) :
    μ.real {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} ≤
      Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) := by
  let S : Ω → ℝ := fun ω => ∑ i, (if B i ω then 1 else 0)
  have hS : Measurable S := by
    dsimp [S]
    refine Finset.measurable_fun_sum Finset.univ ?_
    intro i hi
    exact Measurable.ite
      (measurableSet_preimage (hMeas i) (measurableSet_singleton (true : Bool)))
      measurable_const measurable_const
  have hlogpos : 0 < Real.log (t / (∑ i, (p i : ℝ))) := by
    apply Real.log_pos
    rw [one_lt_div hμ]
    exact ht
  have hmgf := poissonBinomialMgfBound hp hB hLaw
    (Real.log (t / (∑ i, (p i : ℝ)))) hExp
  have hmarkov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (lam := Real.log (t / (∑ i, (p i : ℝ)))) (t := t) hS hlogpos hExpS
  have hbound :
      (∫ ω, Real.exp (Real.log (t / (∑ i, (p i : ℝ))) * S ω) ∂μ) ≤
        Real.exp ((Real.exp (Real.log (t / (∑ i, (p i : ℝ)))) - 1) *
          (∑ i, (p i : ℝ))) := by
    simpa [S] using hmgf
  have hmul :
      Real.exp (-(Real.log (t / (∑ i, (p i : ℝ))) * t)) *
          (∫ ω, Real.exp (Real.log (t / (∑ i, (p i : ℝ))) * S ω) ∂μ) ≤
        Real.exp (-(Real.log (t / (∑ i, (p i : ℝ))) * t)) *
          Real.exp ((Real.exp (Real.log (t / (∑ i, (p i : ℝ)))) - 1) *
            (∑ i, (p i : ℝ))) :=
    mul_le_mul_of_nonneg_left hbound (Real.exp_nonneg _)
  calc
    μ.real {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} =
        μ.real (S ⁻¹' Set.Ici t) := by
      rfl
    _ ≤ Real.exp (-(Real.log (t / (∑ i, (p i : ℝ))) * t)) *
        (∫ ω, Real.exp (Real.log (t / (∑ i, (p i : ℝ))) * S ω) ∂μ) := by
      simpa [S, mul_comm] using hmarkov
    _ ≤ Real.exp (-(Real.log (t / (∑ i, (p i : ℝ))) * t)) *
        Real.exp ((Real.exp (Real.log (t / (∑ i, (p i : ℝ)))) - 1) *
          (∑ i, (p i : ℝ))) := hmul
    _ = Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) := by
      have ht0 : 0 < t := lt_trans hμ ht
      have hratio : 0 < t / (∑ i, (p i : ℝ)) := div_pos ht0 hμ
      have hbase : 0 < Real.exp 1 * (∑ i, (p i : ℝ)) / t :=
        div_pos (mul_pos (Real.exp_pos _) hμ) ht0
      rw [Real.exp_log hratio]
      rw [Real.rpow_def_of_pos hbase]
      rw [Real.log_div (mul_ne_zero (ne_of_gt (Real.exp_pos (1 : ℝ)))
        (ne_of_gt hμ)) (ne_of_gt ht0)]
      rw [Real.log_mul (ne_of_gt (Real.exp_pos (1 : ℝ))) (ne_of_gt hμ)]
      rw [Real.log_exp]
      rw [← Real.exp_add]
      rw [← Real.exp_add]
      congr 1
      rw [Real.log_div (ne_of_gt (lt_trans hμ ht)) (ne_of_gt hμ)]
      field_simp
      ring

theorem poissonBinomialLowerChernoffBound
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {t : ℝ}
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp ((-Real.log ((∑ i, (p i : ℝ)) / t)) *
        (if B i ω then 1 else 0))) μ)
    (ht : 0 < t)
    (htμ : t < ∑ i, (p i : ℝ))
    (hExpS : Integrable
      (fun ω => Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) *
        (-∑ i, (if B i ω then 1 else 0)))) μ) :
    μ.real {ω | ∑ i, (if B i ω then 1 else 0) ≤ t} ≤
      Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) := by
  let S : Ω → ℝ := fun ω => ∑ i, (if B i ω then 1 else 0)
  have hS : Measurable S := by
    dsimp [S]
    refine Finset.measurable_fun_sum Finset.univ ?_
    intro i hi
    exact Measurable.ite
      (measurableSet_preimage (hMeas i) (measurableSet_singleton (true : Bool)))
      measurable_const measurable_const
  have hμpos : 0 < ∑ i, (p i : ℝ) := lt_trans ht htμ
  have hratio : 0 < (∑ i, (p i : ℝ)) / t := div_pos hμpos ht
  have hlogpos : 0 < Real.log ((∑ i, (p i : ℝ)) / t) := by
    apply Real.log_pos
    rw [one_lt_div ht]
    exact htμ
  have hmgf := poissonBinomialMgfBound hp hB hLaw
    (-Real.log ((∑ i, (p i : ℝ)) / t)) hExp
  have hmarkov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (S := fun ω => -S ω)
      (lam := Real.log ((∑ i, (p i : ℝ)) / t)) (t := -t)
      hS.neg hlogpos hExpS
  have hbound :
      (∫ ω, Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * (-S ω)) ∂μ) ≤
        Real.exp ((Real.exp (-Real.log ((∑ i, (p i : ℝ)) / t)) - 1) *
          (∑ i, (p i : ℝ))) := by
    simpa [S, mul_neg] using hmgf
  have hmul :
      Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * t) *
          (∫ ω, Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * (-S ω)) ∂μ) ≤
        Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * t) *
          Real.exp ((Real.exp (-Real.log ((∑ i, (p i : ℝ)) / t)) - 1) *
            (∑ i, (p i : ℝ))) :=
    mul_le_mul_of_nonneg_left hbound (Real.exp_nonneg _)
  calc
    μ.real {ω | ∑ i, (if B i ω then 1 else 0) ≤ t} =
        μ.real ((fun ω => -S ω) ⁻¹' Set.Ici (-t)) := by
      congr 1
      ext ω
      simp [S, le_neg]
    _ ≤ Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * t) *
        (∫ ω, Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * (-S ω)) ∂μ) := by
      simpa [mul_neg, mul_comm] using hmarkov
    _ ≤ Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) * t) *
        Real.exp ((Real.exp (-Real.log ((∑ i, (p i : ℝ)) / t)) - 1) *
          (∑ i, (p i : ℝ))) := hmul
    _ = Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) := by
      have hμpos : 0 < ∑ i, (p i : ℝ) := lt_trans ht htμ
      have hbase : 0 < Real.exp 1 * (∑ i, (p i : ℝ)) / t :=
        div_pos (mul_pos (Real.exp_pos _) hμpos) ht
      rw [Real.exp_neg, Real.exp_log hratio]
      rw [Real.rpow_def_of_pos hbase]
      rw [Real.log_div (mul_ne_zero (ne_of_gt (Real.exp_pos (1 : ℝ)))
        (ne_of_gt hμpos)) (ne_of_gt ht)]
      rw [Real.log_mul (ne_of_gt (Real.exp_pos (1 : ℝ))) (ne_of_gt hμpos)]
      rw [Real.log_exp]
      rw [← Real.exp_add]
      rw [← Real.exp_add]
      congr 1
      rw [Real.log_div (ne_of_gt hμpos) (ne_of_gt ht)]
      field_simp
      ring

theorem poissonBinomialChernoffZeroCase
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {t : ℝ}
    (ht : 0 < t)
    (hZero : ∀ ω, ∑ i, (if B i ω then (1 : ℝ) else 0) = 0) :
    μ.real {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} = 0 := by
  have hset : {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} = (∅ : Set Ω) := by
    ext ω
    simp only [Set.mem_setOf_eq, Set.mem_empty_iff_false, iff_false]
    intro hω
    have hω' : t ≤ 0 := by
      calc
        t ≤ ∑ i, (if B i ω then 1 else 0) := hω
        _ = 0 := hZero ω
    exact (not_le_of_gt ht) hω'
  rw [hset]
  simp

private lemma poissonMeasure_mass (rate : ℝ≥0) (k : ℕ) :
    ProbabilityTheory.poissonMeasure rate {k} =
      ENNReal.ofReal (ProbabilityTheory.poissonPMFReal rate k) := by
  rw [ProbabilityTheory.poissonMeasure,
    PMF.toMeasure_apply_singleton _ k (measurableSet_singleton k)]
  rfl

private lemma poisson_add_fiber (n x : ℕ) :
    Prod.mk x ⁻¹' ((fun p : ℕ × ℕ => p.1 + p.2) ⁻¹' ({n} : Set ℕ)) =
      if x ≤ n then ({n - x} : Set ℕ) else ∅ := by
  by_cases h : x ≤ n
  · ext y
    simp only [Set.mem_preimage, Set.mem_singleton_iff]
    rw [if_pos h]
    constructor
    · intro heq
      exact Nat.eq_sub_of_add_eq (by simpa [Nat.add_comm] using heq)
    · intro heq
      rw [heq]
      exact Nat.add_sub_of_le h
  · ext y
    simp only [Set.mem_preimage, Set.mem_singleton_iff]
    rw [if_neg h]
    constructor
    · intro heq
      exact False.elim (h (by rw [← heq]; exact Nat.le_add_right x y))
    · intro heq
      exact False.elim heq

private lemma finite_tsum_of_support_le (n : ℕ) (f : ℕ → ℝ≥0∞)
    (hf : ∀ x, x > n → f x = 0) :
    (∑' x : ℕ, f x) = ∑ x ∈ Finset.range (n + 1), f x := by
  have hsupp : Function.support f ⊆ (↑(Finset.range (n + 1)) : Set ℕ) := by
    intro x hx
    simp only [Finset.mem_coe, Finset.mem_range]
    by_contra hxn
    apply hx
    exact hf x (Nat.le_of_not_gt hxn)
  rw [← tsum_subtype_eq_of_support_subset hsupp]
  exact Finset.tsum_subtype' (Finset.range (n + 1)) f

/-- The convolution of two Poisson measures is Poisson with the summed rate. -/
theorem poissonMeasure_conv_poissonMeasure (r s : ℝ≥0) :
    ProbabilityTheory.poissonMeasure r ∗ ProbabilityTheory.poissonMeasure s =
      ProbabilityTheory.poissonMeasure (r + s) := by
  apply Measure.ext_of_singleton
  intro n
  rw [Measure.conv, Measure.map_apply measurable_add (measurableSet_singleton n)]
  rw [Measure.prod_apply]
  rw [lintegral_countable']
  have hinner (x : ℕ) :
      ProbabilityTheory.poissonMeasure s
          (Prod.mk x ⁻¹' ((fun p : ℕ × ℕ => p.1 + p.2) ⁻¹' ({n} : Set ℕ))) =
        if x ≤ n then ENNReal.ofReal (ProbabilityTheory.poissonPMFReal s (n - x))
        else 0 := by
    rw [poisson_add_fiber]
    split_ifs with h
    · rw [poissonMeasure_mass]
    · simp
  simp_rw [hinner, poissonMeasure_mass]
  let f : ℕ → ℝ≥0∞ := fun x =>
    (if x ≤ n then ENNReal.ofReal (ProbabilityTheory.poissonPMFReal s (n - x)) else 0) *
      ENNReal.ofReal (ProbabilityTheory.poissonPMFReal r x)
  have hfinite : (∑' x : ℕ, f x) = ∑ x ∈ Finset.range (n + 1), f x := by
    apply finite_tsum_of_support_le
    intro x hx
    simp [f, Nat.not_le_of_gt hx]
  change (∑' x : ℕ, f x) = _
  rw [hfinite]
  have hsum_nonneg (x : ℕ) (hx : x ∈ Finset.range (n + 1)) :
      0 ≤ ProbabilityTheory.poissonPMFReal s (n - x) *
        ProbabilityTheory.poissonPMFReal r x :=
    mul_nonneg ProbabilityTheory.poissonPMFReal_nonneg
      ProbabilityTheory.poissonPMFReal_nonneg
  have hsum :
      (∑ x ∈ Finset.range (n + 1), f x) =
        ENNReal.ofReal
          (∑ x ∈ Finset.range (n + 1),
            ProbabilityTheory.poissonPMFReal s (n - x) *
              ProbabilityTheory.poissonPMFReal r x) := by
    rw [ENNReal.ofReal_sum_of_nonneg hsum_nonneg]
    apply Finset.sum_congr rfl
    intro x hx
    have hxn : x ≤ n := Nat.le_of_lt_succ (Finset.mem_range.1 hx)
    simp only [f, if_pos hxn]
    rw [← ENNReal.ofReal_mul ProbabilityTheory.poissonPMFReal_nonneg]
  rw [hsum]
  apply congrArg ENNReal.ofReal
  calc
    (∑ x ∈ Finset.range (n + 1),
        ProbabilityTheory.poissonPMFReal s (n - x) *
          ProbabilityTheory.poissonPMFReal r x) =
      ∑ x ∈ Finset.range (n + 1),
        Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
          (n.choose x : ℝ) * (↑s : ℝ) ^ (n - x) * (↑r : ℝ) ^ x := by
        apply Finset.sum_congr rfl
        intro x hx
        have hxn : x ≤ n := Nat.le_of_lt_succ (Finset.mem_range.1 hx)
        have hfac_nat := Nat.choose_mul_factorial_mul_factorial hxn
        have hfac : (n.choose x : ℝ) * (x.factorial : ℝ) *
            ((n - x).factorial : ℝ) = (n.factorial : ℝ) := by
          exact_mod_cast hfac_nat
        simp only [ProbabilityTheory.poissonPMFReal]
        have hexp : Real.exp (-↑s) * Real.exp (-↑r) =
            Real.exp (-(↑r + ↑s)) := by
          rw [← Real.exp_add]
          congr 1
          ring
        field_simp [Nat.factorial_ne_zero, Real.exp_ne_zero]
        calc
          _ = Real.exp (-↑s) * Real.exp (-↑r) * (↑s : ℝ) ^ (n - x) *
              (↑r : ℝ) ^ x * (n.factorial : ℝ) := by ring
          _ = _ := by
            rw [hexp]
            rw [← hfac]
            ring
    _ = Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) * (↑r + ↑s) ^ n := by
      calc
        (∑ x ∈ Finset.range (n + 1),
            Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
              (n.choose x : ℝ) * (↑s : ℝ) ^ (n - x) * (↑r : ℝ) ^ x) =
          Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
            ∑ x ∈ Finset.range (n + 1),
              (n.choose x : ℝ) * (↑s : ℝ) ^ (n - x) * (↑r : ℝ) ^ x := by
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro x hx
            ring
        _ = Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) * (↑r + ↑s) ^ n := by
          have hbin := add_pow (↑r : ℝ) (↑s : ℝ) n
          calc
            Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
                ∑ x ∈ Finset.range (n + 1),
                  (n.choose x : ℝ) * (↑s : ℝ) ^ (n - x) * (↑r : ℝ) ^ x =
              Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) *
                ∑ x ∈ Finset.range (n + 1),
                  (↑r : ℝ) ^ x * (↑s : ℝ) ^ (n - x) * (n.choose x : ℝ) := by
                    apply congrArg (fun z => Real.exp (-(↑r + ↑s)) /
                      (n.factorial : ℝ) * z)
                    apply Finset.sum_congr rfl
                    intro x hx
                    ring
            _ = Real.exp (-(↑r + ↑s)) / (n.factorial : ℝ) * (↑r + ↑s) ^ n := by
              rw [hbin]
    _ = ProbabilityTheory.poissonPMFReal (r + s) n := by
      simp only [ProbabilityTheory.poissonPMFReal, NNReal.coe_add]
      ring
  all_goals exact measurableSet_preimage measurable_add (measurableSet_singleton n)

private lemma exp_add_half_le (δ : ℝ) (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) :
    Real.exp (δ / 2) ≤ 1 + δ / 2 + (δ / 2) ^ 2 := by
  have hrem := Real.abs_exp_sub_one_sub_id_le (x := δ / 2) (by
    calc
      |δ / 2| = δ / 2 := abs_of_nonneg (by positivity)
      _ ≤ 1 := by linarith)
  have hrem' : Real.exp (δ / 2) - 1 - δ / 2 ≤ (δ / 2) ^ 2 :=
    (le_abs_self _).trans hrem
  linarith

private lemma exp_neg_half_le (δ : ℝ) (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) :
    Real.exp (-δ / 2) ≤ 1 - δ / 2 + (δ / 2) ^ 2 := by
  have hrem := Real.abs_exp_sub_one_sub_id_le (x := -δ / 2) (by
    calc
      |-δ / 2| = δ / 2 := by
        rw [abs_of_nonpos (by linarith)]
        ring
      _ ≤ 1 := by linarith)
  have hrem' : Real.exp (-δ / 2) - 1 - (-δ / 2) ≤ (-δ / 2) ^ 2 :=
    (le_abs_self _).trans hrem
  linarith

/-! Exercise 2.3.5: the optimized Poisson-binomial Chernoff bounds imply a
quadratic two-sided estimate.  We use the non-optimized parameter `δ/2`; the
second-order exponential remainder gives the explicit universal constant
`c = 1/4` uniformly for `0 < δ ≤ 1`. -/
theorem poissonBinomialTwoSidedQuadraticBound
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {δ : ℝ} (hδ0 : 0 < δ) (hδ1 : δ ≤ 1)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (if B i ω then 1 else 0))) μ)
    (hExpS : ∀ (lam : ℝ),
      Integrable (fun ω => Real.exp (lam * ∑ i, (if B i ω then 1 else 0))) μ) :
    μ.real {ω |
        δ * (∑ i, (p i : ℝ)) ≤
          |(∑ i, (if B i ω then 1 else 0)) - ∑ i, (p i : ℝ)|} ≤
      2 * Real.exp (-(∑ i, (p i : ℝ)) * δ ^ 2 / 4) := by
  let S : Ω → ℝ := fun ω => ∑ i, (if B i ω then 1 else 0)
  let m : ℝ := ∑ i, (p i : ℝ)
  have hm : 0 ≤ m := by
    dsimp [m]
    exact Finset.sum_nonneg (fun i _ => by positivity)
  have hS : Measurable S := by
    dsimp [S]
    refine Finset.measurable_fun_sum Finset.univ ?_
    intro i hi
    exact Measurable.ite
      (measurableSet_preimage (hMeas i) (measurableSet_singleton (true : Bool)))
      measurable_const measurable_const
  have hupper_mgf := poissonBinomialMgfBound hp hB hLaw (δ / 2) (by
    intro i
    exact hExp (δ / 2) i)
  have hlower_mgf := poissonBinomialMgfBound hp hB hLaw (-δ / 2) (by
    intro i
    exact hExp (-δ / 2) i)
  have hupper_markov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := μ) (t := (1 + δ) * m) hS (by linarith) (hExpS (δ / 2))
  have hlower_markov :=
    NumStability.HDP.Scalar.IndependentSums.Hoeffding.exponentialMarkovUpper
      (μ := μ) (S := fun ω => -S ω) (lam := δ / 2) (t := -(1 - δ) * m)
      hS.neg (by linarith)
    (by
      have hEq :
          (fun ω => Real.exp (δ / 2 * (fun ω => -S ω) ω)) =
            (fun ω => Real.exp ((-δ / 2) * ∑ i, (if B i ω then 1 else 0))) := by
        funext ω
        dsimp [S]
        congr 1
        ring
      rw [hEq]
      exact hExpS (-δ / 2))
  have hupper_exp : Real.exp (δ / 2) ≤ 1 + δ / 2 + (δ / 2) ^ 2 :=
    exp_add_half_le δ hδ0.le hδ1
  have hlower_exp : Real.exp (-δ / 2) ≤ 1 - δ / 2 + (δ / 2) ^ 2 :=
    exp_neg_half_le δ hδ0.le hδ1
  have hupper_coeff :
      -(δ / 2 * ((1 + δ) * m)) + (Real.exp (δ / 2) - 1) * m ≤
        -(m * δ ^ 2 / 4) := by
    have hcoeff :
        -(δ / 2 * (1 + δ)) + (Real.exp (δ / 2) - 1) ≤ -(δ ^ 2 / 4) := by
      nlinarith [hupper_exp]
    have := mul_le_mul_of_nonneg_right hcoeff hm
    nlinarith
  have hlower_coeff :
      -(δ / 2 * (-(1 - δ) * m)) + (Real.exp (-δ / 2) - 1) * m ≤
        -(m * δ ^ 2 / 4) := by
    have hcoeff :
        (δ / 2) * (1 - δ) + (Real.exp (-δ / 2) - 1) ≤ -(δ ^ 2 / 4) := by
      nlinarith [hlower_exp]
    have := mul_le_mul_of_nonneg_right hcoeff hm
    nlinarith
  have hupper_raw : μ.real (S ⁻¹' Set.Ici ((1 + δ) * m)) ≤
      Real.exp (-(δ / 2 * ((1 + δ) * m))) *
        Real.exp ((Real.exp (δ / 2) - 1) * m) := by
    apply le_trans hupper_markov
    apply mul_le_mul_of_nonneg_left _ (Real.exp_nonneg _)
    simpa [S, m, mul_assoc] using hupper_mgf
  have hlower_raw : μ.real ((fun ω => -S ω) ⁻¹' Set.Ici (-(1 - δ) * m)) ≤
      Real.exp (-(δ / 2 * (-(1 - δ) * m))) *
        Real.exp ((Real.exp (-δ / 2) - 1) * m) := by
    apply le_trans hlower_markov
    apply mul_le_mul_of_nonneg_left _ (Real.exp_nonneg _)
    have hEq :
        (fun ω => Real.exp (δ / 2 * (fun ω => -S ω) ω)) =
          (fun ω => Real.exp ((-δ / 2) * ∑ i, (if B i ω then 1 else 0))) := by
      funext ω
      dsimp [S]
      congr 1
      ring
    rw [hEq]
    simpa [m] using hlower_mgf
  have hupper : μ.real {ω | (1 + δ) * m ≤ S ω} ≤
      Real.exp (-(m * δ ^ 2 / 4)) := by
    rw [show {ω | (1 + δ) * m ≤ S ω} = S ⁻¹' Set.Ici ((1 + δ) * m) by rfl]
    refine hupper_raw.trans ?_
    rw [← Real.exp_add]
    exact Real.exp_le_exp.2 hupper_coeff
  have hlower : μ.real {ω | S ω ≤ (1 - δ) * m} ≤
      Real.exp (-(m * δ ^ 2 / 4)) := by
    have hset : {ω | S ω ≤ (1 - δ) * m} =
        (fun ω => -S ω) ⁻¹' Set.Ici (-(1 - δ) * m) := by
      ext ω
      simp only [Set.mem_setOf_eq, Set.mem_preimage, Set.mem_Ici]
      constructor <;> intro h <;> linarith
    rw [hset]
    refine hlower_raw.trans ?_
    rw [← Real.exp_add]
    exact Real.exp_le_exp.2 hlower_coeff
  let U : Set Ω := {ω | (1 + δ) * m ≤ S ω}
  let L : Set Ω := {ω | S ω ≤ (1 - δ) * m}
  have hsubset : {ω | δ * m ≤ |S ω - m|} ⊆ U ∪ L := by
    intro ω hω
    change δ * m ≤ |S ω - m| at hω
    by_cases hupper : (1 + δ) * m ≤ S ω
    · exact Or.inl hupper
    · right
      have hnotupper : S ω < (1 + δ) * m := lt_of_not_ge hupper
      by_contra hnotlower
      have hlower' : (1 - δ) * m < S ω := lt_of_not_ge hnotlower
      have habs : |S ω - m| < δ * m := by
        rw [abs_lt]
        constructor <;> linarith
      exact (not_lt_of_ge hω) habs
  have hmono {A B : Set Ω} (hAB : A ⊆ B) : μ.real A ≤ μ.real B := by
    rw [Measure.real_def, Measure.real_def]
    exact ENNReal.toReal_mono (measure_ne_top μ B) (measure_mono hAB)
  have hunion : μ.real (U ∪ L) ≤ μ.real U + μ.real L := by
    rw [Measure.real_def, Measure.real_def, Measure.real_def]
    calc
      (μ (U ∪ L)).toReal ≤ (μ U + μ L).toReal := by
        apply ENNReal.toReal_mono
        · exact ENNReal.add_ne_top.mpr ⟨measure_ne_top μ U, measure_ne_top μ L⟩
        · exact measure_union_le U L
      _ = (μ U).toReal + (μ L).toReal :=
        ENNReal.toReal_add (measure_ne_top μ U) (measure_ne_top μ L)
  have hfinal : μ.real {ω | δ * m ≤ |S ω - m|} ≤
      2 * Real.exp (-m * δ ^ 2 / 4) := by
    calc
      μ.real {ω | δ * m ≤ |S ω - m|} ≤ μ.real (U ∪ L) := hmono hsubset
      _ ≤ μ.real U + μ.real L := hunion
      _ ≤ Real.exp (-(m * δ ^ 2 / 4)) + Real.exp (-(m * δ ^ 2 / 4)) :=
        add_le_add (by simpa [U] using hupper) (by simpa [L] using hlower)
      _ = 2 * Real.exp (-m * δ ^ 2 / 4) := by ring
  simpa [S, m] using hfinal

/-! The sum of independent Poisson variables has the Poisson law with summed rate. -/
theorem poissonAddLaw
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X Y : Ω → ℕ} {r s : ℝ≥0}
    (hX : HasLaw X (ProbabilityTheory.poissonMeasure r) μ)
    (hY : HasLaw Y (ProbabilityTheory.poissonMeasure s) μ)
    (hXY : X ⟂ᵢ[μ] Y) :
    HasLaw (X + Y) (ProbabilityTheory.poissonMeasure (r + s)) μ := by
  have h := hXY.hasLaw_add hX hY
  rw [poissonMeasure_conv_poissonMeasure] at h
  exact h

/-! The point-mass sharpness calculation from Remark 2.3.4.  We state the
asymptotic with its exact Stirling normalization; the book's `≍` notation is
the corresponding two-sided constant-factor consequence. -/
theorem poissonPointMass_isEquivalent_stirling (rate : ℝ≥0) (hrate : 0 < rate) :
    (fun k : ℕ => ProbabilityTheory.poissonPMFReal rate k) ~[Filter.atTop]
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) *
          (Real.exp 1 * (rate : ℝ) / (k : ℝ)) ^ k /
            Real.sqrt (2 * (k : ℝ) * Real.pi)) := by
  have _hrate_real : 0 < (rate : ℝ) := by exact_mod_cast hrate
  have hfactorial := Stirling.factorial_isEquivalent_stirling
  have hnumerator :
      (fun k : ℕ => Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k) ~[Filter.atTop]
        (fun k : ℕ => Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k) :=
    Asymptotics.IsEquivalent.refl
  have hinverse :
      (fun k : ℕ => ((k.factorial : ℝ)⁻¹)) ~[Filter.atTop]
        (fun k : ℕ =>
          (Real.sqrt (2 * (k : ℝ) * Real.pi) *
          ((k : ℝ) / Real.exp 1) ^ k)⁻¹) := by
    simpa only [Pi.inv_apply] using hfactorial.inv
  have hproduct :
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k *
          ((k.factorial : ℝ)⁻¹)) ~[Filter.atTop]
        (fun k : ℕ =>
          Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k *
            (Real.sqrt (2 * (k : ℝ) * Real.pi) *
            ((k : ℝ) / Real.exp 1) ^ k)⁻¹) := by
    simpa only [Pi.mul_apply] using hnumerator.mul hinverse
  have hleft :
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k *
          ((k.factorial : ℝ)⁻¹)) =ᶠ[Filter.atTop]
        (fun k : ℕ => ProbabilityTheory.poissonPMFReal rate k) := by
    filter_upwards [] with k
    simp [ProbabilityTheory.poissonPMFReal, div_eq_mul_inv]
  have hright :
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) * (rate : ℝ) ^ k *
          (Real.sqrt (2 * (k : ℝ) * Real.pi) *
            ((k : ℝ) / Real.exp 1) ^ k)⁻¹) =ᶠ[Filter.atTop]
        (fun k : ℕ =>
          Real.exp (-(rate : ℝ)) *
            (Real.exp 1 * (rate : ℝ) / (k : ℝ)) ^ k /
              Real.sqrt (2 * (k : ℝ) * Real.pi)) := by
    have hlarge : ∀ᶠ k : ℕ in Filter.atTop, 1 ≤ k :=
      Filter.eventually_atTop.2 ⟨1, fun _ hk => hk⟩
    filter_upwards [hlarge] with k hk
    have hk0 : (k : ℝ) ≠ 0 := by
      exact_mod_cast (Nat.ne_of_gt hk)
    have hscale : Real.sqrt (2 * (k : ℝ) * Real.pi) ≠ 0 := by
      positivity
    rw [div_pow, div_pow]
    field_simp [hk0, hscale, Real.exp_ne_zero]
    rw [mul_pow]
  exact (hproduct.congr_left hleft).congr_right hright

structure BernoulliMgfModelData : Prop where
  scalar : ∀ (p : ℝ≥0), (hp : p ≤ 1) → ∀ lam : ℝ,
    ((∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
        (PMF.bernoulli p hp).toMeasure) =
        1 + (Real.exp lam - 1) * (p : ℝ)) ∧
      (1 + (Real.exp lam - 1) * (p : ℝ) ≤
        Real.exp ((Real.exp lam - 1) * (p : ℝ)))
  tensor : ∀ {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0},
    (hp : ∀ i, p i ≤ 1) →
    iIndepFun B μ →
    (∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ) →
    ∀ lam : ℝ,
    (∀ i, Integrable
      (fun ω => Real.exp (lam * (if B i ω then 1 else 0))) μ) →
    (∫ ω, Real.exp (lam * ∑ i, (if B i ω then 1 else 0)) ∂μ) ≤
      Real.exp ((Real.exp lam - 1) * ∑ i, (p i : ℝ))

theorem bernoulliMgfModel : BernoulliMgfModelData :=
  { scalar := fun p hp lam => bernoulliMgfBound p hp lam
    tensor := fun hp hB hLaw lam hExp => poissonBinomialMgfBound hp hB hLaw lam hExp }

/-- The source-facing data for `G(n,p)` and its vertex-degree observable. -/
structure ErdosRenyiModelData (n : ℕ) (p : Set.Icc (0 : ℝ) 1) where
  graphLaw : Measure (SimpleGraph (Fin n))
  degree : Fin n → SimpleGraph (Fin n) → ℕ

/-- The Erdős--Rényi model on `Fin n`, with independent edge indicators. -/
noncomputable def erdosRenyiModel (n : ℕ) (p : Set.Icc (0 : ℝ) 1) :
    ErdosRenyiModelData n p :=
  { graphLaw := SimpleGraph.binomialRandom (Fin n) p
    degree := fun v G =>
      @SimpleGraph.degree (Fin n) G v (Fintype.ofFinite (G.neighborSet v)) }

theorem erdosRenyiModel_degree_eq_graphDegreeSum
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n) (G : SimpleGraph (Fin n)) :
    (erdosRenyiModel n p).degree v G = graphDegreeSum v G := by
  dsimp [erdosRenyiModel]
  letI : Fintype (G.neighborSet v) := Fintype.ofFinite _
  calc
    @SimpleGraph.degree (Fin n) G v (Fintype.ofFinite (G.neighborSet v)) =
        Fintype.card (G.neighborSet v) :=
      (SimpleGraph.card_neighborSet_eq_degree G v).symm
    _ = (G.neighborSet v).ncard := by
      rw [Set.ncard_eq_toFinset_card', Set.toFinset_card]
    _ = graphDegreeSum v G := (graphDegreeSum_eq_graphDegree v G).symm

/-- The fixed set of possible edges incident to a vertex.  This is the finite
edge-coordinate index set used when reducing a random-graph degree to a
Bernoulli product observable. -/
def potentialIncidentEdges {V : Type*} (v : V) : Set (Sym2 V) :=
  (⊤ : SimpleGraph V).incidenceSet v

/-- Count the selected edges in the fixed potential incidence set. -/
def incidentEdgeCount {V : Type*} [Fintype V] (v : V) (G : SimpleGraph V) : ℕ :=
  (potentialIncidentEdges v ∩ G.edgeSet).ncard

theorem potentialIncidentEdges_inter_edgeSet {V : Type*} [Fintype V]
    (v : V) (G : SimpleGraph V) :
    potentialIncidentEdges v ∩ G.edgeSet = G.incidenceSet v := by
  classical
  ext e
  constructor
  · rintro ⟨⟨_, hv⟩, he⟩
    exact ⟨he, hv⟩
  · rintro ⟨he, hv⟩
    have heTop : e ∈ (⊤ : SimpleGraph V).edgeSet := by
      simpa [SimpleGraph.edgeSet] using G.not_isDiag_of_mem_edgeSet he
    exact ⟨⟨heTop, hv⟩, he⟩

theorem incidentEdgeCount_eq_degree {V : Type*} [Fintype V]
    (v : V) (G : SimpleGraph V) :
    incidentEdgeCount v G = @SimpleGraph.degree V G v (Fintype.ofFinite (G.neighborSet v)) := by
  classical
  letI : Fintype (G.neighborSet v) := Fintype.ofFinite _
  rw [incidentEdgeCount, potentialIncidentEdges_inter_edgeSet]
  simpa [Set.ncard_eq_toFinset_card'] using
    (SimpleGraph.card_incidenceSet_eq_degree G v).symm

/-- The canonical Erdős--Rényi law is a probability measure. -/
instance erdosRenyiModel.isProbabilityMeasure
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) :
    IsProbabilityMeasure (erdosRenyiModel n p).graphLaw := by
  dsimp [erdosRenyiModel]
  infer_instance

end NumStability.HDP.Scalar.IndependentSums.Chernoff

namespace NumStability.HDP.Contract

theorem hdp_02_hlem_hpoisson_hadd
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X Y : Ω → ℕ} {r s : ℝ≥0}
    (hX : HasLaw X (ProbabilityTheory.poissonMeasure r) μ)
    (hY : HasLaw Y (ProbabilityTheory.poissonMeasure s) μ)
    (hXY : X ⟂ᵢ[μ] Y) :
    HasLaw (X + Y) (ProbabilityTheory.poissonMeasure (r + s)) μ :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonAddLaw hX hY hXY

theorem hdp_02_hrem_h2_d3_d4 (rate : ℝ≥0) (hrate : 0 < rate) :
    (fun k : ℕ => ProbabilityTheory.poissonPMFReal rate k) ~[Filter.atTop]
      (fun k : ℕ =>
        Real.exp (-(rate : ℝ)) *
          (Real.exp 1 * (rate : ℝ) / (k : ℝ)) ^ k /
            Real.sqrt (2 * (k : ℝ) * Real.pi)) :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonPointMass_isEquivalent_stirling
    rate hrate

theorem hdp_02_hthm_h2_d3_d1
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {t : ℝ}
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp (Real.log (t / (∑ i, (p i : ℝ))) *
        (if B i ω then 1 else 0))) μ)
    (ht : ∑ i, (p i : ℝ) < t)
    (hμ : 0 < ∑ i, (p i : ℝ))
    (hExpS : Integrable
      (fun ω => Real.exp (Real.log (t / (∑ i, (p i : ℝ))) *
        ∑ i, (if B i ω then 1 else 0))) μ) :
    μ.real {ω | t ≤ ∑ i, (if B i ω then 1 else 0)} ≤
      Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonBinomialChernoffBound
    hp hB hLaw hMeas hExp ht hμ hExpS

theorem hdp_02_hex_h2_d3_d2
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {B : ι → Ω → Bool} {p : ι → ℝ≥0}
    (hp : ∀ i, p i ≤ 1)
    (hB : iIndepFun B μ)
    (hLaw : ∀ i, HasLaw (B i) (PMF.bernoulli (p i) (hp i)).toMeasure μ)
    (hMeas : ∀ i, Measurable (B i))
    {t : ℝ}
    (hExp : ∀ i, Integrable
      (fun ω => Real.exp ((-Real.log ((∑ i, (p i : ℝ)) / t)) *
        (if B i ω then 1 else 0))) μ)
    (ht : 0 < t)
    (htμ : t < ∑ i, (p i : ℝ))
    (hExpS : Integrable
      (fun ω => Real.exp (Real.log ((∑ i, (p i : ℝ)) / t) *
        (-∑ i, (if B i ω then 1 else 0)))) μ) :
    μ.real {ω | ∑ i, (if B i ω then 1 else 0) ≤ t} ≤
      Real.exp (-(∑ i, (p i : ℝ))) *
        ((Real.exp 1 * (∑ i, (p i : ℝ)) / t) ^ t) :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.poissonBinomialLowerChernoffBound
    hp hB hLaw hMeas hExp ht htμ hExpS

theorem hdp_02_hlem_hbernoulli_hmgf_hbound :
    NumStability.HDP.Scalar.IndependentSums.Chernoff.BernoulliMgfModelData :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.bernoulliMgfModel

theorem hdp_02_hlem_hbernoulli_hmgf_hbound_scalar
    (p : ℝ≥0) (hp : p ≤ 1) (lam : ℝ) :
    ((∫ b : Bool, Real.exp (lam * (if b then 1 else 0)) ∂
        (PMF.bernoulli p hp).toMeasure) =
        1 + (Real.exp lam - 1) * (p : ℝ)) ∧
      (1 + (Real.exp lam - 1) * (p : ℝ) ≤
        Real.exp ((Real.exp lam - 1) * (p : ℝ))) :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.bernoulliMgfBound p hp lam

end NumStability.HDP.Contract
