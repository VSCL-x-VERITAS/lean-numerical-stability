import Mathlib.Data.Set.Finite.Basic
import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.Algebra.GroupWithZero.Action.Pointwise.Set
import Mathlib.SetTheory.Cardinal.Basic
import Mathlib.Topology.MetricSpace.Pseudo.Basic
import Mathlib.Topology.MetricSpace.Pseudo.Defs
import Mathlib.Analysis.Normed.Affine.AddTorsor
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.MeasureTheory.Measure.Real
import Mathlib.Topology.Instances.Nat
import Mathlib.Tactic

/-!
# Nets, covering numbers, and packing numbers

This module is the source-facing metric covering API for the Vershynin HDP
development.  Covering and packing numbers are `Cardinal`-valued: this keeps
the definition meaningful for sets which have no finite net while retaining
the finite-net witness API used by the volumetric and entropy arguments.
-/

namespace NumStability
namespace HDP
namespace Geometry
namespace Covering

universe u

open Set
open MeasureTheory
open scoped Pointwise ENNReal

/-- An internal `ε`-net of `K`: centers lie in `K` and every point of `K` is
within closed distance `ε` of a center. -/
def isEpsilonNet {T : Type*} [PseudoMetricSpace T]
    (K N : Set T) (ε : ℝ) : Prop :=
  N ⊆ K ∧ ∀ x ∈ K, ∃ y ∈ N, dist x y ≤ ε

/-- The union of closed `ε`-balls centered at a set of points. -/
def closedBallCover {T : Type*} [PseudoMetricSpace T]
    (N : Set T) (ε : ℝ) : Set T :=
  ⋃ y ∈ N, Metric.closedBall y ε

/-- An internal `ε`-net is exactly an internal set whose closed centered
balls cover the target. -/
theorem isEpsilonNet_iff_closedBallCover {T : Type*} [PseudoMetricSpace T]
    (K N : Set T) (ε : ℝ) :
    isEpsilonNet K N ε ↔ N ⊆ K ∧ K ⊆ closedBallCover N ε := by
  constructor
  · rintro ⟨hNK, hcover⟩
    refine ⟨hNK, ?_⟩
    intro x hx
    obtain ⟨y, hyN, hdist⟩ := hcover x hx
    simp only [closedBallCover, mem_iUnion]
    exact ⟨y, ⟨hyN, by simpa [Metric.mem_closedBall, dist_comm] using hdist⟩⟩
  · rintro ⟨hNK, hcover⟩
    refine ⟨hNK, ?_⟩
    intro x hx
    have hxcover : x ∈ closedBallCover N ε := hcover hx
    change x ∈ ⋃ y ∈ N, Metric.closedBall y ε at hxcover
    obtain ⟨y, hyball⟩ := Set.mem_iUnion.mp hxcover
    obtain ⟨hyN, hyball⟩ := Set.mem_iUnion.mp hyball
    refine ⟨y, hyN, ?_⟩
    simpa [Metric.mem_closedBall, dist_comm] using hyball

