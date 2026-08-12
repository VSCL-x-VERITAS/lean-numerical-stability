import Mathlib.MeasureTheory.Measure.Map
import Mathlib.Probability.Independence.Basic
import Mathlib.Probability.ProbabilityMassFunction.Constructions

namespace NumStability.HDP.Quadratic.Symmetrization

open MeasureTheory
open ProbabilityTheory
open scoped NNReal

/-- A random element has a symmetric law when its negation has the same law. -/
def symmetricLaw {Ω E : Type*} [MeasurableSpace Ω] [MeasurableSpace E]
    [Neg E] (μ : Measure Ω) (X : Ω → E) : Prop :=
  Measure.map (fun x => -x) (Measure.map X μ) = Measure.map X μ

/-- The canonical fair Rademacher law on `Bool`. -/
noncomputable def rademacherMeasure : Measure Bool :=
  (PMF.bernoulli ((1 : ℝ≥0) / 2) (by norm_num)).toMeasure

/-- An independent sequence of fair Rademacher random signs. -/
def isIndependentRademacherSequence {Ω ι : Type*}
    [MeasurableSpace Ω] (μ : Measure Ω) (R : ι → Ω → Bool) : Prop :=
  iIndepFun R μ ∧ ∀ i, Measure.map (R i) μ = rademacherMeasure

/-- The complete symmetrization interface: symmetry of `X` together with a
globally independent fair-sign family available for symmetrization. -/
structure SymmetrizationInterface {Ω E ι : Type*}
    [MeasurableSpace Ω] [MeasurableSpace E] [Neg E]
    [MeasurableSpace Bool] (μ : Measure Ω) (X : Ω → E) (R : ι → Ω → Bool) : Prop where
  symmetric : symmetricLaw μ X
  independentSigns : isIndependentRademacherSequence μ R

def symmetrizationInterface {Ω E ι : Type*}
    [MeasurableSpace Ω] [MeasurableSpace E] [Neg E]
    (μ : Measure Ω) (X : Ω → E) (R : ι → Ω → Bool) :
    Prop :=
  SymmetrizationInterface μ X R

end NumStability.HDP.Quadratic.Symmetrization

namespace NumStability.HDP.Contract

open MeasureTheory

def hdp_06_hdef_h6_d4_hsymmetric_hrv {Ω E ι : Type*}
    [MeasurableSpace Ω] [MeasurableSpace E] [Neg E]
    (μ : Measure Ω) (X : Ω → E) (R : ι → Ω → Bool) : Prop :=
  Quadratic.Symmetrization.symmetrizationInterface μ X R

end NumStability.HDP.Contract
