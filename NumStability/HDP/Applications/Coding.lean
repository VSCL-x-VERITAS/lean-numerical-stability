import Mathlib.Data.Set.Finite.Basic
import Mathlib.Topology.MetricSpace.Pseudo.Defs

namespace NumStability.HDP.Applications.Coding

/-- A finite metric codebook with disjoint closed balls of radius `r`. -/
def PairwiseDisjointClosedBalls {α : Type*} [PseudoMetricSpace α]
    (C : Set α) (r : ℝ) : Prop :=
  ∀ c₁ ∈ C, ∀ c₂ ∈ C, c₁ ≠ c₂ →
    ¬ ∃ y, dist y c₁ ≤ r ∧ dist y c₂ ≤ r

/-- A decoder is nearest-codeword valued when it selects a codeword and no
other codeword is closer to the received point. -/
def IsNearestDecoder {α : Type*} [PseudoMetricSpace α]
    (C : Set α) (D : α → α) : Prop :=
  (∀ y, D y ∈ C) ∧ ∀ y c, c ∈ C → dist y (D y) ≤ dist y c

/-- Within a disjoint decoding ball, a nearest-codeword decoder returns its
unique center.  The finite-codebook hypothesis is explicit for the coding API;
the uniqueness step itself only needs the disjointness and nearest properties. -/
theorem nearestCodewordCorrect {α : Type*} [PseudoMetricSpace α]
    (C : Set α) (hfinite : C.Finite) (r : ℝ) (D : α → α)
    (hdecoder : IsNearestDecoder C D)
    (hballs : PairwiseDisjointClosedBalls C r)
    {x c : α} (hc : c ∈ C) (hxc : dist x c ≤ r) :
    D x = c := by
  by_contra hne
  have hDx : D x ∈ C := hdecoder.1 x
  have hnearest : dist x (D x) ≤ r :=
    (hdecoder.2 x c hc).trans hxc
  exact (hballs (D x) hDx c hc hne) ⟨x, hnearest, hxc⟩

end NumStability.HDP.Applications.Coding

namespace NumStability.HDP.Contract

theorem hdp_04_hproof_h4_d3_d4_hnn {α : Type*} [PseudoMetricSpace α]
    (C : Set α) (hfinite : C.Finite) (r : ℝ) (D : α → α)
    (hdecoder : NumStability.HDP.Applications.Coding.IsNearestDecoder C D)
    (hballs : NumStability.HDP.Applications.Coding.PairwiseDisjointClosedBalls C r)
    {x c : α} (hc : c ∈ C) (hxc : dist x c ≤ r) :
    D x = c :=
  NumStability.HDP.Applications.Coding.nearestCodewordCorrect
    C hfinite r D hdecoder hballs hc hxc

end NumStability.HDP.Contract
