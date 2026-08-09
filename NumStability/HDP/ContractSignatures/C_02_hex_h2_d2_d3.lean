import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series

/-!
# Frozen contract signature for the Rademacher MGF hyperbolic-cosine estimate

This file is intentionally proof-free. The implementation is checked in the
semantic module and the contract wrapper is checked against this type.
-/

namespace NumStability.HDP.Contract

def hdp_02_hex_h2_d2_d3__contract_type : Prop :=
  ∀ x : ℝ, Real.cosh x ≤ Real.exp (x ^ 2 / 2)

end NumStability.HDP.Contract
