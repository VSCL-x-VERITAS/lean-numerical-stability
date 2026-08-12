import Mathlib.Data.Fintype.Card
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

namespace NumStability.HDP.RandomVector.Basic

/-- Proof-facing API for the opening norm-square calculation: the squared
norm expectation is represented by the finite sum of coordinate second
moments, so unit coordinate moments yield `n`. -/
theorem normSquareExpectationIdentity (n : ℕ)
    (secondMoment : Fin n → ℝ) (h : ∀ i, secondMoment i = 1) :
    (∑ i, secondMoment i) = n := by
  classical
  simp [h]

/-- Squared-deviation lower bound used to pass from (3.1) to (3.3). -/
theorem sqrtDeviationBound {z δ : ℝ} (hz : 0 ≤ z) (hδ : 0 ≤ δ)
    (hdev : δ ≤ |z - 1|) :
    max δ (δ ^ 2) ≤ |z ^ 2 - 1| := by
  by_cases h : z ≤ 1
  · have hleft : |z - 1| = 1 - z := by
      rw [abs_of_nonpos (sub_nonpos.mpr h)]
      ring
    have hright : |z ^ 2 - 1| = 1 - z ^ 2 := by
      have hsq : z ^ 2 - 1 ≤ 0 := by
        nlinarith [mul_nonneg hz (sub_nonneg.mpr h)]
      rw [abs_of_nonpos hsq]
      ring
    have hdev' : δ ≤ 1 - z := by simpa [hleft] using hdev
    have hsq : δ ^ 2 ≤ (1 - z) ^ 2 :=
      (sq_le_sq₀ hδ (sub_nonneg.mpr h)).2 hdev'
    rw [hright]
    refine max_le ?_ ?_
    · nlinarith [mul_nonneg hz (sub_nonneg.mpr h)]
    · nlinarith [hsq, mul_nonneg hz (sub_nonneg.mpr h)]
  · have hz1 : 1 ≤ z := le_of_not_ge h
    have hleft : |z - 1| = z - 1 :=
      abs_of_nonneg (sub_nonneg.mpr hz1)
    have hright : |z ^ 2 - 1| = z ^ 2 - 1 := by
      have hsq : 0 ≤ z ^ 2 - 1 := by
        nlinarith [mul_nonneg (sub_nonneg.mpr hz1)
          (add_nonneg hz (by norm_num : (0 : ℝ) ≤ 1))]
      exact abs_of_nonneg hsq
    have hdev' : δ ≤ z - 1 := by simpa [hleft] using hdev
    have hsq : δ ^ 2 ≤ (z - 1) ^ 2 :=
      (sq_le_sq₀ hδ (sub_nonneg.mpr hz1)).2 hdev'
    rw [hright]
    refine max_le ?_ ?_
    · nlinarith [mul_nonneg (sub_nonneg.mpr hz1)
        (add_nonneg hz (by norm_num : (0 : ℝ) ≤ 1))]
    · nlinarith

/-- Symmetric bilinear forms are determined by their quadratic evaluations. -/
theorem symmetricQuadraticExtensionality {V : Type*}
    [AddCommGroup V] [Module ℝ V]
    (B C : V →ₗ[ℝ] V →ₗ[ℝ] ℝ)
    (hB : ∀ x y, B x y = B y x)
    (hC : ∀ x y, C x y = C y x)
    (hquad : ∀ x, B x x = C x x) : B = C := by
  ext x y
  have hplus := hquad (x + y)
  have hminus := hquad (x - y)
  simp only [map_add, map_sub, LinearMap.add_apply, LinearMap.sub_apply] at hplus hminus
  rw [hB y x, hC y x] at hplus
  rw [hB y x, hC y x] at hminus
  linarith

end NumStability.HDP.RandomVector.Basic

namespace NumStability.HDP.Contract

theorem hdp_03_hlem_hnorm_hsquare_hexpectation (n : ℕ)
    (secondMoment : Fin n → ℝ) (h : ∀ i, secondMoment i = 1) :
    (∑ i, secondMoment i) = n :=
  RandomVector.Basic.normSquareExpectationIdentity n secondMoment h

theorem hdp_03_hlem_hsqrt_hdeviation {z δ : ℝ} (hz : 0 ≤ z) (hδ : 0 ≤ δ)
    (hdev : δ ≤ |z - 1|) :
    max δ (δ ^ 2) ≤ |z ^ 2 - 1| :=
  RandomVector.Basic.sqrtDeviationBound hz hδ hdev

theorem hdp_03_hlem_hsymmetric_hquadratic_hext {V : Type*}
    [AddCommGroup V] [Module ℝ V]
    (B C : V →ₗ[ℝ] V →ₗ[ℝ] ℝ)
    (hB : ∀ x y, B x y = B y x)
    (hC : ∀ x y, C x y = C y x)
    (hquad : ∀ x, B x x = C x x) : B = C :=
  RandomVector.Basic.symmetricQuadraticExtensionality B C hB hC hquad

end NumStability.HDP.Contract
