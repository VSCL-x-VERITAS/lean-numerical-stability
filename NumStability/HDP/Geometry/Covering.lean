import Mathlib.Data.Set.Finite.Basic
import Mathlib.SetTheory.Cardinal.Basic
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

/-- An internal `ε`-net of `K`: centers lie in `K` and every point of `K` is
within closed distance `ε` of a center. -/
def isEpsilonNet {T : Type*} [PseudoMetricSpace T]
    (K N : Set T) (ε : ℝ) : Prop :=
  N ⊆ K ∧ ∀ x ∈ K, ∃ y ∈ N, dist x y ≤ ε

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

end Covering
end Geometry
end HDP
end NumStability
