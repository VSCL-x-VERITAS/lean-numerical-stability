import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Matrix.Normed

/-!
# Gaussian matrix process geometry

This module develops the deterministic rank-one matrix estimates used in the
Gaussian comparison arguments of Chapter 7.
-/

open scoped BigOperators InnerProductSpace Matrix.Norms.Frobenius

namespace NumStability.HDP.Process.GaussianMatrices

/-- The squared Frobenius norm is the sum of the squared entries. -/
theorem frobenius_norm_sq_eq_sum
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (A : Matrix ι κ ℝ) :
    ‖A‖ ^ 2 = ∑ i, ∑ j, (A i j) ^ 2 := by
  rw [Matrix.frobenius_norm_def]
  have hsum : 0 ≤ ∑ i, ∑ j, (A i j) ^ 2 := by positivity
  calc
    ((∑ i, ∑ j, ‖A i j‖ ^ (2 : ℝ)) ^ (1 / 2 : ℝ)) ^ 2 =
        ((∑ i, ∑ j, (A i j) ^ 2) ^ ((2 : ℕ) : ℝ)⁻¹) ^ 2 := by
      congr 2
      · simp
      · norm_num
    _ = ∑ i, ∑ j, (A i j) ^ 2 :=
      Real.rpow_inv_natCast_pow hsum (by norm_num)

/-- The rank-one matrix `u vᵀ`, with Euclidean vectors indexed by arbitrary
finite types. -/
noncomputable def rankOneMatrix
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ) : Matrix ι κ ℝ :=
  Matrix.vecMulVec (fun i ↦ u i) (fun j ↦ v j)

