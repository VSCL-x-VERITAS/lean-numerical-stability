import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Stable contract alias for the maximal-separated-set net lemma. -/
theorem hdp_04_hlem_h4_d2_d6 {T : Type} [PseudoMetricSpace T]
    {K N : Set T} {ε : ℝ} (hε : 0 ≤ ε)
    (hmax : Geometry.Covering.isMaximalEpsilonSeparated K N ε) :
    Geometry.Covering.isEpsilonNet K N ε :=
  Geometry.Covering.isEpsilonNet_of_isMaximalEpsilonSeparated hε hmax

end NumStability.HDP.Contract
