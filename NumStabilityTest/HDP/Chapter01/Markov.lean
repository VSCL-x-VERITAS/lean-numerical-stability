import NumStability.HDP.Contracts.C_01_hprop_h1_d2_d4
import NumStability.HDP.ContractSignatures.C_01_hprop_h1_d2_d4

open MeasureTheory

namespace NumStabilityTest.HDP.Chapter01

open NumStability.HDP.Contract

example : hdp_01_hprop_h1_d2_d4__contract_type := by
  unfold hdp_01_hprop_h1_d2_d4__contract_type
  exact @hdp_01_hprop_h1_d2_d4

#print axioms NumStability.HDP.Contract.hdp_01_hprop_h1_d2_d4

end NumStabilityTest.HDP.Chapter01
