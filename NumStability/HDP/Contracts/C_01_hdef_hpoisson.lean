import NumStability.HDP.Scalar.LimitTheorems

namespace NumStability.HDP.Contract

open MeasureTheory

/-- Chapter 1's Poisson law on the natural numbers. -/
noncomputable def hdp_01_hdef_hpoisson (rate : NNReal) : Measure ℕ :=
  NumStability.HDP.Scalar.LimitTheorems.poissonLaw rate

end NumStability.HDP.Contract
