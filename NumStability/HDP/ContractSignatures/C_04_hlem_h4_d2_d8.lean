import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Proof-free source-facing type for the packing/covering comparison lemma. -/
def hdp_04_hlem_h4_d2_d8__contract_type : Prop :=
  ∀ {T : Type} [PseudoMetricSpace T]
    (K : Set T) {ε : ℝ},
    0 < ε →
      Geometry.Covering.packingNumber K (2 * ε) ≤
          Geometry.Covering.coveringNumber K ε ∧
        Geometry.Covering.coveringNumber K ε ≤
          Geometry.Covering.packingNumber K ε

end NumStability.HDP.Contract
