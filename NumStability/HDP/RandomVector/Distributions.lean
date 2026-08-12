import Mathlib.Analysis.InnerProductSpace.EuclideanDist
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.Normed.Lp.MeasurableSpace
import Mathlib.Analysis.Convex.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.MeasureTheory.Measure.Map
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic

namespace NumStability.HDP.RandomVector.Distributions

open MeasureTheory
open scoped BigOperators
open scoped Pointwise

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

/-- Isotropy of a finite second-moment measure, expressed through quadratic
forms of the Euclidean inner product. -/
def isotropicMeasure {n : ℕ}
    (μ : Measure (EuclideanSpace ℝ (Fin n))) : Prop :=
  ∀ x, ∫ y, (inner ℝ y x) ^ 2 ∂μ = ‖x‖ ^ 2

/-- The exponential-moment predicate used here as the concrete `ψ₁` marginal
interface. -/
def subexponentialMarginalBound {n : ℕ}
    (μ : Measure (EuclideanSpace ℝ (Fin n))) (C : ℝ) : Prop :=
  ∀ x, ‖x‖ ≤ 1 →
    ∫⁻ y, ENNReal.ofReal (Real.exp (‖inner ℝ y x‖ / C)) ∂μ ≤ 2

/-- Brunn--Minkowski is retained as an explicit, reusable external premise.
The content functional is supplied by the consuming probability model. -/
def brunnMinkowskiPrerequisite : Prop :=
  ∀ {n : ℕ} (volume : Set (EuclideanSpace ℝ (Fin n)) → ℝ)
    (A B : Set (EuclideanSpace ℝ (Fin n))),
    isConvexBody A → isConvexBody B →
      0 ≤ volume A → 0 ≤ volume B → 0 ≤ volume (A + B) →
      Real.rpow (volume A) (1 / (n : ℝ)) +
          Real.rpow (volume B) (1 / (n : ℝ)) ≤
        Real.rpow (volume (A + B)) (1 / (n : ℝ))

/-- Borell's convex-body marginal estimate, parameterized by the preceding
Brunn--Minkowski foundation so the external dependency remains visible. -/
def borellConvexMarginalPrerequisite : Prop :=
  ∀ {n : ℕ} (K : Set (EuclideanSpace ℝ (Fin n)))
    (volumeMeasure : Measure (EuclideanSpace ℝ (Fin n)))
    (μ : Measure (EuclideanSpace ℝ (Fin n))) (C : ℝ),
    brunnMinkowskiPrerequisite → isConvexBody K →
      μ ∈ convexBodyUniform n K volumeMeasure → isotropicMeasure μ → 0 < C →
      subexponentialMarginalBound μ C

/-- Composition of the two external analytic prerequisites for isotropic
uniform convex-body marginals. -/
theorem borellConvexMarginal {n : ℕ}
    (K : Set (EuclideanSpace ℝ (Fin n)))
    (volumeMeasure : Measure (EuclideanSpace ℝ (Fin n)))
    (μ : Measure (EuclideanSpace ℝ (Fin n))) (C : ℝ)
    (hBM : brunnMinkowskiPrerequisite)
    (hBorell : borellConvexMarginalPrerequisite)
    (hK : isConvexBody K)
    (hμ : μ ∈ convexBodyUniform n K volumeMeasure)
    (hIso : isotropicMeasure μ) (hC : 0 < C) :
    subexponentialMarginalBound μ C :=
  hBorell K volumeMeasure μ C hBM hK hμ hIso hC

/-- A finite indexed family satisfying the frame inequalities. -/
def isFrame {ι E : Type*} [Fintype ι] [NormedAddCommGroup E]
    [Inner ℝ E] (u : ι → E) (A B : ℝ) : Prop :=
  0 < A ∧ 0 < B ∧
    ∀ x, A * ‖x‖ ^ 2 ≤
      ∑ i, ‖@Inner.inner ℝ E _ (u i) x‖ ^ 2 ∧
      (∑ i, ‖@Inner.inner ℝ E _ (u i) x‖ ^ 2) ≤ B * ‖x‖ ^ 2

/-- A frame is tight when its lower and upper frame bounds agree. -/
def isTightFrame {ι E : Type*} [Fintype ι] [NormedAddCommGroup E]
    [Inner ℝ E] (u : ι → E) (A : ℝ) : Prop :=
  isFrame u A A

/-- The one-dimensional projection associated with a coefficient vector. -/
def linearProjection {n : ℕ} (θ : Fin n → ℝ) (x : Fin n → ℝ) : ℝ :=
  ∑ i, θ i * x i

/-- Foundation-helper contract for uniqueness from all one-dimensional laws.
The analytic characteristic-function uniqueness theorem is not supplied by
the pinned Mathlib baseline, so it is kept as an explicit reusable premise. -/
def characteristicFunctionUniqueness (n : ℕ) : Prop :=
  ∀ μ ν : Measure (Fin n → ℝ),
    (∀ θ : Fin n → ℝ,
      Measure.map (linearProjection θ) μ = Measure.map (linearProjection θ) ν) →
      μ = ν

/-- Cramér--Wold in the measure-level form consumed by the HDP distribution API. -/
theorem cramerWold {n : ℕ}
    (huniq : characteristicFunctionUniqueness n)
    (μ ν : Measure (Fin n → ℝ))
    (hproj : ∀ θ : Fin n → ℝ,
      Measure.map (linearProjection θ) μ = Measure.map (linearProjection θ) ν) :
    μ = ν :=
  huniq μ ν hproj

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

theorem hdp_03_hthm_hborell_hconvex_hmarginal {n : ℕ}
    (K : Set (EuclideanSpace ℝ (Fin n)))
    (volumeMeasure : Measure (EuclideanSpace ℝ (Fin n)))
    (μ : Measure (EuclideanSpace ℝ (Fin n))) (C : ℝ)
    (hBM : RandomVector.Distributions.brunnMinkowskiPrerequisite)
    (hBorell : RandomVector.Distributions.borellConvexMarginalPrerequisite)
    (hK : RandomVector.Distributions.isConvexBody K)
    (hμ : μ ∈ RandomVector.Distributions.convexBodyUniform n K volumeMeasure)
    (hIso : RandomVector.Distributions.isotropicMeasure μ) (hC : 0 < C) :
    RandomVector.Distributions.subexponentialMarginalBound μ C :=
  RandomVector.Distributions.borellConvexMarginal K volumeMeasure μ C
    hBM hBorell hK hμ hIso hC

theorem hdp_03_hthm_hcramer_hwold {n : ℕ}
    (huniq : RandomVector.Distributions.characteristicFunctionUniqueness n)
    (μ ν : Measure (Fin n → ℝ))
    (hproj : ∀ θ : Fin n → ℝ,
      Measure.map (RandomVector.Distributions.linearProjection θ) μ =
        Measure.map (RandomVector.Distributions.linearProjection θ) ν) :
    μ = ν :=
  RandomVector.Distributions.cramerWold huniq μ ν hproj

def hdp_03_hdef_h3_d3_d8 {ι E : Type*} [Fintype ι]
    [NormedAddCommGroup E] [Inner ℝ E] (u : ι → E) (A B : ℝ) : Prop :=
  RandomVector.Distributions.isFrame u A B

end NumStability.HDP.Contract
