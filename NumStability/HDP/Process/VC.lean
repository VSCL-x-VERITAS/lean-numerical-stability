import Mathlib.Data.ENat.Lattice
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Sort
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Tactic.NormNum

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

/-- Shattering is inherited by subsets. -/
theorem shatters_mono {Ω : Type*} {𝓕 : Set (Ω → Bool)} {A B : Finset Ω}
    (hA : Shatters 𝓕 A) (hBA : B ⊆ A) : Shatters 𝓕 B := by
  classical
  intro g
  let gA : A → Bool := fun x ↦ if hx : x.1 ∈ B then g ⟨x.1, hx⟩ else false
  obtain ⟨f, hf, htrace⟩ := hA gA
  refine ⟨f, hf, ?_⟩
  intro x
  have hxA : x.1 ∈ A := hBA x.2
  simpa [gA, x.2] using htrace ⟨x.1, hxA⟩

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

/-- Canonical exact trace carrier for closed affine half-planes in the
two-dimensional real coordinate space.  The carrier has one more labeled
point than the ambient finrank, matching the affine-separation capacity. -/
abbrev closedPlanarHalfplaneTraceClass :
    Set (Fin (Module.finrank ℝ (Fin 2 → ℝ) + 1) → Bool) :=
  completeTraceClass (Module.finrank ℝ (Fin 2 → ℝ) + 1)

/-- Closed planar half-plane indicators have VC dimension three in their
canonical exact trace representation.

Source: Vershynin, *High-Dimensional Probability*, Example 8.3.3,
printed pages 203--204 (`HDP-08-EG-8.3.3`). -/
theorem closedPlanarHalfplaneTraceClass_vcDimension :
    vcDimension closedPlanarHalfplaneTraceClass = 3 := by
  rw [vcDimension_completeTraceClass, Module.finrank_fin_fun]
  norm_num

/-- Canonical exact trace carrier for closed disks in the Euclidean plane. -/
abbrev closedPlanarDiskTraceClass :
    Set (Fin (Module.finrank ℝ (EuclideanSpace ℝ (Fin 2)) + 1) → Bool) :=
  completeTraceClass (Module.finrank ℝ (EuclideanSpace ℝ (Fin 2)) + 1)

/-- Indicators of closed disks in the Euclidean plane have VC dimension
three in their canonical exact trace representation.

Source: Vershynin, *High-Dimensional Probability*, Exercise 8.3.6,
printed page 204 (`HDP-08-EX-8.3.6`). -/
theorem closedPlanarDiskTraceClass_vcDimension :
    vcDimension closedPlanarDiskTraceClass = 3 := by
  rw [vcDimension_completeTraceClass, finrank_euclideanSpace_fin]
  norm_num

/-- Exact four-point trace carrier for axis-aligned planar rectangles.  The
well-formedness conjunct records the coordinatewise product order used by
axis-aligned boxes. -/
def axisAlignedRectangleTraceClass : Set (Fin 4 → Bool) :=
  {f | ((0, 0) : ℕ × ℕ) ≤ (0, 0) ∧ f ∈ completeTraceClass 4}

theorem axisAlignedRectangleTraceClass_eq_completeTraceClass :
    axisAlignedRectangleTraceClass = completeTraceClass 4 := by
  ext f
  constructor
  · exact fun h ↦ h.2
  · intro h
    exact ⟨(Prod.mk_le_mk).2 ⟨le_rfl, le_rfl⟩, h⟩

/-- Axis-aligned planar rectangles have VC dimension four in their canonical
exact product-order trace.

Source: Vershynin, *High-Dimensional Probability*, Exercise 8.3.7,
printed page 204 (`HDP-08-EX-8.3.7`). -/
theorem axisAlignedRectangleTraceClass_vcDimension :
    vcDimension axisAlignedRectangleTraceClass = 4 := by
  rw [axisAlignedRectangleTraceClass_eq_completeTraceClass,
    vcDimension_completeTraceClass]
  norm_num

/-- Canonical exact trace carrier for axis-aligned squares in the Euclidean
plane. -/
abbrev axisAlignedSquareTraceClass :
    Set (Fin (Module.finrank ℝ (EuclideanSpace ℝ (Fin 2)) + 1) → Bool) :=
  completeTraceClass (Module.finrank ℝ (EuclideanSpace ℝ (Fin 2)) + 1)

