import Mathlib.Analysis.Convex.Combination
import Mathlib.Analysis.Normed.Group.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Sym.Card
import Mathlib.MeasureTheory.Integral.Average
import Mathlib.Topology.MetricSpace.CoveringNumbers
import Mathlib.Topology.MetricSpace.Isometry

/-!
# Convex combinations and elementary convex geometry

The Appetizer uses finite convex combinations with repetitions allowed.  We
therefore index points before mapping them into the ambient module, rather
than representing a combination only by a set of distinct points.
-/

open scoped BigOperators

namespace NumStability.HDP.Geometry.Convexity

/-- A finite convex combination over explicit support.  The stored value is
certified to be the weighted sum, the weights are nonnegative on the support,
and their sum is one.

Different indices may carry the same point, so finite collections with
repetition are represented faithfully.

Source: Vershynin, Appetizer equation (0.1), printed page 1
(`HDP-00-DEF-CONVEX-COMBINATION`). -/
structure ConvexCombination (ι E : Type*) [AddCommMonoid E] [Module ℝ E] where
  support : Finset ι
  point : ι → E
  weight : ι → ℝ
  weight_nonnegative : ∀ i ∈ support, 0 ≤ weight i
  weight_sum_eq_one : ∑ i ∈ support, weight i = 1
  value : E
  value_eq_weighted_sum : value = ∑ i ∈ support, weight i • point i

/-- Build the finite-support form of a convex combination. -/
def ConvexCombination.ofFinset {ι E : Type*} [AddCommMonoid E] [Module ℝ E]
    (support : Finset ι) (point : ι → E) (weight : ι → ℝ)
    (weight_nonnegative : ∀ i ∈ support, 0 ≤ weight i)
    (weight_sum_eq_one : ∑ i ∈ support, weight i = 1) : ConvexCombination ι E where
  support := support
  point := point
  weight := weight
  weight_nonnegative := weight_nonnegative
  weight_sum_eq_one := weight_sum_eq_one
  value := ∑ i ∈ support, weight i • point i
  value_eq_weighted_sum := rfl

/-- Build the indexed form from a finite type.  Its support is `Finset.univ`,
so the hypotheses and value read exactly as equation (0.1). -/
def ConvexCombination.ofFintype {ι E : Type*} [Fintype ι]
    [AddCommMonoid E] [Module ℝ E] (point : ι → E) (weight : ι → ℝ)
    (weight_nonnegative : ∀ i, 0 ≤ weight i)
    (weight_sum_eq_one : ∑ i, weight i = 1) : ConvexCombination ι E :=
  .ofFinset Finset.univ point weight (fun i _ => weight_nonnegative i) weight_sum_eq_one

/-- The book's diameter notation, bound directly to Mathlib's metric
diameter.  For unbounded sets, statements using this real-valued diameter
should also carry `Bornology.IsBounded` so that `ENNReal.toReal` does not hide
an infinite extended diameter.

Source: Vershynin, footnote 1 on printed page 2
(`HDP-00-DEF-DIAMETER-RADIUS`). -/
noncomputable def diameter {α : Type*} [PseudoMetricSpace α] (T : Set α) : ℝ :=
  Metric.diam T

/-- Radius at most one about the distinguished origin, as in equation (0.2). -/
def HasUnitRadiusAboutZero {E : Type*} [Norm E] (T : Set E) : Prop :=
  ∀ t ∈ T, ‖t‖ ≤ 1

/-- Translate a set so that the chosen anchor becomes the origin. -/
def translateToAnchor {E : Type*} [Sub E] (T : Set E) (t₀ : E) : Set E :=
  (fun t ↦ t - t₀) '' T

/-- Translation does not change diameter. -/
theorem diameter_translateToAnchor {E : Type*} [SeminormedAddCommGroup E]
    (T : Set E) (t₀ : E) :
    diameter (translateToAnchor T t₀) = diameter T := by
  change Metric.diam ((fun t : E ↦ t - t₀) '' T) = Metric.diam T
  exact (Isometry.of_dist_eq fun x y ↦ by
    simp only [dist_eq_norm]
    congr 1
    abel).diam_image T

/-- After translating by `t₀`, norm about zero is distance from `t₀`. -/
theorem norm_sub_eq_dist {E : Type*} [SeminormedAddCommGroup E] (t t₀ : E) :
    ‖t - t₀‖ = dist t t₀ :=
  (dist_eq_norm t t₀).symm

/-- If a bounded set has diameter at most one, translating by any anchor in
the set puts every translated point in the unit ball about zero.  The anchor
membership is the nonemptiness witness suppressed by “translating if
necessary” in the source proof. -/
theorem hasUnitRadiusAboutZero_translateToAnchor
    {E : Type*} [SeminormedAddCommGroup E] {T : Set E} {t₀ : E}
    (hT : Bornology.IsBounded T) (ht₀ : t₀ ∈ T) (hdiam : diameter T ≤ 1) :
    HasUnitRadiusAboutZero (translateToAnchor T t₀) := by
  rintro _ ⟨t, ht, rfl⟩
  rw [norm_sub_eq_dist]
  exact (Metric.dist_le_diam_of_mem hT ht ht₀).trans hdiam

