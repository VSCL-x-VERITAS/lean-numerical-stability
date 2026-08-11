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

/-- Population squared risk. -/
noncomputable def populationSquaredRisk {S : Type*} [MeasurableSpace S]
    (ν : Measure S) (target hypothesis : S → ℝ) : ℝ :=
  ∫ x, squaredLoss target hypothesis x ∂ν

/-- Empirical squared risk on an indexed sample. -/
noncomputable def empiricalSquaredRisk {n : ℕ} {Ω S : Type*}
    (X : Fin n → Ω → S) (target hypothesis : S → ℝ) (ω : Ω) : ℝ :=
  Process.Empirical.empiricalAverage X (squaredLoss target hypothesis) ω

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

end NumStability.HDP.Contract
