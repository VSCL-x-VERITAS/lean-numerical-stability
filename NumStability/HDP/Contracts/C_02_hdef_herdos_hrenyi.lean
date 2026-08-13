import NumStability.HDP.Scalar.IndependentSums.Chernoff

namespace NumStability.HDP.Contract

open MeasureTheory

/-- Chapter 2's Erdős--Rényi random graph and degree interface. -/
noncomputable def hdp_02_hdef_herdos_hrenyi
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) :
    NumStability.HDP.Scalar.IndependentSums.Chernoff.ErdosRenyiModelData n p :=
  NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p

end NumStability.HDP.Contract
