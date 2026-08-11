import NumStability.HDP.ContractSignatures.C_00_hex_h0_d0_d3a
import NumStability.HDP.Geometry.Convexity

/-- Stable source alias for `HDP-00-EX-0.0.3A`. -/
theorem NumStability.HDP.Contract.hdp_00_hex_h0_d0_d3a :
    NumStability.HDP.Contract.hdp_00_hex_h0_d0_d3a__contract_type := by
  exact NumStability.HDP.Geometry.Convexity.independentMeanZero_secondMoment_sum
