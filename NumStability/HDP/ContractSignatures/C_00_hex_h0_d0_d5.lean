import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Data.Nat.Choose.Sum

open scoped BigOperators

/-- Frozen proof-free proposition for the outbound contract supplied by
`HDP-00-EX-0.0.5`. -/
def NumStability.HDP.Contract.hdp_00_hex_h0_d0_d5__contract_type : Prop :=
  ∀ (m n : ℕ), 1 ≤ m → m ≤ n →
    ((n : ℝ) / m) ^ m ≤ (n.choose m : ℝ) ∧
      (n.choose m : ℝ) ≤ ∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ) ∧
      (∑ k ∈ Finset.range (m + 1), (n.choose k : ℝ)) ≤
        (Real.exp 1 * (n : ℝ) / m) ^ m
