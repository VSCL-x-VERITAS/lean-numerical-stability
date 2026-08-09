import Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Probability.HasLaw
import Mathlib.Probability.Independence.Integration
import Mathlib.Probability.Distributions.Poisson
import Mathlib.Analysis.Asymptotics.AsymptoticEquivalent
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Tactic
import NumStability.HDP.Scalar.IndependentSums.Hoeffding

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

/-- The canonical Erdős--Rényi law is a probability measure. -/
instance erdosRenyiModel.isProbabilityMeasure
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) :
    IsProbabilityMeasure (erdosRenyiModel n p).graphLaw := by
  dsimp [erdosRenyiModel]
  infer_instance

end NumStability.HDP.Scalar.IndependentSums.Chernoff

namespace NumStability.HDP.Contract

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
