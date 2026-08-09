import Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Probability.HasLaw
import Mathlib.Probability.Independence.Integration
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
