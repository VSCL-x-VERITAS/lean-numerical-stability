import NumStability.Analysis.SingularValues.Realification
import Mathlib.Analysis.InnerProductSpace.Spectrum

/-!
# HDP random-matrix deterministic interface

This module starts the Split 2 Chapter 4 matrix surface.  It fixes the
finite-dimensional real matrix representation used by the HDP development and
adapts the repository's existing rectangular norm and singular-value APIs.
-/

namespace NumStability
namespace HDP
namespace RandomMatrix
namespace Basic

open scoped BigOperators

/-- HDP real vectors are finite-dimensional Euclidean spaces indexed by `Fin n`. -/
abbrev RealVector (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-- HDP rectangular real matrices use Mathlib's matrix type over `Fin` indices. -/
abbrev RealMatrix (m n : ℕ) := Matrix (Fin m) (Fin n) ℝ

/-- Function-shaped view used to reuse the existing `NumStability` matrix API. -/
abbrev RealMatrixFn (m n : ℕ) := Fin m → Fin n → ℝ

/-- Forget a Mathlib matrix to the repository's function-shaped matrix view. -/
abbrev toMatrixFn {m n : ℕ} (A : RealMatrix m n) : RealMatrixFn m n :=
  fun i j => A i j

/-- Complexification of an HDP real matrix, reusing the repository bridge. -/
noncomputable abbrev toComplexMatrix {m n : ℕ} (A : RealMatrix m n) : CMatrix m n :=
  realRectToCMatrix (toMatrixFn A)

/-- Euclidean linear-map interpretation of an HDP real matrix. -/
noncomputable def toEuclideanLin {m n : ℕ} (A : RealMatrix m n) :
    RealVector n →ₗ[ℝ] RealVector m :=
  (Matrix.toEuclideanLin (𝕜 := ℝ) (m := Fin m) (n := Fin n)) A

/-- Transpose in the HDP real matrix interface. -/
abbrev transpose {m n : ℕ} (A : RealMatrix m n) : RealMatrix n m :=
  A.transpose

/-- Over the reals, the adjoint matrix is the transpose. -/
abbrev adjoint {m n : ℕ} (A : RealMatrix m n) : RealMatrix n m :=
  transpose A

/-- Gram matrix `AᵀA`, used for singular values and covariance calculations. -/
noncomputable def gram {m n : ℕ} (A : RealMatrix m n) : RealMatrix n n :=
  transpose A * A

/-- Mathlib matrix rank, fixed as the HDP rank convention. -/
noncomputable def rank {m n : ℕ} (A : RealMatrix m n) : ℕ :=
  Matrix.rank A

/-- Ordered singular values, zero-based in Lean and zero-padded through the
domain dimension.  Index `0` is the source's largest singular value. -/
noncomputable def singularValue {m n : ℕ} (A : RealMatrix m n) (i : Fin n) : ℝ :=
  complexMatrixSingularValue (toComplexMatrix A) i

/-- Singular values are nonnegative. -/
theorem singularValue_nonneg {m n : ℕ} (A : RealMatrix m n) (i : Fin n) :
    0 ≤ singularValue A i :=
  complexMatrixSingularValue_nonneg (toComplexMatrix A) i

/-- Singular values are ordered decreasingly in the source-facing convention. -/
theorem singularValue_antitone {m n : ℕ} (A : RealMatrix m n) :
    Antitone (singularValue A) :=
  complexMatrixSingularValue_antitone (toComplexMatrix A)

/-- Frobenius norm for rectangular HDP real matrices. -/
noncomputable def frobeniusNorm {m n : ℕ} (A : RealMatrix m n) : ℝ :=
  frobNormRect (toMatrixFn A)

/-- Euclidean induced operator norm for rectangular HDP real matrices. -/
noncomputable def operatorNorm {m n : ℕ} (A : RealMatrix m n) : ℝ :=
  rectOpNorm2 (toMatrixFn A)

/-- Predicate form for rectangular Euclidean operator-norm upper bounds. -/
def operatorNormLe {m n : ℕ} (A : RealMatrix m n) (c : ℝ) : Prop :=
  rectOpNorm2Le (toMatrixFn A) c

/-- The canonical operator norm satisfies its own predicate bound. -/
theorem operatorNormLe_operatorNorm {m n : ℕ} (A : RealMatrix m n) :
    operatorNormLe A (operatorNorm A) :=
  rectOpNorm2Le_rectOpNorm2 (toMatrixFn A)

/-- Chapter 4 shared matrix interface, packaged as a concrete type so downstream
contracts can depend on the representation choices without re-fixing them. -/
structure MatrixInterface : Type 1 where
  matrix : ℕ → ℕ → Type
  vector : ℕ → Type
  fnView : ∀ {m n : ℕ}, matrix m n → Type
  euclideanLin : ∀ {m n : ℕ}, RealMatrix m n → RealVector n →ₗ[ℝ] RealVector m
  transpose : ∀ {m n : ℕ}, RealMatrix m n → RealMatrix n m
  rank : ∀ {m n : ℕ}, RealMatrix m n → ℕ
  singularValue : ∀ {m n : ℕ}, matrix m n → Fin n → ℝ
  frobeniusNorm : ∀ {m n : ℕ}, matrix m n → ℝ
  operatorNorm : ∀ {m n : ℕ}, matrix m n → ℝ

/-- The HDP Chapter 4 matrix interface instantiated by the canonical choices. -/
noncomputable def matrixInterface : MatrixInterface where
  matrix := RealMatrix
  vector := RealVector
  fnView := fun {m n} _ => RealMatrixFn m n
  euclideanLin := toEuclideanLin
  transpose := transpose
  rank := rank
  singularValue := singularValue
  frobeniusNorm := frobeniusNorm
  operatorNorm := operatorNorm

/-- Self-adjointness for a square HDP matrix, expressed through its Euclidean
linear-map interpretation. -/
def isSelfAdjoint {n : ℕ} (A : RealMatrix n n) : Prop :=
  (toEuclideanLin A).IsSymmetric

private theorem realVector_finrank (n : ℕ) :
    Module.finrank ℝ (RealVector n) = n := by
  simp [RealVector]

/-- The ordered real eigenvalues of a self-adjoint HDP matrix.  The index is
zero-based and follows Mathlib's decreasing source convention. -/
noncomputable def orderedEigenvalues {n : ℕ} (A : RealMatrix n n)
    (hA : isSelfAdjoint A) : Fin n → ℝ :=
  hA.eigenvalues (realVector_finrank n)

/-- The ordered eigenvalue sequence is antitone. -/
theorem orderedEigenvalues_antitone {n : ℕ} (A : RealMatrix n n)
    (hA : isSelfAdjoint A) : Antitone (orderedEigenvalues A hA) :=
  hA.eigenvalues_antitone (realVector_finrank n)

/-- Index `i` represents a simple eigenvalue when no other ordered slot has the
same eigenvalue. -/
def hasSimpleEigenvalue {n : ℕ} (A : RealMatrix n n)
    (hA : isSelfAdjoint A) (i : Fin n) : Prop :=
  ∀ j, orderedEigenvalues A hA j = orderedEigenvalues A hA i → j = i

/-- A normalized eigenvector selected from the spectral orthonormal basis.
The simple-eigenvalue certificate is an explicit argument, so later consumers
cannot silently treat a repeated eigenspace as having a canonical vector. -/
noncomputable def normalizedEigenvector {n : ℕ} (A : RealMatrix n n)
    (hA : isSelfAdjoint A) (i : Fin n)
    (_hsimple : hasSimpleEigenvalue A hA i) : RealVector n :=
  hA.eigenvectorBasis (realVector_finrank n) i

/-- The angle between two nonzero Euclidean vectors, in radians. -/
noncomputable def vectorAngle {n : ℕ} (u v : RealVector n)
    (_hu : u ≠ 0) (_hv : v ≠ 0) : ℝ :=
  Real.arccos (inner ℝ u v / (‖u‖ * ‖v‖))

/-- The minimum angle between nonzero vectors in two finite-dimensional
subspaces.  The `sInf` convention is retained for empty subspace pairs; the
nonempty hypotheses needed by angle estimates belong to those estimates. -/
noncomputable def subspaceAngle {n : ℕ}
    (E F : Submodule ℝ (RealVector n)) : ℝ :=
  sInf {θ : ℝ | ∃ u ∈ E, ∃ v ∈ F, ∃ hu : u ≠ 0, ∃ hv : v ≠ 0,
    θ = vectorAngle u v hu hv}

/-- Distance between one-dimensional eigendirections, identifying vectors up
to sign. -/
noncomputable def signEquivalenceDistance {n : ℕ} (u v : RealVector n) : ℝ :=
  min ‖u - v‖ ‖u + v‖

/-- The Chapter 4 spectral-gap interface. -/
structure SpectralGapInterface (n : ℕ) where
  isSelfAdjoint : RealMatrix n n → Prop
  orderedEigenvalues : ∀ A, isSelfAdjoint A → Fin n → ℝ
  hasSimpleEigenvalue : ∀ (A : RealMatrix n n)
    (hA : NumStability.HDP.RandomMatrix.Basic.isSelfAdjoint A)
    (i : Fin n), Prop
  normalizedEigenvector : ∀ (A : RealMatrix n n)
    (hA : NumStability.HDP.RandomMatrix.Basic.isSelfAdjoint A)
    (i : Fin n),
    Basic.hasSimpleEigenvalue A hA i → RealVector n
  subspaceAngle : Submodule ℝ (RealVector n) →
    Submodule ℝ (RealVector n) → ℝ
  signEquivalenceDistance : RealVector n → RealVector n → ℝ

/-- The canonical Chapter 4 spectral-gap interface. -/
noncomputable def spectralGapInterface (n : ℕ) : SpectralGapInterface n where
  isSelfAdjoint := isSelfAdjoint
  orderedEigenvalues := orderedEigenvalues
  hasSimpleEigenvalue := hasSimpleEigenvalue
  normalizedEigenvector := normalizedEigenvector
  subspaceAngle := subspaceAngle
  signEquivalenceDistance := signEquivalenceDistance

/-- A positive universal constant, independent of dimensions and distributions. -/
def UniversalConstant : Type := {C : ℝ // 0 < C}

/-- A positive lower universal constant.  This is definitionally the same
representation as `UniversalConstant`, but names the lower-bound role. -/
abbrev UniversalLowerConstant : Type := UniversalConstant

/-- Explicit comparison by a universal constant. -/
def universallyBounded {α : Type*} (quantity scale : α → ℝ)
    (C : UniversalConstant) : Prop :=
  ∀ x, quantity x ≤ C.1 * scale x

/-- The Chapter 4 constants convention as a reusable interface. -/
structure ConstantsInterface where
  universal : UniversalConstant
  lower : UniversalLowerConstant
  upperBound : ∀ {α : Type*}, (α → ℝ) → (α → ℝ) → UniversalConstant → Prop

def constantsInterface : ConstantsInterface where
  universal := ⟨1, by norm_num⟩
  lower := ⟨1, by norm_num⟩
  upperBound := fun quantity scale C => universallyBounded quantity scale C

end Basic
end RandomMatrix
end HDP
end NumStability

namespace NumStability.HDP.Contract

def hdp_04_hiface_hconstants :
    RandomMatrix.Basic.ConstantsInterface :=
  RandomMatrix.Basic.constantsInterface

end NumStability.HDP.Contract
