import NumStability.HDP.Quadratic.HansonWright

namespace NumStability.HDP.Contract

open MeasureTheory

noncomputable def hdp_06_hiface_hindependent_hcopy {Ω α : Type*}
    [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : Ω → α) :
    HDP.Quadratic.HansonWright.IndependentCopyInterface μ X :=
  HDP.Quadratic.HansonWright.independentCopyInterface μ X

end NumStability.HDP.Contract
