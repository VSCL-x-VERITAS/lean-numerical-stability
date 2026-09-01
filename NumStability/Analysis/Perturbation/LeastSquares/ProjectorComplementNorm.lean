/-
Copyright (c) 2026 QED. All rights reserved.
Released under Apache 2.0 license as described in LICENSES/Apache-2.0.txt.
SPDX-License-Identifier: Apache-2.0
See LICENSES/Apache-2.0.txt.
Authors: QED
-/

import NumStability.Algorithms.LinearSystems.LeastSquares.Basic
import NumStability.Analysis.Perturbation.LeastSquares.Wedin

namespace NumStability

open scoped BigOperators Matrix.Norms.Frobenius

/-!
# Complementary projector norms for underdetermined systems

Reusable exact norm facts for `I - A⁺ A`.  The results use only finite-matrix,
Moore--Penrose, and least-squares perturbation infrastructure; source-specific
equation adapters live in `NumStability.Source.Higham.Chapter21`.
-/

/-- A real `m`-by-`n` matrix with `m < n` has a nonzero right-nullspace
    vector. -/
theorem higham21_exists_nonzero_rectMatMulVec_eq_zero_of_lt
    {m n : Nat} (A : Fin m -> Fin n -> Real) (hmn : m < n) :
    ∃ x : Fin n -> Real, x ≠ 0 ∧ rectMatMulVec A x = 0 := by
  classical
  let T : (Fin n -> Real) →ₗ[Real] (Fin m -> Real) :=
    (Matrix.of A).mulVecLin
  have hdim :
      Module.finrank Real (Fin m -> Real) <
        Module.finrank Real (Fin n -> Real) := by
    simpa using hmn
  have hker : LinearMap.ker T ≠ (⊥ : Submodule Real (Fin n -> Real)) :=
    LinearMap.ker_ne_bot_of_finrank_lt (f := T) hdim
  rcases (Submodule.ne_bot_iff (LinearMap.ker T)).1 hker with
    ⟨x, hxmem, hxne⟩
  have hTx : T x = 0 := by
    simpa [LinearMap.mem_ker] using hxmem
  refine ⟨x, hxne, ?_⟩
  ext i
  have hi := congrFun hTx i
  simpa [T, rectMatMulVec, Matrix.mulVecLin, Matrix.mulVec,
    dotProduct, Matrix.of] using hi

/-- Unit-vector form of the strict rectangular nullspace witness. -/
theorem higham21_exists_unit_rectMatMulVec_eq_zero_of_lt
    {m n : Nat} (A : Fin m -> Fin n -> Real) (hmn : m < n) :
    ∃ x : Fin n -> Real, vecNorm2 x = 1 ∧ rectMatMulVec A x = 0 := by
  obtain ⟨x, hxne, hAx⟩ :=
    higham21_exists_nonzero_rectMatMulVec_eq_zero_of_lt A hmn
  have hxnorm_ne : vecNorm2 x ≠ 0 := by
    intro hxnorm
    apply hxne
    funext j
    exact (vecNorm2_eq_zero_iff x).mp hxnorm j
  have hxpos : 0 < vecNorm2 x :=
    lt_of_le_of_ne (vecNorm2_nonneg x) (Ne.symm hxnorm_ne)
  let y : Fin n -> Real := fun j => (vecNorm2 x)⁻¹ * x j
  refine ⟨y, ?_, ?_⟩
  · simpa [y] using vecNorm2_inv_smul_self_of_pos x hxpos
  · calc
      rectMatMulVec A y =
          fun i => (vecNorm2 x)⁻¹ * rectMatMulVec A x i := by
        simpa [y] using rectMatMulVec_smul A (vecNorm2 x)⁻¹ x
      _ = 0 := by
        rw [hAx]
        funext i
        simp

/-- The augmented least-squares block is entrywise `I - Aplus*A`. -/
theorem higham21_lsAugmentedProjectionBlock_eq_complement
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) :
    lsAugmentedProjectionBlock Aplus A =
      fun i j => idMatrix n i j - rectMatMul Aplus A i j := by
  ext i j
  simp only [lsAugmentedProjectionBlock, rectMatMulVec, rectMatMul]

