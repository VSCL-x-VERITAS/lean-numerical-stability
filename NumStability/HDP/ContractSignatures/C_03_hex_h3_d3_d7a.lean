import NumStability.HDP.RandomVector.Distributions

namespace NumStability.HDP.Contract

def hdp_03_hex_h3_d3_d7a__contract_type : Prop :=
  ∀ (hPolar : RandomVector.Distributions.gaussianPolarIndependencePrerequisite)
    {n : ℕ} (μ : MeasureTheory.Measure (EuclideanSpace ℝ (Fin n)))
    (r : EuclideanSpace ℝ (Fin n) → ℝ)
    (θ : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n)),
    RandomVector.Distributions.radialDirectionIndependence μ r θ

end NumStability.HDP.Contract
