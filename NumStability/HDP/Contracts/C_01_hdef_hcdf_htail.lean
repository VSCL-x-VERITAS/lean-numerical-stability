import NumStability.HDP.Scalar.Preliminaries

namespace NumStability.HDP.Contract

open MeasureTheory

/-- Chapter 1's distribution, CDF, and upper-tail interface. -/
noncomputable def hdp_01_hdef_hcdf_htail
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) :
    NumStability.HDP.Scalar.Preliminaries.CDFTailModelData μ X :=
  NumStability.HDP.Scalar.Preliminaries.cdfTailModel μ X

end NumStability.HDP.Contract
