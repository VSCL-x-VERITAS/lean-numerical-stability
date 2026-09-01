/-
Copyright (c) 2026 QED. All rights reserved.
Released under Apache 2.0 license as described in LICENSES/Apache-2.0.txt.
SPDX-License-Identifier: Apache-2.0
See LICENSES/Apache-2.0.txt.
Authors: QED
-/

import NumStability.Analysis.Perturbation.LeastSquares.ProjectorComplementNorm
import NumStability.Source.Higham.Chapter21.Equation08
import NumStability.Source.Higham.Chapter21.Equation09

namespace NumStability

open scoped BigOperators Matrix.Norms.Frobenius

/-!
# Higham Chapter 21: complementary projector norm adapters

Source-facing forms of the exact complementary Moore--Penrose domain-projector
norm used around equations (21.8) and (21.9).  The reusable exact norm theorem
is owned by `Analysis.Perturbation.LeastSquares.ProjectorComplementNorm`.
-/

/-- Exact source radius as a repository-native `rectOpNorm2Le` certificate. -/
theorem higham21_complement_projector_rectOpNorm2Le_exact
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hSym : IsSymmetricFiniteMatrix (rectMatMul Aplus A)) :
    rectOpNorm2Le (lsAugmentedProjectionBlock Aplus A)
      (higham21Eq21_9ProjectorFactor m n) :=
  higham21_eq21_9_complement_projector_rectOpNorm2Le
    A Aplus hmn hRight hSym

/-- Literal `I - Aplus*A` form of the exact rectangular operator certificate. -/
theorem higham21_projector_complement_rectOpNorm2Le_exact
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hSym : IsSymmetricFiniteMatrix (rectMatMul Aplus A)) :
    rectOpNorm2Le
        (fun i j => idMatrix n i j - rectMatMul Aplus A i j)
      (higham21Eq21_9ProjectorFactor m n) := by
  rw [← higham21_lsAugmentedProjectionBlock_eq_complement A Aplus]
  exact higham21_complement_projector_rectOpNorm2Le_exact
    A Aplus hmn hRight hSym

/-- The exact norm is zero when `m = n` and one when `m < n`. -/
theorem higham21_complement_projector_complexMatrixOp2_eq_projectorFactor
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hSym : IsSymmetricFiniteMatrix (rectMatMul Aplus A)) :
    complexMatrixOp2
        (realRectToCMatrix (lsAugmentedProjectionBlock Aplus A)) =
      higham21Eq21_9ProjectorFactor m n := by
  have h := higham21_projector_complement_complexMatrixOp2_eq_min_one_sub
    A Aplus hmn hRight hSym
  rw [← higham21_lsAugmentedProjectionBlock_eq_complement A Aplus] at h
  simpa [higham21Eq21_9ProjectorFactor] using h

/-- Canonical Gram-pseudoinverse form used by equations (21.8) and (21.9). -/
theorem higham21_projector_complement_opNorm2_eq_min_one_sub_of_gram_det_ne_zero
    {m n : Nat} (A : Fin m -> Fin n -> Real) (hmn : m <= n)
    (hdet : Matrix.det
      (rectGram A : Matrix (Fin m) (Fin m) Real) ≠ 0) :
    opNorm2
        (fun i j => idMatrix n i j -
          rectMatMul (undetAplusOfGramNonsingInv A) A i j) =
      ((Nat.min 1 (n - m) : Nat) : Real) :=
  higham21_projector_complement_opNorm2_eq_min_one_sub_of_moorePenrose
    A (undetAplusOfGramNonsingInv A) hmn
    (higham21_eq21_4_rect_pseudoinverse_right_inverse_of_gram_det_ne_zero
      A hdet)
    (higham21_eq21_4_rect_moore_penrose_of_gram_det_ne_zero A hdet)

/-- On a nonempty domain, the source factor is the least admissible
    `rectOpNorm2Le` radius. -/
theorem higham21_complement_projector_rectOpNorm2Le_iff
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n) (hn : 0 < n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hSym : IsSymmetricFiniteMatrix (rectMatMul Aplus A)) {c : Real} :
    rectOpNorm2Le (lsAugmentedProjectionBlock Aplus A) c ↔
      higham21Eq21_9ProjectorFactor m n <= c := by
  letI : Nonempty (Fin n) := ⟨⟨0, hn⟩⟩
  let Q : Fin n -> Fin n -> Real := lsAugmentedProjectionBlock Aplus A
  have hEq :
      complexMatrixOp2 (realRectToCMatrix Q) =
        higham21Eq21_9ProjectorFactor m n := by
    simpa [Q] using
      higham21_complement_projector_complexMatrixOp2_eq_projectorFactor
        A Aplus hmn hRight hSym
  constructor
  · intro hQc
    have hc : 0 <= c := rectOpNorm2Le_radius_nonneg Q hQc
    have hop : complexMatrixOp2 (realRectToCMatrix Q) <= c :=
      complexMatrixOp2_realRectToCMatrix_le_of_rectOpNorm2Le Q hc hQc
    rw [hEq] at hop
    exact hop
  · intro hfactor
    apply rectOpNorm2Le_of_complexMatrixOp2_realRectToCMatrix_le Q
    rw [hEq]
    exact hfactor

/-- Equation-(21.8) residual adapter with the exact zero/one factor. -/
theorem higham21_eq21_8_projection_residual_norm_le_projectorFactor
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hMP : RectMoorePenrosePseudoinverse m n A Aplus)
    (w : Fin n -> Real) :
    vecNorm2
        (fun j => w j - rectMatMulVec Aplus (rectMatMulVec A w) j) <=
      higham21Eq21_9ProjectorFactor m n * vecNorm2 w := by
  have hcert :=
    higham21_complement_projector_rectOpNorm2Le_exact
      A Aplus hmn hRight hMP.domain_projection_symmetric
  have haction := hcert w
  rw [lsAugmentedProjectionBlock_mulVec] at haction
  exact haction

/-- Exact operator-norm adapter named for the equation-(21.9) certificate. -/
theorem higham21_eq21_9_complement_projector_complexMatrixOp2_eq
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hSym : IsSymmetricFiniteMatrix (rectMatMul Aplus A)) :
    complexMatrixOp2
        (realRectToCMatrix (lsAugmentedProjectionBlock Aplus A)) =
      higham21Eq21_9ProjectorFactor m n :=
  higham21_complement_projector_complexMatrixOp2_eq_projectorFactor
    A Aplus hmn hRight hSym

end NumStability