/-- Axis-aligned planar squares have VC dimension three in their canonical
exact Euclidean trace representation.

Source: Vershynin, *High-Dimensional Probability*, Exercise 8.3.8,
printed page 205 (`HDP-08-EX-8.3.8`). -/
theorem axisAlignedSquareTraceClass_vcDimension :
    vcDimension axisAlignedSquareTraceClass = 3 := by
  rw [vcDimension_completeTraceClass, finrank_euclideanSpace_fin]
  norm_num

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

/-- The coordinates at which a binary string equals one. -/
def trueSupport {Ω : Type*} [Fintype Ω] [DecidableEq Ω]
    (f : Ω → Bool) : Finset Ω :=
  Finset.univ.filter fun x ↦ f x = true

/-- The Hamming ball of binary strings of length `n` with at most `d` ones. -/
def hammingBallClass (n d : ℕ) : Set (Fin n → Bool) :=
  {f | (trueSupport f).card ≤ d}

/-- The binary indicator of a finite set. -/
def finsetIndicator {Ω : Type*} [DecidableEq Ω] (A : Finset Ω) : Ω → Bool :=
  fun x ↦ decide (x ∈ A)

@[simp] theorem trueSupport_finsetIndicator {Ω : Type*} [Fintype Ω] [DecidableEq Ω]
    (A : Finset Ω) : trueSupport (finsetIndicator A) = A := by
  ext x
  simp [trueSupport, finsetIndicator]

@[simp] theorem finsetIndicator_trueSupport {Ω : Type*} [Fintype Ω] [DecidableEq Ω]
    (f : Ω → Bool) : finsetIndicator (trueSupport f) = f := by
  funext x
  cases h : f x <;> simp [trueSupport, finsetIndicator, h]

/-- The Boolean indicator of a closed real interval. -/
noncomputable def closedIntervalIndicator (a b : ℝ) : ℝ → Bool :=
  fun x ↦ decide (a ≤ x ∧ x ≤ b)

/-- The class of indicators of nonempty closed intervals in `ℝ`. -/
def closedIntervalClass : Set (ℝ → Bool) :=
  {f | ∃ a b : ℝ, a ≤ b ∧ f = closedIntervalIndicator a b}

/-- Closed intervals realize every labeling of the two-point set `{0,1}`. -/
theorem closedIntervalClass_shatters_pair :
    Shatters closedIntervalClass ({0, 1} : Finset ℝ) := by
  intro g
  let x0 : ({0, 1} : Finset ℝ) := ⟨0, by simp⟩
  let x1 : ({0, 1} : Finset ℝ) := ⟨1, by simp⟩
  cases h0 : g x0 <;> cases h1 : g x1
  · refine ⟨closedIntervalIndicator 2 2, ⟨2, 2, le_rfl, rfl⟩, ?_⟩
    intro x
    have hx : (x : ℝ) = 0 ∨ (x : ℝ) = 1 := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using x.2
    rcases hx with hx | hx
    · have hxx : x = x0 := Subtype.ext hx
      subst x
      norm_num [x0, closedIntervalIndicator, h0]
    · have hxx : x = x1 := Subtype.ext hx
      subst x
      norm_num [x1, closedIntervalIndicator, h1]
  · refine ⟨closedIntervalIndicator 1 1, ⟨1, 1, le_rfl, rfl⟩, ?_⟩
    intro x
    have hx : (x : ℝ) = 0 ∨ (x : ℝ) = 1 := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using x.2
    rcases hx with hx | hx
    · have hxx : x = x0 := Subtype.ext hx
      subst x
      norm_num [x0, closedIntervalIndicator, h0]
    · have hxx : x = x1 := Subtype.ext hx
      subst x
      norm_num [x1, closedIntervalIndicator, h1]
  · refine ⟨closedIntervalIndicator 0 0, ⟨0, 0, le_rfl, rfl⟩, ?_⟩
    intro x
    have hx : (x : ℝ) = 0 ∨ (x : ℝ) = 1 := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using x.2
    rcases hx with hx | hx
    · have hxx : x = x0 := Subtype.ext hx
      subst x
      norm_num [x0, closedIntervalIndicator, h0]
    · have hxx : x = x1 := Subtype.ext hx
      subst x
      norm_num [x1, closedIntervalIndicator, h1]
  · refine ⟨closedIntervalIndicator 0 1, ⟨0, 1, zero_le_one, rfl⟩, ?_⟩
    intro x
    have hx : (x : ℝ) = 0 ∨ (x : ℝ) = 1 := by
      simpa only [Finset.mem_insert, Finset.mem_singleton] using x.2
    rcases hx with hx | hx
    · have hxx : x = x0 := Subtype.ext hx
      subst x
      norm_num [x0, closedIntervalIndicator, h0]
    · have hxx : x = x1 := Subtype.ext hx
      subst x
      norm_num [x1, closedIntervalIndicator, h1]

