import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Algebra.Order.Ring.Abs
import Mathlib.Order.Filter.Extr
import NumStability.HDP.Process.Empirical

/-!
# Statistical-learning interfaces

This module records the squared-risk and certified-minimizer interfaces used
in Section 8.4.  Minimizers are carried as hypotheses with certificates; no
attainment or measurable-selection theorem is assumed.
-/

open MeasureTheory ProbabilityTheory
open scoped BigOperators

namespace NumStability.HDP.Applications.StatisticalLearning

/-- An iid training sample.  The alias keeps the learning-facing terminology
while preserving the indexed, multiplicity-sensitive empirical interface. -/
abbrev IIDTrainingSample (ι Ω S : Type*) [MeasurableSpace Ω]
    [MeasurableSpace S] (P : Measure Ω) (ν : Measure S)
    [IsProbabilityMeasure P] [IsProbabilityMeasure ν] :=
  Process.Empirical.IIDSample ι Ω S P ν

/-- Pointwise squared loss against a target function. -/
def squaredLoss {S : Type*} (target hypothesis : S → ℝ) (x : S) : ℝ :=
  (hypothesis x - target x) ^ 2

/-- Real encoding of a Boolean label. -/
def booleanLabel (b : Bool) : ℝ :=
  if b then 1 else 0

/-- Event on which a Boolean hypothesis misclassifies the target. -/
def misclassificationSet {S : Type*} (target hypothesis : S → Bool) : Set S :=
  {x | hypothesis x ≠ target x}

/-- Population squared risk. -/
noncomputable def populationSquaredRisk {S : Type*} [MeasurableSpace S]
    (ν : Measure S) (target hypothesis : S → ℝ) : ℝ :=
  ∫ x, squaredLoss target hypothesis x ∂ν

/-- Empirical squared risk on an indexed sample. -/
noncomputable def empiricalSquaredRisk {n : ℕ} {Ω S : Type*}
    (X : Fin n → Ω → S) (target hypothesis : S → ℝ) (ω : Ω) : ℝ :=
  Process.Empirical.empiricalAverage X (squaredLoss target hypothesis) ω

/-- Number of sample points at which a Boolean hypothesis is mislabeled. -/
def empiricalMisclassificationCount {n : ℕ} {Ω S : Type*}
    (X : Fin n → Ω → S) (target hypothesis : S → Bool) (ω : Ω) : ℕ :=
  (Finset.univ.filter fun i ↦ hypothesis (X i ω) ≠ target (X i ω)).card

/-- A certified exact population-risk minimizer in a hypothesis class. -/
def IsPopulationRiskMinimizer {S : Type*} [MeasurableSpace S]
    (ν : Measure S) (target : S → ℝ) (H : Set (S → ℝ))
    (fStar : S → ℝ) : Prop :=
  fStar ∈ H ∧ IsMinOn (populationSquaredRisk ν target) H fStar

/-- A certified population minimizer with additive slack `ε`. -/
def IsApproximatePopulationRiskMinimizer {S : Type*} [MeasurableSpace S]
    (ν : Measure S) (target : S → ℝ) (H : Set (S → ℝ))
    (ε : ℝ) (fStar : S → ℝ) : Prop :=
  fStar ∈ H ∧ ∀ f ∈ H,
    populationSquaredRisk ν target fStar ≤ populationSquaredRisk ν target f + ε

/-- A certified empirical-risk minimizer for one realized sample. -/
def IsEmpiricalRiskMinimizer {n : ℕ} {Ω S : Type*}
    (X : Fin n → Ω → S) (target : S → ℝ) (H : Set (S → ℝ))
    (fHat : S → ℝ) (ω : Ω) : Prop :=
  fHat ∈ H ∧ IsMinOn (fun f ↦ empiricalSquaredRisk X target f ω) H fHat

/-- Complete executable learning interface for population and empirical
squared risk and certified exact, approximate, and empirical minimizers.