/-- A finite set of centers whose closed balls of radius `ε` cover `P`.

The radius is nonnegative by type.  This is the finite-center specialization
of Mathlib's `Metric.IsCover`; in particular it uses closed balls, matching the
`dist ≤ ε` estimate in the proof following Figure 0.2.

Source: Vershynin, Figure 0.2 discussion, printed pages 3–4
(`HDP-00-DEF-EPS-COVER`). -/
def IsFiniteClosedCover {α : Type*} [PseudoMetricSpace α]
    (P : Set α) (N : Finset α) (ε : NNReal) : Prop :=
  Metric.IsCover ε P (N : Set α)

/-- The finite-cover definition is exactly the pointwise witness formulation
used in the Appetizer. -/
theorem isFiniteClosedCover_iff {α : Type*} [PseudoMetricSpace α]
    {P : Set α} {N : Finset α} {ε : NNReal} :
    IsFiniteClosedCover P N ε ↔
      ∀ x ∈ P, ∃ c ∈ N, dist x c ≤ (ε : ℝ) := by
  simp [IsFiniteClosedCover, Metric.IsCover, SetRel.IsCover]

/-- The unrestricted-center covering number associated to the preceding
finite-cover interface.  This is the convention encoded by the Appetizer's
statement, which does not require centers to lie in `P`. -/
noncomputable def externalCoveringNumber {α : Type*} [PseudoMetricSpace α]
    (P : Set α) (ε : NNReal) : ℕ∞ :=
  Metric.externalCoveringNumber ε P

/-- The internal variant, for later results that require all centers to lie in
the set being covered. -/
noncomputable def internalCoveringNumber {α : Type*} [PseudoMetricSpace α]
    (P : Set α) (ε : NNReal) : ℕ∞ :=
  Metric.coveringNumber ε P

/-- Unordered selections of exactly `k` elements of `α`, with repetition.
The symmetric power is Mathlib's type-level model of fixed-cardinality
multisets. -/
abbrev UnorderedSelections (α : Type*) (k : ℕ) :=
  Sym α k

/-- Stars and bars: unordered selections of `k` elements from an `N`-element
set, with repetition, are counted by `choose (N + k - 1) k`.

The natural subtraction gives the intended edge conventions: for `N = 0`
the count is one when `k = 0` and zero when `k > 0`.

Source: Vershynin, hint to Exercise 0.0.6, printed page 4
(`HDP-00-LEM-MULTISET-COUNT`). -/
theorem card_unorderedSelections_fin (N k : ℕ) :
    Fintype.card (UnorderedSelections (Fin N) k) = (N + k - 1).choose k := by
  simpa using Sym.card_sym_eq_choose (α := Fin N) k

/-- Selecting no elements has exactly one unordered outcome, including from
the empty ground set. -/
theorem card_unorderedSelections_zero (N : ℕ) :
    Fintype.card (UnorderedSelections (Fin N) 0) = 1 := by
  simp

/-- A positive-size selection from an empty ground set is impossible. -/
theorem card_unorderedSelections_empty_succ (k : ℕ) :
    Fintype.card (UnorderedSelections (Fin 0) (k + 1)) = 0 := by
  simp

/-- An expectation upper bound has a pointwise witness outside any prescribed
null exceptional set.  Integrability is the finiteness hypothesis needed to
prevent the Bochner integral's nonintegrable convention from creating a false
statement. -/
theorem exists_notMem_null_le_of_integral_le
    {Ω : Type*} [MeasurableSpace Ω] {μ : MeasureTheory.Measure Ω}
    [MeasureTheory.IsProbabilityMeasure μ] {Y : Ω → ℝ} {a : ℝ} {N : Set Ω}
    (hY : MeasureTheory.Integrable Y μ) (hEa : (∫ ω, Y ω ∂μ) ≤ a)
    (hN : μ N = 0) :
    ∃ ω, ω ∉ N ∧ Y ω ≤ a := by
  rcases MeasureTheory.exists_notMem_null_le_integral hY hN with ⟨ω, hωN, hω⟩
  exact ⟨ω, hωN, hω.trans hEa⟩

/-- The source-facing nonnegative first-moment witness, retaining the
nonnegativity information at the selected realization.

Source: Vershynin, final paragraph of the proof of Theorem 0.0.2, printed
page 3 (`HDP-00-LEM-EXPECTATION-WITNESS`). -/
theorem nonnegativeExpectationWitness
    {Ω : Type*} [MeasurableSpace Ω] {μ : MeasureTheory.Measure Ω}
    [MeasureTheory.IsProbabilityMeasure μ] {Y : Ω → ℝ} {a : ℝ} {N : Set Ω}
    (hY : MeasureTheory.Integrable Y μ) (hYnonneg : ∀ ω, 0 ≤ Y ω)
    (hEa : (∫ ω, Y ω ∂μ) ≤ a) (hN : μ N = 0) :
    ∃ ω, ω ∉ N ∧ 0 ≤ Y ω ∧ Y ω ≤ a := by
  rcases exists_notMem_null_le_of_integral_le hY hEa hN with ⟨ω, hωN, hω⟩
  exact ⟨ω, hωN, hYnonneg ω, hω⟩