/-- A finite internal `ε`-net, represented constructively by a `Finset`. -/
def isFiniteEpsilonNet {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (N : Finset T) (ε : ℝ) : Prop :=
  isEpsilonNet K (N : Set T) ε

/-- An exterior `ε`-net: centers need not lie in the target set. -/
def isExteriorEpsilonNet {T : Type*} [PseudoMetricSpace T]
    (K N : Set T) (ε : ℝ) : Prop :=
  ∀ x ∈ K, ∃ y ∈ N, dist x y ≤ ε

/-- A set is `ε`-separated when distinct points are at strictly greater
distance than `ε`. -/
def isEpsilonSeparated {T : Type*} [PseudoMetricSpace T]
    (N : Set T) (ε : ℝ) : Prop :=
  N.Pairwise (fun x y => ε < dist x y)

/-- Inclusion-maximal internal `ε`-separated subset of `K`. -/
def isMaximalEpsilonSeparated {T : Type*} [PseudoMetricSpace T]
    (K N : Set T) (ε : ℝ) : Prop :=
  N ⊆ K ∧ isEpsilonSeparated N ε ∧
    ∀ M : Set T, N ⊆ M → M ⊆ K → isEpsilonSeparated M ε → M = N

/-- A point is a valid next point for the greedy separated-set procedure. -/
def canGreedilyAdd {T : Type*} [PseudoMetricSpace T]
    (K N : Set T) (ε : ℝ) (x : T) : Prop :=
  x ∈ K ∧ ∀ y ∈ N, ε < dist x y

/-- Adding a point that is more than `ε` from all existing centers preserves
strict `ε`-separation. -/
theorem isEpsilonSeparated_insert_of_canGreedilyAdd
    {T : Type*} [PseudoMetricSpace T] {K N : Set T} {ε : ℝ} {x : T}
    (hsep : isEpsilonSeparated N ε)
    (hadd : canGreedilyAdd K N ε x) :
    isEpsilonSeparated (insert x N) ε := by
  intro a ha b hb hab
  simp only [mem_insert_iff] at ha hb
  rcases ha with rfl | ha
  · rcases hb with rfl | hb
    · exact False.elim (hab rfl)
    · exact hadd.2 b hb
  · rcases hb with rfl | hb
    · simpa [dist_comm] using hadd.2 a ha
    · exact hsep ha hb hab

/-- If no point can be greedily added, the current separated set is maximal. -/
theorem isMaximalEpsilonSeparated_of_no_canGreedilyAdd
    {T : Type*} [PseudoMetricSpace T] {K N : Set T} {ε : ℝ}
    (hNK : N ⊆ K) (hsep : isEpsilonSeparated N ε)
    (hterminal : ∀ x ∈ K, ¬ canGreedilyAdd K N ε x) :
    isMaximalEpsilonSeparated K N ε := by
  refine ⟨hNK, hsep, ?_⟩
  intro M hNM hMK hM
  apply Set.Subset.antisymm ?_ hNM
  intro x hx
  by_contra hxN
  have hadd : canGreedilyAdd K N ε x := by
    refine ⟨hMK hx, ?_⟩
    intro y hyN
    simpa [dist_comm] using hM (hNM hyN) hx (by intro h; exact hxN (h ▸ hyN))
  exact hterminal x (hMK hx) hadd

/-- Every inclusion-maximal separated subset is an internal net. -/
theorem isEpsilonNet_of_isMaximalEpsilonSeparated
    {T : Type*} [PseudoMetricSpace T] {K N : Set T} {ε : ℝ}
    (hε : 0 ≤ ε) (hmax : isMaximalEpsilonSeparated K N ε) :
    isEpsilonNet K N ε := by
  refine ⟨hmax.1, ?_⟩
  intro x hx
  by_contra hnot
  have hxN : x ∉ N := by
    intro hxN
    exact hnot ⟨x, hxN, by simpa [dist_self] using hε⟩
  have hstrict : ∀ y ∈ N, ε < dist x y := by
    intro y hy
    exact lt_of_not_ge (fun hy' => hnot ⟨y, hy, hy'⟩)
  have hunion : isEpsilonSeparated (insert x N) ε := by
    intro a ha b hb hab
    simp only [mem_insert_iff] at ha hb
    rcases ha with rfl | ha
    · rcases hb with rfl | hb
      · exact False.elim (hab rfl)
      · exact hstrict b hb
    · rcases hb with rfl | hb
      · simpa [dist_comm] using hstrict a ha
      · exact hmax.2.1 ha hb hab
  have heq := hmax.2.2 (insert x N) (subset_insert x N) (insert_subset hx hmax.1) (by
    exact hunion)
  have hxinsert : x ∈ insert x N := mem_insert x N
  exact hxN (by rw [← heq]; exact hxinsert)

/-- A terminal finite greedy selection is an epsilon-net. -/
theorem isEpsilonNet_of_terminalGreedySelection
    {T : Type*} [PseudoMetricSpace T] {K N : Set T} {ε : ℝ}
    (hε : 0 ≤ ε) (hNK : N ⊆ K) (hsep : isEpsilonSeparated N ε)
    (hterminal : ∀ x ∈ K, ¬ canGreedilyAdd K N ε x) :
    isEpsilonNet K N ε :=
  isEpsilonNet_of_isMaximalEpsilonSeparated hε
    (isMaximalEpsilonSeparated_of_no_canGreedilyAdd hNK hsep hterminal)

/-- The candidate cardinal family used by `coveringNumber`. -/
def coveringCardinals {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) : Set Cardinal :=
  {c | ∃ N : Set T, isEpsilonNet K N ε ∧ Cardinal.mk N = c}

/-- The internal covering number of `K` at radius `ε`.  It is the infimum of
the cardinals of all internal nets, with the complete-cardinal convention for
the empty candidate family. -/
noncomputable def coveringNumber {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) : Cardinal :=
  sInf (coveringCardinals K ε)

/-- The cardinal-valued exterior covering number, with unrestricted centers. -/
def exteriorCoveringCardinals {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) : Set Cardinal :=
  {c | ∃ N : Set T, isExteriorEpsilonNet K N ε ∧ Cardinal.mk N = c}

noncomputable def exteriorCoveringNumber {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) : Cardinal :=
  sInf (exteriorCoveringCardinals K ε)

/-- Covering numbers decrease as the radius grows, for nonnegative radii. -/
theorem coveringNumber_anti_mono {T : Type*} [PseudoMetricSpace T]
    (K : Set T) {ε₁ ε₂ : ℝ} (hε₁ : 0 ≤ ε₁) (hε : ε₁ ≤ ε₂) :
    coveringNumber K ε₂ ≤ coveringNumber K ε₁ := by
  apply csInf_le_csInf'
  · refine ⟨Cardinal.mk K, ?_⟩
    refine ⟨K, ?_, rfl⟩
    constructor
    · exact subset_rfl
    · intro x hx
      exact ⟨x, hx, by simpa using hε₁⟩
  · intro c hc
    rcases hc with ⟨N, hN, hcard⟩
    refine ⟨N, ?_, hcard⟩
    refine ⟨hN.1, ?_⟩
    intro x hx
    rcases hN.2 x hx with ⟨y, hyN, hxy⟩
    exact ⟨y, hyN, hxy.trans hε⟩

/-- The candidate cardinal family used by `packingNumber`. -/
def packingCardinals {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) : Set Cardinal :=
  {c | ∃ N : Set T, N ⊆ K ∧ isEpsilonSeparated N ε ∧ Cardinal.mk N = c}

/-- The packing number of `K` at separation scale `ε`, as a supremum of
cardinals of internal separated sets. -/
noncomputable def packingNumber {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) : Cardinal :=
  sSup (packingCardinals K ε)

/-- The packing number is the supremum of cardinalities of internal strictly
`ε`-separated subsets. -/
theorem packingNumber_spec {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) :
    packingNumber K ε = sSup (packingCardinals K ε) := rfl

/-! The basic witness comparison behind the packing/covering inequalities. -/

theorem cardinal_mk_le_of_two_mul_epsilon_separated_of_epsilonNet
    {T : Type*} [PseudoMetricSpace T] {K M N : Set T} {ε : ℝ}
    (hnet : isEpsilonNet K N ε) (hMK : M ⊆ K)
    (hMsep : isEpsilonSeparated M (2 * ε)) :
    Cardinal.mk M ≤ Cardinal.mk N := by
  classical
  let center : M → T := fun x =>
    Classical.choose (hnet.2 x.1 (hMK x.2))
  have hcenter (x : M) : center x ∈ N ∧ dist (x : T) (center x) ≤ ε := by
    simpa using Classical.choose_spec (hnet.2 x.1 (hMK x.2))
  let f : M → N := fun x => ⟨center x, (hcenter x).1⟩
  apply Cardinal.mk_le_of_injective (f := f)
  intro x y hxy
  by_contra hne
  have hxneq : (x : T) ≠ (y : T) := by
    intro hxy
    exact hne (Subtype.ext hxy)
  have hsep := hMsep x.2 y.2 hxneq
  have hcenters : center x = center y := congrArg Subtype.val hxy
  have hdist : dist (x : T) (y : T) ≤ ε + ε := by
    calc
      dist (x : T) (y : T) ≤ dist (x : T) (center x) + dist (center x) (y : T) :=
        dist_triangle _ _ _
      _ = dist (x : T) (center x) + dist (y : T) (center y) := by
        rw [hcenters, dist_comm (center y) (y : T)]
      _ ≤ ε + ε := add_le_add (hcenter x).2 (hcenter y).2
  linarith

theorem exists_maximalEpsilonSeparated
    {T : Type*} [PseudoMetricSpace T] (K : Set T) (ε : ℝ) :
    ∃ N : Set T, isMaximalEpsilonSeparated K N ε := by
  classical
  let S : Set (Set T) := {N | N ⊆ K ∧ isEpsilonSeparated N ε}
  have hS : (∅ : Set T) ∈ S := by
    exact ⟨empty_subset K, by simp [isEpsilonSeparated]⟩
  have hchain : ∀ c ⊆ S, IsChain (· ⊆ ·) c → c.Nonempty →
      ∃ ub ∈ S, ∀ s ∈ c, s ⊆ ub := by
    intro c hc hcc hcn
    refine ⟨⋃₀ c, ?_, ?_⟩
    · refine ⟨?_, ?_⟩
      · intro x hx
        rcases Set.mem_sUnion.mp hx with ⟨s, hs, hxs⟩
        exact (hc hs).1 hxs
      · intro x hx y hy hxy
        rcases Set.mem_sUnion.mp hx with ⟨s, hs, hxs⟩
        rcases Set.mem_sUnion.mp hy with ⟨t, ht, hyt⟩
        obtain rfl | hst := eq_or_ne s t
        · exact (hc hs).2 hxs hyt hxy
        · obtain hst | hts := hcc hs ht hst
          · exact (hc ht).2 (hst hxs) hyt hxy
          · exact (hc hs).2 hxs (hts hyt) hxy
    · intro s hs
      exact Set.subset_sUnion_of_mem hs
  obtain ⟨N, hNsub, hNmax⟩ := zorn_subset_nonempty S hchain ∅ hS
  refine ⟨N, hNmax.prop.1, hNmax.prop.2, ?_⟩
  intro M hNM hMK hM
  apply Set.Subset.antisymm (hNmax.2 ⟨hMK, hM⟩ hNM) hNM

theorem packingNumber_two_mul_le_coveringNumber_le_packingNumber
    {T : Type*} [PseudoMetricSpace T] (K : Set T) {ε : ℝ} (hε : 0 < ε) :
    packingNumber K (2 * ε) ≤ coveringNumber K ε ∧
      coveringNumber K ε ≤ packingNumber K ε := by
  have hcover_nonempty : (coveringCardinals K ε).Nonempty := by
    refine ⟨Cardinal.mk K, ?_⟩
    refine ⟨K, ?_, rfl⟩
    constructor
    · exact subset_rfl
    · intro x hx
      exact ⟨x, hx, by simpa using hε.le⟩
  constructor
  · change sSup (packingCardinals K (2 * ε)) ≤ coveringNumber K ε
    apply csSup_le'
    intro c hc
    rcases hc with ⟨M, hMK, hMsep, rfl⟩
    apply le_csInf hcover_nonempty
    intro d hd
    rcases hd with ⟨N, hN, rfl⟩
    exact cardinal_mk_le_of_two_mul_epsilon_separated_of_epsilonNet
      hN hMK hMsep
  · change coveringNumber K ε ≤ sSup (packingCardinals K ε)
    obtain ⟨N, hmax⟩ := exists_maximalEpsilonSeparated K ε
    have hnet := isEpsilonNet_of_isMaximalEpsilonSeparated hε.le hmax
    have hpack_bdd : BddAbove (packingCardinals K ε) := by
      refine ⟨Cardinal.mk K, ?_⟩
      intro c hc
      rcases hc with ⟨M, hMK, hsep, rfl⟩
      exact Cardinal.mk_le_mk_of_subset hMK
    calc
      coveringNumber K ε ≤ Cardinal.mk N := csInf_le' ⟨N, hnet, rfl⟩
      _ ≤ sSup (packingCardinals K ε) :=
        le_csSup hpack_bdd ⟨N, hmax.1, hmax.2.1, rfl⟩

theorem internal_net_of_exterior_net
    {T : Type*} [PseudoMetricSpace T] {K M : Set T} {ε : ℝ}
    (hM : isExteriorEpsilonNet K M (ε / 2)) :
    ∃ N : Set T, isEpsilonNet K N ε ∧ Cardinal.mk N ≤ Cardinal.mk M := by
  classical
  let M' : Set T := {m | m ∈ M ∧ ∃ x ∈ K, dist x m ≤ ε / 2}
  have hchoose (m : M') : ∃ x : K, dist (x : T) m.1 ≤ ε / 2 := by
    rcases m.2.2 with ⟨x, hxK, hxm⟩
    exact ⟨⟨x, hxK⟩, hxm⟩
  let g : M' → K := fun m =>
    Classical.choose (hchoose m)
  have hg (m : M') : dist (g m : T) m.1 ≤ ε / 2 := by
    simpa using Classical.choose_spec (hchoose m)
  let gT : M' → T := fun m => g m
  let N : Set T := Set.range gT
  have hNK : N ⊆ K := by
    intro x hx
    rcases hx with ⟨m, rfl⟩
    exact (g m).2
  have hNnet : isEpsilonNet K N ε := by
    refine ⟨hNK, ?_⟩
    intro x hx
    rcases hM x hx with ⟨m, hmM, hxm⟩
    let m' : M' := ⟨m, hmM, ⟨x, hx, hxm⟩⟩
    refine ⟨gT m', ⟨m', rfl⟩, ?_⟩
    calc
      dist x (gT m') ≤ dist x m + dist m (gT m') :=
        dist_triangle _ _ _
      _ = dist x m + dist (gT m') m := by
        congr 1
        exact dist_comm _ _
      _ ≤ ε / 2 + ε / 2 := add_le_add hxm (hg m')
      _ = ε := by ring
  have hcard : Cardinal.mk N ≤ Cardinal.mk M' := by
    exact Cardinal.mk_range_le
  have hsubcard : Cardinal.mk M' ≤ Cardinal.mk M := by
    apply Cardinal.mk_subtype_mono
    intro m hm
    exact hm.1
  exact ⟨N, hNnet, hcard.trans hsubcard⟩

theorem exteriorCoveringNumber_le_coveringNumber_le_exteriorCoveringNumber_half
    {T : Type*} [PseudoMetricSpace T] (K : Set T) {ε : ℝ} (hε : 0 < ε) :
    exteriorCoveringNumber K ε ≤ coveringNumber K ε ∧
      coveringNumber K ε ≤ exteriorCoveringNumber K (ε / 2) := by
  have hcover_nonempty : (coveringCardinals K ε).Nonempty := by
    refine ⟨Cardinal.mk K, ?_⟩
    refine ⟨K, ?_, rfl⟩
    constructor
    · exact subset_rfl
    · intro x hx
      exact ⟨x, hx, by simpa using hε.le⟩
  have hexterior_nonempty :
      (exteriorCoveringCardinals K ε).Nonempty := by
    refine ⟨Cardinal.mk K, ?_⟩
    refine ⟨K, ?_, rfl⟩
    intro x hx
    exact ⟨x, hx, by simpa using hε.le⟩
  constructor
  · change sInf (exteriorCoveringCardinals K ε) ≤ coveringNumber K ε
    apply csInf_le_csInf' hcover_nonempty
    intro c hc
    rcases hc with ⟨N, hN, rfl⟩
    exact ⟨N, hN.2, rfl⟩
  · change coveringNumber K ε ≤ sInf (exteriorCoveringCardinals K (ε / 2))
    have hexterior_half_nonempty :
        (exteriorCoveringCardinals K (ε / 2)).Nonempty := by
      refine ⟨Cardinal.mk K, ?_⟩
      refine ⟨K, ?_, rfl⟩
      intro x hx
      exact ⟨x, hx, by simpa using (by linarith : 0 ≤ ε / 2)⟩
    apply le_csInf hexterior_half_nonempty
    intro c hc
    rcases hc with ⟨M, hM, rfl⟩
    rcases internal_net_of_exterior_net hM with ⟨N, hN, hcard⟩
    exact (csInf_le' (s := coveringCardinals K ε) ⟨N, hN, rfl⟩).trans hcard

theorem coveringNumber_subset_le_coveringNumber_half
    {T : Type*} [PseudoMetricSpace T] {L K : Set T} (hLK : L ⊆ K)
    {ε : ℝ} (hε : 0 < ε) :
    coveringNumber L ε ≤ coveringNumber K (ε / 2) := by
  have hcover_nonempty :
      (coveringCardinals K (ε / 2)).Nonempty := by
    refine ⟨Cardinal.mk K, ?_⟩
    refine ⟨K, ?_, rfl⟩
    constructor
    · exact subset_rfl
    · intro x hx
      exact ⟨x, hx, by simpa using (by linarith : 0 ≤ ε / 2)⟩
  apply le_csInf hcover_nonempty
  intro c hc
  rcases hc with ⟨N, hN, rfl⟩
  have hNext : isExteriorEpsilonNet L N (ε / 2) := by
    intro x hx
    exact hN.2 x (hLK hx)
  rcases internal_net_of_exterior_net hNext with ⟨M, hM, hcard⟩
  exact (csInf_le' (s := coveringCardinals L ε) ⟨M, hM, rfl⟩).trans hcard

def internalCoveringCenterCounterexampleStatement : Prop :=
  ∃ K L : Set ℕ, L ⊆ K ∧
    isEpsilonNet K ({1} : Set ℕ) 1 ∧
      ¬ isEpsilonNet L ({1} : Set ℕ) 1

theorem internalCoveringCenterCounterexample :
    internalCoveringCenterCounterexampleStatement := by
  refine ⟨{0, 1, 2}, {0, 2}, ?_, ?_, ?_⟩
  · intro x hx
    simp at hx ⊢
    omega
  · constructor
    · simp
    · intro x hx
      refine ⟨1, by simp, ?_⟩
      simp only [Nat.dist_eq]
      simp at hx
      rcases hx with rfl | rfl | rfl <;> norm_num
  · intro h
    have hcenter : (1 : ℕ) ∈ ({0, 2} : Set ℕ) :=
      h.1 (by simp)
    simp at hcenter

theorem internalCoveringMonotonicityExerciseStatement :
    (∀ {T : Type} [PseudoMetricSpace T] {L K : Set T}, L ⊆ K →
        ∀ {ε : ℝ}, 0 < ε → coveringNumber L ε ≤ coveringNumber K (ε / 2)) ∧
      internalCoveringCenterCounterexampleStatement := by
  constructor
  · intro T _ L K hLK ε hε
    exact coveringNumber_subset_le_coveringNumber_half hLK hε
  · exact internalCoveringCenterCounterexample

/-- Pairwise disjoint closed balls of radius `ε/2` centered at `N`. -/
def halfClosedBallPairwiseDisjoint {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] (N : Set E) (ε : ℝ) : Prop :=
  N.Pairwise (fun x y =>
    Disjoint (Metric.closedBall x (ε / 2)) (Metric.closedBall y (ε / 2)))

/-- In a normed space, strict separation by `ε` is equivalent to disjointness
of the centered closed `ε/2`-balls. -/
theorem halfClosedBallPairwiseDisjoint_iff {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] (N : Set E) (ε : ℝ) :
    halfClosedBallPairwiseDisjoint N ε ↔
      N.Pairwise (fun x y => ε < dist x y) := by
  constructor
  · intro h x hx y hy hxy
    by_contra hnot
    have hle : dist x y ≤ ε := le_of_not_gt hnot
    have hmemx : midpoint ℝ x y ∈ Metric.closedBall x (ε / 2) := by
      rw [Metric.mem_closedBall, dist_midpoint_left (𝕜 := ℝ)]
      norm_num
      linarith
    have hmemy : midpoint ℝ x y ∈ Metric.closedBall y (ε / 2) := by
      rw [Metric.mem_closedBall, dist_midpoint_right (𝕜 := ℝ)]
      norm_num
      linarith
    exact Set.disjoint_left.1 (h hx hy hxy) hmemx hmemy
  · intro h x hx y hy hxy
    apply Set.disjoint_left.2
    intro z hzx hzy
    have hxy' : ε < dist x y := h hx hy hxy
    have hdistx : dist x z ≤ ε / 2 := by
      simpa [dist_comm] using Metric.mem_closedBall.mp hzx
    have hdisty : dist z y ≤ ε / 2 := Metric.mem_closedBall.mp hzy
    have hdist : dist x y ≤ ε := by
      calc
        dist x y ≤ dist x z + dist z y := dist_triangle _ _ _
        _ ≤ ε / 2 + ε / 2 := add_le_add hdistx hdisty
        _ = ε := by ring
    exact (not_lt_of_ge hdist) hxy'

/-- A discrete metric need not have the midpoint property: on `ℕ`, the two
closed half-radius balls around `0` and `1` are disjoint although the centers
are not strictly more than one unit apart. -/
theorem halfClosedBall_nat_counterexample :
    Disjoint (Metric.closedBall (0 : ℕ) (1 / 2 : ℝ))
        (Metric.closedBall 1 (1 / 2 : ℝ)) ∧
      ¬ ((1 : ℝ) < dist (0 : ℕ) 1) := by
  constructor
  · rw [Set.disjoint_left]
    intro z hz0 hz1
    have h0 := Metric.mem_closedBall.mp hz0
    have h1 := Metric.mem_closedBall.mp hz1
    simp only [Nat.dist_eq] at h0 h1
    have h0' : (z : ℝ) ≤ 1 / 2 := by simpa using h0
    have hzlt : (z : ℝ) < 1 := lt_of_le_of_lt h0' (by norm_num)
    have hzlt' : z < 1 := by exact_mod_cast hzlt
    have hz : z = 0 := by omega
    subst z
    norm_num at h1
  · norm_num [Nat.dist_eq]

/-- Bundled source-facing statement for the normed-space packing-ball
identification and its metric-space boundary counterexample. -/
def packingGeometryExampleStatement : Prop :=
    (∀ {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
      (N : Set E) (ε : ℝ),
      halfClosedBallPairwiseDisjoint N ε ↔
        N.Pairwise (fun x y => ε < dist x y)) ∧
      Disjoint (Metric.closedBall (0 : ℕ) (1 / 2 : ℝ))
        (Metric.closedBall 1 (1 / 2 : ℝ)) ∧
      ¬ ((1 : ℝ) < dist (0 : ℕ) 1)

theorem packingGeometryExample : packingGeometryExampleStatement := by
  exact ⟨fun N ε => halfClosedBallPairwiseDisjoint_iff N ε,
    halfClosedBall_nat_counterexample.1,
    halfClosedBall_nat_counterexample.2⟩

/-- The finite witness form of an internal covering. -/
theorem finite_net_witness_iff {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) :
    (∃ N : Finset T, isFiniteEpsilonNet K N ε) ↔
      ∃ N : Set T, N.Finite ∧ isEpsilonNet K N ε := by
  constructor
  · rintro ⟨N, hN⟩
    exact ⟨(N : Set T), N.finite_toSet, hN⟩
  · rintro ⟨N, hNfinite, hN⟩
    classical
    have hset : (hNfinite.toFinset : Set T) = N := by
      ext x
      simp
    exact ⟨hNfinite.toFinset, by
      unfold isFiniteEpsilonNet
      rw [hset]
      exact hN⟩

/-- The finite witness form of a covering number: a finite net is available
whenever the source supplies one, without confusing that witness with a
natural-valued minimum in the infinite case. -/
theorem coveringNumber_has_finite_witness {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ)
    (h : ∃ N : Finset T, isFiniteEpsilonNet K N ε) :
    ∃ N : Finset T, isFiniteEpsilonNet K N ε := h

/-- The Chapter 4 covering-number package: the cardinal infimum definition,
radius monotonicity, and the finite-net witness interface. -/
theorem coveringNumber_properties {T : Type*} [PseudoMetricSpace T]
    (K : Set T) :
    (∀ {ε₁ ε₂ : ℝ}, 0 ≤ ε₁ → ε₁ ≤ ε₂ →
      coveringNumber K ε₂ ≤ coveringNumber K ε₁) ∧
      (∀ {ε : ℝ},
        (∃ N : Finset T, isFiniteEpsilonNet K N ε) →
          ∃ N : Finset T, isFiniteEpsilonNet K N ε) := by
  constructor
  · intro ε₁ ε₂ hε₁ hε
    exact coveringNumber_anti_mono K hε₁ hε
  · intro ε h
    exact coveringNumber_has_finite_witness K ε h

/-- At positive radius, finiteness of the cardinal covering number is
equivalent to the existence of a finite internal net. -/
theorem coveringNumber_lt_aleph0_iff {T : Type u} [PseudoMetricSpace T]
    (K : Set T) {ε : ℝ} (hε : 0 < ε) :
    coveringNumber K ε < Cardinal.aleph0.{u} ↔
      ∃ N : Finset T, isFiniteEpsilonNet K N ε := by
  constructor
  · intro hfinite
    have hnonempty : (coveringCardinals K ε).Nonempty := by
      refine ⟨Cardinal.mk K, ?_⟩
      refine ⟨K, ?_, rfl⟩
      constructor
      · exact subset_rfl
      · intro x hx
        exact ⟨x, hx, by simpa using hε.le⟩
    have hmem : coveringNumber K ε ∈ coveringCardinals K ε := by
      exact csInf_mem hnonempty
    rcases hmem with ⟨N, hN, hcard⟩
    have hNfinite : N.Finite := by
      apply Cardinal.lt_aleph0_iff_set_finite.mp
      rw [hcard]
      exact hfinite
    exact (finite_net_witness_iff K ε).2 ⟨N, hNfinite, hN⟩
  · rintro ⟨N, hN⟩
    have hle : coveringNumber K ε ≤ Cardinal.mk (N : Set T) := by
      apply csInf_le'
      exact ⟨(N : Set T), hN, rfl⟩
    exact hle.trans_lt N.finite_toSet.lt_aleph0

/-- A metric-space set is totally bounded exactly when its covering number is
finite at every positive radius. -/
theorem totallyBounded_iff_coveringNumber_lt_aleph0
    {T : Type u} [PseudoMetricSpace T] (K : Set T) :
    TotallyBounded K ↔ ∀ ε > 0, coveringNumber K ε < Cardinal.aleph0.{u} := by
  constructor
  · intro htot ε hε
    rcases Metric.finite_approx_of_totallyBounded htot (ε / 2) (by linarith) with
      ⟨N, hNK, hNfinite, hcover⟩
    apply (coveringNumber_lt_aleph0_iff K hε).2
    classical
    refine ⟨hNfinite.toFinset, ?_⟩
    unfold isFiniteEpsilonNet isEpsilonNet
    refine ⟨?_, ?_⟩
    · intro x hx
      exact hNK (hNfinite.mem_toFinset.mp hx)
    · intro x hx
      rcases Set.mem_iUnion.mp (hcover hx) with ⟨y, hy⟩
      rcases Set.mem_iUnion.mp hy with ⟨hyN, hyball⟩
      refine ⟨y, hNfinite.mem_toFinset.mpr hyN, ?_⟩
      have hy' : dist x y < ε / 2 := by
        simpa [Metric.mem_ball, dist_comm] using hyball
      exact le_of_lt (hy'.trans_le (by linarith))
  · intro hfinite
    rw [Metric.totallyBounded_iff]
    intro ε hε
    have hcovering := hfinite (ε / 2) (by linarith)
    rcases (coveringNumber_lt_aleph0_iff K (by linarith)).1 hcovering with
      ⟨N, hN⟩
    rcases hN with ⟨hNK, hnet⟩
    refine ⟨(N : Set T), N.finite_toSet, ?_⟩
    intro x hx
    rcases hnet x hx with ⟨y, hyN, hy⟩
    have hy' : dist x y < ε := lt_of_le_of_lt hy (by linarith)
    change x ∈ ⋃ z ∈ (N : Set T), Metric.ball z ε
    simp only [Set.mem_iUnion]
    exact ⟨y, ⟨hyN, by simpa [Metric.mem_ball, dist_comm] using hy'⟩⟩

/-- The packaged Chapter 4 metric-cover interface. -/
structure MetricCoverInterface (T : Type u) [PseudoMetricSpace T] where
  isNet : Set T → Set T → ℝ → Prop
  covering : Set T → ℝ → Cardinal.{u}
  isSeparated : Set T → ℝ → Prop
  packing : Set T → ℝ → Cardinal.{u}
  finiteWitness : ∀ {s : Set T}, s.Finite → Finset T

/-- The canonical metric-cover interface. -/
noncomputable def metricCoverInterface {T : Type*} [PseudoMetricSpace T] :
    MetricCoverInterface T where
  isNet := isEpsilonNet
  covering := coveringNumber
  isSeparated := isEpsilonSeparated
  packing := packingNumber
  finiteWitness := Set.Finite.toFinset

/-! Coding-theoretic definitions used by Chapter 4. -/

/-- The binary Hamming cube of dimension `n`. -/
def hammingCube (n : ℕ) : Type := Fin n → Bool

/-- The Hamming distance: the number of coordinates on which two words differ. -/
def hammingDistance {n : ℕ} (x y : hammingCube n) : ℕ :=
  (Finset.univ.filter (fun i => x i != y i)).card

/-- Pointwise Minkowski addition of two sets. -/
def minkowskiSum {E : Type*} [Add E] (A B : Set E) : Set E :=
  A + B

/-- Pointwise scalar dilation of a set. -/
def scalarDilate {𝕜 E : Type*} [SMul 𝕜 E] (r : 𝕜) (B : Set E) : Set E :=
  r • B

/-! Volumetric witness inequalities for finite nets and packings. -/

theorem volume_le_finset_card_mul_closedBall
    {n : ℕ} [NeZero n] (K : Set (EuclideanSpace ℝ (Fin n))) {ε : ℝ}
    (hε : 0 < ε) (N : Finset (EuclideanSpace ℝ (Fin n)))
    (hnet : isFiniteEpsilonNet K N ε) :
    volume K ≤ (N.card : ℝ≥0∞) * volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) ε) := by
  have hcover : K ⊆ ⋃ x ∈ N, Metric.closedBall x ε := by
    exact (isEpsilonNet_iff_closedBallCover K (N : Set (EuclideanSpace ℝ (Fin n))) ε).mp hnet
      |>.2
  have hballs :
      ∀ x : EuclideanSpace ℝ (Fin n),
        volume (Metric.closedBall x ε) =
          volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) ε) := by
    intro x
    calc
      volume (Metric.closedBall x ε) = volume (Metric.ball x ε) :=
        Measure.addHaar_closedBall_eq_addHaar_ball volume x ε
      _ = ENNReal.ofReal (ε ^ Module.finrank ℝ (EuclideanSpace ℝ (Fin n))) *
          volume (Metric.ball 0 1) := Measure.addHaar_ball volume x hε.le
      _ = volume (Metric.ball (0 : EuclideanSpace ℝ (Fin n)) ε) :=
        (Measure.addHaar_ball volume 0 hε.le).symm
      _ = volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) ε) :=
        (Measure.addHaar_closedBall_eq_addHaar_ball volume 0 ε).symm
  calc
    volume K ≤ volume (⋃ x ∈ N, Metric.closedBall x ε) := measure_mono hcover
    _ ≤ ∑ x ∈ N, volume (Metric.closedBall x ε) :=
      measure_biUnion_finset_le N (fun x => Metric.closedBall x ε)
    _ = ∑ _x ∈ N, volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) ε) := by
      apply Finset.sum_congr rfl
      intro x hx
      rw [hballs x]
    _ = (N.card : ℝ≥0∞) * volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) ε) := by
      simp [Finset.sum_const, nsmul_eq_mul]

