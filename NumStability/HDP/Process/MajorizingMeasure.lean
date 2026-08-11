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

/-- Weighted point-to-projection cost for a chosen sequence of projected
points. -/
noncomputable def projectedChainCost {α : Type*} [PseudoEMetricSpace α]
    (projection : ℕ → α) (t : α) : ENNReal :=
  ∑' k, gamma2Weight k * edist t (projection k)

private theorem gamma2Weight_succ_le_two_mul (k : ℕ) :
    gamma2Weight (k + 1) ≤ 2 * gamma2Weight k := by
  rw [gamma2Weight, gamma2Weight, ← ENNReal.ofReal_ofNat 2,
    ← ENNReal.ofReal_mul (by norm_num : (0 : ℝ) ≤ 2)]
  apply ENNReal.ofReal_le_ofReal
  have hexp : (((k + 1 : ℕ) : ℝ) / 2) ≤ (k : ℝ) / 2 + 1 := by
    push_cast
    linarith
  calc
    (2 : ℝ) ^ (((k + 1 : ℕ) : ℝ) / 2)
        ≤ 2 ^ ((k : ℝ) / 2 + 1) :=
      Real.rpow_le_rpow_of_exponent_le (by norm_num) hexp
    _ = 2 ^ ((k : ℝ) / 2) * 2 ^ (1 : ℝ) := by
      rw [Real.rpow_add (by norm_num)]
    _ = 2 * 2 ^ ((k : ℝ) / 2) := by norm_num [mul_comm]

private theorem weighted_adjacentProjection_path_tsum_le
    {α : Type*} [PseudoEMetricSpace α] (t : α) (projection : ℕ → α) :
    (∑' k, gamma2Weight (k + 1) *
        edist (projection (k + 1)) (projection k)) ≤
      3 * projectedChainCost projection t := by
  have hcurrent :
      (∑' k, gamma2Weight (k + 1) * edist t (projection (k + 1))) ≤
        projectedChainCost projection t := by
    simpa only [projectedChainCost, Nat.succ_eq_add_one] using
      ENNReal.tsum_comp_le_tsum_of_injective Nat.succ_injective
        (fun j ↦ gamma2Weight j * edist t (projection j))
  have hprevious :
      (∑' k, gamma2Weight (k + 1) * edist t (projection k)) ≤
        2 * projectedChainCost projection t := by
    calc
      (∑' k, gamma2Weight (k + 1) * edist t (projection k))
          ≤ ∑' k, (2 * gamma2Weight k) * edist t (projection k) :=
        ENNReal.tsum_le_tsum fun k ↦ by
          gcongr
          exact gamma2Weight_succ_le_two_mul k
      _ = 2 * projectedChainCost projection t := by
        rw [projectedChainCost, ← ENNReal.tsum_mul_left]
        congr 1
        funext k
        ac_rfl
  calc
    (∑' k, gamma2Weight (k + 1) *
        edist (projection (k + 1)) (projection k))
        ≤ ∑' k, gamma2Weight (k + 1) *
            (edist t (projection (k + 1)) + edist t (projection k)) :=
      ENNReal.tsum_le_tsum fun k ↦ by
        gcongr
        exact edist_triangle_left _ _ t
    _ = (∑' k, gamma2Weight (k + 1) * edist t (projection (k + 1))) +
        ∑' k, gamma2Weight (k + 1) * edist t (projection k) := by
      simp only [mul_add, ENNReal.tsum_add]
    _ ≤ projectedChainCost projection t + 2 * projectedChainCost projection t :=
      add_le_add hcurrent hprevious
    _ = 3 * projectedChainCost projection t := by
      rw [show (3 : ENNReal) = 1 + 2 by norm_num, add_mul, one_mul]

/-- The weighted sum of adjacent projection increments along two paths is
controlled by the two point-to-projection path costs.  The successor
reindexing drops only the nonnegative level-zero term.

Source: Vershynin, proof of Theorem 8.5.3, printed pages 224--225
(`HDP-08-AUX-8.5-REINDEX`). -/
theorem weighted_adjacentProjection_tsum_le
    {α : Type*} [PseudoEMetricSpace α]
    (s t : α) (projectionS projectionT : ℕ → α) :
    (∑' k, gamma2Weight (k + 1) *
        (edist (projectionS (k + 1)) (projectionS k) +
          edist (projectionT (k + 1)) (projectionT k))) ≤
      3 * (projectedChainCost projectionS s + projectedChainCost projectionT t) := by
  calc
    (∑' k, gamma2Weight (k + 1) *
        (edist (projectionS (k + 1)) (projectionS k) +
          edist (projectionT (k + 1)) (projectionT k))) =
        (∑' k, gamma2Weight (k + 1) *
          edist (projectionS (k + 1)) (projectionS k)) +
        ∑' k, gamma2Weight (k + 1) *
          edist (projectionT (k + 1)) (projectionT k) := by
      simp only [mul_add, ENNReal.tsum_add]
    _ ≤ 3 * projectedChainCost projectionS s +
        3 * projectedChainCost projectionT t :=
      add_le_add (weighted_adjacentProjection_path_tsum_le s projectionS)
        (weighted_adjacentProjection_path_tsum_le t projectionT)
    _ = 3 * (projectedChainCost projectionS s + projectedChainCost projectionT t) := by
      rw [mul_add]

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

/-- Stable source alias for `HDP-08-AUX-8.5-REINDEX`. -/
theorem hdp_08_haux_h8_d5_hreindex
    {α : Type*} [PseudoEMetricSpace α]
    (s t : α) (projectionS projectionT : ℕ → α) :
    (∑' k, Process.MajorizingMeasure.gamma2Weight (k + 1) *
        (edist (projectionS (k + 1)) (projectionS k) +
          edist (projectionT (k + 1)) (projectionT k))) ≤
      3 * (Process.MajorizingMeasure.projectedChainCost projectionS s +
        Process.MajorizingMeasure.projectedChainCost projectionT t) :=
  Process.MajorizingMeasure.weighted_adjacentProjection_tsum_le
    s t projectionS projectionT

end NumStability.HDP.Contract
