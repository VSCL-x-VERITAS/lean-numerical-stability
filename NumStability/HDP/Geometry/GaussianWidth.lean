import Mathlib.Analysis.InnerProductSpace.LinearMap
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Topology.Order.Bornology

/-!
# Directional width and its minimum containing slab

This file formalizes the deterministic geometry underlying spherical and
Gaussian width.  Suprema and infima are used throughout, so no supporting
hyperplane is assumed to meet a nonclosed set.
-/

open Set
open scoped InnerProductSpace

namespace NumStability.HDP.Geometry.GaussianWidth

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Scalar projection onto a direction. -/
def projection (θ x : E) : ℝ :=
  ⟪θ, x⟫_ℝ

/-- The set of scalar projections of `T` onto `θ`. -/
def projectionSet (θ : E) (T : Set E) : Set ℝ :=
  projection θ '' T

/-- The width of `T` in direction `θ`, represented as the supremum of all
ordered projection differences.  By `directionalWidth_eq_pairwise`, this is
exactly `sup_{x,y ∈ T} ⟪θ, x-y⟫` from equation (7.15).

Source: Vershynin, Section 7.5.2, printed pages 175–176, equation (7.15)
(`HDP-07-DEF-DIRECTIONAL-WIDTH`). -/
noncomputable def directionalWidth (θ : E) (T : Set E) : ℝ :=
  sSup (Set.image2 (· - ·) (projectionSet θ T) (projectionSet θ T))

/-- The closed slab between projection levels `a` and `b`, with boundary
hyperplanes orthogonal to `θ`. -/
def slab (θ : E) (a b : ℝ) : Set E :=
  {x | a ≤ projection θ x ∧ projection θ x ≤ b}

/-- The canonical containing slab uses the infimum and supremum projection
levels.  Its boundary need not meet `T`. -/
noncomputable def canonicalSlab (θ : E) (T : Set E) : Set E :=
  slab θ (sInf (projectionSet θ T)) (sSup (projectionSet θ T))

theorem projectionSet_nonempty {θ : E} {T : Set E} (hT : T.Nonempty) :
    (projectionSet θ T).Nonempty :=
  hT.image _

theorem projectionSet_isBounded {θ : E} {T : Set E}
    (hT : Bornology.IsBounded T) :
    Bornology.IsBounded (projectionSet θ T) := by
  simpa [projectionSet, projection, innerSL_apply_apply] using
    (innerSL ℝ θ).lipschitz.isBounded_image hT

/-- The image-based definition unfolds to the book's ordered-pair formula. -/
theorem directionalWidth_eq_pairwise (θ : E) (T : Set E) :
    directionalWidth θ T =
      sSup {r : ℝ | ∃ x ∈ T, ∃ y ∈ T, ⟪θ, x - y⟫_ℝ = r} := by
  unfold directionalWidth
  congr 1
  ext r
  constructor
  · rintro ⟨px, ⟨x, hx, rfl⟩, py, ⟨y, hy, rfl⟩, rfl⟩
    exact ⟨x, hx, y, hy, by simp [projection, inner_sub_right]⟩
  · rintro ⟨x, hx, y, hy, rfl⟩
    exact ⟨projection θ x, ⟨x, hx, rfl⟩, projection θ y, ⟨y, hy, rfl⟩,
      by simp [projection, inner_sub_right]⟩

/-- Directional width is the difference between the extreme projection
levels.  The extremes are not required to be attained. -/
theorem directionalWidth_eq_projection_span {θ : E} {T : Set E}
    (hTne : T.Nonempty) (hT : Bornology.IsBounded T) :
    directionalWidth θ T =
      sSup (projectionSet θ T) - sInf (projectionSet θ T) := by
  let P := projectionSet θ T
  have hPne : P.Nonempty := projectionSet_nonempty hTne
  have hPbdd : Bornology.IsBounded P := projectionSet_isBounded hT
  unfold directionalWidth
  change sSup (Set.image2 (· - ·) P P) = sSup P - sInf P
  refine csSup_image2_eq_csSup_csInf
    (u₁ := fun b c : ℝ => c + b) (u₂ := fun a c : ℝ => a - c) ?_ ?_
    hPne hPbdd.bddAbove hPne hPbdd.bddBelow
  · intro b a c
    constructor <;> intro h <;> linarith
  · intro a b c
    change a - OrderDual.ofDual b ≤ c ↔ a - c ≤ OrderDual.ofDual b
    constructor <;> intro h <;> linarith

