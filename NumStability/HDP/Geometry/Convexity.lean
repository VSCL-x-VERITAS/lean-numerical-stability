import Mathlib.Analysis.Convex.Combination
import Mathlib.Analysis.Convex.Caratheodory
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.Normed.Group.Basic
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Data.ENNReal.BigOperators
import Mathlib.Data.Real.Basic
import Mathlib.Data.Sym.Card
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Integral.Average
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Probability.Independence.Basic
import Mathlib.Probability.HasLawExists
import Mathlib.Probability.IdentDistrib
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.LinearAlgebra.AffineSpace.FiniteDimensional
import Mathlib.Topology.MetricSpace.CoveringNumbers
import Mathlib.Topology.MetricSpace.Isometry

/-!
# Convex combinations and elementary convex geometry

The Appetizer uses finite convex combinations with repetitions allowed.  We
therefore index points before mapping them into the ambient module, rather
than representing a combination only by a set of distinct points.
-/

open scoped BigOperators InnerProductSpace

namespace NumStability.HDP.Geometry.Convexity

universe u

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

/-- The source-facing finite-combination description of the convex hull.

Membership records an explicitly finite index type, nonnegative weights
summing to one, points of `T`, and their weighted sum.  Using an indexed
family rather than a set of points preserves repetitions in the finite
collection from the book's definition.

Source: Vershynin, Appetizer, printed page 1
(`HDP-00-DEF-CONVEX-HULL`). -/
def finiteConvexCombinationHull {E : Type*} [AddCommGroup E] [Module ℝ E]
    (T : Set E) : Set E :=
  {x | ∃ (ι : Type) (_ : Fintype ι) (weight : ι → ℝ) (point : ι → E),
    (∀ i, 0 ≤ weight i) ∧ (∑ i, weight i = 1) ∧
      (∀ i, point i ∈ T) ∧ ∑ i, weight i • point i = x}

/-- An explicit finite convex combination belongs to the Mathlib convex
hull.  This direction is universe-polymorphic, so it can be used directly
with any finite indexing type. -/
theorem weightedSum_mem_convexHull {ι E : Type*} [Fintype ι]
    [AddCommGroup E] [Module ℝ E] {T : Set E}
    (weight : ι → ℝ) (point : ι → E)
    (hweight : ∀ i, 0 ≤ weight i) (hsum : ∑ i, weight i = 1)
    (hpoint : ∀ i, point i ∈ T) :
    (∑ i, weight i • point i) ∈ convexHull ℝ T := by
  rw [← Finset.centerMass_eq_of_sum_1 Finset.univ point (by simpa using hsum)]
  exact Finset.centerMass_mem_convexHull Finset.univ
    (by simpa using hweight) (by simpa [hsum]) (by simpa using hpoint)

/-- The finite-combination definition in the book is exactly Mathlib's
`convexHull ℝ`. -/
theorem finiteConvexCombinationHull_eq_convexHull
    {E : Type*} [AddCommGroup E] [Module ℝ E] (T : Set E) :
    finiteConvexCombinationHull T = convexHull ℝ T := by
  ext x
  constructor
  · rintro ⟨ι, _, weight, point, hweight, hsum, hpoint, rfl⟩
    exact weightedSum_mem_convexHull weight point hweight hsum hpoint
  · intro hx
    exact (mem_convexHull_iff_exists_fintype (R := ℝ) (s := T) (x := x)).mp hx

/-- Eliminate membership in a convex hull into the explicit finite
coefficients used by the source. -/
theorem mem_convexHull_iff_finiteCoefficients
    {E : Type*} [AddCommGroup E] [Module ℝ E] {T : Set E} {x : E} :
    x ∈ convexHull ℝ T ↔
      ∃ (ι : Type) (_ : Fintype ι) (weight : ι → ℝ) (point : ι → E),
        (∀ i, 0 ≤ weight i) ∧ (∑ i, weight i = 1) ∧
          (∀ i, point i ∈ T) ∧ ∑ i, weight i • point i = x :=
  mem_convexHull_iff_exists_fintype (R := ℝ) (s := T) (x := x)

/-- A polytope presentation by a finite generating set.  This deliberately
records generators rather than irredundant extreme points: the covering
argument in Corollary 0.0.4 only uses the former.

Source: Vershynin, proof of Corollary 0.0.4, printed page 4
(`HDP-00-DEF-POLYTOPE-VERTICES`). -/
def finitePolytope {E : Type*} [AddCommGroup E] [Module ℝ E]
    (vertices : Finset E) : Set E :=
  convexHull ℝ (vertices : Set E)

/-- Membership in a finitely generated polytope is exactly an explicit
finite convex combination of its generators. -/
theorem mem_finitePolytope_iff_finiteCoefficients
    {E : Type*} [AddCommGroup E] [Module ℝ E]
    {vertices : Finset E} {x : E} :
    x ∈ finitePolytope vertices ↔
      ∃ (ι : Type) (_ : Fintype ι) (weight : ι → ℝ) (point : ι → E),
        (∀ i, 0 ≤ weight i) ∧ (∑ i, weight i = 1) ∧
          (∀ i, point i ∈ vertices) ∧ ∑ i, weight i • point i = x := by
  unfold finitePolytope
  simpa only [Finset.mem_coe] using
    (mem_convexHull_iff_finiteCoefficients (T := (vertices : Set E)) (x := x))

/-- Book-wording specialization when the chosen generating set has cardinality
`N`.  The cardinality hypothesis is metadata for later counting arguments;
the convex-combination characterization itself needs only finiteness. -/
theorem mem_finitePolytope_iff_of_card
    {E : Type*} [AddCommGroup E] [Module ℝ E]
    (vertices : Finset E) (N : ℕ) (_hcard : vertices.card = N) (x : E) :
    x ∈ finitePolytope vertices ↔
      ∃ (ι : Type) (_ : Fintype ι) (weight : ι → ℝ) (point : ι → E),
        (∀ i, 0 ≤ weight i) ∧ (∑ i, weight i = 1) ∧
          (∀ i, point i ∈ vertices) ∧ ∑ i, weight i • point i = x :=
  mem_finitePolytope_iff_finiteCoefficients

/-- Carathéodory's theorem in the finite-dimensional form used by the book.
Every point of the convex hull has a convex representation indexed by at
most `finrank ℝ E + 1` points.  The returned points are in fact affinely
independent and the weights positive; the statement records the weaker
nonnegativity needed by later arguments.

Source: Vershynin, Theorem 0.0.1, printed pages 1--2
(`HDP-00-THM-0.0.1`). -/
theorem caratheodory_sparse_convexCombination
    {E : Type u} [AddCommGroup E] [Module ℝ E] [FiniteDimensional ℝ E]
    {T : Set E} {x : E} (hx : x ∈ convexHull ℝ T) :
    ∃ (ι : Type u) (_ : Fintype ι) (point : ι → E) (weight : ι → ℝ),
      Fintype.card ι ≤ Module.finrank ℝ E + 1 ∧
        (∀ i, point i ∈ T) ∧ (∀ i, 0 ≤ weight i) ∧
          (∑ i, weight i = 1) ∧ ∑ i, weight i • point i = x := by
  obtain ⟨ι, _, point, weight, hpoint, hindependent, hweight, hsum, hvalue⟩ :=
    eq_pos_convex_span_of_mem_convexHull hx
  refine ⟨ι, inferInstance, point, weight, ?_,
    fun i ↦ hpoint (Set.mem_range_self i), fun i ↦ (hweight i).le, hsum, hvalue⟩
  exact hindependent.card_le_finrank_succ.trans
    (Nat.add_le_add_right (Submodule.finrank_le _) 1)

/-- The centroid of an affine-independent finite family cannot lie in the
convex hull obtained by deleting any one vertex.  For a family indexed by
`Fin (n + 1)`, this is the canonical simplex witness showing that the
`n + 1` bound in Carathéodory's theorem is sharp.

Source: Vershynin, prose after Theorem 0.0.1, printed page 2
(`HDP-00-EXAMPLE-SIMPLEX-SHARPNESS`). -/
theorem simplexCentroid_not_mem_convexHull_without_vertex
    {ι E : Type*} [Fintype ι] [Nonempty ι]
    [AddCommGroup E] [Module ℝ E]
    (point : ι → E) (hindependent : AffineIndependent ℝ point) (j : ι) :
    Finset.univ.centroid ℝ point ∉
      convexHull ℝ (point '' {i | i ≠ j}) := by
  intro hcentroid
  have hspan : Finset.univ.centroid ℝ point ∈
      affineSpan ℝ (point '' {i | i ≠ j}) :=
    convexHull_subset_affineSpan _ hcentroid
  have hsum : ∑ i ∈ (Finset.univ : Finset ι),
      Finset.univ.centroidWeights ℝ i = 1 :=
    Finset.univ.sum_centroidWeights_eq_one_of_nonempty ℝ Finset.univ_nonempty
  have hcombination : Finset.univ.affineCombination ℝ point
      (Finset.univ.centroidWeights ℝ) ∈
        affineSpan ℝ (point '' {i | i ≠ j}) := by
    simpa only [Finset.centroid_def] using hspan
  have hzero : Finset.univ.centroidWeights ℝ j = 0 :=
    hindependent.eq_zero_of_affineCombination_mem_affineSpan
      hsum hcombination (Finset.mem_univ j) (by simp)
  have hcard : (Fintype.card ι : ℝ) ≠ 0 := by
    exact_mod_cast Fintype.card_ne_zero
  exact (inv_ne_zero hcard) (by simpa using hzero)