/-- In the square branch, a right inverse makes the complementary domain
    projector identically zero. -/
theorem higham21_complement_projector_eq_zero_of_square
    {n : Nat} (A Aplus : Fin n -> Fin n -> Real)
    (hRight : rectMatMul A Aplus = idMatrix n) :
    lsAugmentedProjectionBlock Aplus A = 0 := by
  have hRightPred : IsRightInverse n A Aplus := by
    intro i j
    have hij := congrFun (congrFun hRight i) j
    simpa [rectMatMul, idMatrix] using hij
  have hLeftPred : IsLeftInverse n A Aplus :=
    isLeftInverse_of_isRightInverse A Aplus hRightPred
  have hLeft : rectMatMul Aplus A = idMatrix n := by
    ext i j
    simpa [rectMatMul, idMatrix] using hLeftPred i j
  rw [higham21_lsAugmentedProjectionBlock_eq_complement A Aplus, hLeft]
  ext i j
  simp

/-- If `m < n`, `I - Aplus*A` fixes a unit vector in the nullspace of `A`. -/
theorem higham21_complement_projector_exists_unit_fixed_vector_of_lt
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m < n) :
    ∃ x : Fin n -> Real,
      vecNorm2 x = 1 ∧
        rectMatMulVec (lsAugmentedProjectionBlock Aplus A) x = x := by
  obtain ⟨x, hxnorm, hAx⟩ :=
    higham21_exists_unit_rectMatMulVec_eq_zero_of_lt A hmn
  refine ⟨x, hxnorm, ?_⟩
  rw [lsAugmentedProjectionBlock_mulVec, hAx]
  ext j
  simp [rectMatMulVec]

/-- The strict underdetermined nullspace witness gives the lower norm bound. -/
theorem higham21_one_le_complement_projector_complexMatrixOp2_of_lt
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m < n) :
    1 <= complexMatrixOp2
      (realRectToCMatrix (lsAugmentedProjectionBlock Aplus A)) := by
  let Q : Fin n -> Fin n -> Real := lsAugmentedProjectionBlock Aplus A
  obtain ⟨x, hxnorm, hxfix⟩ :=
    higham21_complement_projector_exists_unit_fixed_vector_of_lt
      A Aplus hmn
  have hQx : rectMatMulVec Q x = x := by
    simpa [Q] using hxfix
  calc
    1 = vecNorm2 (rectMatMulVec Q x) := by rw [hQx, hxnorm]
    _ = norm
        (complexMatrixEuclideanLin (realRectToCMatrix Q)
          (realVecToEuclidean x)) := by
      symm
      exact
        realRectToCMatrix_euclideanLin_realVecToEuclidean_norm Q x
    _ <= complexMatrixOp2 (realRectToCMatrix Q) *
        norm (realVecToEuclidean x) := by
      rw [complexMatrixOp2_eq_norm_euclideanLin]
      exact ContinuousLinearMap.le_opNorm
        ((complexMatrixEuclideanLin
          (realRectToCMatrix Q)).toContinuousLinearMap)
        (realVecToEuclidean x)
    _ = complexMatrixOp2 (realRectToCMatrix Q) := by
      rw [realVecToEuclidean_norm, hxnorm, mul_one]

/-- The exact real square `opNorm2` agrees with the exact norm of its
    complexification. -/
theorem higham21_opNorm2_eq_complexMatrixOp2_realRectToCMatrix
    {n : Nat} (M : Fin n -> Fin n -> Real) :
    opNorm2 M = complexMatrixOp2 (realRectToCMatrix M) := by
  apply le_antisymm
  · exact opNorm2_le_of_opNorm2Le M
      (complexMatrixOp2_nonneg (realRectToCMatrix M))
      (opNorm2Le_complexMatrixOp2_realRectToCMatrix M)
  · exact complexMatrixOp2_realRectToCMatrix_le_of_opNorm2Le M
      (opNorm2_nonneg M) (opNorm2Le_opNorm2 M)

/-- Exact complexified norm of the complementary projector: zero in the
    square case and one in the strict underdetermined case. -/
