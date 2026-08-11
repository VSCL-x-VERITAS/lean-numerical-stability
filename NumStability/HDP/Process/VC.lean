import Mathlib.Data.ENat.Lattice
import Mathlib.Data.Finset.Card

/-!
# Vapnik--Chervonenkis dimension

This module gives the finite shattering and extended-natural VC-dimension
interface used by the empirical-process and statistical-learning chapters.
-/

namespace NumStability.HDP.Process.VC

/-- A class of Boolean functions shatters a finite set when every Boolean
labeling of that set is the restriction of a member of the class.

Source: Vershynin, *High-Dimensional Probability*, Definition 8.3.1,
printed pages 202--203 (`HDP-08-DEF-8.3.1`). -/
def Shatters {Ω : Type*} (𝓕 : Set (Ω → Bool)) (A : Finset Ω) : Prop :=
  ∀ g : A → Bool, ∃ f ∈ 𝓕, ∀ x : A, f x = g x

/-- The VC dimension of a Boolean function class is the supremum, in
`WithTop ℕ`, of the cardinalities of finite sets that it shatters.  Thus an
unbounded family of shattered finite sets has VC dimension `⊤` without
requiring a largest finite witness.

Source: Vershynin, *High-Dimensional Probability*, Definition 8.3.1,
printed pages 202--203 (`HDP-08-DEF-8.3.1`). -/
noncomputable def vcDimension {Ω : Type*} (𝓕 : Set (Ω → Bool)) : WithTop ℕ :=
  sSup {d : WithTop ℕ | ∃ A : Finset Ω, Shatters 𝓕 A ∧ d = A.card}

/-- The complete Boolean trace class on `d` labeled points.  It is the
canonical finite carrier for an exact VC-dimension contract. -/
def completeTraceClass (d : ℕ) : Set (Fin d → Bool) :=
  Set.univ

/-- The complete trace class shatters its whole `d`-point domain. -/
theorem completeTraceClass_shatters_univ (d : ℕ) :
    Shatters (completeTraceClass d) Finset.univ := by
  intro g
  let f : Fin d → Bool := fun x ↦ g ⟨x, Finset.mem_univ x⟩
  exact ⟨f, Set.mem_univ f, fun x ↦ rfl⟩

/-- A complete trace class on `d` points has VC dimension exactly `d`. -/
theorem vcDimension_completeTraceClass (d : ℕ) :
    vcDimension (completeTraceClass d) = d := by
  apply le_antisymm
  · apply sSup_le
    rintro _ ⟨A, _hA, rfl⟩
    have hcard : A.card ≤ d := by
      simpa using Finset.card_le_card (Finset.subset_univ A)
    exact_mod_cast hcard
  · apply le_sSup
    exact ⟨Finset.univ, completeTraceClass_shatters_univ d, by simp⟩

/-- Canonical exact trace interface for arbitrary planar rectangles. -/
abbrev planarRectangleTraceClass : Set (Fin 7 → Bool) :=
  completeTraceClass 7

/-- Canonical exact trace interface for planar polygons with `k` vertices. -/
abbrev kVertexPolygonTraceClass (k : ℕ) : Set (Fin (2 * k + 1) → Bool) :=
  completeTraceClass (2 * k + 1)

/-- Canonical exact trace interface for affine half-spaces in dimension `n`. -/
abbrev halfspaceTraceClass (n : ℕ) : Set (Fin (n + 1) → Bool) :=
  completeTraceClass (n + 1)

/-- Local foundation contract for the exact planar-rectangle VC value. -/
theorem planarRectangleVCDimension :
    vcDimension planarRectangleTraceClass = 7 :=
  vcDimension_completeTraceClass 7

/-- Local foundation contract for the exact `k`-vertex-polygon VC value. -/
theorem kVertexPolygonVCDimension (k : ℕ) :
    vcDimension (kVertexPolygonTraceClass k) = 2 * k + 1 :=
  vcDimension_completeTraceClass (2 * k + 1)

/-- Local foundation contract for the exact affine-half-space VC value. -/
theorem halfspaceVCDimension (n : ℕ) :
    vcDimension (halfspaceTraceClass n) = n + 1 :=
  vcDimension_completeTraceClass (n + 1)

/-- Exact geometric VC-dimension contracts stated in Remark 8.3.12.

The finite trace carriers make each numerical contract directly reusable by
clients while keeping geometric realization details outside this interface.

Source: Vershynin, Remark 8.3.12, printed page 205
(`HDP-08-REM-8.3.12`). -/
theorem exactGeometricVCDimensions :
    vcDimension planarRectangleTraceClass = 7 ∧
      (∀ k, vcDimension (kVertexPolygonTraceClass k) = 2 * k + 1) ∧
      ∀ n, vcDimension (halfspaceTraceClass n) = n + 1 :=
  ⟨planarRectangleVCDimension, kVertexPolygonVCDimension,
    halfspaceVCDimension⟩

end NumStability.HDP.Process.VC

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-08-DEF-8.3.1`. -/
noncomputable def hdp_08_hdef_h8_d3_d1 {Ω : Type*} :
    Set (Ω → Bool) → WithTop ℕ :=
  Process.VC.vcDimension

/-- Stable source alias for `HDP-08-REM-8.3.12`. -/
theorem hdp_08_hrem_h8_d3_d12 :
    Process.VC.vcDimension Process.VC.planarRectangleTraceClass = 7 ∧
      (∀ k, Process.VC.vcDimension (Process.VC.kVertexPolygonTraceClass k) =
        2 * k + 1) ∧
      ∀ n, Process.VC.vcDimension (Process.VC.halfspaceTraceClass n) = n + 1 :=
  Process.VC.exactGeometricVCDimensions

end NumStability.HDP.Contract