/-- Total real weight of the fiber of `point` over `z`. -/
noncomputable def fiberWeight {ι E : Type*} [Fintype ι]
    (point : ι → E) (weight : ι → ℝ) (z : E) : ℝ := by
  classical
  exact ∑ i with point i = z, weight i

/-- Nonnegative normalized real weights define a probability law on their
finite index set.  Mapping the index-valued random variable through `point`
adds the masses of every fiber, and its Bochner expectation is the original
weighted sum.

This is the corrected version of the point-mass construction in the source:
when displayed vertices repeat, the law lives on indices and the mass at a
geometric point is the sum over all indices mapping to it.

Source: Vershynin, proof of Theorem 0.0.2, printed page 2
(`HDP-00-LEM-FINITE-LAW-FROM-WEIGHTS`). -/
theorem finiteWeightPMF_exists
    {ι E : Type*} [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (point : ι → E) (weight : ι → ℝ)
    (hweight : ∀ i, 0 ≤ weight i) (hsum : ∑ i, weight i = 1) :
    ∃ p : PMF ι,
      (∀ i, p i = ENNReal.ofReal (weight i)) ∧
      (∀ z, (p.map point) z =
        ENNReal.ofReal (fiberWeight point weight z)) ∧
      (∫ i, point i ∂p.toMeasure) = ∑ i, weight i • point i := by
  classical
  have hmass : ∑ i, ENNReal.ofReal (weight i) = 1 := by
    rw [← ENNReal.ofReal_sum_of_nonneg (s := Finset.univ)
      (fun i _ ↦ hweight i)]
    simp [hsum]
  let p : PMF ι := PMF.ofFintype (fun i ↦ ENNReal.ofReal (weight i)) hmass
  refine ⟨p, ?_, ?_, ?_⟩
  · intro i
    exact PMF.ofFintype_apply hmass i
  · intro z
    unfold fiberWeight
    rw [PMF.map_apply, tsum_fintype]
    simp only [p, PMF.ofFintype_apply]
    rw [ENNReal.ofReal_sum_of_nonneg
      (s := Finset.univ.filter fun i ↦ point i = z) (fun i _ ↦ hweight i)]
    simp only [Finset.sum_filter]
    apply Finset.sum_congr rfl
    intro i _
    simp only [eq_comm]
  · rw [PMF.integral_eq_sum]
    apply Finset.sum_congr rfl
    intro i _
    simp only [p, PMF.ofFintype_apply, ENNReal.toReal_ofReal (hweight i)]

/-- If two distinct indices carry the same point and both weights are
positive, the geometric point mass is strictly larger than either displayed
individual weight.  Thus the source assertion `P(Z = z_i) = λ_i` cannot hold
for repeated vertices. -/
theorem weight_lt_fiberWeight_of_coincident
    {ι E : Type*} [Fintype ι]
    (point : ι → E) (weight : ι → ℝ) (hweight : ∀ k, 0 ≤ weight k)
    {i j : ι} (hij : i ≠ j) (hpoint : point i = point j)
    (hj : 0 < weight j) :
    weight i < fiberWeight point weight (point i) := by
  classical
  let fiber := Finset.univ.filter fun k ↦ point k = point i
  have hiFiber : i ∈ fiber := by simp [fiber]
  have hjErase : j ∈ fiber.erase i := by simp [fiber, hij.symm, hpoint.symm]
  have hj_le : weight j ≤ ∑ k ∈ fiber.erase i, weight k :=
    Finset.single_le_sum (fun k _ ↦ hweight k) hjErase
  have hdecomp := Finset.sum_erase_add fiber weight hiFiber
  unfold fiberWeight
  change weight i < ∑ k ∈ fiber, weight k
  linarith

/-- Construct finitely many iid copies of the random point encoded by
nonnegative normalized index weights.  The copies have the corrected
pushforward law, are mutually independent, are integrable, and retain the
weighted-sum expectation.

Source: Vershynin, proof of Theorem 0.0.2, printed page 2
(`HDP-00-LEM-INDEPENDENT-COPIES-FINITE`). -/
theorem finiteWeight_iidCopies
    {ι : Type u} {E : Type*} [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    [MeasurableSpace E]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (point : ι → E) (weight : ι → ℝ)
    (hweight : ∀ i, 0 ≤ weight i) (hsum : ∑ i, weight i = 1) (k : ℕ) :
    ∃ (p : PMF ι) (Ω : Type u) (_ : MeasurableSpace Ω)
        (P : MeasureTheory.Measure Ω) (Z : Fin k → Ω → E),
      (∀ i, p i = ENNReal.ofReal (weight i)) ∧
      (∀ j, ProbabilityTheory.HasLaw (Z j)
        (MeasureTheory.Measure.map point p.toMeasure) P) ∧
      ProbabilityTheory.iIndepFun Z P ∧
      MeasureTheory.IsProbabilityMeasure P ∧
      (∀ j, MeasureTheory.Integrable (Z j) P) ∧
      ∀ j, (∫ ω, Z j ω ∂P) = ∑ i, weight i • point i := by
  obtain ⟨p, hp, _hpushforward, hpmean⟩ :=
    finiteWeightPMF_exists point weight hweight hsum
  obtain ⟨Ω, mΩ, P, I, hImeas, hIlaw, hIindependent, hP⟩ :=
    ProbabilityTheory.exists_iid (Fin k) p.toMeasure
  let Z : Fin k → Ω → E := fun j ↦ point ∘ I j
  have hpointMeasurable : Measurable point := measurable_of_finite point
  have hpointIntegrable : MeasureTheory.Integrable point p.toMeasure :=
    MeasureTheory.Integrable.of_finite
  have hpointLaw : ProbabilityTheory.HasLaw point
      (MeasureTheory.Measure.map point p.toMeasure) p.toMeasure := {
    aemeasurable := hpointMeasurable.aemeasurable
    map_eq := rfl }
  refine ⟨p, Ω, mΩ, P, Z, hp, ?_, ?_, hP, ?_, ?_⟩
  · intro j
    exact hpointLaw.comp (hIlaw j)
  · exact hIindependent.comp (fun _ ↦ point) (fun _ ↦ hpointMeasurable)
  · intro j
    have hpull : MeasureTheory.Integrable point
        (MeasureTheory.Measure.map (I j) P) := by
      rw [(hIlaw j).map_eq]
      exact hpointIntegrable
    simpa [Z] using hpull.comp_aemeasurable (hIlaw j).aemeasurable
  · intro j
    calc
      (∫ ω, Z j ω ∂P) = ∫ i, point i ∂p.toMeasure := by
        simpa [Z] using
          (hIlaw j).integral_comp hpointIntegrable.aestronglyMeasurable
      _ = ∑ i, weight i • point i := hpmean

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

/-- For independent Hilbert-space-valued random variables, the expected
inner product factors as the inner product of their expectations.

This is the off-diagonal cancellation mechanism in Exercise 0.0.3(a). -/
theorem integral_inner_eq_inner_integral_of_indepFun
    {Ω E : Type*} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    {X Y : Ω → E} (hX : MeasureTheory.MemLp X 2 μ)
    (hY : MeasureTheory.MemLp Y 2 μ)
    (hXY : ProbabilityTheory.IndepFun X Y μ) :
    (∫ ω, ⟪X ω, Y ω⟫_ℝ ∂μ) =
      ⟪∫ ω, X ω ∂μ, ∫ ω, Y ω ∂μ⟫_ℝ := by
  have hXi : MeasureTheory.Integrable X μ := hX.integrable (by norm_num)
  have hYi : MeasureTheory.Integrable Y μ := hY.integrable (by norm_num)
  have hXm : MeasureTheory.Integrable (fun x : E ↦ x) (μ.map X) := by
    rw [MeasureTheory.integrable_map_measure (by fun_prop) hX.aemeasurable]
    simpa only [Function.comp_id] using hXi
  have hYm : MeasureTheory.Integrable (fun y : E ↦ y) (μ.map Y) := by
    rw [MeasureTheory.integrable_map_measure (by fun_prop) hY.aemeasurable]
    simpa only [Function.comp_id] using hYi
  have hprod : MeasureTheory.Integrable (fun z : E × E ↦ ⟪z.1, z.2⟫_ℝ)
      ((μ.map X).prod (μ.map Y)) := by
    exact MeasureTheory.Integrable.op_fst_snd continuous_inner
      ⟨1, fun x y ↦ by simpa only [one_mul, Real.norm_eq_abs] using
        (norm_inner_le_norm (𝕜 := ℝ) x y)⟩ hXm hYm
  calc
    (∫ ω, ⟪X ω, Y ω⟫_ℝ ∂μ) =
        ∫ z : E × E, ⟪z.1, z.2⟫_ℝ ∂μ.map (fun ω ↦ (X ω, Y ω)) := by
          rw [MeasureTheory.integral_map (hX.aemeasurable.prodMk hY.aemeasurable)]
          exact continuous_inner.aestronglyMeasurable
    _ = ∫ z : E × E, ⟪z.1, z.2⟫_ℝ ∂((μ.map X).prod (μ.map Y)) := by
          rw [(ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map
            hX.aemeasurable hY.aemeasurable).1 hXY]
    _ = ∫ x : E, ∫ y : E, ⟪x, y⟫_ℝ ∂μ.map Y ∂μ.map X :=
          MeasureTheory.integral_prod _ hprod
    _ = ∫ x : E, ⟪x, ∫ y : E, y ∂μ.map Y⟫_ℝ ∂μ.map X := by
          congr 1
          funext x
          exact integral_inner hYm x
    _ = ⟪∫ x : E, x ∂μ.map X, ∫ y : E, y ∂μ.map Y⟫_ℝ := by
          simpa only [real_inner_comm] using
            (integral_inner (𝕜 := ℝ) hXm (∫ y : E, y ∂μ.map Y))
    _ = ⟪∫ ω, X ω ∂μ, ∫ ω, Y ω ∂μ⟫_ℝ := by
          rw [MeasureTheory.integral_map hX.aemeasurable,
            MeasureTheory.integral_map hY.aemeasurable]
          all_goals fun_prop

/-- The second moment of a finite sum of independent, mean-zero random
variables in a real Hilbert space is the sum of their second moments.

The second-countability assumption supplies the standard Borel interface for
the joint-law argument; it holds in particular for every Euclidean space.

Source: Vershynin, Exercise 0.0.3(a), printed page 3
(`HDP-00-EX-0.0.3A`). -/
theorem independentMeanZero_secondMoment_sum
    {ι Ω E : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (Z : ι → Ω → E) (hZ : ∀ i, MeasureTheory.MemLp (Z i) 2 μ)
    (hmean : ∀ i, ∫ ω, Z i ω ∂μ = 0)
    (hindep : ProbabilityTheory.iIndepFun Z μ) :
    (∫ ω, ‖∑ i, Z i ω‖ ^ 2 ∂μ) =
      ∑ i, ∫ ω, ‖Z i ω‖ ^ 2 ∂μ := by
  classical
  have hinner (i j : ι) :
      MeasureTheory.Integrable (fun ω ↦ ⟪Z i ω, Z j ω⟫_ℝ) μ := by
    have hnormprod :
        MeasureTheory.Integrable (fun ω ↦ ‖Z i ω‖ * ‖Z j ω‖) μ := by
      simpa only [Pi.mul_apply] using (hZ i).norm.integrable_mul (hZ j).norm
    exact hnormprod.mono
      ((hZ i).aestronglyMeasurable.inner (hZ j).aestronglyMeasurable)
      (MeasureTheory.ae_of_all _ fun ω ↦ by
        simp only [Real.norm_eq_abs]
        calc
          |⟪Z i ω, Z j ω⟫_ℝ| ≤ ‖Z i ω‖ * ‖Z j ω‖ :=
            norm_inner_le_norm (𝕜 := ℝ) (Z i ω) (Z j ω)
          _ = |‖Z i ω‖ * ‖Z j ω‖| :=
            (abs_of_nonneg (mul_nonneg (norm_nonneg _) (norm_nonneg _))).symm)
  simp_rw [← real_inner_self_eq_norm_sq, sum_inner, inner_sum]
  rw [MeasureTheory.integral_finset_sum Finset.univ]
  · apply Finset.sum_congr rfl
    intro i hi
    rw [MeasureTheory.integral_finset_sum Finset.univ]
    · rw [Finset.sum_eq_single i]
      · intro j _hj hji
        rw [integral_inner_eq_inner_integral_of_indepFun (hZ i) (hZ j)
          (hindep.indepFun hji.symm), hmean i, hmean j]
        simp
      · simp
    · exact fun j _hj ↦ hinner i j
  · exact fun i _hi ↦
      MeasureTheory.integrable_finset_sum Finset.univ fun j _hj ↦ hinner i j

/-- Euclidean specialization of `independentMeanZero_secondMoment_sum`. -/
theorem independentMeanZero_euclidean_secondMoment_sum
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ] (n : ℕ)
    [MeasurableSpace (EuclideanSpace ℝ (Fin n))]
    [BorelSpace (EuclideanSpace ℝ (Fin n))]
    (Z : ι → Ω → EuclideanSpace ℝ (Fin n))
    (hZ : ∀ i, MeasureTheory.MemLp (Z i) 2 μ)
    (hmean : ∀ i, ∫ ω, Z i ω ∂μ = 0)
    (hindep : ProbabilityTheory.iIndepFun Z μ) :
    (∫ ω, ‖∑ i, Z i ω‖ ^ 2 ∂μ) =
      ∑ i, ∫ ω, ‖Z i ω‖ ^ 2 ∂μ :=
  independentMeanZero_secondMoment_sum Z hZ hmean hindep

/-- Centering subtracts exactly the squared norm of the mean from the second
moment of a square-integrable random variable in a real Hilbert space.

Source: Vershynin, Exercise 0.0.3(b), printed page 3
(`HDP-00-EX-0.0.3B`). -/
theorem centered_secondMoment
    {Ω E : Type*} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    (Z : Ω → E) (hZ : MeasureTheory.MemLp Z 2 μ) :
    (∫ ω, ‖Z ω - ∫ ω, Z ω ∂μ‖ ^ 2 ∂μ) =
      (∫ ω, ‖Z ω‖ ^ 2 ∂μ) - ‖∫ ω, Z ω ∂μ‖ ^ 2 := by
  let m : E := ∫ ω, Z ω ∂μ
  have hZi : MeasureTheory.Integrable Z μ := hZ.integrable (by norm_num)
  have hsq : MeasureTheory.Integrable (fun ω ↦ ‖Z ω‖ ^ 2) μ :=
    hZ.integrable_norm_pow (by norm_num)
  have hinner : MeasureTheory.Integrable (fun ω ↦ ⟪Z ω, m⟫_ℝ) μ :=
    hZi.inner_const m
  have htwice : MeasureTheory.Integrable (fun ω ↦ 2 * ⟪Z ω, m⟫_ℝ) μ :=
    hinner.const_mul 2
  have hconst : MeasureTheory.Integrable (fun _ : Ω ↦ ‖m‖ ^ 2) μ :=
    MeasureTheory.integrable_const _
  have hint : (∫ ω, ⟪Z ω, m⟫_ℝ ∂μ) = ⟪m, m⟫_ℝ := by
    simpa only [real_inner_comm] using
      (integral_inner (𝕜 := ℝ) hZi m)
  change (∫ ω, ‖Z ω - m‖ ^ 2 ∂μ) =
    (∫ ω, ‖Z ω‖ ^ 2 ∂μ) - ‖m‖ ^ 2
  simp_rw [norm_sub_sq_real]
  calc
    (∫ ω, ‖Z ω‖ ^ 2 - 2 * ⟪Z ω, m⟫_ℝ + ‖m‖ ^ 2 ∂μ) =
        (∫ ω, ‖Z ω‖ ^ 2 - 2 * ⟪Z ω, m⟫_ℝ ∂μ) +
          ∫ _ : Ω, ‖m‖ ^ 2 ∂μ :=
      MeasureTheory.integral_add (hsq.sub htwice) hconst
    _ = ((∫ ω, ‖Z ω‖ ^ 2 ∂μ) - ∫ ω, 2 * ⟪Z ω, m⟫_ℝ ∂μ) +
          ∫ _ : Ω, ‖m‖ ^ 2 ∂μ := by
      rw [MeasureTheory.integral_sub hsq htwice]
    _ = (∫ ω, ‖Z ω‖ ^ 2 ∂μ) - ‖m‖ ^ 2 := by
      rw [MeasureTheory.integral_const_mul, hint]
      simp only [MeasureTheory.integral_const, MeasureTheory.probReal_univ,
        one_smul, real_inner_self_eq_norm_sq]
      ring

/-- Euclidean specialization of `centered_secondMoment`. -/
theorem centered_euclidean_secondMoment
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    (n : ℕ) (Z : Ω → EuclideanSpace ℝ (Fin n))
    (hZ : MeasureTheory.MemLp Z 2 μ) :
    (∫ ω, ‖Z ω - ∫ ω, Z ω ∂μ‖ ^ 2 ∂μ) =
      (∫ ω, ‖Z ω‖ ^ 2 ∂μ) - ‖∫ ω, Z ω ∂μ‖ ^ 2 :=
  centered_secondMoment Z hZ

/-- Exact mean-square error of an empirical average of independent copies.
The common centered second moment is named `σ2`; for identically distributed
copies it is the variance term of any one copy.

Source: Vershynin, displayed computation in the proof of Theorem 0.0.2,
printed pages 2--3 (`HDP-00-LEM-MEAN-SQUARE-EMPIRICAL`). -/
theorem meanSquare_empiricalAverage
    {Ω E : Type*} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (k : ℕ) (hk : 0 < k) (Z : Fin k → Ω → E) (m : E) (σ2 : ℝ)
    (hZ : ∀ j, MeasureTheory.MemLp (Z j) 2 μ)
    (hmean : ∀ j, ∫ ω, Z j ω ∂μ = m)
    (hmoment : ∀ j, (∫ ω, ‖Z j ω - m‖ ^ 2 ∂μ) = σ2)
    (hindep : ProbabilityTheory.iIndepFun Z μ) :
    (∫ ω, ‖(k : ℝ)⁻¹ • (∑ j, Z j ω) - m‖ ^ 2 ∂μ) =
      (k : ℝ)⁻¹ * σ2 := by
  let W : Fin k → Ω → E := fun j ω ↦ Z j ω - m
  have hW : ∀ j, MeasureTheory.MemLp (W j) 2 μ := fun j ↦
    (hZ j).sub (MeasureTheory.memLp_const m)
  have hWmean : ∀ j, ∫ ω, W j ω ∂μ = 0 := by
    intro j
    rw [show (fun ω ↦ W j ω) = (fun ω ↦ Z j ω - m) from rfl,
      MeasureTheory.integral_sub ((hZ j).integrable (by norm_num))
        (MeasureTheory.integrable_const m), hmean j,
      MeasureTheory.integral_const, MeasureTheory.probReal_univ, one_smul, sub_self]
  have hWindep : ProbabilityTheory.iIndepFun W μ := by
    simpa only [W, Function.comp_def] using
      hindep.comp (fun _ z ↦ z - m) (fun _ ↦ by fun_prop)
  have hsumMoment :
      (∫ ω, ‖∑ j, W j ω‖ ^ 2 ∂μ) = k * σ2 := by
    rw [independentMeanZero_secondMoment_sum W hW hWmean hWindep]
    have hWmoment (j : Fin k) : (∫ ω, ‖W j ω‖ ^ 2 ∂μ) = σ2 := by
      simpa only [W] using hmoment j
    simp_rw [hWmoment]
    simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  have hkReal : (k : ℝ) ≠ 0 := by exact_mod_cast hk.ne'
  have hcenter (ω : Ω) :
      (k : ℝ)⁻¹ • (∑ j, Z j ω) - m =
        (k : ℝ)⁻¹ • (∑ j, W j ω) := by
    simp only [W, Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ,
      Fintype.card_fin, smul_sub]
    rw [← Nat.cast_smul_eq_nsmul ℝ, ← mul_smul, inv_mul_cancel₀ hkReal, one_smul]
  simp_rw [hcenter]
  have hnorm (ω : Ω) :
      ‖(k : ℝ)⁻¹ • (∑ j, W j ω)‖ ^ 2 =
        ((k : ℝ)⁻¹) ^ 2 * ‖∑ j, W j ω‖ ^ 2 := by
    rw [norm_smul, Real.norm_eq_abs, abs_inv,
      abs_of_nonneg (show 0 ≤ (k : ℝ) by positivity)]
    ring
  simp_rw [hnorm]
  rw [MeasureTheory.integral_const_mul, hsumMoment]
  field_simp [hkReal]

/-- The corresponding bound when the common centered second moment is at
most `R²`. -/
theorem meanSquare_empiricalAverage_le
    {Ω E : Type*} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (k : ℕ) (hk : 0 < k) (Z : Fin k → Ω → E) (m : E) (σ2 R : ℝ)
    (hZ : ∀ j, MeasureTheory.MemLp (Z j) 2 μ)
    (hmean : ∀ j, ∫ ω, Z j ω ∂μ = m)
    (hmoment : ∀ j, (∫ ω, ‖Z j ω - m‖ ^ 2 ∂μ) = σ2)
    (hindep : ProbabilityTheory.iIndepFun Z μ) (hσ : σ2 ≤ R ^ 2) :
    (∫ ω, ‖(k : ℝ)⁻¹ • (∑ j, Z j ω) - m‖ ^ 2 ∂μ) ≤
      (k : ℝ)⁻¹ * R ^ 2 := by
  rw [meanSquare_empiricalAverage k hk Z m σ2 hZ hmean hmoment hindep]
  exact mul_le_mul_of_nonneg_left hσ (inv_nonneg.mpr (Nat.cast_nonneg k))

/-- A square-integrable Hilbert-space-valued random variable supported in the
closed ball of radius `R` has centered second moment at most `R²`. -/
theorem centered_secondMoment_le_sq_of_ae_norm_le
    {Ω E : Type*} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    (Z : Ω → E) (hZ : MeasureTheory.MemLp Z 2 μ) (R : ℝ) (hR : 0 ≤ R)
    (hbound : ∀ᵐ ω ∂μ, ‖Z ω‖ ≤ R) :
    (∫ ω, ‖Z ω - ∫ ω, Z ω ∂μ‖ ^ 2 ∂μ) ≤ R ^ 2 := by
  rw [centered_secondMoment Z hZ]
  have hsq : MeasureTheory.Integrable (fun ω ↦ ‖Z ω‖ ^ 2) μ :=
    hZ.integrable_norm_pow (by norm_num)
  have hconst : MeasureTheory.Integrable (fun _ : Ω ↦ R ^ 2) μ :=
    MeasureTheory.integrable_const _
  have hsecond : (∫ ω, ‖Z ω‖ ^ 2 ∂μ) ≤ R ^ 2 := by
    calc
      (∫ ω, ‖Z ω‖ ^ 2 ∂μ) ≤ ∫ _ : Ω, R ^ 2 ∂μ :=
        MeasureTheory.integral_mono_ae hsq hconst <|
          hbound.mono fun ω hω ↦
            (sq_le_sq₀ (norm_nonneg (Z ω)) hR).2 hω
      _ = R ^ 2 := by
        simp only [MeasureTheory.integral_const, MeasureTheory.probReal_univ, one_smul]
  exact (sub_le_self _ (sq_nonneg _)).trans hsecond

/-- Radius-bound form of the empirical mean-square estimate.  Since all
copies have the same centered second moment, it suffices to impose the
almost-sure radius bound on the first copy. -/
theorem meanSquare_empiricalAverage_le_of_ae_norm_le
    {Ω E : Type*} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (k : ℕ) (hk : 0 < k) (Z : Fin k → Ω → E) (m : E) (σ2 R : ℝ)
    (hZ : ∀ j, MeasureTheory.MemLp (Z j) 2 μ)
    (hmean : ∀ j, ∫ ω, Z j ω ∂μ = m)
    (hmoment : ∀ j, (∫ ω, ‖Z j ω - m‖ ^ 2 ∂μ) = σ2)
    (hindep : ProbabilityTheory.iIndepFun Z μ) (hR : 0 ≤ R)
    (hbound : ∀ᵐ ω ∂μ, ‖Z ⟨0, hk⟩ ω‖ ≤ R) :
    (∫ ω, ‖(k : ℝ)⁻¹ • (∑ j, Z j ω) - m‖ ^ 2 ∂μ) ≤
      (k : ℝ)⁻¹ * R ^ 2 := by
  apply meanSquare_empiricalAverage_le k hk Z m σ2 R hZ hmean hmoment hindep
  rw [← hmoment ⟨0, hk⟩, ← hmean ⟨0, hk⟩]
  exact centered_secondMoment_le_sq_of_ae_norm_le
    (Z ⟨0, hk⟩) (hZ ⟨0, hk⟩) R hR hbound

/-- A nonpositive integer cannot be the positive cardinality of the empirical
average used in Theorem 0.0.2.  This records the source-domain defect in the
printed phrase “every integer `k`”: at `k = 0` the reciprocal and square-root
scale are undefined, while negative integers cannot index a finite sample. -/
theorem nonpositiveInteger_not_validEmpiricalSampleCount
    (k : ℤ) (hk : k ≤ 0) :
    ¬ ∃ n : ℕ, 0 < n ∧ (n : ℤ) = k := by
  rintro ⟨n, hn, rfl⟩
  exact (not_lt_of_ge hk) (by exact_mod_cast hn)

/-- Scale-covariant approximate Carathéodory theorem obtained by the
empirical method.  Repetitions in the returned `Fin k` family are allowed.

Source: Vershynin, Theorem 0.0.2 and footnote 1, printed pages 2--3
(`HDP-00-THM-0.0.2`, corrected to `0 < k`). -/
theorem approximateCaratheodory_diameter
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    {T : Set E} {x : E} (hT : Bornology.IsBounded T)
    (hx : x ∈ convexHull ℝ T) (k : ℕ) (hk : 0 < k) :
    ∃ point : Fin k → E, (∀ j, point j ∈ T) ∧
      ‖x - (k : ℝ)⁻¹ • ∑ j, point j‖ ≤ diameter T / Real.sqrt k := by
  classical
  obtain ⟨ι, instι, weight, point, hweight, hweightSum, hpoint, hvalue⟩ :=
    mem_convexHull_iff_finiteCoefficients.mp hx
  letI : Fintype ι := instι
  letI : MeasurableSpace ι := ⊤
  obtain ⟨t₀, ht₀⟩ : T.Nonempty := convexHull_nonempty_iff.mp ⟨x, hx⟩
  let q : ι → E := fun i ↦ point i - t₀
  have hqBound (i : ι) : ‖q i‖ ≤ diameter T := by
    rw [show q i = point i - t₀ from rfl, norm_sub_eq_dist]
    exact Metric.dist_le_diam_of_mem hT (hpoint i) ht₀
  have hqMean : ∑ i, weight i • q i = x - t₀ := by
    simp only [q, smul_sub, Finset.sum_sub_distrib, ← Finset.sum_smul,
      hweightSum, one_smul, hvalue]
  obtain ⟨p₀, _hp₀, _hpush₀, hp₀Mean⟩ :=
    finiteWeightPMF_exists q weight hweight hweightSum
  have hqExpectation : (∫ i, q i ∂p₀.toMeasure) = x - t₀ :=
    hp₀Mean.trans hqMean
  obtain ⟨p, Ω, mΩ, P, Z, _hp, hZlaw, hZindep, hP, _hZintegrable, hZmean⟩ :=
    finiteWeight_iidCopies q weight hweight hweightSum k
  letI : MeasurableSpace Ω := mΩ
  letI : MeasureTheory.IsProbabilityMeasure P := hP
  have hqMeasurable : Measurable q := measurable_of_finite q
  have hqLaw : ProbabilityTheory.HasLaw q
      (MeasureTheory.Measure.map q p.toMeasure) p.toMeasure := {
    aemeasurable := hqMeasurable.aemeasurable
    map_eq := rfl }
  have hident (j : Fin k) :
      ProbabilityTheory.IdentDistrib q (Z j) p.toMeasure P :=
    hqLaw.identDistrib (hZlaw j)
  have hqLp : MeasureTheory.MemLp q 2 p.toMeasure :=
    MeasureTheory.MemLp.of_bound hqMeasurable.aestronglyMeasurable
      (diameter T) (Filter.Eventually.of_forall hqBound)
  have hZLp : ∀ j, MeasureTheory.MemLp (Z j) 2 P := fun j ↦
    (hident j).memLp_snd hqLp
  have hmean : ∀ j, (∫ ω, Z j ω ∂P) = x - t₀ := fun j ↦
    (hZmean j).trans (hp₀Mean.symm.trans hqExpectation)
  let σ2 : ℝ := ∫ i, ‖q i - (x - t₀)‖ ^ 2 ∂p.toMeasure
  have hmoment : ∀ j, (∫ ω, ‖Z j ω - (x - t₀)‖ ^ 2 ∂P) = σ2 := by
    intro j
    have hsqIdent := (hident j).comp
      (show Measurable (fun z : E ↦ ‖z - (x - t₀)‖ ^ 2) by fun_prop)
    exact hsqIdent.integral_eq.symm
  have hfirstBound : ∀ᵐ ω ∂P, ‖Z ⟨0, hk⟩ ω‖ ≤ diameter T :=
    (hident ⟨0, hk⟩).ae_snd (measurableSet_le measurable_norm measurable_const)
      (Filter.Eventually.of_forall hqBound)
  have hmeanSquare :
      (∫ ω, ‖(k : ℝ)⁻¹ • (∑ j, Z j ω) - (x - t₀)‖ ^ 2 ∂P) ≤
        (k : ℝ)⁻¹ * diameter T ^ 2 := by
    exact meanSquare_empiricalAverage_le_of_ae_norm_le
      k hk Z (x - t₀) σ2 (diameter T) hZLp hmean hmoment hZindep
        Metric.diam_nonneg hfirstBound
  let A : Ω → E := fun ω ↦ (k : ℝ)⁻¹ • ∑ j, Z j ω
  have hALp : MeasureTheory.MemLp A 2 P := by
    have hsum : MeasureTheory.MemLp (fun ω ↦ ∑ j, Z j ω) 2 P :=
      MeasureTheory.memLp_finset_sum Finset.univ fun j _ ↦ hZLp j
    simpa only [A, Pi.smul_apply] using hsum.const_smul (k : ℝ)⁻¹
  have herrorIntegrable :
      MeasureTheory.Integrable (fun ω ↦ ‖A ω - (x - t₀)‖ ^ 2) P :=
    (hALp.sub (MeasureTheory.memLp_const (x - t₀))).integrable_norm_pow
      (by norm_num)
  have hsupport (j : Fin k) : ∀ᵐ ω ∂P, Z j ω ∈ Set.range q :=
    (hident j).ae_mem_snd (Set.finite_range q).measurableSet
      (Filter.Eventually.of_forall Set.mem_range_self)
  have hsupportAll : ∀ᵐ ω ∂P, ∀ j, Z j ω ∈ Set.range q :=
    Filter.eventually_all.mpr hsupport
  let bad : Set Ω := {ω | ¬ ∀ j, Z j ω ∈ Set.range q}
  have hbad : P bad = 0 := by
    exact MeasureTheory.ae_iff.mp hsupportAll
  have hmeanSquareA : (∫ ω, ‖A ω - (x - t₀)‖ ^ 2 ∂P) ≤
      (k : ℝ)⁻¹ * diameter T ^ 2 := by
    simpa only [A] using hmeanSquare
  obtain ⟨ω, hωbad, hωerror⟩ :=
    exists_notMem_null_le_of_integral_le herrorIntegrable hmeanSquareA hbad
  let sample : Fin k → E := fun j ↦ Z j ω + t₀
  have hωsupport : ∀ j, Z j ω ∈ Set.range q := by
    simpa only [bad, Set.mem_setOf_eq, not_not] using hωbad
  have hsample (j : Fin k) : sample j ∈ T := by
    obtain ⟨i, hi⟩ := hωsupport j
    rw [show sample j = Z j ω + t₀ from rfl, ← hi]
    simpa only [q, sub_add_cancel] using hpoint i
  refine ⟨sample, hsample, ?_⟩
  have hkReal : (k : ℝ) ≠ 0 := by exact_mod_cast hk.ne'
  have hcancel : (k : ℝ)⁻¹ • (k • t₀) = t₀ := by
    rw [← Nat.cast_smul_eq_nsmul ℝ, ← mul_smul, inv_mul_cancel₀ hkReal, one_smul]
  have herrorEq :
      ‖x - (k : ℝ)⁻¹ • ∑ j, sample j‖ =
        ‖A ω - (x - t₀)‖ := by
    have hvector :
        x - (k : ℝ)⁻¹ • ∑ j, sample j = -(A ω - (x - t₀)) := by
      simp only [sample, A, Finset.sum_add_distrib, Finset.sum_const,
        Finset.card_univ, Fintype.card_fin, smul_add, hcancel]
      abel
    rw [hvector, norm_neg]
  rw [herrorEq]
  have hsqrtPos : 0 < Real.sqrt (k : ℝ) :=
    Real.sqrt_pos.2 (by exact_mod_cast hk)
  have hright : 0 ≤ diameter T / Real.sqrt k :=
    div_nonneg Metric.diam_nonneg hsqrtPos.le
  rw [← sq_le_sq₀ (norm_nonneg _) hright]
  rw [div_pow, Real.sq_sqrt (by positivity : (0 : ℝ) ≤ k)]
  simpa only [div_eq_inv_mul, mul_comm] using hωerror

/-- Unit-diameter form of the approximate Carathéodory theorem stated in the
main text. -/
theorem approximateCaratheodory_unitDiameter
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    {T : Set E} {x : E} (hT : Bornology.IsBounded T)
    (hdiam : diameter T ≤ 1) (hx : x ∈ convexHull ℝ T)
    (k : ℕ) (hk : 0 < k) :
    ∃ point : Fin k → E, (∀ j, point j ∈ T) ∧
      ‖x - (k : ℝ)⁻¹ • ∑ j, point j‖ ≤ 1 / Real.sqrt k := by
  obtain ⟨point, hpoint, herror⟩ :=
    approximateCaratheodory_diameter hT hx k hk
  refine ⟨point, hpoint, herror.trans ?_⟩
  exact div_le_div_of_nonneg_right hdiam (Real.sqrt_nonneg k)

/-- The diameter-scaling exercise follows directly from the scale-covariant
form of Theorem 0.0.2.  The proof does not divide by the diameter, so the
zero-diameter case is included without a separate degeneracy argument.

Source: Vershynin, footnote 1, printed page 2
(`HDP-00-EX-DIAMETER-SCALING`). -/
theorem approximateCaratheodory_diameterScaling
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    {T : Set E} {x : E} (hT : Bornology.IsBounded T)
    (hx : x ∈ convexHull ℝ T) (k : ℕ) (hk : 0 < k) :
    ∃ point : Fin k → E, (∀ j, point j ∈ T) ∧
      ‖x - (k : ℝ)⁻¹ • ∑ j, point j‖ ≤ diameter T / Real.sqrt k := by
  have hdiam : 0 ≤ diameter T := Metric.diam_nonneg
  rw [← abs_of_nonneg hdiam]
  simpa only [abs_of_nonneg hdiam] using
    approximateCaratheodory_diameter hT hx k hk

/-- The product-form lower bound for a binomial coefficient. -/
theorem chooseLowerBoundReal : ∀ (m n : ℕ), 1 ≤ m → m ≤ n →
    ((n : ℝ) / m) ^ m ≤ (n.choose m : ℝ) := by
  intro m
  induction m with
  | zero => simp
  | succ m ih =>
      intro n hm hmn
      by_cases hm0 : m = 0
      · subst m
        simp
      have hmpos : 0 < m := Nat.pos_of_ne_zero hm0
      have hnpos : 0 < n := lt_of_lt_of_le (Nat.succ_pos m) hmn
      have himn : m ≤ n - 1 := by omega
      have hratio : (n : ℝ) / (m + 1) ≤ ((n - 1 : ℕ) : ℝ) / m := by
        rw [div_le_div_iff₀ (by positivity : (0 : ℝ) < m + 1)
          (by positivity : (0 : ℝ) < m)]
        norm_num only [Nat.cast_add, Nat.cast_one]
        rw [Nat.cast_sub (Nat.one_le_iff_ne_zero.mpr hnpos.ne')]
        norm_num only [Nat.cast_one]
        have hcast : (m : ℝ) ≤ ((n - 1 : ℕ) : ℝ) := by exact_mod_cast himn
        have hmnR : ((m + 1 : ℕ) : ℝ) ≤ n := by exact_mod_cast hmn
        norm_num only [Nat.cast_add, Nat.cast_one] at hmnR
        nlinarith
      have hratio_nonneg : 0 ≤ (n : ℝ) / (m + 1) := by positivity
      have hpow := pow_le_pow_left₀ hratio_nonneg hratio m
      have hih := ih (n - 1) (by omega) himn
      have hmul := mul_le_mul_of_nonneg_left (hpow.trans hih) hratio_nonneg
      calc
        ((n : ℝ) / ↑(m + 1)) ^ (m + 1) =
            ((n : ℝ) / ↑(m + 1)) * ((n : ℝ) / ↑(m + 1)) ^ m := by
              rw [pow_succ']
        _ ≤ ((n : ℝ) / ↑(m + 1)) * ((n - 1).choose m : ℝ) := by
          simpa only [Nat.cast_add, Nat.cast_one] using hmul
        _ = (n.choose (m + 1) : ℝ) := by
          rw [div_mul_eq_mul_div]
          apply (div_eq_iff (by positivity : ((m + 1 : ℕ) : ℝ) ≠ 0)).2
          have hnat : n * (n - 1).choose m = n.choose (m + 1) * (m + 1) := by
            simpa [Nat.sub_add_cancel (Nat.one_le_iff_ne_zero.mpr hnpos.ne')] using
              Nat.add_one_mul_choose_eq (n - 1) m
          exact_mod_cast hnat

/-- The binomial-theorem upper bound for the partial sum through rank `m`. -/
theorem choosePartialSumUpperBoundReal (m n : ℕ) (hm : 1 ≤ m) (hmn : m ≤ n) :
    (∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ)) ≤
      (Real.exp 1 * (n : ℝ) / m) ^ m := by
  let x : ℝ := (m : ℝ) / n
  have hn : 0 < n := lt_of_lt_of_le (Nat.zero_lt_of_lt hm) hmn
  have hx : 0 < x := by
    dsimp [x]
    positivity
  have hxle : x ≤ 1 := by
    dsimp [x]
    exact (div_le_one (by positivity : (0 : ℝ) < n)).2 (by exact_mod_cast hmn)
  have hweighted :
      x ^ m * (∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ)) ≤
        (x + 1) ^ n := by
    calc
      x ^ m * (∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ)) =
          ∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ) * x ^ m := by
            rw [Finset.mul_sum]
            apply Finset.sum_congr rfl
            intro k hk
            ring
      _ ≤ ∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ) * x ^ k := by
        apply Finset.sum_le_sum
        intro k hk
        apply mul_le_mul_of_nonneg_left
        · exact pow_le_pow_of_le_one hx.le hxle
            (Nat.le_of_lt_succ <| Finset.mem_range.1 hk)
        · positivity
      _ ≤ ∑ k ∈ Finset.range (n + 1), (n.choose k : ℝ) * x ^ k := by
        apply Finset.sum_le_sum_of_subset_of_nonneg
        · intro k hk
          simp only [Finset.mem_range] at hk ⊢
          omega
        · intro k _hk _hnot
          positivity
      _ = (x + 1) ^ n := by
        rw [add_pow]
        apply Finset.sum_congr rfl
        intro k hk
        simp only [one_pow, mul_one]
        ring
  have hexp : (x + 1) ^ n ≤ Real.exp 1 ^ m := by
    calc
      (x + 1) ^ n ≤ (Real.exp x) ^ n := by
        apply pow_le_pow_left₀
        · positivity
        · simpa [add_comm] using Real.add_one_le_exp x
      _ = Real.exp ((n : ℝ) * x) := (Real.exp_nat_mul x n).symm
      _ = Real.exp (m : ℝ) := by
        congr 1
        dsimp [x]
        field_simp
      _ = Real.exp 1 ^ m := by
        rw [← Real.exp_nat_mul]
        norm_num
  have hprod :
      x ^ m * (∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ)) ≤
        Real.exp 1 ^ m := hweighted.trans hexp
  calc
    (∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ)) ≤
        Real.exp 1 ^ m / x ^ m := by
          rw [le_div_iff₀ (pow_pos hx m)]
          simpa [mul_comm] using hprod
    _ = (Real.exp 1 / x) ^ m := (div_pow (Real.exp 1) x m).symm
    _ = (Real.exp 1 * (n : ℝ) / m) ^ m := by
      congr 1
      dsimp [x]
      field_simp

