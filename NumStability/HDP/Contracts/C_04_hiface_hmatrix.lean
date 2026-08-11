import NumStability.HDP.RandomMatrix.Basic

/-!
# Contract alias for `HDP-C-04-IFACE-MATRIX`
-/

namespace NumStability
namespace HDP
namespace Contract

/-- Stable contract alias for `HDP-04-IFACE-MATRIX`. -/
noncomputable def hdp_04_hiface_hmatrix : RandomMatrix.Basic.MatrixInterface :=
  RandomMatrix.Basic.matrixInterface

end Contract
end HDP
end NumStability