/-- Coordinate expansion of the squared Frobenius distance between two
rank-one matrices. -/
theorem rankOne_sq_expansion
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ) :
    (∑ i, ∑ j, (u i * v j - w i * z j) ^ 2) =
      (∑ i, (u i) ^ 2) * (∑ j, (v j) ^ 2) +
      (∑ i, (w i) ^ 2) * (∑ j, (z j) ^ 2) -
      2 * (∑ i, u i * w i) * (∑ j, v j * z j) := by
  have huv : (∑ i, ∑ j, (u i * v j) ^ 2) =
      (∑ i, (u i) ^ 2) * (∑ j, (v j) ^ 2) := by
    symm
    rw [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro i hi
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro j hj
    ring
  have hwz : (∑ i, ∑ j, (w i * z j) ^ 2) =
      (∑ i, (w i) ^ 2) * (∑ j, (z j) ^ 2) := by
    symm
    rw [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro i hi
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro j hj
    ring
  have hcross : (∑ i, ∑ j, 2 * (u i * v j) * (w i * z j)) =
      2 * (∑ i, u i * w i) * (∑ j, v j * z j) := by
    calc
      (∑ i, ∑ j, 2 * (u i * v j) * (w i * z j)) =
          ∑ i, ∑ j, (2 * (u i * w i)) * (v j * z j) := by
        apply Finset.sum_congr rfl
        intro i hi
        apply Finset.sum_congr rfl
        intro j hj
        ring
      _ = ∑ i, (2 * (u i * w i)) * (∑ j, v j * z j) := by
        apply Finset.sum_congr rfl
        intro i hi
        rw [Finset.mul_sum]
      _ = (∑ i, 2 * (u i * w i)) * (∑ j, v j * z j) := by
        simpa using
          (Finset.sum_mul Finset.univ (fun i : ι ↦ 2 * (u i * w i))
            (∑ j : κ, v j * z j)).symm
      _ = 2 * (∑ i, u i * w i) * (∑ j, v j * z j) := by
        have htwo : (∑ i, 2 * (u i * w i)) = 2 * (∑ i, u i * w i) := by
          simpa using
            (Finset.mul_sum Finset.univ (fun i : ι ↦ u i * w i) 2).symm
        rw [htwo]
  simp_rw [sub_sq, Finset.sum_add_distrib, Finset.sum_sub_distrib]
  rw [huv, hwz, hcross]
  ring

/-- For unit Euclidean vectors, the rank-one embedding into Frobenius matrix
space does not increase the product squared distance.

Source: Vershynin, Exercise 7.3.2, printed page 169
(`HDP-07-EX-7.3.2`). -/
theorem rankOneMatrix_dist_sq_le
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ)
    (hu : ‖u‖ = 1) (hw : ‖w‖ = 1) (hv : ‖v‖ = 1) (hz : ‖z‖ = 1) :
    ‖rankOneMatrix u v - rankOneMatrix w z‖ ^ 2 ≤
      ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 := by
  rw [frobenius_norm_sq_eq_sum]
  simp only [rankOneMatrix, Matrix.sub_apply, Matrix.vecMulVec_apply]
  rw [rankOne_sq_expansion]
  have huu : ∑ i, (u i) ^ 2 = 1 := by
    calc
      ∑ i, (u i) ^ 2 = ∑ i, ‖u i‖ ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ = ‖u‖ ^ 2 := (EuclideanSpace.norm_sq_eq u).symm
      _ = 1 := by rw [hu]; norm_num
  have hww : ∑ i, (w i) ^ 2 = 1 := by
    calc
      ∑ i, (w i) ^ 2 = ∑ i, ‖w i‖ ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ = ‖w‖ ^ 2 := (EuclideanSpace.norm_sq_eq w).symm
      _ = 1 := by rw [hw]; norm_num
  have hvv : ∑ j, (v j) ^ 2 = 1 := by
    calc
      ∑ j, (v j) ^ 2 = ∑ j, ‖v j‖ ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ = ‖v‖ ^ 2 := (EuclideanSpace.norm_sq_eq v).symm
      _ = 1 := by rw [hv]; norm_num
  have hzz : ∑ j, (z j) ^ 2 = 1 := by
    calc
      ∑ j, (z j) ^ 2 = ∑ j, ‖z j‖ ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ = ‖z‖ ^ 2 := (EuclideanSpace.norm_sq_eq z).symm
      _ = 1 := by rw [hz]; norm_num
  have hinner_uw : (∑ i, u i * w i) = ⟪u, w⟫_ℝ := by
    rw [PiLp.inner_apply]
    apply Finset.sum_congr rfl
    intro i hi
    change u i * w i = w i * u i
    ring
  have hinner_vz : (∑ j, v j * z j) = ⟪v, z⟫_ℝ := by
    rw [PiLp.inner_apply]
    apply Finset.sum_congr rfl
    intro j hj
    change v j * z j = z j * v j
    ring
  rw [huu, hww, hvv, hzz]
  rw [hinner_uw, hinner_vz, norm_sub_sq_real, norm_sub_sq_real,
    hu, hw, hv, hz]
  have huw : ⟪u, w⟫_ℝ ≤ 1 := real_inner_le_one_of_norm_eq_one hu hw
  have hvz : ⟪v, z⟫_ℝ ≤ 1 := real_inner_le_one_of_norm_eq_one hv hz
  nlinarith [mul_nonneg (sub_nonneg.mpr huw) (sub_nonneg.mpr hvz)]

end NumStability.HDP.Process.GaussianMatrices

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-07-EX-7.3.2`. -/
theorem hdp_07_hex_h7_d3_d2
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ)
    (hu : ‖u‖ = 1) (hw : ‖w‖ = 1) (hv : ‖v‖ = 1) (hz : ‖z‖ = 1) :
    ‖Process.GaussianMatrices.rankOneMatrix u v -
        Process.GaussianMatrices.rankOneMatrix w z‖ ^ 2 ≤
      ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 :=
  Process.GaussianMatrices.rankOneMatrix_dist_sq_le u w v z hu hw hv hz

end NumStability.HDP.Contract
