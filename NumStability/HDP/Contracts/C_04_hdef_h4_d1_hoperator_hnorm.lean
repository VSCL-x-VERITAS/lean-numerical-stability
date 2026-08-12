import NumStability.HDP.RandomMatrix.Basic

namespace NumStability.HDP.Contract

noncomputable def hdp_04_hdef_h4_d1_hoperator_hnorm {m n : ℕ}
    (A : RandomMatrix.Basic.RealMatrix m n) : ℝ :=
  RandomMatrix.Basic.operatorNorm A

end NumStability.HDP.Contract