theorem finset_card_mul_half_closedBall_le_volume_minkowskiSum
    {n : ℕ} [NeZero n] (K : Set (EuclideanSpace ℝ (Fin n))) {ε : ℝ}
    (hε : 0 < ε) (N : Finset (EuclideanSpace ℝ (Fin n)))
    (hNK : (N : Set (EuclideanSpace ℝ (Fin n))) ⊆ K)
    (hsep : isEpsilonSeparated (N : Set (EuclideanSpace ℝ (Fin n))) ε) :
    (N.card : ℝ≥0∞) *
        volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) (ε / 2)) ≤
      volume (minkowskiSum K
        (scalarDilate (ε / 2) (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1))) := by
  have hdisj :
      (N : Set (EuclideanSpace ℝ (Fin n))).PairwiseDisjoint
        (fun x => Metric.closedBall x (ε / 2)) := by
    exact (halfClosedBallPairwiseDisjoint_iff (N : Set (EuclideanSpace ℝ (Fin n))) ε).2 hsep
  have hmeas :
      ∀ x ∈ N, MeasurableSet (Metric.closedBall x (ε / 2)) := by
    intro x hx
    exact Metric.isClosed_closedBall.measurableSet
  have hballs :
      ∀ x : EuclideanSpace ℝ (Fin n),
        volume (Metric.closedBall x (ε / 2)) =
          volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) (ε / 2)) := by
    intro x
    calc
      volume (Metric.closedBall x (ε / 2)) = volume (Metric.ball x (ε / 2)) :=
        Measure.addHaar_closedBall_eq_addHaar_ball volume x (ε / 2)
      _ = ENNReal.ofReal ((ε / 2) ^ Module.finrank ℝ (EuclideanSpace ℝ (Fin n))) *
          volume (Metric.ball 0 1) :=
        Measure.addHaar_ball volume x (by linarith)
      _ = volume (Metric.ball (0 : EuclideanSpace ℝ (Fin n)) (ε / 2)) :=
        (Measure.addHaar_ball volume 0 (by linarith)).symm
      _ = volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) (ε / 2)) :=
        (Measure.addHaar_closedBall_eq_addHaar_ball volume 0 (ε / 2)).symm
  have hunion :
      volume (⋃ x ∈ N, Metric.closedBall x (ε / 2)) =
        ∑ x ∈ N, volume (Metric.closedBall x (ε / 2)) := by
    exact measure_biUnion_finset hdisj hmeas
  have hsubset :
      (⋃ x ∈ N, Metric.closedBall x (ε / 2)) ⊆
        minkowskiSum K
          (scalarDilate (ε / 2) (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1)) := by
    intro z hz
    rcases Set.mem_iUnion.mp hz with ⟨x, hz⟩
    rcases Set.mem_iUnion.mp hz with ⟨hxN, hzball⟩
    have hxK : x ∈ K := hNK (by simpa using hxN)
    have hdist : dist z x ≤ ε / 2 := Metric.mem_closedBall.mp hzball
    have hunit : (1 / (ε / 2)) • (z - x) ∈
        Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1 := by
      rw [Metric.mem_closedBall]
      rw [dist_eq_norm]
      simp only [sub_zero, norm_smul, Real.norm_eq_abs]
      rw [abs_of_pos (by positivity : 0 < (1 / (ε / 2) : ℝ))]
      have hnorm : ‖z - x‖ / (ε / 2) ≤ 1 := by
        apply (div_le_iff₀ (by linarith : 0 < ε / 2)).2
        simpa [dist_eq_norm] using hdist
      calc
        1 / (ε / 2) * ‖z - x‖ = ‖z - x‖ / (ε / 2) := by ring
        _ ≤ 1 := hnorm
    have hdiff : z - x ∈ scalarDilate (ε / 2)
        (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1) := by
      rw [scalarDilate, Set.mem_smul_set]
      refine ⟨(1 / (ε / 2)) • (z - x), hunit, ?_⟩
      rw [smul_smul]
      have hne : (ε / 2 : ℝ) ≠ 0 := by linarith
      field_simp
      simp
    rw [minkowskiSum, Set.mem_add]
    exact ⟨x, hxK, z - x, hdiff, by abel⟩
  calc
    (N.card : ℝ≥0∞) *
        volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) (ε / 2)) =
      ∑ _x ∈ N, volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) (ε / 2)) := by
        simp [Finset.sum_const, nsmul_eq_mul]
    _ = ∑ x ∈ N, volume (Metric.closedBall x (ε / 2)) := by
      apply Finset.sum_congr rfl
      intro x hx
      rw [hballs x]
    _ = volume (⋃ x ∈ N, Metric.closedBall x (ε / 2)) := hunion.symm
    _ ≤ volume (minkowskiSum K
        (scalarDilate (ε / 2) (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1))) :=
      measure_mono hsubset

