import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Proof-free source-facing type for the maximal-separated-set net lemma. -/
def hdp_04_hlem_h4_d2_d6__contract_type : Prop :=
  ∀ {T : Type} [PseudoMetricSpace T] {K N : Set T} {ε : ℝ},
    0 ≤ ε →
      Geometry.Covering.isMaximalEpsilonSeparated K N ε →
        Geometry.Covering.isEpsilonNet K N ε

end NumStability.HDP.Contract
