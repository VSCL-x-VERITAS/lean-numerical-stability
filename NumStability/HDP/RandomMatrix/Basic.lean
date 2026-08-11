import NumStability.Analysis.SingularValues.Realification

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
  singularValue : ∀ {m n : ℕ}, matrix m n → Fin n → ℝ
  frobeniusNorm : ∀ {m n : ℕ}, matrix m n → ℝ
  operatorNorm : ∀ {m n : ℕ}, matrix m n → ℝ

/-- The HDP Chapter 4 matrix interface instantiated by the canonical choices. -/
noncomputable def matrixInterface : MatrixInterface where
  matrix := RealMatrix
  vector := RealVector
  fnView := fun {m n} _ => RealMatrixFn m n
  singularValue := singularValue
  frobeniusNorm := frobeniusNorm
  operatorNorm := operatorNorm

end Basic
end RandomMatrix
end HDP
end NumStability