/-- The three binomial-coefficient inequalities of Exercise 0.0.5.

Source: Vershynin, Exercise 0.0.5, printed page 4
(`HDP-00-EX-0.0.5`). -/
theorem binomialCoefficientBounds (m n : ℕ) (hm : 1 ≤ m) (hmn : m ≤ n) :
    ((n : ℝ) / m) ^ m ≤ (n.choose m : ℝ) ∧
      (n.choose m : ℝ) ≤ ∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ) ∧
      (∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ)) ≤
        (Real.exp 1 * (n : ℝ) / m) ^ m := by
  refine ⟨chooseLowerBoundReal m n hm hmn, ?_,
    choosePartialSumUpperBoundReal m n hm hmn⟩
  exact Finset.single_le_sum (s := Finset.range (m + 1))
    (f := fun k ↦ (n.choose k : ℝ)) (fun k _hk ↦ by positivity) (by simp)

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

/-- Choosing `k = ⌈1 / ε²⌉` makes the empirical-method error scale
`1 / √k` at most `ε`. -/
theorem one_div_sqrt_natCeil_inv_sq_le {ε : ℝ} (hε : 0 < ε) :
    1 / Real.sqrt (Nat.ceil (1 / ε ^ 2) : ℝ) ≤ ε := by
  let k : ℕ := Nat.ceil (1 / ε ^ 2)
  have hk : 0 < k := Nat.ceil_pos.mpr (by positivity)
  have hkReal : 0 < (k : ℝ) := by exact_mod_cast hk
  have hεsq : 0 < ε ^ 2 := sq_pos_of_pos hε
  have hceil : 1 / ε ^ 2 ≤ (k : ℝ) := Nat.le_ceil _
  have hinv : (k : ℝ)⁻¹ ≤ ε ^ 2 := by
    simpa only [one_div] using (one_div_le hkReal hεsq).2 hceil
  have hsqrt : 0 < Real.sqrt (k : ℝ) := Real.sqrt_pos.2 hkReal
  rw [← sq_le_sq₀ (div_nonneg zero_le_one hsqrt.le) hε.le]
  rw [div_pow, one_pow, Real.sq_sqrt hkReal.le]
  simpa only [one_div] using hinv

