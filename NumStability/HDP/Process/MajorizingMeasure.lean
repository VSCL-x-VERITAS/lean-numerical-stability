import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.Order.Ring.Nat
import Mathlib.Data.ENNReal.Operations
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal
import Mathlib.Topology.MetricSpace.HausdorffDistance

/-!
# Talagrand's gamma-two functional

This module contains the generic-chaining functionals from Chapter 8 of
Vershynin's *High-Dimensional Probability*.
-/

namespace NumStability.HDP.Process.MajorizingMeasure

/-- A sequence of finite subsets of `T` is admissible when its zeroth level
has one point and level `k` has at most `2^(2^k)` points.

Source: Vershynin, Definition 8.5.1 and equation (8.40), printed page 222
(`HDP-08-DEF-8.5.1`). -/
def IsAdmissibleSequence {α : Type*} (T : Set α) (approx : ℕ → Finset α) : Prop :=
  (approx 0).card = 1 ∧
    (∀ k, (approx k : Set α) ⊆ T) ∧
    ∀ k, (approx k).card ≤ 2 ^ (2 ^ k)

/-- The exact extended-nonnegative coefficient `2^(k/2)` used at level `k`
of a generic chain. -/
noncomputable def gamma2Weight (k : ℕ) : ENNReal :=
  ENNReal.ofReal (2 ^ ((k : ℝ) / 2))

/-- The weighted distance sum of a point from an approximating sequence.  The
extended value correctly assigns infinite cost if some approximating set is
empty. -/
noncomputable def chainCost {α : Type*} [PseudoEMetricSpace α]
    (approx : ℕ → Finset α) (t : α) : ENNReal :=
  ∑' k, gamma2Weight k * Metric.infEDist t (approx k : Set α)

/-- Talagrand's `γ₂` functional: infimum over admissible sequences of the
supremum, over points of `T`, of the weighted point-to-level distance sum.

The codomain is `ENNReal`, so an empty family of admissible sequences has
infimum `⊤`, and divergent chains retain value `⊤`.

Source: Vershynin, Definition 8.5.1, printed pages 222--223
(`HDP-08-DEF-8.5.1`). -/
noncomputable def gamma2 {α : Type*} [PseudoEMetricSpace α] (T : Set α) : ENNReal :=
  sInf {r : ENNReal |
    ∃ approx : ℕ → Finset α,
      IsAdmissibleSequence T approx ∧
        r = ⨆ t : T, chainCost approx t}

/-- Admissibility bounds the number of adjacent-net pairs at level `k` by
`2^(2^(k+1))`.  At `k = 0`, the predecessor is the truncated predecessor.

Source: Vershynin, proof of Theorem 8.5.3, printed pages 223--224
(`HDP-08-AUX-8.5-PAIRCOUNT`). -/
theorem adjacent_card_mul_le {α : Type*} {T : Set α} {approx : ℕ → Finset α}
    (happrox : IsAdmissibleSequence T approx) (k : ℕ) :
    (approx k).card * (approx (k - 1)).card ≤ 2 ^ (2 ^ (k + 1)) := by
  have hk : (approx k).card ≤ 2 ^ (2 ^ k) := happrox.2.2 k
  have hpred : (approx (k - 1)).card ≤ 2 ^ (2 ^ (k - 1)) :=
    happrox.2.2 (k - 1)
  have hinner : 2 ^ (k - 1) ≤ 2 ^ k :=
    Nat.pow_le_pow_right (by omega) (Nat.sub_le k 1)
  have hpred' : (approx (k - 1)).card ≤ 2 ^ (2 ^ k) :=
    hpred.trans (Nat.pow_le_pow_right (by omega) hinner)
  calc
    (approx k).card * (approx (k - 1)).card
        ≤ 2 ^ (2 ^ k) * 2 ^ (2 ^ k) := Nat.mul_le_mul hk hpred'
    _ = 2 ^ (2 ^ k + 2 ^ k) := (pow_add 2 (2 ^ k) (2 ^ k)).symm
    _ = 2 ^ (2 ^ (k + 1)) := by
      congr 1
      rw [pow_succ]
      omega

end NumStability.HDP.Process.MajorizingMeasure

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-08-DEF-8.5.1`. -/
noncomputable def hdp_08_hdef_h8_d5_d1 {α : Type*} [PseudoEMetricSpace α] :
    Set α → ENNReal :=
  Process.MajorizingMeasure.gamma2

/-- Stable source alias for `HDP-08-AUX-8.5-PAIRCOUNT`. -/
theorem hdp_08_haux_h8_d5_hpaircount
    {α : Type*} {T : Set α} {approx : ℕ → Finset α}
    (happrox : Process.MajorizingMeasure.IsAdmissibleSequence T approx) (k : ℕ) :
    (approx k).card * (approx (k - 1)).card ≤ 2 ^ (2 ^ (k + 1)) :=
  Process.MajorizingMeasure.adjacent_card_mul_le happrox k

end NumStability.HDP.Contract
