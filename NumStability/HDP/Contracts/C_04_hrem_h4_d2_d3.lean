import NumStability.HDP.Geometry.Covering

namespace NumStability.HDP.Contract

universe u

/-- Stable contract alias for the total-boundedness characterization. -/
theorem hdp_04_hrem_h4_d2_d3 {T : Type u} [PseudoMetricSpace T]
    (K : Set T) :
    TotallyBounded K ↔
      ∀ ε > 0,
        Geometry.Covering.coveringNumber K ε < Cardinal.aleph0.{u} :=
  Geometry.Covering.totallyBounded_iff_coveringNumber_lt_aleph0 K

end NumStability.HDP.Contract
