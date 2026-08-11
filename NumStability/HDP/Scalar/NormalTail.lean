import Mathlib.Analysis.Asymptotics.Theta
import Mathlib.Data.Real.Basic

/-!
# Scalar tail and comparison interfaces

The comparison conventions below make the filter or domain explicit.  This
removes the deliberate contextual ambiguity of the book's informal symbols.
-/

open Filter

namespace NumStability.HDP.Scalar.NormalTail

/-- Canonical Mathlib interpretation of equivalence up to constant factors
along a specified filter. -/
def comparisonTheta {α : Type*} (l : Filter α) (f g : α → ℝ) : Prop :=
  Asymptotics.IsTheta l f g

/-- Eventually, `f` is at most a positive constant times `g` (`f ≲ g`). -/
def EventuallyLesssim {α : Type*} (l : Filter α) (f g : α → ℝ) : Prop :=
  ∃ C > 0, ∀ᶠ x in l, f x ≤ C * g x

/-- Eventually, `f` is at least a positive constant times `g` (`f ≳ g`). -/
def EventuallyGreatersim {α : Type*} (l : Filter α) (f g : α → ℝ) : Prop :=
  EventuallyLesssim l g f

/-- Explicit positive-constant form of `f ≍ g` along a filter. -/
def EventuallyComparable {α : Type*} (l : Filter α) (f g : α → ℝ) : Prop :=
  ∃ c > 0, ∃ C > 0, ∀ᶠ x in l, c * f x ≤ g x ∧ g x ≤ C * f x

/-- Global one-sided comparison on a specified domain. -/
def GloballyLesssimOn {α : Type*} (s : Set α) (f g : α → ℝ) : Prop :=
  EventuallyLesssim (Filter.principal s) f g

/-- Global reverse one-sided comparison on a specified domain. -/
def GloballyGreatersimOn {α : Type*} (s : Set α) (f g : α → ℝ) : Prop :=
  EventuallyGreatersim (Filter.principal s) f g

/-- Global two-sided comparison on a specified domain. -/
def GloballyComparableOn {α : Type*} (s : Set α) (f g : α → ℝ) : Prop :=
  EventuallyComparable (Filter.principal s) f g

theorem globallyLesssimOn_iff {α : Type*} {s : Set α} {f g : α → ℝ} :
    GloballyLesssimOn s f g ↔ ∃ C > 0, ∀ x ∈ s, f x ≤ C * g x := by
  simp only [GloballyLesssimOn, EventuallyLesssim, Filter.eventually_principal]

theorem globallyGreatersimOn_iff {α : Type*} {s : Set α} {f g : α → ℝ} :
    GloballyGreatersimOn s f g ↔ ∃ C > 0, ∀ x ∈ s, g x ≤ C * f x := by
  simp only [GloballyGreatersimOn, EventuallyGreatersim, EventuallyLesssim,
    Filter.eventually_principal]

theorem globallyComparableOn_iff {α : Type*} {s : Set α} {f g : α → ℝ} :
    GloballyComparableOn s f g ↔
      ∃ c > 0, ∃ C > 0, ∀ x ∈ s, c * f x ≤ g x ∧ g x ≤ C * f x := by
  simp only [GloballyComparableOn, EventuallyComparable, Filter.eventually_principal]

/-- On eventually nonnegative functions, the explicit positive-constant
definition from the footnote is equivalent to Mathlib's norm-based `IsTheta`.
This is the reusable bridge from book notation to formal asymptotics. -/
theorem eventuallyComparable_iff_comparisonTheta
    {α : Type*} {l : Filter α} {f g : α → ℝ}
    (hnonneg : ∀ᶠ x in l, 0 ≤ f x ∧ 0 ≤ g x) :
    EventuallyComparable l f g ↔ comparisonTheta l f g := by
  constructor
  · rintro ⟨c, hc, C, hC, hbounds⟩
    refine ⟨?_, ?_⟩
    · rw [Asymptotics.isBigO_iff'']
      refine ⟨c, hc, ?_⟩
      filter_upwards [hbounds, hnonneg] with x hx hnn
      simpa only [Real.norm_eq_abs, abs_of_nonneg hnn.1, abs_of_nonneg hnn.2] using hx.1
    · rw [Asymptotics.isBigO_iff']
      refine ⟨C, hC, ?_⟩
      filter_upwards [hbounds, hnonneg] with x hx hnn
      simpa only [Real.norm_eq_abs, abs_of_nonneg hnn.1, abs_of_nonneg hnn.2] using hx.2
  · rintro ⟨hfg, hgf⟩
    rw [Asymptotics.isBigO_iff''] at hfg
    rw [Asymptotics.isBigO_iff'] at hgf
    obtain ⟨c, hc, hcf⟩ := hfg
    obtain ⟨C, hC, hgC⟩ := hgf
    refine ⟨c, hc, C, hC, ?_⟩
    filter_upwards [hcf, hgC, hnonneg] with x hxlower hxupper hnn
    simpa only [Real.norm_eq_abs, abs_of_nonneg hnn.1, abs_of_nonneg hnn.2] using
      And.intro hxlower hxupper

end NumStability.HDP.Scalar.NormalTail

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-02-DEF-COMPARISON-NOTATION`. -/
def hdp_02_hdef_hcomparison_hnotation {α : Type*} :
    Filter α → (α → ℝ) → (α → ℝ) → Prop :=
  Scalar.NormalTail.comparisonTheta

end NumStability.HDP.Contract
