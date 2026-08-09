import NumStability.HDP.Scalar.SubGaussian
import NumStability.HDP.ContractSignatures.C_02_hex_h2_d6_d9

/-! Stable Chapter 2 contract module for Exercise 2.6.9. -/

noncomputable section

namespace NumStability.HDP.Contract

theorem hdp_02_hex_h2_d6_d9 : hdp_02_hex_h2_d6_d9__contract_type := by
  simpa [hdp_02_hex_h2_d6_d9__contract_type,
    NumStability.HDP.Scalar.SubGaussian.exercise269Law,
    NumStability.HDP.Scalar.SubGaussian.exercise269Mean,
    NumStability.HDP.Scalar.SubGaussian.twoPointPsiTwoNorm,
    NumStability.HDP.Scalar.SubGaussian.twoPointPsiTwoAdmissible] using
    NumStability.HDP.Scalar.SubGaussian.exercise269_counterexample

end NumStability.HDP.Contract
