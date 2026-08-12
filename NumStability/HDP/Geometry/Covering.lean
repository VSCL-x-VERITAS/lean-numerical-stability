import Mathlib.Data.Set.Finite.Basic
import Mathlib.Algebra.Group.Pointwise.Set.Basic
import Mathlib.Algebra.GroupWithZero.Action.Pointwise.Set
import Mathlib.SetTheory.Cardinal.Basic
import Mathlib.Topology.MetricSpace.Pseudo.Basic
import Mathlib.Topology.MetricSpace.Pseudo.Defs

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
open scoped Pointwise

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

/-- A set is `ε`-separated when distinct points are at strictly greater
distance than `ε`. -/
def isEpsilonSeparated {T : Type*} [PseudoMetricSpace T]
    (N : Set T) (ε : ℝ) : Prop :=
  N.Pairwise (fun x y => ε < dist x y)

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

/-- Stable contract alias for the total-boundedness characterization. -/
theorem hdp_04_hrem_h4_d2_d3 {T : Type u} [PseudoMetricSpace T]
    (K : Set T) :
    TotallyBounded K ↔
      ∀ ε > 0, Geometry.Covering.coveringNumber K ε < Cardinal.aleph0.{u} :=
  Geometry.Covering.totallyBounded_iff_coveringNumber_lt_aleph0 K

end Contract
end HDP
end NumStability
