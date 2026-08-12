import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Stable contract alias for the exterior covering comparison exercise. -/
theorem hdp_04_hex_h4_d2_d9 {T : Type*} [PseudoMetricSpace T]
    (K : Set T) {ε : ℝ} (hε : 0 < ε) :
    Geometry.Covering.exteriorCoveringNumber K ε ≤
        Geometry.Covering.coveringNumber K ε ∧
      Geometry.Covering.coveringNumber K ε ≤
        Geometry.Covering.exteriorCoveringNumber K (ε / 2) :=
  Geometry.Covering.exteriorCoveringNumber_le_coveringNumber_le_exteriorCoveringNumber_half K hε

end NumStability.HDP.Contract