/-- Ordered averages of `k = ⌈1 / ε²⌉` vertices form the finite cover in
Corollary 0.0.4, with at most `N^k` centers for `N` listed vertices.

Source: Vershynin, Corollary 0.0.4, printed pages 3--4
(`HDP-00-COR-0.0.4`). -/
theorem finitePolytope_orderedAverage_cover
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (vertices : Finset E) (hdiam : diameter (vertices : Set E) ≤ 1)
    (ε : NNReal) (hε : 0 < ε) :
    let k := Nat.ceil (1 / (ε : ℝ) ^ 2)
    IsFiniteClosedCover (finitePolytope vertices)
        (orderedAverageSet (fun v : ↥vertices ↦ (v : E)) k) ε ∧
      (orderedAverageSet (fun v : ↥vertices ↦ (v : E)) k).card ≤
        vertices.card ^ k := by
  classical
  let k : ℕ := Nat.ceil (1 / (ε : ℝ) ^ 2)
  let vertex : ↥vertices → E := fun v ↦ (v : E)
  have hk : 0 < k := Nat.ceil_pos.mpr (by positivity)
  have hscale : 1 / Real.sqrt (k : ℝ) ≤ (ε : ℝ) := by
    exact one_div_sqrt_natCeil_inv_sq_le (by exact_mod_cast hε)
  have hbounded : Bornology.IsBounded (vertices : Set E) :=
    vertices.finite_toSet.isBounded
  have hdiamNonneg : 0 ≤ diameter (vertices : Set E) := Metric.diam_nonneg
  have hdiamUnit : diameter (vertices : Set E) ≤ 1 := by
    rw [← abs_of_nonneg hdiamNonneg]
    simpa only [abs_of_nonneg hdiamNonneg] using hdiam
  constructor
  · rw [isFiniteClosedCover_iff]
    intro y hy
    have hyHull : y ∈ convexHull ℝ (vertices : Set E) := by
      simpa only [finitePolytope] using hy
    obtain ⟨sample, hsample, herror⟩ :=
      approximateCaratheodory_unitDiameter hbounded hdiamUnit hyHull k hk
    let tuple : Fin k → ↥vertices := fun j ↦ ⟨sample j, hsample j⟩
    let center : E := (k : ℝ)⁻¹ • ∑ j, vertex (tuple j)
    refine ⟨center, ?_, ?_⟩
    · rw [orderedAverageSet]
      exact Finset.mem_image.mpr ⟨tuple, Finset.mem_univ tuple, rfl⟩
    · rw [dist_eq_norm]
      simpa only [center, vertex, tuple] using herror.trans hscale
  · simpa only [vertex, Fintype.card_coe] using
      card_orderedAverageSet_le vertex k

