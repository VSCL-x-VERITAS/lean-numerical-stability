import Mathlib.Analysis.InnerProductSpace.EuclideanDist
import Mathlib.Analysis.Normed.Lp.MeasurableSpace
import Mathlib.MeasureTheory.Measure.Map

namespace NumStability.HDP.RandomVector.Distributions

open MeasureTheory

/-- The Euclidean sphere of radius `r` in dimension `n`. -/
def euclideanSphere (n : ℕ) (r : ℝ) : Set (EuclideanSpace ℝ (Fin n)) :=
  {x | ‖x‖ = r}

/-- A norm-preserving map, used as the coordinate-free rotation predicate. -/
def normPreserving {n : ℕ}
    (T : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n)) : Prop :=
  ∀ x, ‖T x‖ = ‖x‖

/--
The family of normalized rotation-invariant surface measures on a sphere.
The surface measure is supplied explicitly, so this definition does not hide
an unavailable existence theorem for Hausdorff measure on the sphere.
-/
def sphericalUniform (n : ℕ) (r : ℝ)
    (surface : Measure (EuclideanSpace ℝ (Fin n))) :
    Set (Measure (EuclideanSpace ℝ (Fin n))) :=
  {μ | 0 < r ∧
    μ Set.univ = 1 ∧
    μ (euclideanSphere n r) = 1 ∧
    surface (euclideanSphere n r) ≠ 0 ∧
    (∀ T, normPreserving T → Measure.map T μ = μ) ∧
    (∀ A, μ A = surface A / surface (euclideanSphere n r))}

end NumStability.HDP.RandomVector.Distributions
