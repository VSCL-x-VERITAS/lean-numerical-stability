import NumStability.HDP.Geometry.Covering

/-!
# Contract alias for `HDP-C-04-DEF-4.2.1`
-/

namespace NumStability
namespace HDP
namespace Contract

/-- Stable contract alias for the internal net/closed-ball-cover equivalence. -/
theorem hdp_04_hdef_h4_d2_d1 {T : Type*} [PseudoMetricSpace T]
    (K N : Set T) (ε : ℝ) :
    Geometry.Covering.isEpsilonNet K N ε ↔
      N ⊆ K ∧ K ⊆ Geometry.Covering.closedBallCover N ε :=
  Geometry.Covering.isEpsilonNet_iff_closedBallCover K N ε

end Contract
end HDP
end NumStability