theorem higham21_projector_complement_complexMatrixOp2_eq_min_one_sub
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hSym : IsSymmetricFiniteMatrix (rectMatMul Aplus A)) :
    complexMatrixOp2
        (realRectToCMatrix
          (fun i j => idMatrix n i j - rectMatMul Aplus A i j)) =
      ((Nat.min 1 (n - m) : Nat) : Real) := by
  rw [← higham21_lsAugmentedProjectionBlock_eq_complement A Aplus]
  by_cases heq : m = n
  · subst n
    have hQzero : lsAugmentedProjectionBlock Aplus A = 0 :=
      higham21_complement_projector_eq_zero_of_square A Aplus hRight
    have hupper :
        complexMatrixOp2
            (realRectToCMatrix (lsAugmentedProjectionBlock Aplus A)) <= 0 := by
      apply complexMatrixOp2_realRectToCMatrix_le_of_rectOpNorm2Le
        (lsAugmentedProjectionBlock Aplus A) le_rfl
      rw [hQzero]
      intro x
      have hzero :
          rectMatMulVec (0 : Fin m -> Fin m -> Real) x =
            (fun _ : Fin m => 0) := by
        funext i
        simp [rectMatMulVec]
      rw [hzero, vecNorm2_zero]
      simp
    have hopzero :
        complexMatrixOp2
            (realRectToCMatrix (lsAugmentedProjectionBlock Aplus A)) = 0 :=
      le_antisymm hupper (complexMatrixOp2_nonneg _)
    simpa using hopzero
  · have hlt : m < n := lt_of_le_of_ne hmn heq
    have hminNat : Nat.min 1 (n - m) = 1 :=
      Nat.min_eq_left (Nat.sub_pos_of_lt hlt)
    have hmin : ((Nat.min 1 (n - m) : Nat) : Real) = 1 := by
      exact_mod_cast hminNat
    have hcontractive :
        rectOpNorm2Le (lsAugmentedProjectionBlock Aplus A) 1 := by
      simpa [lsAugmentedProjectionBlock, rectMatMul] using
        (wedinLemma20_12_rectOpNorm2Le_projectionComplement_of_symmetric_left_inverse
          Aplus A hRight hSym)
    have hupper :
        complexMatrixOp2
            (realRectToCMatrix (lsAugmentedProjectionBlock Aplus A)) <= 1 :=
      complexMatrixOp2_realRectToCMatrix_le_of_rectOpNorm2Le
        (lsAugmentedProjectionBlock Aplus A) (by norm_num) hcontractive
    have hlower :
        1 <= complexMatrixOp2
          (realRectToCMatrix (lsAugmentedProjectionBlock Aplus A)) :=
      higham21_one_le_complement_projector_complexMatrixOp2_of_lt
        A Aplus hlt
    have hopone :
        complexMatrixOp2
            (realRectToCMatrix (lsAugmentedProjectionBlock Aplus A)) = 1 :=
      le_antisymm hupper hlower
    simpa [hmin] using hopone

/-- Real `opNorm2` form of the exact complementary-projector norm. -/
theorem higham21_projector_complement_opNorm2_eq_min_one_sub
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hSym : IsSymmetricFiniteMatrix (rectMatMul Aplus A)) :
    opNorm2 (fun i j => idMatrix n i j - rectMatMul Aplus A i j) =
      ((Nat.min 1 (n - m) : Nat) : Real) := by
  rw [higham21_opNorm2_eq_complexMatrixOp2_realRectToCMatrix]
  exact higham21_projector_complement_complexMatrixOp2_eq_min_one_sub
    A Aplus hmn hRight hSym

/-- Moore--Penrose adapter for the exact complementary-projector norm. -/
theorem higham21_projector_complement_opNorm2_eq_min_one_sub_of_moorePenrose
    {m n : Nat} (A : Fin m -> Fin n -> Real)
    (Aplus : Fin n -> Fin m -> Real) (hmn : m <= n)
    (hRight : rectMatMul A Aplus = idMatrix m)
    (hMP : RectMoorePenrosePseudoinverse m n A Aplus) :
    opNorm2 (fun i j => idMatrix n i j - rectMatMul Aplus A i j) =
      ((Nat.min 1 (n - m) : Nat) : Real) :=
  higham21_projector_complement_opNorm2_eq_min_one_sub
    A Aplus hmn hRight hMP.domain_projection_symmetric

end NumStability