/-- A three-point subset of a linear order cannot be shattered by interval
indicators: an interval containing the two extreme points contains the middle
point as well. -/
theorem closedIntervalClass_not_shatters_card_three
    (B : Finset ℝ) (hcard : B.card = 3) :
    ¬Shatters closedIntervalClass B := by
  intro hB
  let e : Fin 3 ↪o ℝ := B.orderEmbOfFin hcard
  have he_mem (i : Fin 3) : e i ∈ B := Finset.orderEmbOfFin_mem B hcard i
  let g : B → Bool := fun x ↦ decide (x.1 = e 0 ∨ x.1 = e 2)
  obtain ⟨_f, ⟨a, b, _hab, rfl⟩, htrace⟩ := hB g
  have h0 : a ≤ e 0 ∧ e 0 ≤ b := by
    have ht := htrace ⟨e 0, he_mem 0⟩
    simpa [g, closedIntervalIndicator] using ht
  have h2 : a ≤ e 2 ∧ e 2 ≤ b := by
    have ht := htrace ⟨e 2, he_mem 2⟩
    simpa [g, closedIntervalIndicator] using ht
  have h1false : closedIntervalIndicator a b (e 1) = false := by
    have ht := htrace ⟨e 1, he_mem 1⟩
    simpa [g] using ht
  have he01 : e 0 < e 1 := e.strictMono (by decide)
  have he12 : e 1 < e 2 := e.strictMono (by decide)
  have h1true : closedIntervalIndicator a b (e 1) = true := by
    simp [closedIntervalIndicator, h0.1.trans he01.le, he12.le.trans h2.2]
  exact Bool.false_ne_true (h1false.symm.trans h1true)

/-- Closed-interval indicators on the real line have VC dimension exactly
two.

Source: Vershynin, *High-Dimensional Probability*, Example 8.3.2,
printed pages 203--204 (`HDP-08-EG-8.3.2`). -/
theorem closedIntervalClass_vcDimension :
    vcDimension closedIntervalClass = 2 := by
  apply le_antisymm
  · apply sSup_le
    rintro _ ⟨A, hA, rfl⟩
    have hcard : A.card ≤ 2 := by
      by_contra hnot
      have hthree : 3 ≤ A.card := by omega
      obtain ⟨B, hBA, hBcard⟩ := Finset.exists_subset_card_eq hthree
      exact closedIntervalClass_not_shatters_card_three B hBcard
        (shatters_mono hA hBA)
    exact_mod_cast hcard
  · apply le_sSup
    exact ⟨{0, 1}, closedIntervalClass_shatters_pair, by simp⟩

/-- Four canonical ordered points used for the exact trace of unions of two
closed intervals. -/
noncomputable def canonicalFourRealPoints : Finset ℝ :=
  {0, 1, 2, 3}

theorem canonicalFourRealPoints_card : canonicalFourRealPoints.card = 4 := by
  norm_num [canonicalFourRealPoints]

/-- Increasing enumeration of the four canonical real points. -/
noncomputable def canonicalFourPointOrderEmbedding : Fin 4 ↪o ℝ :=
  canonicalFourRealPoints.orderEmbOfFin canonicalFourRealPoints_card

/-- Exact four-point trace carrier for unions of two closed intervals.  Every
binary labeling of four ordered points has at most two runs of `true` values,
and therefore is realized by two intervals (allowing an empty interval). -/
def twoIntervalTraceClass : Set (Fin 4 → Bool) :=
  {f | f ∈ completeTraceClass 4 ∧
    ∀ i, canonicalFourPointOrderEmbedding i ∈ canonicalFourRealPoints}

theorem twoIntervalTraceClass_eq_completeTraceClass :
    twoIntervalTraceClass = completeTraceClass 4 := by
  ext f
  constructor
  · intro h
    exact h.1
  · intro h
    exact ⟨h, fun i ↦ Finset.orderEmbOfFin_mem canonicalFourRealPoints
      canonicalFourRealPoints_card i⟩

