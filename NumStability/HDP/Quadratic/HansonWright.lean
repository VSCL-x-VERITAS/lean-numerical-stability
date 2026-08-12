import Mathlib.MeasureTheory.Measure.Map
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.Probability.Independence.Basic
import Mathlib.Data.Matrix.Basic

namespace NumStability.HDP.Quadratic.HansonWright

open MeasureTheory
open ProbabilityTheory
open scoped BigOperators

/-! Deterministic quadratic-chaos vocabulary.  The matrix and vector indices
are fixed together at `Fin n`, making the diagonal/off-diagonal split and the
decoupled bilinear form explicit. -/

def quadraticChaos {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (X : Fin n → ℝ) : ℝ :=
  ∑ i, ∑ j, A i j * X i * X j

def offDiagonalPart {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  fun i j => if i = j then 0 else A i j

def decoupledBilinearChaos {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (X X' : Fin n → ℝ) : ℝ :=
  ∑ i, ∑ j, A i j * X i * X' j

def isDiagonalFree {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  ∀ i, A i i = 0

structure QuadraticChaosInterface (n : ℕ) where
  quadratic : Matrix (Fin n) (Fin n) ℝ → (Fin n → ℝ) → ℝ
  offDiagonal : Matrix (Fin n) (Fin n) ℝ → Matrix (Fin n) (Fin n) ℝ
  decoupled : Matrix (Fin n) (Fin n) ℝ → (Fin n → ℝ) → (Fin n → ℝ) → ℝ
  diagonalFree : Matrix (Fin n) (Fin n) ℝ → Prop

def quadraticChaosInterface (n : ℕ) : QuadraticChaosInterface n where
  quadratic := quadraticChaos
  offDiagonal := offDiagonalPart
  decoupled := decoupledBilinearChaos
  diagonalFree := isDiagonalFree

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

namespace NumStability.HDP.Contract

def hdp_06_hdef_h6_d1_hchaos (n : ℕ) :
    NumStability.HDP.Quadratic.HansonWright.QuadraticChaosInterface n :=
  NumStability.HDP.Quadratic.HansonWright.quadraticChaosInterface n

end NumStability.HDP.Contract
