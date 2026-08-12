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

end NumStability.HDP.Quadratic.Symmetrization

namespace NumStability.HDP.Contract

open MeasureTheory

def hdp_06_hdef_h6_d4_hsymmetric_hrv {Ω E : Type*}
    [MeasurableSpace Ω] [MeasurableSpace E] [Neg E]
    (μ : Measure Ω) (X : Ω → E) : Prop :=
  Quadratic.Symmetrization.symmetricLaw μ X

end NumStability.HDP.Contract
