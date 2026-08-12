import Mathlib.MeasureTheory.Measure.Map
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.Probability.Independence.Basic

namespace NumStability.HDP.Quadratic.HansonWright

open MeasureTheory
open ProbabilityTheory

/-!
An interface for the independent-copy construction used in the Hanson--Wright
chapter.  The interface deliberately records the product extension, its two
coordinate copies, and the law/independence predicates as data.  Downstream
formalizations can refine these predicates with the relevant hypotheses.
-/

def firstCoordinateCopy {Ω α : Type*} (X : Ω → α) : Ω × Ω → α :=
  fun p => X p.1

def secondCoordinateCopy {Ω α : Type*} (X : Ω → α) : Ω × Ω → α :=
  fun p => X p.2

noncomputable def productCopyMeasure {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) : Measure (Ω × Ω) :=
  Measure.prod μ μ

def copyHasSameLaw {Ω α : Type*} [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : Ω → α) (X' : Ω × Ω → α) : Prop :=
  Measure.map X' (productCopyMeasure μ) = Measure.map X μ

def copyIsIndependent {Ω α : Type*} [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : Ω → α) (X' : Ω × Ω → α) : Prop :=
  IndepFun (firstCoordinateCopy X) X' (productCopyMeasure μ)

structure IndependentCopyInterface {Ω α : Type*}
    [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : Ω → α) where
  extendedMeasure : Measure (Ω × Ω)
  originalCopy : Ω × Ω → α
  independentCopy : Ω × Ω → α
  sameLaw : Measure (Ω × Ω) → (Ω × Ω → α) → Prop
  independent : Measure (Ω × Ω) → (Ω × Ω → α) → Prop

noncomputable def independentCopyInterface {Ω α : Type*}
    [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : Ω → α) : IndependentCopyInterface μ X where
  extendedMeasure := productCopyMeasure μ
  originalCopy := firstCoordinateCopy X
  independentCopy := secondCoordinateCopy X
  sameLaw := fun ν Y => Measure.map Y ν = Measure.map X μ
  independent := fun ν Y => IndepFun (firstCoordinateCopy X) Y ν

def jointSecondCoordinateCopies {ι Ω α : Type*}
    (X : ι → Ω → α) : ι → Ω × Ω → α :=
  fun i p => X i p.2

def jointCopiesHaveSameLaw {ι Ω α : Type*}
    [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : ι → Ω → α) : Prop :=
  ∀ i, Measure.map (jointSecondCoordinateCopies X i) (productCopyMeasure μ) =
    Measure.map (X i) μ

def jointCopiesAreIndependent {ι Ω α : Type*}
    [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : ι → Ω → α) : Prop :=
  iIndepFun (jointSecondCoordinateCopies X) (productCopyMeasure μ)

structure JointIndependentCopyInterface {ι Ω α : Type*} [Fintype ι]
    [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : ι → Ω → α) where
  copies : ι → Ω × Ω → α
  sameLaw : Prop
  independent : Prop

noncomputable def jointIndependentCopyInterface {ι Ω α : Type*} [Fintype ι]
    [MeasurableSpace Ω] [MeasurableSpace α]
    (μ : Measure Ω) (X : ι → Ω → α) :
    JointIndependentCopyInterface μ X where
  copies := jointSecondCoordinateCopies X
  sameLaw := jointCopiesHaveSameLaw μ X
  independent := jointCopiesAreIndependent μ X

end NumStability.HDP.Quadratic.HansonWright
