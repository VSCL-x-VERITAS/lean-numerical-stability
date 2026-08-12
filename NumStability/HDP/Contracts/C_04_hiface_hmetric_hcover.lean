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
    Geometry.MetricCoverInterface T :=
  Geometry.metricCoverInterface

end Contract
end HDP
end NumStability
