import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

/-- Stable contract alias for the packing/covering comparison lemma. -/
theorem hdp_04_hlem_h4_d2_d8 {T : Type*} [PseudoMetricSpace T]
    (K : Set T) {ε : ℝ} (hε : 0 < ε) :
    Geometry.Covering.packingNumber K (2 * ε) ≤
        Geometry.Covering.coveringNumber K ε ∧
      Geometry.Covering.coveringNumber K ε ≤
        Geometry.Covering.packingNumber K ε :=
  Geometry.Covering.packingNumber_two_mul_le_coveringNumber_le_packingNumber K hε

end NumStability.HDP.Contract