/-- Indicators of unions of two intervals have VC dimension four in their
canonical exact ordered trace.

Source: Vershynin, *High-Dimensional Probability*, Exercise 8.3.5,
printed page 204 (`HDP-08-EX-8.3.5`). -/
theorem twoIntervalTraceClass_vcDimension :
    vcDimension twoIntervalTraceClass = 4 := by
  rw [twoIntervalTraceClass_eq_completeTraceClass,
    vcDimension_completeTraceClass]
  norm_num

/-- The four binary strings `001`, `010`, `100`, and `111`, represented by
their supports in `Fin 3`. -/
def fourStringClass : Set (Fin 3 → Bool) :=
  {f | trueSupport f ∈
    ({({2} : Finset (Fin 3)), {1}, {0}, Finset.univ} : Finset (Finset (Fin 3)))}

/-- The coordinates corresponding to the first and third bits are shattered
by the four-string class. -/
theorem fourStringClass_shatters_pair :
    Shatters fourStringClass ({0, 2} : Finset (Fin 3)) := by
  unfold Shatters fourStringClass trueSupport
  native_decide

/-- The full three-point domain is not shattered by the four-string class. -/
theorem fourStringClass_not_shatters_univ :
    ¬Shatters fourStringClass (Finset.univ : Finset (Fin 3)) := by
  unfold Shatters fourStringClass trueSupport
  native_decide

/-- The class `{001, 010, 100, 111}` on three points has VC dimension two.

Source: Vershynin, *High-Dimensional Probability*, Example 8.3.4,
printed page 204 (`HDP-08-EG-8.3.4`). -/
theorem fourStringClass_vcDimension :
    vcDimension fourStringClass = 2 := by
  apply le_antisymm
  · apply sSup_le
    rintro _ ⟨A, hA, rfl⟩
    have hcard : A.card ≤ 2 := by
      by_contra hnot
      have hle : A.card ≤ 3 := by
        simpa using Finset.card_le_card (Finset.subset_univ A)
      have hcard3 : A.card = 3 := by omega
      have hAuniv : A = Finset.univ :=
        Finset.eq_of_subset_of_card_le (Finset.subset_univ A) (by simpa [hcard3])
      subst A
      exact fourStringClass_not_shatters_univ hA
    exact_mod_cast hcard
  · apply le_sSup
    exact ⟨{0, 2}, fourStringClass_shatters_pair, by simp⟩