def volumetricCoveringWitnessStatement : Prop :=
  ∀ {n : ℕ} [NeZero n] (K : Set (EuclideanSpace ℝ (Fin n))) {ε : ℝ},
    0 < ε →
      (∀ N : Finset (EuclideanSpace ℝ (Fin n)),
        isFiniteEpsilonNet K N ε →
          volume K ≤ (N.card : ℝ≥0∞) *
            volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) ε)) ∧
      (∀ N : Finset (EuclideanSpace ℝ (Fin n)),
        (N : Set (EuclideanSpace ℝ (Fin n))) ⊆ K →
        isEpsilonSeparated (N : Set (EuclideanSpace ℝ (Fin n))) ε →
          (N.card : ℝ≥0∞) *
              volume (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) (ε / 2)) ≤
            volume (minkowskiSum K
              (scalarDilate (ε / 2)
                (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1))))

theorem volumetricCoveringWitnesses :
    volumetricCoveringWitnessStatement := by
  intro n _ K ε hε
  constructor
  · intro N hnet
    exact volume_le_finset_card_mul_closedBall K hε N hnet
  · intro N hNK hsep
    exact finset_card_mul_half_closedBall_le_volume_minkowskiSum K hε N hNK hsep

/-- The bundled pointwise set-geometry interface. -/
structure MinkowskiSetInterface (𝕜 E : Type*) [Add E] [SMul 𝕜 E] where
  sum : Set E → Set E → Set E
  dilate : 𝕜 → Set E → Set E

