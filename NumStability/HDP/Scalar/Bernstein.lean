import Mathlib.Analysis.Normed.Field.Basic

namespace NumStability.HDP.Scalar.Bernstein

/-- Changing one coordinate of a dependent product changes `f` by at most `c`. -/
def coordinateSensitivity {ι : Type*} [DecidableEq ι] {X : ι → Type*}
    (f : (∀ i, X i) → ℝ) (i : ι) (c : ℝ) : Prop :=
  ∀ x (z : X i), ‖f (Function.update x i z) - f x‖ ≤ c

/-- The finite-coordinate bounded-differences condition. -/
def boundedDifferences {ι : Type*} [Fintype ι] [DecidableEq ι] {X : ι → Type*}
    (f : (∀ i, X i) → ℝ) (c : ι → ℝ) : Prop :=
  ∀ i, 0 ≤ c i ∧ coordinateSensitivity f i (c i)

end NumStability.HDP.Scalar.Bernstein

namespace NumStability.HDP.Contract

def hdp_02_hdef_hbounded_hdifferences {ι : Type*} [Fintype ι] [DecidableEq ι]
    {X : ι → Type*} (f : (∀ i, X i) → ℝ) (c : ι → ℝ) : Prop :=
  Scalar.Bernstein.boundedDifferences f c

end NumStability.HDP.Contract
