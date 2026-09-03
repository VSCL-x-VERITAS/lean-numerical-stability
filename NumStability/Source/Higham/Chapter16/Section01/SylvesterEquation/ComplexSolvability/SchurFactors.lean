import Mathlib.Data.Prod.Lex
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.LinearAlgebra.Matrix.ToLinearEquiv
import Mathlib.LinearAlgebra.Matrix.Vec
import NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.ComplexSchur.Existence

/-!
# Source.Higham.Chapter16.Section01.SylvesterEquation.ComplexSolvability.SchurFactors

Source-numbered aliases connecting the reusable complex Schur solvability
results to Higham, Chapter 16, equations (16.2), (16.3), and (16.6).
-/

/-
Analysis/SylvesterSchurExistence.lean

Complex-path Schur existence for the Chapter 16 Sylvester equation
(Higham, *Accuracy and Stability of Numerical Algorithms*, 2nd ed.,
Section 16.2, equations (16.4)-(16.6)).

MOTIVATION / HONEST SCOPE.

The real-valued Chapter 16 development
(`NumStability/Algorithms/Sylvester/Higham16.lean`,
`NumStability/Algorithms/Sylvester/Higham16Spectrum.lean`) proves the Bartels-Stewart
triangular solve only *conditionally* on SUPPLIED Schur factors: the theorem
`existsUnique_isSylvesterSolutionRect_schurTriangular` requires the caller to
hand over real orthogonal `U, V`, a real matrix `R` with `A = U R Uᵀ`, and a
real UPPER-TRIANGULAR `S` with `B = V S Vᵀ`.  That "supplied factors" hypothesis
is genuine and unavoidable there, because a real matrix in general has NO real
upper-triangular Schur form: the real Schur form of Higham (16.4) is only
*quasi*-triangular (2x2 real blocks for complex-conjugate eigenpairs).  The real
file therefore cannot discharge its own supplied-triangular hypothesis, and does
not claim to.

Over `ℂ`, by contrast, the classical Schur triangulation
`NumStability.schur_triangulation` (`NumStability/Analysis/SchurTriangulation.lean`)
gives, for EVERY complex square matrix, a genuine unitary `U` and a genuine
upper-triangular `T` with `Uᴴ A U = T`.  This file uses that primitive to turn
the complex analogue of the supplied-triangular hypothesis into an
*unconditional existence* statement, and then proves unique solvability of the
complex Sylvester equation `A X - X B = C`.

WHAT IS UNCONDITIONAL HERE (no supplied factors):

* `complexSylvester_schur_factors_exist` — for any `A : ℂ^{m×m}`,
  `B : ℂ^{n×n}` there exist a unitary `U` and upper-triangular `R` with
  `Uᴴ A U = R`, and a unitary `V` and upper-triangular `S` with `Vᴴ B V = S`.
  This is exactly the datum the real file must *assume*; over `ℂ` it is proved.

WHAT REMAINS AN EXPLICIT, NON-TAUTOLOGICAL HYPOTHESIS:

* the per-column shift nonsingularity `det (R - s_kk • I) ≠ 0`.  This is a
  condition on the DIAGONAL ENTRIES of the triangular factors, i.e. on the
  eigenvalues `λ_i(A) ≠ μ_k(B)` (the Sylvester separation / no-common-eigenvalue
  condition of (16.3)).  It is emphatically NOT the conclusion in disguise: it
  constrains only the (supplied-by-Schur) eigenvalues, not the solution `X`.  The
  headline theorem `complexSylvester_exists_unique_of_schur_shift` exposes it as
  a hypothesis phrased in terms of the Schur factors produced by the existence
  step, and states honestly that this is the residual assumption.

WHAT IS NOT CLAIMED:

* No real Schur form, no real quasi-triangular (2x2 block) solve of Higham
  (16.4)/(16.7)-(16.8): those are over `ℝ` and are genuinely different objects.
  This file does not touch, restate, or overclaim the real results.