/-- Average represented by an unordered selection with repetition. -/
noncomputable def unorderedAverage {α E : Type*} [AddCommMonoid E] [Module ℝ E]
    (point : α → E) {k : ℕ} (selection : UnorderedSelections α k) : E :=
  (k : ℝ)⁻¹ • ((selection : Multiset α).map point).sum

/-- The finite set of averages indexed by size-`k` multisets. -/
noncomputable def unorderedAverageSet {α E : Type*} [Fintype α]
    [AddCommMonoid E] [Module ℝ E] (point : α → E) (k : ℕ) : Finset E := by
  classical
  exact (Finset.univ : Finset (UnorderedSelections α k)).image
    (unorderedAverage point)

/- Passing from unordered selections to their averages cannot increase
cardinality, so stars and bars gives the sharp combinatorial count. -/
set_option maxHeartbeats 800000 in
theorem card_unorderedAverageSet_le_choose {α E : Type*} [Fintype α]
    [AddCommMonoid E] [Module ℝ E] (point : α → E) (k : ℕ) :
    (unorderedAverageSet point k).card ≤
      (Fintype.card α + k - 1).choose k := by
  classical
  calc
    (unorderedAverageSet point k).card ≤
        Fintype.card (UnorderedSelections α k) := by
      rw [unorderedAverageSet]
      exact Finset.card_image_le.trans_eq Finset.card_univ
    _ = (Fintype.card α + k - 1).choose k :=
      Sym.card_sym_eq_choose k