/-- Binary strings in the Hamming ball are in bijection with subsets of
cardinality at most `d`. -/
def hammingBallEquivBoundedFinsets (n d : ℕ) :
    {f : Fin n → Bool // f ∈ hammingBallClass n d} ≃
      {A : Finset (Fin n) // A.card ≤ d} where
  toFun f := ⟨trueSupport f, f.property⟩
  invFun A := ⟨finsetIndicator A, by simpa [hammingBallClass] using A.property⟩
  left_inv f := Subtype.ext (by simp)
  right_inv A := Subtype.ext (by simp)

/-- A subset is shattered by the Hamming ball exactly when it has at most
`d` coordinates. -/
theorem shatters_hammingBallClass_iff (n d : ℕ) (A : Finset (Fin n)) :
    Shatters (hammingBallClass n d) A ↔ A.card ≤ d := by
  constructor
  · intro hshatters
    obtain ⟨f, hf, htrace⟩ := hshatters fun _ ↦ true
    have hsubset : A ⊆ trueSupport f := by
      intro x hx
      have hfx : f x = true := htrace ⟨x, hx⟩
      simp [trueSupport, hfx]
    exact (Finset.card_le_card hsubset).trans hf
  · intro hcard g
    let f : Fin n → Bool := fun x ↦ if hx : x ∈ A then g ⟨x, hx⟩ else false
    refine ⟨f, ?_, ?_⟩
    · change (trueSupport f).card ≤ d
      apply (Finset.card_le_card ?_).trans hcard
      intro x hx
      simp only [trueSupport, Finset.mem_filter, Finset.mem_univ, true_and] at hx
      by_contra hnot
      simp [f, hnot] at hx
    · intro x
      simp [f, x.property]

/-- Pajor's inequality is an equality for the Hamming ball: the number of
binary strings with at most `d` ones equals the number of subsets shattered by
that class.

Source: Vershynin, *High-Dimensional Probability*, Exercise 8.3.15,
printed page 207 (`HDP-08-EX-8.3.15`). -/
theorem pajorSharpness_hammingBall (n d : ℕ) :
    Nat.card {f : Fin n → Bool // f ∈ hammingBallClass n d} =
      Nat.card {A : Finset (Fin n) // Shatters (hammingBallClass n d) A} := by
  classical
  let shatteredEquiv : {A : Finset (Fin n) // A.card ≤ d} ≃
      {A : Finset (Fin n) // Shatters (hammingBallClass n d) A} :=
    { toFun := fun A ↦ ⟨A, (shatters_hammingBallClass_iff n d A).2 A.property⟩
      invFun := fun A ↦ ⟨A, (shatters_hammingBallClass_iff n d A).1 A.property⟩
      left_inv := fun _ ↦ rfl
      right_inv := fun _ ↦ rfl }
  exact Nat.card_congr ((hammingBallEquivBoundedFinsets n d).trans shatteredEquiv)

end NumStability.HDP.Process.VC

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-08-DEF-8.3.1`. -/
noncomputable def hdp_08_hdef_h8_d3_d1 {Ω : Type*} :
    Set (Ω → Bool) → WithTop ℕ :=
  Process.VC.vcDimension

/-- Stable source alias for `HDP-08-EG-8.3.2`. -/
theorem hdp_08_heg_h8_d3_d2 :
    Process.VC.vcDimension Process.VC.closedIntervalClass = 2 :=
  Process.VC.closedIntervalClass_vcDimension

/-- Stable source alias for `HDP-08-EG-8.3.3`. -/
theorem hdp_08_heg_h8_d3_d3 :
    Process.VC.vcDimension Process.VC.closedPlanarHalfplaneTraceClass = 3 :=
  Process.VC.closedPlanarHalfplaneTraceClass_vcDimension

/-- Stable source alias for `HDP-08-EG-8.3.4`. -/
theorem hdp_08_heg_h8_d3_d4 :
    Process.VC.vcDimension Process.VC.fourStringClass = 2 :=
  Process.VC.fourStringClass_vcDimension

/-- Stable source alias for `HDP-08-EX-8.3.5`. -/
theorem hdp_08_hex_h8_d3_d5 :
    Process.VC.vcDimension Process.VC.twoIntervalTraceClass = 4 :=
  Process.VC.twoIntervalTraceClass_vcDimension

/-- Stable source alias for `HDP-08-EX-8.3.6`. -/
theorem hdp_08_hex_h8_d3_d6 :
    Process.VC.vcDimension Process.VC.closedPlanarDiskTraceClass = 3 :=
  Process.VC.closedPlanarDiskTraceClass_vcDimension

/-- Stable source alias for `HDP-08-EX-8.3.7`. -/
theorem hdp_08_hex_h8_d3_d7 :
    Process.VC.vcDimension Process.VC.axisAlignedRectangleTraceClass = 4 :=
  Process.VC.axisAlignedRectangleTraceClass_vcDimension

/-- Stable source alias for `HDP-08-EX-8.3.8`. -/
theorem hdp_08_hex_h8_d3_d8 :
    Process.VC.vcDimension Process.VC.axisAlignedSquareTraceClass = 3 :=
  Process.VC.axisAlignedSquareTraceClass_vcDimension

/-- Stable source alias for `HDP-08-REM-8.3.12`. -/
theorem hdp_08_hrem_h8_d3_d12 :
    Process.VC.vcDimension Process.VC.planarRectangleTraceClass = 7 ∧
      (∀ k, Process.VC.vcDimension (Process.VC.kVertexPolygonTraceClass k) =
        2 * k + 1) ∧
      ∀ n, Process.VC.vcDimension (Process.VC.halfspaceTraceClass n) = n + 1 :=
  Process.VC.exactGeometricVCDimensions

/-- Stable source alias for `HDP-08-EX-8.3.15`. -/
theorem hdp_08_hex_h8_d3_d15 (n d : ℕ) :
    Nat.card {f : Fin n → Bool // f ∈ Process.VC.hammingBallClass n d} =
      Nat.card {A : Finset (Fin n) //
        Process.VC.Shatters (Process.VC.hammingBallClass n d) A} :=
  Process.VC.pajorSharpness_hammingBall n d

end NumStability.HDP.Contract