/-- The canonical pointwise Minkowski/dilation interface. -/
def minkowskiSetInterface {𝕜 E : Type*} [Add E] [SMul 𝕜 E] :
    MinkowskiSetInterface 𝕜 E where
  sum := minkowskiSum
  dilate := scalarDilate

/-- The bundled binary-cube definition and its Hamming distance. -/
structure HammingCubeInterface (n : ℕ) where
  cube : Type
  distance : cube → cube → ℕ

/-- The canonical binary Hamming-cube interface. -/
def hammingCubeInterface (n : ℕ) : HammingCubeInterface n where
  cube := hammingCube n
  distance := hammingDistance

end Covering
end Geometry
end HDP
end NumStability

namespace NumStability
namespace HDP
namespace Contract

/-- Stable contract alias for the internal net/closed-ball-cover equivalence. -/
theorem hdp_04_hdef_h4_d2_d1 {T : Type*} [PseudoMetricSpace T]
    (K N : Set T) (ε : ℝ) :
    Geometry.Covering.isEpsilonNet K N ε ↔
      N ⊆ K ∧ K ⊆ Geometry.Covering.closedBallCover N ε :=
  Geometry.Covering.isEpsilonNet_iff_closedBallCover K N ε

/-- Stable contract alias for the covering-number package. -/
theorem hdp_04_hdef_h4_d2_d2 {T : Type*} [PseudoMetricSpace T]
    (K : Set T) :
    (∀ {ε₁ ε₂ : ℝ}, 0 ≤ ε₁ → ε₁ ≤ ε₂ →
      Geometry.Covering.coveringNumber K ε₂ ≤
        Geometry.Covering.coveringNumber K ε₁) ∧
      (∀ {ε : ℝ},
        (∃ N : Finset T, Geometry.Covering.isFiniteEpsilonNet K N ε) →
          ∃ N : Finset T, Geometry.Covering.isFiniteEpsilonNet K N ε) :=
  Geometry.Covering.coveringNumber_properties K

