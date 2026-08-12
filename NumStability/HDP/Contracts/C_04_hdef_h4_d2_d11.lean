import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.Algebra.GroupWithZero.Action.Pointwise.Set
import NumStability.HDP.Geometry.Covering

open scoped Pointwise

namespace NumStability.HDP.Contract

def hdp_04_hdef_h4_d2_d11 {𝕜 E : Type*} [Add E] [SMul 𝕜 E] :
    Geometry.Covering.MinkowskiSetInterface 𝕜 E :=
  Geometry.Covering.minkowskiSetInterface

end NumStability.HDP.Contract