* No floating-point rounding analysis; all arithmetic is exact over `ℂ`.
* No spectral converse claim beyond what the shift hypothesis encodes.

Everything is stated for the standard Mathlib matrix type `Matrix (Fin _) (Fin _)
ℂ` with ordinary matrix multiplication `*` and `Matrix.mulVec`, so that the
complex Schur primitive (`Uᴴ * A * U = T`) plugs in directly.
-/







open scoped BigOperators Matrix

namespace NumStability

-- ============================================================
-- The complex Sylvester operator and solution predicate
-- ============================================================


















































































































































































































































































































































/-- Higham, 2nd ed., Chapter 16.1, equation (16.2): source-numbered alias for
    the complex vec/Kronecker Sylvester coefficient. -/
theorem H16_eq16_2_complexSylvesterVecCoeff {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ) :
    complexSylvesterVecCoeff A B =
      Matrix.kronecker (1 : Matrix (Fin n) (Fin n) ℂ) A -
        Matrix.kronecker (Matrix.transpose B) (1 : Matrix (Fin m) (Fin m) ℂ) :=
  rfl

/-- Higham, 2nd ed., Chapter 16.1, equation (16.3): source-numbered alias for
    the supplied complex triangular vec/Kronecker determinant product. -/
theorem H16_eq16_3_complexSylvesterVecCoeff_det_eq_prod_of_upperTriangular
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ)
    (hA : IsUpperTriangularC A) (hB : IsUpperTriangularC B) :
    Matrix.det (complexSylvesterVecCoeff A B) =
      ∏ p : Prod (Fin n) (Fin m), (A p.2 p.2 - B p.1 p.1) :=
  complexSylvesterVecCoeff_det_eq_prod_of_upperTriangular A B hA hB

/-- Higham, 2nd ed., Chapter 16.1, equation (16.3): source-numbered alias for
    the supplied complex triangular shifted vec/Kronecker determinant product. -/
theorem H16_eq16_3_complexSylvesterVecCoeff_shifted_det_eq_prod_of_upperTriangular
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ) (μ : ℂ)
    (hA : IsUpperTriangularC A) (hB : IsUpperTriangularC B) :
    Matrix.det (complexSylvesterVecCoeff A B -
        Matrix.scalar (Prod (Fin n) (Fin m)) μ) =
      ∏ p : Prod (Fin n) (Fin m), (A p.2 p.2 - B p.1 p.1 - μ) :=
  complexSylvesterVecCoeff_shifted_det_eq_prod_of_upperTriangular A B μ hA hB

/-- Higham, 2nd ed., Chapter 16.1, equation (16.3): source-numbered alias for
    the supplied complex triangular shifted determinant/separation equivalence. -/
theorem H16_eq16_3_complexSylvesterVecCoeff_shifted_det_ne_zero_iff_of_upperTriangular_diagonal_separation
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ) (μ : ℂ)
    (hA : IsUpperTriangularC A) (hB : IsUpperTriangularC B) :
    Matrix.det (complexSylvesterVecCoeff A B -
        Matrix.scalar (Prod (Fin n) (Fin m)) μ) ≠ 0 ↔
      ∀ i : Fin m, ∀ j : Fin n, A i i - B j j ≠ μ :=
  complexSylvesterVecCoeff_shifted_det_ne_zero_iff_of_upperTriangular_diagonal_separation
    A B μ hA hB

/-- Higham, 2nd ed., Chapter 16.1, equation (16.3): source-numbered alias for
    the supplied complex triangular shifted determinant nonsingularity
    consequence. -/
theorem H16_eq16_3_complexSylvesterVecCoeff_shifted_det_ne_zero_of_upperTriangular_diagonal_separation
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ) (μ : ℂ)
    (hA : IsUpperTriangularC A) (hB : IsUpperTriangularC B)
    (hsep : ∀ i : Fin m, ∀ j : Fin n, A i i - B j j ≠ μ) :
    Matrix.det (complexSylvesterVecCoeff A B -
        Matrix.scalar (Prod (Fin n) (Fin m)) μ) ≠ 0 :=
  complexSylvesterVecCoeff_shifted_det_ne_zero_of_upperTriangular_diagonal_separation
    A B μ hA hB hsep

