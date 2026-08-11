import NumStability.HDP.ContractSignatures.C_07_hexample_h7_d5_d8
import NumStability.HDP.Geometry.GaussianWidth

/-- Stable source alias for `HDP-07-EXAMPLE-7.5.8`. -/
theorem NumStability.HDP.Contract.hdp_07_hexample_h7_d5_d8 :
    NumStability.HDP.Contract.hdp_07_hexample_h7_d5_d8__contract_type := by
  intro n
  simpa only [NumStability.HDP.Contract.hdp_07_hexample_h7_d5_d8__contract_type,
    NumStability.HDP.Geometry.GaussianWidth.standardGaussian,
    NumStability.HDP.Geometry.GaussianWidth.gaussianCube,
    NumStability.HDP.Geometry.GaussianWidth.gaussianSupport,
    NumStability.HDP.Geometry.GaussianWidth.gaussianWidth] using
    NumStability.HDP.Geometry.GaussianWidth.gaussianWidth_gaussianCube n
