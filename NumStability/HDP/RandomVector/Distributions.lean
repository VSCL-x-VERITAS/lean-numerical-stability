import Mathlib.Analysis.InnerProductSpace.EuclideanDist
import Mathlib.Analysis.Normed.Lp.MeasurableSpace
import Mathlib.Analysis.Convex.Basic
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

/-- The source-facing convex-body predicate. -/
def isConvexBody {n : ℕ} (K : Set (EuclideanSpace ℝ (Fin n))) : Prop :=
  Convex ℝ K ∧ Bornology.IsBounded K ∧ (interior K).Nonempty

/-- The family of normalized restrictions of a supplied volume measure to a
convex body.  Supplying the volume measure keeps the definition independent of
the choice of a particular Lebesgue-measure construction. -/
def convexBodyUniform (n : ℕ) (K : Set (EuclideanSpace ℝ (Fin n)))
    (volumeMeasure : Measure (EuclideanSpace ℝ (Fin n))) :
    Set (Measure (EuclideanSpace ℝ (Fin n))) :=
  {μ | isConvexBody K ∧
    volumeMeasure K ≠ 0 ∧
    μ Set.univ = 1 ∧
    ∀ A, μ A = volumeMeasure (A ∩ K) / volumeMeasure K}

end NumStability.HDP.RandomVector.Distributions

namespace NumStability.HDP.Contract

open MeasureTheory

def hdp_03_hdef_hspherical_huniform (n : ℕ) (r : ℝ)
    (surface : Measure (EuclideanSpace ℝ (Fin n))) :
    Set (Measure (EuclideanSpace ℝ (Fin n))) :=
  RandomVector.Distributions.sphericalUniform n r surface

def hdp_03_hdef_hconvex_hbody_huniform (n : ℕ)
    (K : Set (EuclideanSpace ℝ (Fin n)))
    (volumeMeasure : Measure (EuclideanSpace ℝ (Fin n))) :
    Set (Measure (EuclideanSpace ℝ (Fin n))) :=
  RandomVector.Distributions.convexBodyUniform n K volumeMeasure

end NumStability.HDP.Contract
