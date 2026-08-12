import NumStability.HDP.RandomVector.Distributions

namespace NumStability.HDP.Contract

open MeasureTheory

def hdp_03_hdef_hspherical_huniform (n : ℕ) (r : ℝ)
    (surface : Measure (EuclideanSpace ℝ (Fin n))) :
    Set (Measure (EuclideanSpace ℝ (Fin n))) :=
  HDP.RandomVector.Distributions.sphericalUniform n r surface

end NumStability.HDP.Contract