/- Every ordered tuple determines the same average as its underlying
multiset, so the unordered-average set retains the cover from Corollary
0.0.4. -/
set_option maxHeartbeats 800000 in
theorem finitePolytope_unorderedAverage_cover
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (vertices : Finset E) (hdiam : diameter (vertices : Set E) ≤ 1)
    (ε : NNReal) (hε : 0 < ε) :
    let k := Nat.ceil (1 / (ε : ℝ) ^ 2)
    IsFiniteClosedCover (finitePolytope vertices)
      (unorderedAverageSet (fun v : ↥vertices ↦ (v : E)) k) ε := by
  classical
  let k : ℕ := Nat.ceil (1 / (ε : ℝ) ^ 2)
  let vertex : ↥vertices → E := fun v ↦ (v : E)
  change IsFiniteClosedCover (finitePolytope vertices)
    (unorderedAverageSet vertex k) ε
  have hordered : IsFiniteClosedCover (finitePolytope vertices)
      (orderedAverageSet vertex k) ε := by
    simpa only [k, vertex] using
      (finitePolytope_orderedAverage_cover vertices hdiam ε hε).1
  rw [isFiniteClosedCover_iff] at hordered ⊢
  intro y hy
  obtain ⟨center, hcenter, hdist⟩ := hordered y hy
  rw [orderedAverageSet] at hcenter
  obtain ⟨tuple, _htuple, rfl⟩ := Finset.mem_image.mp hcenter
  let selection : UnorderedSelections ↥vertices k :=
    ⟨(Finset.univ : Finset (Fin k)).val.map tuple, by simp⟩
  refine ⟨(k : ℝ)⁻¹ • ∑ j, vertex (tuple j), ?_, hdist⟩
  rw [unorderedAverageSet]
  apply Finset.mem_image.mpr
  refine ⟨selection, by simp, ?_⟩
  simp only [unorderedAverage, selection, Sym.toMultiset, Multiset.map_map,
    Function.comp_apply, Finset.sum, vertex]

