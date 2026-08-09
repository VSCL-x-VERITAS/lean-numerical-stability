import NumStability.HDP.Scalar.IndependentSums.Hoeffding

/-! Stable Chapter 2 forwarding declaration for Exercise 2.2.3. -/

namespace NumStability.HDP.Contract

theorem hdp_02_hex_h2_d2_d3 (x : ℝ) :
    Real.cosh x ≤ Real.exp (x ^ 2 / 2) :=
  NumStability.HDP.Scalar.IndependentSums.Hoeffding.coshLeExpHalfSq x

end NumStability.HDP.Contract
