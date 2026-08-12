import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Stable contract alias for the internal-center monotonicity exercise. -/
theorem hdp_04_hex_h4_d2_d10 :
    (∀ {T : Type} [PseudoMetricSpace T] {L K : Set T}, L ⊆ K →
        ∀ {ε : ℝ}, 0 < ε →
          Geometry.Covering.coveringNumber L ε ≤
            Geometry.Covering.coveringNumber K (ε / 2)) ∧
      Geometry.Covering.internalCoveringCenterCounterexampleStatement :=
  Geometry.Covering.internalCoveringMonotonicityExerciseStatement

end NumStability.HDP.Contract