/-- Exercise 0.0.6 with the concrete universal constant `C = 3`.
The center count is interpreted in `ℝ`, matching the real-valued estimate in
Exercise 0.0.5.

Source: Vershynin, Exercise 0.0.6, printed page 4
(`HDP-00-EX-0.0.6`). -/
theorem finitePolytope_unorderedAverage_cover_universalConstant
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E] :
    ∃ C : ℝ, 0 < C ∧
      ∀ (vertices : Finset E), diameter (vertices : Set E) ≤ 1 →
        ∀ (ε : NNReal), 0 < ε →
          let k := Nat.ceil (1 / (ε : ℝ) ^ 2)
          IsFiniteClosedCover (finitePolytope vertices)
              (unorderedAverageSet (fun v : ↥vertices ↦ (v : E)) k) ε ∧
            ((unorderedAverageSet
                (fun v : ↥vertices ↦ (v : E)) k).card : ℝ) ≤
              (C + C * (ε : ℝ) ^ 2 * vertices.card) ^ k := by
  classical
  refine ⟨3, by norm_num, ?_⟩
  intro vertices hdiam ε hε
  let k : ℕ := Nat.ceil (1 / (ε : ℝ) ^ 2)
  let vertex : ↥vertices → E := fun v ↦ (v : E)
  change IsFiniteClosedCover (finitePolytope vertices)
      (unorderedAverageSet vertex k) ε ∧
    ((unorderedAverageSet vertex k).card : ℝ) ≤
      (3 + 3 * (ε : ℝ) ^ 2 * vertices.card) ^ k
  have hk : 0 < k := Nat.ceil_pos.mpr (by positivity)
  have hkReal : 0 < (k : ℝ) := by exact_mod_cast hk
  have hεReal : 0 < (ε : ℝ) := by exact_mod_cast hε
  have hεsq : 0 < (ε : ℝ) ^ 2 := sq_pos_of_pos hεReal
  have hceil : 1 / (ε : ℝ) ^ 2 ≤ (k : ℝ) := Nat.le_ceil _
  have hinv : (k : ℝ)⁻¹ ≤ (ε : ℝ) ^ 2 := by
    simpa only [one_div] using (one_div_le hkReal hεsq).2 hceil
  constructor
  · exact finitePolytope_unorderedAverage_cover vertices hdiam ε hε
  · have hcardNat : (unorderedAverageSet vertex k).card ≤
        (vertices.card + k - 1).choose k := by
      simpa only [vertex, Fintype.card_coe] using
        card_unorderedAverageSet_le_choose vertex k
    by_cases hN : vertices.card = 0
    · have hchooseZero : (vertices.card + k - 1).choose k = 0 := by
        apply Nat.choose_eq_zero_of_lt
        omega
      have hcardZero : (unorderedAverageSet vertex k).card = 0 :=
        Nat.eq_zero_of_le_zero (hcardNat.trans_eq hchooseZero)
      rw [hcardZero]
      simpa only [Nat.cast_zero] using pow_nonneg
        (show (0 : ℝ) ≤ 3 + 3 * (ε : ℝ) ^ 2 * vertices.card by positivity) k
    · have hNpos : 0 < vertices.card := Nat.pos_of_ne_zero hN
      let n : ℕ := vertices.card + k - 1
      have hkn : k ≤ n := by
        dsimp [n]
        omega
      have hchoose : ((n.choose k : ℕ) : ℝ) ≤
          (Real.exp 1 * (n : ℝ) / k) ^ k := by
        have hbounds := binomialCoefficientBounds k n hk hkn
        exact hbounds.2.1.trans hbounds.2.2
      have hnle : (n : ℝ) ≤ (vertices.card : ℝ) + k := by
        exact_mod_cast (show n ≤ vertices.card + k by omega)
      have hratio : (n : ℝ) / k ≤ (vertices.card : ℝ) / k + 1 := by
        rw [div_le_iff₀ hkReal]
        calc
          (n : ℝ) ≤ (vertices.card : ℝ) + k := hnle
          _ = ((vertices.card : ℝ) / k + 1) * k := by
            field_simp
      have hNscale : (vertices.card : ℝ) / k ≤
          (ε : ℝ) ^ 2 * vertices.card := by
        change (vertices.card : ℝ) * (k : ℝ)⁻¹ ≤
          (ε : ℝ) ^ 2 * vertices.card
        nlinarith [show (0 : ℝ) ≤ vertices.card by positivity]
      have hbase : Real.exp 1 * (n : ℝ) / k ≤
          3 + 3 * (ε : ℝ) ^ 2 * vertices.card := by
        calc
          Real.exp 1 * (n : ℝ) / k = Real.exp 1 * ((n : ℝ) / k) := by ring
          _ ≤ 3 * ((n : ℝ) / k) := by
            exact mul_le_mul_of_nonneg_right Real.exp_one_lt_three.le (by positivity)
          _ ≤ 3 * ((vertices.card : ℝ) / k + 1) := by gcongr
          _ ≤ 3 * ((ε : ℝ) ^ 2 * vertices.card + 1) := by gcongr
          _ = 3 + 3 * (ε : ℝ) ^ 2 * vertices.card := by ring
      have hcardReal : ((unorderedAverageSet vertex k).card : ℝ) ≤
          (n.choose k : ℝ) := by
        exact_mod_cast (show (unorderedAverageSet vertex k).card ≤ n.choose k by
          simpa only [n] using hcardNat)
      exact hcardReal.trans <| hchoose.trans <|
        pow_le_pow_left₀ (by positivity) hbase k