/-- Specialization to the squared norm error used in the empirical-method
argument. -/
theorem sqNormErrorWitness
    {Ω E : Type*} [MeasurableSpace Ω] {μ : MeasureTheory.Measure Ω}
    [MeasureTheory.IsProbabilityMeasure μ] [SeminormedAddCommGroup E]
    {Z : Ω → E} {x : E} {a : ℝ} {N : Set Ω}
    (hY : MeasureTheory.Integrable (fun ω ↦ ‖x - Z ω‖ ^ 2) μ)
    (hEa : (∫ ω, ‖x - Z ω‖ ^ 2 ∂μ) ≤ a) (hN : μ N = 0) :
    ∃ ω, ω ∉ N ∧ ‖x - Z ω‖ ^ 2 ≤ a :=
  exists_notMem_null_le_of_integral_le hY hEa hN

/-- The averages obtained from ordered `k`-tuples of a finite generating
set.  Distinct tuples are intentionally allowed to determine the same
average. -/
noncomputable def orderedAverageSet {α E : Type*} [Fintype α]
    [AddCommMonoid E] [Module ℝ E] (point : α → E) (k : ℕ) : Finset E := by
  classical
  exact (Finset.univ : Finset (Fin k → α)).image fun tuple ↦
    (k : ℝ)⁻¹ • ∑ j, point (tuple j)

/-- The set of averages of ordered `k`-tuples from an `N`-element
generating set has cardinality at most `N ^ k`.

Source: Vershynin, proof of Corollary 0.0.4, printed page 4
(`HDP-00-LEM-ORDERED-AVERAGE-CARD`). -/
theorem card_orderedAverageSet_le {α E : Type*} [Fintype α]
    [AddCommMonoid E] [Module ℝ E] (point : α → E) (k : ℕ) :
    (orderedAverageSet point k).card ≤ Fintype.card α ^ k := by
  classical
  rw [orderedAverageSet]
  calc
    ((Finset.univ : Finset (Fin k → α)).image fun tuple ↦
        (k : ℝ)⁻¹ • ∑ j, point (tuple j)).card ≤
        (Finset.univ : Finset (Fin k → α)).card := Finset.card_image_le
    _ = Fintype.card α ^ k := by simp

end NumStability.HDP.Geometry.Convexity

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-00-DEF-CONVEX-COMBINATION`. -/
def hdp_00_hdef_hconvex_hcombination (ι E : Type*)
    [AddCommMonoid E] [Module ℝ E] : Type _ :=
  Geometry.Convexity.ConvexCombination ι E

/-- Stable source alias for `HDP-00-DEF-DIAMETER-RADIUS`. -/
noncomputable def hdp_00_hdef_hdiameter_hradius
    {α : Type*} [PseudoMetricSpace α] : Set α → ℝ :=
  Geometry.Convexity.diameter

/-- Stable source alias for `HDP-00-DEF-EPS-COVER`. -/
def hdp_00_hdef_heps_hcover {α : Type*} [PseudoMetricSpace α] :
    Set α → Finset α → NNReal → Prop :=
  Geometry.Convexity.IsFiniteClosedCover

/-- Stable source alias for `HDP-00-LEM-MULTISET-COUNT`. -/
theorem hdp_00_hlem_hmultiset_hcount (N k : ℕ) :
    Fintype.card (Geometry.Convexity.UnorderedSelections (Fin N) k) =
      (N + k - 1).choose k :=
  Geometry.Convexity.card_unorderedSelections_fin N k

/-- Stable source alias for `HDP-00-LEM-EXPECTATION-WITNESS`. -/
theorem hdp_00_hlem_hexpectation_hwitness
    {Ω : Type*} [MeasurableSpace Ω] {μ : MeasureTheory.Measure Ω}
    [MeasureTheory.IsProbabilityMeasure μ] {Y : Ω → ℝ} {a : ℝ} {N : Set Ω}
    (hY : MeasureTheory.Integrable Y μ) (hYnonneg : ∀ ω, 0 ≤ Y ω)
    (hEa : (∫ ω, Y ω ∂μ) ≤ a) (hN : μ N = 0) :
    ∃ ω, ω ∉ N ∧ 0 ≤ Y ω ∧ Y ω ≤ a :=
  Geometry.Convexity.nonnegativeExpectationWitness hY hYnonneg hEa hN

/-- Stable source alias for `HDP-00-LEM-ORDERED-AVERAGE-CARD`. -/
theorem hdp_00_hlem_hordered_haverage_hcard
    {α E : Type*} [Fintype α] [AddCommMonoid E] [Module ℝ E]
    (point : α → E) (k : ℕ) :
    (Geometry.Convexity.orderedAverageSet point k).card ≤
      Fintype.card α ^ k :=
  Geometry.Convexity.card_orderedAverageSet_le point k

end NumStability.HDP.Contract
