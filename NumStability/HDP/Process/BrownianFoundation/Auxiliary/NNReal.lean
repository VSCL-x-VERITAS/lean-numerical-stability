import Mathlib.Data.NNReal.Basic

namespace NNReal

lemma add_sub_two_mul_min_eq_max (s t : ℝ≥0) : s + t - 2 * min s t = max (s - t) (t - s) := by
  apply NNReal.eq
  simp only [NNReal.coe_add, NNReal.coe_sub_def, NNReal.coe_mul, NNReal.coe_ofNat,
    NNReal.coe_min, NNReal.coe_max]
  rcases le_total (s : ℝ) t with hst | hts
  · rw [min_eq_left hst]
    rw [max_eq_left (by linarith : 0 ≤ (s : ℝ) + t - 2 * s)]
    rw [max_eq_right (by linarith : (s : ℝ) - t ≤ 0)]
    rw [max_eq_left (by linarith : 0 ≤ (t : ℝ) - s)]
    rw [max_eq_right (by linarith : 0 ≤ (t : ℝ) - s)]
    ring
  · rw [min_eq_right hts]
    rw [max_eq_left (by linarith : 0 ≤ (s : ℝ) + t - 2 * t)]
    rw [max_eq_left (by linarith : 0 ≤ (s : ℝ) - t)]
    rw [max_eq_right (by linarith : (t : ℝ) - s ≤ 0)]
    rw [max_eq_left (by linarith : 0 ≤ (s : ℝ) - t)]
    ring

end NNReal
