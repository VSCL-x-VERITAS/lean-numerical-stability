import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Proof-free source-facing type for the total-boundedness remark contract. -/
def hdp_04_hrem_h4_d2_d3__contract_type : Prop :=
  ∀ {T : Type} [PseudoMetricSpace T] (K : Set T),
    TotallyBounded K ↔
      ∀ ε > 0,
        Geometry.Covering.coveringNumber K ε < Cardinal.aleph0

end NumStability.HDP.Contract
