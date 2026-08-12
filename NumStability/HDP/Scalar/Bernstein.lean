import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Tactic

namespace NumStability.HDP.Scalar.Bernstein

/-- Changing one coordinate of a dependent product changes `f` by at most `c`. -/
def coordinateSensitivity {ι : Type*} [DecidableEq ι] {X : ι → Type*}
    (f : (∀ i, X i) → ℝ) (i : ι) (c : ℝ) : Prop :=
  ∀ x (z : X i), ‖f (Function.update x i z) - f x‖ ≤ c

/-- The finite-coordinate bounded-differences condition. -/
def boundedDifferences {ι : Type*} [Fintype ι] [DecidableEq ι] {X : ι → Type*}
    (f : (∀ i, X i) → ℝ) (c : ι → ℝ) : Prop :=
  ∀ i, 0 ≤ c i ∧ coordinateSensitivity f i (c i)

/-- Bennett's scalar rate function. -/
noncomputable def bennettH (u : ℝ) : ℝ := (1 + u) * Real.log (1 + u) - u

/-- Certified small- and large-regime bounds for Bennett's rate function. -/
theorem bennettH_bounds {u : ℝ} (hu : 0 ≤ u) (hu1 : u ≤ 1) :
    u ^ 2 / 3 ≤ bennettH u ∧ bennettH u ≤ u ^ 2 := by
  have hpos : 0 < 1 + u := by linarith
  have hden : 0 < u + 2 := by linarith
  have hlog_lower : 2 * u / (u + 2) ≤ Real.log (1 + u) :=
    Real.le_log_one_add_of_nonneg hu
  have hlog_upper : Real.log (1 + u) ≤ u := by
    simpa [sub_eq_add_neg] using Real.log_le_sub_one_of_pos hpos
  have hmul_lower := mul_le_mul_of_nonneg_left hlog_lower (by linarith : 0 ≤ 1 + u)
  have hmul_upper := mul_le_mul_of_nonneg_left hlog_upper (by linarith : 0 ≤ 1 + u)
  have hlower : u ^ 2 / (u + 2) ≤ bennettH u := by
    dsimp [bennettH]
    calc
      u ^ 2 / (u + 2) = (1 + u) * (2 * u / (u + 2)) - u := by
        field_simp
        ring
      _ ≤ (1 + u) * Real.log (1 + u) - u := by linarith
  have hthird : u ^ 2 / 3 ≤ u ^ 2 / (u + 2) := by
    apply (le_div_iff₀ hden).2
    nlinarith [sq_nonneg u]
  have hupper : bennettH u ≤ u ^ 2 := by
    dsimp [bennettH]
    nlinarith
  exact ⟨hthird.trans hlower, hupper⟩

theorem bennettH_large_lower {u : ℝ} (hu : Real.exp 2 ≤ u) :
    (u / 2) * Real.log u ≤ bennettH u := by
  have hu0 : 0 ≤ u := le_trans (le_of_lt (Real.exp_pos 2)) hu
  have hu_pos : 0 < u := lt_of_lt_of_le (Real.exp_pos 2) hu
  have hlog : 2 ≤ Real.log u := (Real.le_log_iff_exp_le hu_pos).2 hu
  have hlog_mono : Real.log u ≤ Real.log (1 + u) :=
    (Real.log_le_log_iff hu_pos (by linarith)).2 (by linarith)
  have hmul_log := mul_le_mul_of_nonneg_left hlog_mono hu0
  have hmul_two := mul_le_mul_of_nonneg_left hlog hu0
  dsimp [bennettH]
  nlinarith

theorem bennettHInterface :
    ∀ u : ℝ, 0 ≤ u →
      bennettH u = (1 + u) * Real.log (1 + u) - u ∧
      (u ≤ 1 → u ^ 2 / 3 ≤ bennettH u ∧ bennettH u ≤ u ^ 2) ∧
      (Real.exp 2 ≤ u → (u / 2) * Real.log u ≤ bennettH u) := by
  intro u hu
  refine ⟨rfl, ?_, ?_⟩
  · intro hu1
    exact bennettH_bounds hu hu1
  · intro hu2
    exact bennettH_large_lower hu2

end NumStability.HDP.Scalar.Bernstein

namespace NumStability.HDP.Contract

def hdp_02_hdef_hbounded_hdifferences {ι : Type*} [Fintype ι] [DecidableEq ι]
    {X : ι → Type*} (f : (∀ i, X i) → ℝ) (c : ι → ℝ) : Prop :=
  Scalar.Bernstein.boundedDifferences f c

theorem hdp_02_hdef_hbennett_hh :
    ∀ u : ℝ, 0 ≤ u →
      Scalar.Bernstein.bennettH u = (1 + u) * Real.log (1 + u) - u ∧
      (u ≤ 1 → u ^ 2 / 3 ≤ Scalar.Bernstein.bennettH u ∧
        Scalar.Bernstein.bennettH u ≤ u ^ 2) ∧
      (Real.exp 2 ≤ u →
        (u / 2) * Real.log u ≤ Scalar.Bernstein.bennettH u) :=
  Scalar.Bernstein.bennettHInterface

end NumStability.HDP.Contract