/-- Stable contract alias for the internal separated-set packing definition. -/
theorem hdp_04_hdef_h4_d2_d4 {T : Type*} [PseudoMetricSpace T]
    (K : Set T) (ε : ℝ) :
    Geometry.Covering.packingNumber K ε =
      sSup (Geometry.Covering.packingCardinals K ε) :=
  Geometry.Covering.packingNumber_spec K ε

/-- Stable contract alias for the normed packing-ball identification example. -/
theorem hdp_04_hex_h4_d2_d5 :
    Geometry.Covering.packingGeometryExampleStatement :=
  Geometry.Covering.packingGeometryExample

/-- Stable source-facing alias for the terminal greedy-selection net remark. -/
theorem hdp_04_hrem_h4_d2_d7 {T : Type*} [PseudoMetricSpace T]
    {K N : Set T} {ε : ℝ} (hε : 0 ≤ ε)
    (hNK : N ⊆ K)
    (hsep : Geometry.Covering.isEpsilonSeparated N ε)
    (hterminal : ∀ x ∈ K, ¬ Geometry.Covering.canGreedilyAdd K N ε x) :
    Geometry.Covering.isEpsilonNet K N ε :=
  Geometry.Covering.isEpsilonNet_of_terminalGreedySelection hε hNK hsep hterminal

/-- Stable source-facing alias for the internal-center monotonicity exercise. -/
theorem hdp_04_hex_h4_d2_d10 :
    (∀ {T : Type} [PseudoMetricSpace T] {L K : Set T}, L ⊆ K →
        ∀ {ε : ℝ}, 0 < ε →
          Geometry.Covering.coveringNumber L ε ≤
            Geometry.Covering.coveringNumber K (ε / 2)) ∧
      Geometry.Covering.internalCoveringCenterCounterexampleStatement :=
  Geometry.Covering.internalCoveringMonotonicityExerciseStatement

end Contract
end HDP
end NumStability