Source: Vershynin, *High-Dimensional Probability*, equations (8.31)--(8.34)
and Section 8.4 (`HDP-08-IFACE-LEARNING`). -/
theorem statisticalLearningInterface
    {n : ℕ} {Ω S : Type*} [MeasurableSpace Ω] [MeasurableSpace S]
    (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure S) [IsProbabilityMeasure ν]
    (X : IIDTrainingSample (Fin n) Ω S P ν)
    (target : S → ℝ) (H : Set (S → ℝ)) (ε : ℝ)
    (fStar fApprox fHat : S → ℝ) (ω : Ω) :
    populationSquaredRisk ν target fStar =
        ∫ x, (fStar x - target x) ^ 2 ∂ν ∧
      empiricalSquaredRisk X.eval target fHat ω =
        (n : ℝ)⁻¹ * ∑ i, (fHat (X.eval i ω) - target (X.eval i ω)) ^ 2 ∧
      (IsPopulationRiskMinimizer ν target H fStar ↔
        fStar ∈ H ∧ ∀ f ∈ H,
          populationSquaredRisk ν target fStar ≤ populationSquaredRisk ν target f) ∧
      (IsApproximatePopulationRiskMinimizer ν target H ε fApprox ↔
        fApprox ∈ H ∧ ∀ f ∈ H,
          populationSquaredRisk ν target fApprox ≤
            populationSquaredRisk ν target f + ε) ∧
      (IsEmpiricalRiskMinimizer X.eval target H fHat ω ↔
        fHat ∈ H ∧ ∀ f ∈ H,
          empiricalSquaredRisk X.eval target fHat ω ≤
            empiricalSquaredRisk X.eval target f ω) := by
  refine ⟨rfl, rfl, ?_, Iff.rfl, ?_⟩
  · simp only [IsPopulationRiskMinimizer, isMinOn_iff]
  · simp only [IsEmpiricalRiskMinimizer, isMinOn_iff]

/-- For Boolean labels, squared-loss risk is exactly misclassification
probability.

Source: Vershynin, *High-Dimensional Probability*, Exercise 8.4.2,
printed page 216 (`HDP-08-EG-8.4.2`). -/
theorem booleanSquaredRisk_eq_misclassification
    {S : Type*} [MeasurableSpace S] (ν : Measure S)
    (target hypothesis : S → Bool)
    (hmis : MeasurableSet (misclassificationSet target hypothesis)) :
    populationSquaredRisk ν (booleanLabel ∘ target) (booleanLabel ∘ hypothesis) =
      ν.real (misclassificationSet target hypothesis) := by
  have hpoint : squaredLoss (booleanLabel ∘ target) (booleanLabel ∘ hypothesis) =
      (misclassificationSet target hypothesis).indicator (fun _ ↦ (1 : ℝ)) := by
    funext x
    cases ht : target x <;> cases hh : hypothesis x <;>
      simp [squaredLoss, booleanLabel, misclassificationSet, ht, hh]
  rw [populationSquaredRisk, hpoint]
  exact MeasureTheory.integral_indicator_one hmis

/-- Empirical risk and empirical-risk minimization, with attainment carried
as an explicit certificate.

Source: Vershynin, *High-Dimensional Probability*, Definition 8.4.3,
printed page 217 (`HDP-08-DEF-8.4.3`). -/
theorem empiricalRiskMinimizer_definition
    {n : ℕ} {Ω S : Type*} (X : Fin n → Ω → S)
    (target : S → ℝ) (H : Set (S → ℝ)) (fHat : S → ℝ) (ω : Ω) :
    empiricalSquaredRisk X target fHat ω =
        (n : ℝ)⁻¹ * ∑ i, (fHat (X i ω) - target (X i ω)) ^ 2 ∧
      (IsEmpiricalRiskMinimizer X target H fHat ω ↔
        fHat ∈ H ∧ ∀ f ∈ H,
          empiricalSquaredRisk X target fHat ω ≤ empiricalSquaredRisk X target f ω) := by
  refine ⟨rfl, ?_⟩
  simp only [IsEmpiricalRiskMinimizer, isMinOn_iff]

/-- A uniform empirical/population risk bound controls the excess population
risk of an empirical minimizer.  The first conclusion records that the excess
is nonnegative when a certified population minimizer is supplied.

Source: Vershynin, *High-Dimensional Probability*, Lemma 8.4.5,
printed page 218 (`HDP-08-LEM-8.4.5`). -/
theorem excessRisk_le_two_mul_uniformDeviation
    {A : Type*} (population empirical : A → ℝ) (H : Set A)
    (fStar fHat : A) (δ : ℝ)
    (hStar : fStar ∈ H) (hHat : fHat ∈ H)
    (hPop : IsMinOn population H fStar)
    (hEmp : IsMinOn empirical H fHat)
    (hdev : ∀ f ∈ H, |empirical f - population f| ≤ δ) :
    0 ≤ population fHat - population fStar ∧
      population fHat - population fStar ≤ 2 * δ := by
  have hPopOrder : population fStar ≤ population fHat :=
    (isMinOn_iff.mp hPop) fHat hHat
  have hEmpOrder : empirical fHat ≤ empirical fStar :=
    (isMinOn_iff.mp hEmp) fStar hStar
  have hHatBounds := abs_le.mp (hdev fHat hHat)
  have hStarBounds := abs_le.mp (hdev fStar hStar)
  constructor <;> linarith

