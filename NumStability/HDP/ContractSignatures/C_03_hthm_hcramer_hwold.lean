import NumStability.HDP.RandomVector.Distributions

namespace NumStability.HDP.Contract

def hdp_03_hthm_hcramer_hwold__contract_type : Prop :=
  ∀ {n : ℕ},
    RandomVector.Distributions.characteristicFunctionUniqueness n →
      (μ ν : MeasureTheory.Measure (Fin n → ℝ)) →
        (∀ θ : Fin n → ℝ,
          MeasureTheory.Measure.map (RandomVector.Distributions.linearProjection θ) μ =
            MeasureTheory.Measure.map (RandomVector.Distributions.linearProjection θ) ν) →
          μ = ν

end NumStability.HDP.Contract
