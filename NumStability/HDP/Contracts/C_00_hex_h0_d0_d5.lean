import NumStability.HDP.ContractSignatures.C_00_hex_h0_d0_d5
import NumStability.HDP.Geometry.Convexity

/-- Stable source alias for `HDP-00-EX-0.0.5`. -/
theorem NumStability.HDP.Contract.hdp_00_hex_h0_d0_d5 :
    NumStability.HDP.Contract.hdp_00_hex_h0_d0_d5__contract_type := by
  intro m n hm hmn
  exact NumStability.HDP.Geometry.Convexity.binomialCoefficientBounds m n hm hmn