end NumStability.HDP.Geometry.Convexity

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-00-DEF-CONVEX-COMBINATION`. -/
def hdp_00_hdef_hconvex_hcombination (ι E : Type*)
    [AddCommMonoid E] [Module ℝ E] : Type _ :=
  Geometry.Convexity.ConvexCombination ι E

/-- Stable source alias for `HDP-00-DEF-CONVEX-HULL`. -/
theorem hdp_00_hdef_hconvex_hhull
    {E : Type*} [AddCommGroup E] [Module ℝ E] (T : Set E) :
    Geometry.Convexity.finiteConvexCombinationHull T = convexHull ℝ T :=
  Geometry.Convexity.finiteConvexCombinationHull_eq_convexHull T

/-- Stable source alias for `HDP-00-DEF-POLYTOPE-VERTICES`. -/
theorem hdp_00_hdef_hpolytope_hvertices
    {E : Type*} [AddCommGroup E] [Module ℝ E]
    {vertices : Finset E} {x : E} :
    x ∈ Geometry.Convexity.finitePolytope vertices ↔
      ∃ (ι : Type) (_ : Fintype ι) (weight : ι → ℝ) (point : ι → E),
        (∀ i, 0 ≤ weight i) ∧ (∑ i, weight i = 1) ∧
          (∀ i, point i ∈ vertices) ∧ ∑ i, weight i • point i = x :=
  Geometry.Convexity.mem_finitePolytope_iff_finiteCoefficients

/-- Stable source alias for `HDP-00-THM-0.0.1`. -/
theorem hdp_00_hthm_h0_d0_d1
    {E : Type u} [AddCommGroup E] [Module ℝ E] [FiniteDimensional ℝ E]
    {T : Set E} {x : E} (hx : x ∈ convexHull ℝ T) :
    ∃ (ι : Type u) (_ : Fintype ι) (point : ι → E) (weight : ι → ℝ),
      Fintype.card ι ≤ Module.finrank ℝ E + 1 ∧
        (∀ i, point i ∈ T) ∧ (∀ i, 0 ≤ weight i) ∧
          (∑ i, weight i = 1) ∧ ∑ i, weight i • point i = x :=
  Geometry.Convexity.caratheodory_sparse_convexCombination hx

/-- Stable source alias for `HDP-00-EXAMPLE-SIMPLEX-SHARPNESS`. -/
theorem hdp_00_hexample_hsimplex_hsharpness
    {ι E : Type*} [Fintype ι] [Nonempty ι]
    [AddCommGroup E] [Module ℝ E]
    (point : ι → E) (hindependent : AffineIndependent ℝ point) (j : ι) :
    Finset.univ.centroid ℝ point ∉
      convexHull ℝ (point '' {i | i ≠ j}) :=
  Geometry.Convexity.simplexCentroid_not_mem_convexHull_without_vertex
    point hindependent j

/-- Stable source alias for `HDP-00-LEM-FINITE-LAW-FROM-WEIGHTS`. -/
theorem hdp_00_hlem_hfinite_hlaw_hfrom_hweights
    {ι E : Type*} [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (point : ι → E) (weight : ι → ℝ)
    (hweight : ∀ i, 0 ≤ weight i) (hsum : ∑ i, weight i = 1) :
    ∃ p : PMF ι,
      (∀ i, p i = ENNReal.ofReal (weight i)) ∧
      (∀ z, (p.map point) z =
        ENNReal.ofReal (Geometry.Convexity.fiberWeight point weight z)) ∧
      (∫ i, point i ∂p.toMeasure) = ∑ i, weight i • point i :=
  Geometry.Convexity.finiteWeightPMF_exists point weight hweight hsum

/-- Stable source alias for `HDP-00-LEM-INDEPENDENT-COPIES-FINITE`. -/
theorem hdp_00_hlem_hindependent_hcopies_hfinite
    {ι : Type u} {E : Type*} [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι]
    [MeasurableSpace E]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (point : ι → E) (weight : ι → ℝ)
    (hweight : ∀ i, 0 ≤ weight i) (hsum : ∑ i, weight i = 1) (k : ℕ) :
    ∃ (p : PMF ι) (Ω : Type u) (_ : MeasurableSpace Ω)
        (P : MeasureTheory.Measure Ω) (Z : Fin k → Ω → E),
      (∀ i, p i = ENNReal.ofReal (weight i)) ∧
      (∀ j, ProbabilityTheory.HasLaw (Z j)
        (MeasureTheory.Measure.map point p.toMeasure) P) ∧
      ProbabilityTheory.iIndepFun Z P ∧
      MeasureTheory.IsProbabilityMeasure P ∧
      (∀ j, MeasureTheory.Integrable (Z j) P) ∧
      ∀ j, (∫ ω, Z j ω ∂P) = ∑ i, weight i • point i :=
  Geometry.Convexity.finiteWeight_iidCopies point weight hweight hsum k

/-- Stable source alias for `HDP-00-LEM-MEAN-SQUARE-EMPIRICAL`. -/
theorem hdp_00_hlem_hmean_hsquare_hempirical
    {Ω E : Type*} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (k : ℕ) (hk : 0 < k) (Z : Fin k → Ω → E) (m : E) (σ2 : ℝ)
    (hZ : ∀ j, MeasureTheory.MemLp (Z j) 2 μ)
    (hmean : ∀ j, ∫ ω, Z j ω ∂μ = m)
    (hmoment : ∀ j, (∫ ω, ‖Z j ω - m‖ ^ 2 ∂μ) = σ2)
    (hindep : ProbabilityTheory.iIndepFun Z μ) :
    (∫ ω, ‖(k : ℝ)⁻¹ • (∑ j, Z j ω) - m‖ ^ 2 ∂μ) =
      (k : ℝ)⁻¹ * σ2 :=
  Geometry.Convexity.meanSquare_empiricalAverage
    k hk Z m σ2 hZ hmean hmoment hindep

/-- Stable source alias for `HDP-00-THM-0.0.2`. -/
theorem hdp_00_hthm_h0_d0_d2
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    {T : Set E} {x : E} (hT : Bornology.IsBounded T)
    (hx : x ∈ convexHull ℝ T) (k : ℕ) (hk : 0 < k) :
    ∃ point : Fin k → E, (∀ j, point j ∈ T) ∧
      ‖x - (k : ℝ)⁻¹ • ∑ j, point j‖ ≤
        Geometry.Convexity.diameter T / Real.sqrt k :=
  Geometry.Convexity.approximateCaratheodory_diameter hT hx k hk

/-- Stable source alias for `HDP-00-EX-DIAMETER-SCALING`. -/
theorem hdp_00_hex_hdiameter_hscaling
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    {T : Set E} {x : E} (hT : Bornology.IsBounded T)
    (hx : x ∈ convexHull ℝ T) (k : ℕ) (hk : 0 < k) :
    ∃ point : Fin k → E, (∀ j, point j ∈ T) ∧
      ‖x - (k : ℝ)⁻¹ • ∑ j, point j‖ ≤
        Geometry.Convexity.diameter T / Real.sqrt k :=
  Geometry.Convexity.approximateCaratheodory_diameterScaling hT hx k hk

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

/-- Stable source alias for `HDP-00-COR-0.0.4`. -/
theorem hdp_00_hcor_h0_d0_d4
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (vertices : Finset E)
    (hdiam : Geometry.Convexity.diameter (vertices : Set E) ≤ 1)
    (ε : NNReal) (hε : 0 < ε) :
    let k := Nat.ceil (1 / (ε : ℝ) ^ 2)
    Geometry.Convexity.IsFiniteClosedCover
        (Geometry.Convexity.finitePolytope vertices)
        (Geometry.Convexity.orderedAverageSet
          (fun v : ↥vertices ↦ (v : E)) k) ε ∧
      (Geometry.Convexity.orderedAverageSet
          (fun v : ↥vertices ↦ (v : E)) k).card ≤ vertices.card ^ k :=
  Geometry.Convexity.finitePolytope_orderedAverage_cover vertices hdiam ε hε

/-- Stable source alias for `HDP-00-EX-0.0.6`. -/
theorem hdp_00_hex_h0_d0_d6
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E] :
    ∃ C : ℝ, 0 < C ∧
      ∀ (vertices : Finset E),
        Geometry.Convexity.diameter (vertices : Set E) ≤ 1 →
        ∀ (ε : NNReal), 0 < ε →
          let k := Nat.ceil (1 / (ε : ℝ) ^ 2)
          Geometry.Convexity.IsFiniteClosedCover
              (Geometry.Convexity.finitePolytope vertices)
              (Geometry.Convexity.unorderedAverageSet
                (fun v : ↥vertices ↦ (v : E)) k) ε ∧
            ((Geometry.Convexity.unorderedAverageSet
                (fun v : ↥vertices ↦ (v : E)) k).card : ℝ) ≤
              (C + C * (ε : ℝ) ^ 2 * vertices.card) ^ k :=
  Geometry.Convexity.finitePolytope_unorderedAverage_cover_universalConstant

end NumStability.HDP.Contract
