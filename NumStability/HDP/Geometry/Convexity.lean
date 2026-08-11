import Mathlib.Analysis.Convex.Combination
import Mathlib.Data.Real.Basic
import Mathlib.Topology.MetricSpace.CoveringNumbers

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

end NumStability.HDP.Geometry.Convexity

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-00-DEF-CONVEX-COMBINATION`. -/
def hdp_00_hdef_hconvex_hcombination (ι E : Type*)
    [AddCommMonoid E] [Module ℝ E] : Type _ :=
  Geometry.Convexity.ConvexCombination ι E

/-- Stable source alias for `HDP-00-DEF-EPS-COVER`. -/
def hdp_00_hdef_heps_hcover {α : Type*} [PseudoMetricSpace α] :
    Set α → Finset α → NNReal → Prop :=
  Geometry.Convexity.IsFiniteClosedCover

end NumStability.HDP.Contract
