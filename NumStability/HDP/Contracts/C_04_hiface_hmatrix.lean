import NumStability.HDP.RandomMatrix.Basic

/-!
# Contract alias for `HDP-C-04-IFACE-MATRIX`
-/

namespace NumStability
namespace HDP
namespace Contract

/-- Stable contract alias for `HDP-04-IFACE-MATRIX`. -/
noncomputable def hdp_04_hiface_hmatrix : RandomMatrix.MatrixInterface :=
  RandomMatrix.matrixInterface

end Contract
end HDP
end NumStability

