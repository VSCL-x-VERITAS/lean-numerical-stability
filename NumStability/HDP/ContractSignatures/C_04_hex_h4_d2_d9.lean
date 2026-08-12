import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Proof-free source-facing type for the exterior covering comparison exercise. -/
def hdp_04_hex_h4_d2_d9__contract_type : Prop :=
  ∀ {T : Type} [PseudoMetricSpace T] (K : Set T) {ε : ℝ},
    0 < ε →
      Geometry.Covering.exteriorCoveringNumber K ε ≤
          Geometry.Covering.coveringNumber K ε ∧
        Geometry.Covering.coveringNumber K ε ≤
          Geometry.Covering.exteriorCoveringNumber K (ε / 2)

end NumStability.HDP.Contract