/-- Higham, 2nd ed., Chapter 16.1, equation (16.3): source-numbered alias for
    the supplied complex triangular determinant/separation equivalence. -/
theorem H16_eq16_3_complexSylvesterVecCoeff_det_ne_zero_iff_of_upperTriangular_diagonal_separation
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ)
    (hA : IsUpperTriangularC A) (hB : IsUpperTriangularC B) :
    Matrix.det (complexSylvesterVecCoeff A B) ≠ 0 ↔
      ∀ i : Fin m, ∀ j : Fin n, A i i ≠ B j j :=
  complexSylvesterVecCoeff_det_ne_zero_iff_of_upperTriangular_diagonal_separation
    A B hA hB

/-- Higham, 2nd ed., Chapter 16.1, equation (16.3): source-numbered alias for
    supplied complex triangular nonsingularity from diagonal separation. -/
theorem H16_eq16_3_complexSylvesterVecCoeff_det_ne_zero_of_upperTriangular_diagonal_separation
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ)
    (hA : IsUpperTriangularC A) (hB : IsUpperTriangularC B)
    (hsep : ∀ i : Fin m, ∀ j : Fin n, A i i ≠ B j j) :
    Matrix.det (complexSylvesterVecCoeff A B) ≠ 0 :=
  complexSylvesterVecCoeff_det_ne_zero_of_upperTriangular_diagonal_separation
    A B hA hB hsep












































































/-- Higham, 2nd ed., Chapter 16.1, equation (16.3): source-numbered alias for
    the supplied complex triangular no-common-eigenpair determinant route. -/
theorem H16_eq16_3_complexSylvesterVecCoeff_det_ne_zero_of_upperTriangular_no_common_eigenpair
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ)
    (hA : IsUpperTriangularC A) (hB : IsUpperTriangularC B)
    (hno : ∀ μ : ℂ,
      ¬ ((∃ y : Fin m → ℂ,
            y ≠ 0 ∧ Matrix.mulVec A y = fun i => μ * y i) ∧
          (∃ z : Fin n → ℂ,
            z ≠ 0 ∧ Matrix.mulVec B z = fun j => μ * z j))) :
    Matrix.det (complexSylvesterVecCoeff A B) ≠ 0 :=
  complexSylvesterVecCoeff_det_ne_zero_of_upperTriangular_no_common_eigenpair
    A B hA hB hno

-- ============================================================
-- Complex Schur factors exist unconditionally
-- ============================================================




















-- ============================================================
-- The transformed equation R Y - Y S = C' in Schur coordinates
-- ============================================================



















































































-- ============================================================
-- The complex Bartels-Stewart column solve
-- ============================================================





























































/-- Higham, 2nd ed., Chapter 16.2, equation (16.6):
    source-numbered alias for nonsingularity of the shifted triangular
    column coefficient from supplied diagonal separation. -/
alias H16_eq16_6_complexShiftedCoeff_det_ne_zero_of_upperTriangular_diag_ne :=
  complexShiftedCoeff_det_ne_zero_of_upperTriangular_diag_ne

/-- Higham, 2nd ed., Chapter 16.2, equations (16.3)-(16.6):
    source-numbered alias for the supplied complex Schur diagonal-separation
    shifted determinant certificates. -/
alias H16_eq16_3_6_complexSylvester_shift_det_ne_zero_of_schur_diagonal_separation :=
  complexSylvester_shift_det_ne_zero_of_schur_diagonal_separation
















































































































-- ============================================================
-- Uniqueness and existence of the column solve
-- ============================================================

































































































































































-- ============================================================
-- Headline: complex Sylvester unique solvability with Schur factors supplied
-- by existence (not by hypothesis)
-- ============================================================











































































