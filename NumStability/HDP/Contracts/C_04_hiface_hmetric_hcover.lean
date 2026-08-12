import NumStability.HDP.Geometry.Covering

/-!
# Contract alias for `HDP-C-04-IFACE-METRIC-COVER`
-/

namespace NumStability
namespace HDP
namespace Contract

universe u

/-- Stable contract alias for the Chapter 4 metric-cover interface. -/
noncomputable def hdp_04_hiface_hmetric_hcover
    {T : Type u} [PseudoMetricSpace T] :
    Geometry.Covering.MetricCoverInterface T :=
  Geometry.Covering.metricCoverInterface

end Contract
end HDP
end NumStability