/-- Every point of a nonempty bounded set lies in the canonical slab. -/
theorem subset_canonicalSlab {θ : E} {T : Set E}
    (hT : Bornology.IsBounded T) :
    T ⊆ canonicalSlab θ T := by
  intro x hx
  have hP := projectionSet_isBounded (θ := θ) hT
  exact ⟨csInf_le hP.bddBelow ⟨x, hx, rfl⟩,
    le_csSup hP.bddAbove ⟨x, hx, rfl⟩⟩

/-- Any slab containing `T` has width at least the directional width. -/
theorem directionalWidth_le_slabWidth {θ : E} {T : Set E} {a b : ℝ}
    (hTne : T.Nonempty) (hT : Bornology.IsBounded T)
    (hcontain : T ⊆ slab θ a b) :
    directionalWidth θ T ≤ b - a := by
  rw [directionalWidth_eq_projection_span hTne hT]
  have hPne := projectionSet_nonempty (θ := θ) hTne
  have hP := projectionSet_isBounded (θ := θ) hT
  have hsup : sSup (projectionSet θ T) ≤ b := by
    refine (csSup_le_iff hP.bddAbove hPne).2 ?_
    rintro _ ⟨x, hx, rfl⟩
    exact (hcontain hx).2
  have hinf : a ≤ sInf (projectionSet θ T) := by
    refine (le_csInf_iff hP.bddBelow hPne).2 ?_
    rintro _ ⟨x, hx, rfl⟩
    exact (hcontain hx).1
  linarith

/-- For a unit direction, the canonical slab contains `T`, its scalar width
equals the directional width, and every other containing orthogonal slab is
at least as wide.  Thus it realizes the minimum slab width even when its
boundary hyperplanes do not meet `T`. -/
theorem directionalWidth_eq_minimum_slab {θ : E} {T : Set E}
    (hθ : ‖θ‖ = 1) (hTne : T.Nonempty) (hT : Bornology.IsBounded T) :
    T ⊆ canonicalSlab θ T ∧
      directionalWidth θ T =
        sSup (projectionSet θ T) - sInf (projectionSet θ T) ∧
      ∀ a b, T ⊆ slab θ a b → directionalWidth θ T ≤ b - a := by
  have _ := hθ
  exact ⟨subset_canonicalSlab hT,
    directionalWidth_eq_projection_span hTne hT,
    fun _ _ => directionalWidth_le_slabWidth hTne hT⟩

end NumStability.HDP.Geometry.GaussianWidth

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-07-DEF-DIRECTIONAL-WIDTH`. -/
theorem hdp_07_hdef_hdirectional_hwidth
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {θ : E} {T : Set E} (hθ : ‖θ‖ = 1) (hTne : T.Nonempty)
    (hT : Bornology.IsBounded T) :
    T ⊆ Geometry.GaussianWidth.canonicalSlab θ T ∧
      Geometry.GaussianWidth.directionalWidth θ T =
        sSup (Geometry.GaussianWidth.projectionSet θ T) -
          sInf (Geometry.GaussianWidth.projectionSet θ T) ∧
      ∀ a b, T ⊆ Geometry.GaussianWidth.slab θ a b →
        Geometry.GaussianWidth.directionalWidth θ T ≤ b - a :=
  Geometry.GaussianWidth.directionalWidth_eq_minimum_slab hθ hTne hT

end NumStability.HDP.Contract
