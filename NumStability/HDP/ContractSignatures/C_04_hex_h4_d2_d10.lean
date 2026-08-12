import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Proof-free source-facing type for the internal-center monotonicity exercise. -/
def hdp_04_hex_h4_d2_d10__contract_type : Prop :=
  (∀ {T : Type} [PseudoMetricSpace T] {L K : Set T}, L ⊆ K →
      ∀ {ε : ℝ}, 0 < ε →
        Geometry.Covering.coveringNumber L ε ≤
          Geometry.Covering.coveringNumber K (ε / 2)) ∧
    Geometry.Covering.internalCoveringCenterCounterexampleStatement

end NumStability.HDP.Contract