/-- Higham, 2nd ed., Chapter 16.2, equations (16.3)-(16.6):
    source-numbered alias for the supplied complex Schur diagonal-separation
    exact unique-solve theorem. -/
alias H16_eq16_3_6_complexSylvester_exists_unique_of_schur_diagonal_separation :=
  complexSylvester_exists_unique_of_schur_diagonal_separation





























































































/-- Higham, 2nd ed., Chapter 16.1-16.2, equations (16.3)-(16.6):
    source-numbered alias for the complex Schur unique-solve route from a
    no-common-right-eigenpair hypothesis on the original matrices. -/
theorem H16_eq16_3_complexSylvester_exists_unique_of_schur_no_common_eigenpair
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ)
    (U : Matrix (Fin m) (Fin m) ℂ) (V : Matrix (Fin n) (Fin n) ℂ)
    (R : Matrix (Fin m) (Fin m) ℂ) (S : Matrix (Fin n) (Fin n) ℂ)
    (C : Matrix (Fin m) (Fin n) ℂ)
    (hU : U ∈ Matrix.unitaryGroup (Fin m) ℂ)
    (hV : V ∈ Matrix.unitaryGroup (Fin n) ℂ)
    (hR : Uᴴ * A * U = R) (hS : Vᴴ * B * V = S)
    (hRtri : IsUpperTriangularC R)
    (hStri : IsUpperTriangularC S)
    (hno : ∀ μ : ℂ,
      ¬ ((∃ y : Fin m → ℂ,
            y ≠ 0 ∧ Matrix.mulVec A y = fun i => μ * y i) ∧
          (∃ z : Fin n → ℂ,
            z ≠ 0 ∧ Matrix.mulVec B z = fun j => μ * z j))) :
    ∃! X : Matrix (Fin m) (Fin n) ℂ, IsComplexSylvesterSolution A B C X :=
  complexSylvester_exists_unique_of_schur_no_common_eigenpair
    A B U V R S C hU hV hR hS hRtri hStri hno



















/-- Higham, 2nd ed., Chapter 16.1-16.2, equations (16.3)-(16.6):
    source-numbered alias for the exact complex Sylvester unique-solve theorem
    from no common supplied right eigenpair, with Schur factors obtained by
    existence. -/
theorem H16_eq16_3_complexSylvester_exists_unique_of_no_common_eigenpair
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ)
    (C : Matrix (Fin m) (Fin n) ℂ)
    (hno : ∀ μ : ℂ,
      ¬ ((∃ y : Fin m → ℂ,
            y ≠ 0 ∧ Matrix.mulVec A y = fun i => μ * y i) ∧
          (∃ z : Fin n → ℂ,
            z ≠ 0 ∧ Matrix.mulVec B z = fun j => μ * z j))) :
    ∃! X : Matrix (Fin m) (Fin n) ℂ, IsComplexSylvesterSolution A B C X :=
  complexSylvester_exists_unique_of_no_common_eigenpair A B C hno

















/-- Higham, 2nd ed., Chapter 16.1-16.2, equations (16.2)-(16.3):
    source-numbered alias for the complex vec/Kronecker determinant
    nonsingularity theorem from no common supplied right eigenpair. -/
theorem H16_eq16_3_complexSylvesterVecCoeff_det_ne_zero_of_no_common_eigenpair
    {m n : ℕ}
    (A : Matrix (Fin m) (Fin m) ℂ) (B : Matrix (Fin n) (Fin n) ℂ)
    (hno : ∀ μ : ℂ,
      ¬ ((∃ y : Fin m → ℂ,
            y ≠ 0 ∧ Matrix.mulVec A y = fun i => μ * y i) ∧
          (∃ z : Fin n → ℂ,
            z ≠ 0 ∧ Matrix.mulVec B z = fun j => μ * z j))) :
    Matrix.det (complexSylvesterVecCoeff A B) ≠ 0 :=
  complexSylvesterVecCoeff_det_ne_zero_of_no_common_eigenpair A B hno






























end NumStability