/-- On Boolean hypotheses, empirical squared risk is the normalized number of
mislabeled sample points. -/
theorem empiricalSquaredRisk_boolean_eq_count
    {n : ℕ} {Ω S : Type*} (X : Fin n → Ω → S)
    (target hypothesis : S → Bool) (ω : Ω) :
    empiricalSquaredRisk X (booleanLabel ∘ target) (booleanLabel ∘ hypothesis) ω =
      (n : ℝ)⁻¹ * empiricalMisclassificationCount X target hypothesis ω := by
  simp only [empiricalSquaredRisk, Process.Empirical.empiricalAverage,
    empiricalMisclassificationCount, squaredLoss, Function.comp_apply]
  congr 1
  rw [Finset.card_eq_sum_ones, Nat.cast_sum, Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro i _
  cases ht : target (X i ω) <;> cases hh : hypothesis (X i ω) <;>
    simp [booleanLabel]

/-- A Boolean empirical-risk minimizer minimizes the number of mislabeled
sample points.  This includes the circle-hypothesis example as a special case.

Source: Vershynin, *High-Dimensional Probability*, Exercise 8.4.7,
printed page 220 (`HDP-08-EX-8.4.7`). -/
theorem empiricalRiskMinimizer_minimizes_misclassifications
    {n : ℕ} {Ω S : Type*} (hn : 0 < n) (X : Fin n → Ω → S)
    (target : S → Bool) (H : Set (S → Bool)) (fHat : S → Bool) (ω : Ω)
    (hHat : fHat ∈ H)
    (hERM : IsMinOn
      (fun f ↦ empiricalSquaredRisk X (booleanLabel ∘ target) (booleanLabel ∘ f) ω)
      H fHat) :
    fHat ∈ H ∧ IsMinOn (fun f ↦ empiricalMisclassificationCount X target f ω) H fHat := by
  refine ⟨hHat, isMinOn_iff.mpr ?_⟩
  intro f hf
  have hrisk := (isMinOn_iff.mp hERM) f hf
  rw [empiricalSquaredRisk_boolean_eq_count,
    empiricalSquaredRisk_boolean_eq_count] at hrisk
  have hscale : 0 < (n : ℝ)⁻¹ := inv_pos.mpr (Nat.cast_pos.mpr hn)
  have hcast :
      (empiricalMisclassificationCount X target fHat ω : ℝ) ≤
        empiricalMisclassificationCount X target f ω := by
    nlinarith
  exact_mod_cast hcast

end NumStability.HDP.Applications.StatisticalLearning

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-08-IFACE-LEARNING`. -/
theorem hdp_08_hiface_hlearning
    {n : ℕ} {Ω S : Type*} [MeasurableSpace Ω] [MeasurableSpace S]
    (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure S) [IsProbabilityMeasure ν]
    (X : Applications.StatisticalLearning.IIDTrainingSample (Fin n) Ω S P ν)
    (target : S → ℝ) (H : Set (S → ℝ)) (ε : ℝ)
    (fStar fApprox fHat : S → ℝ) (ω : Ω) :
    Applications.StatisticalLearning.populationSquaredRisk ν target fStar =
        ∫ x, (fStar x - target x) ^ 2 ∂ν ∧
      Applications.StatisticalLearning.empiricalSquaredRisk X.eval target fHat ω =
        (n : ℝ)⁻¹ * ∑ i, (fHat (X.eval i ω) - target (X.eval i ω)) ^ 2 ∧
      (Applications.StatisticalLearning.IsPopulationRiskMinimizer ν target H fStar ↔
        fStar ∈ H ∧ ∀ f ∈ H,
          Applications.StatisticalLearning.populationSquaredRisk ν target fStar ≤
            Applications.StatisticalLearning.populationSquaredRisk ν target f) ∧
      (Applications.StatisticalLearning.IsApproximatePopulationRiskMinimizer
          ν target H ε fApprox ↔
        fApprox ∈ H ∧ ∀ f ∈ H,
          Applications.StatisticalLearning.populationSquaredRisk ν target fApprox ≤
            Applications.StatisticalLearning.populationSquaredRisk ν target f + ε) ∧
      (Applications.StatisticalLearning.IsEmpiricalRiskMinimizer
          X.eval target H fHat ω ↔
        fHat ∈ H ∧ ∀ f ∈ H,
          Applications.StatisticalLearning.empiricalSquaredRisk X.eval target fHat ω ≤
            Applications.StatisticalLearning.empiricalSquaredRisk X.eval target f ω) :=
  Applications.StatisticalLearning.statisticalLearningInterface
    P ν X target H ε fStar fApprox fHat ω

/-- Stable source alias for `HDP-08-EG-8.4.2`. -/
theorem hdp_08_heg_h8_d4_d2
    {S : Type*} [MeasurableSpace S] (ν : Measure S)
    (target hypothesis : S → Bool)
    (hmis : MeasurableSet
      (Applications.StatisticalLearning.misclassificationSet target hypothesis)) :
    Applications.StatisticalLearning.populationSquaredRisk ν
        (Applications.StatisticalLearning.booleanLabel ∘ target)
        (Applications.StatisticalLearning.booleanLabel ∘ hypothesis) =
      ν.real (Applications.StatisticalLearning.misclassificationSet target hypothesis) :=
  Applications.StatisticalLearning.booleanSquaredRisk_eq_misclassification
    ν target hypothesis hmis

/-- Stable source alias for `HDP-08-DEF-8.4.3`. -/
theorem hdp_08_hdef_h8_d4_d3
    {n : ℕ} {Ω S : Type*} (X : Fin n → Ω → S)
    (target : S → ℝ) (H : Set (S → ℝ)) (fHat : S → ℝ) (ω : Ω) :
    Applications.StatisticalLearning.empiricalSquaredRisk X target fHat ω =
        (n : ℝ)⁻¹ * ∑ i, (fHat (X i ω) - target (X i ω)) ^ 2 ∧
      (Applications.StatisticalLearning.IsEmpiricalRiskMinimizer X target H fHat ω ↔
        fHat ∈ H ∧ ∀ f ∈ H,
          Applications.StatisticalLearning.empiricalSquaredRisk X target fHat ω ≤
            Applications.StatisticalLearning.empiricalSquaredRisk X target f ω) :=
  Applications.StatisticalLearning.empiricalRiskMinimizer_definition
    X target H fHat ω

/-- Stable source alias for `HDP-08-LEM-8.4.5`. -/
theorem hdp_08_hlem_h8_d4_d5
    {A : Type*} (population empirical : A → ℝ) (H : Set A)
    (fStar fHat : A) (δ : ℝ)
    (hStar : fStar ∈ H) (hHat : fHat ∈ H)
    (hPop : IsMinOn population H fStar)
    (hEmp : IsMinOn empirical H fHat)
    (hdev : ∀ f ∈ H, |empirical f - population f| ≤ δ) :
    0 ≤ population fHat - population fStar ∧
      population fHat - population fStar ≤ 2 * δ :=
  Applications.StatisticalLearning.excessRisk_le_two_mul_uniformDeviation
    population empirical H fStar fHat δ hStar hHat hPop hEmp hdev

/-- Stable source alias for `HDP-08-EX-8.4.7`. -/
theorem hdp_08_hex_h8_d4_d7
    {n : ℕ} {Ω S : Type*} (hn : 0 < n) (X : Fin n → Ω → S)
    (target : S → Bool) (H : Set (S → Bool)) (fHat : S → Bool) (ω : Ω)
    (hHat : fHat ∈ H)
    (hERM : IsMinOn
      (fun f ↦ Applications.StatisticalLearning.empiricalSquaredRisk X
        (Applications.StatisticalLearning.booleanLabel ∘ target)
        (Applications.StatisticalLearning.booleanLabel ∘ f) ω)
      H fHat) :
    fHat ∈ H ∧
      IsMinOn
        (fun f ↦ Applications.StatisticalLearning.empiricalMisclassificationCount
          X target f ω)
        H fHat :=
  Applications.StatisticalLearning.empiricalRiskMinimizer_minimizes_misclassifications
    hn X target H fHat ω hHat hERM

end NumStability.HDP.Contract
