import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Probability.Distributions.Gaussian.Real

open MeasureTheory ProbabilityTheory Set
open scoped BigOperators InnerProductSpace

/-- Frozen proof-free proposition for the outbound contract supplied by
`HDP-07-EXAMPLE-7.5.8`. -/
def NumStability.HDP.Contract.hdp_07_hexample_h7_d5_d8__contract_type : Prop :=
  ∀ n : ℕ,
    let μ : Measure (EuclideanSpace ℝ (Fin n)) :=
      (Measure.pi (fun _ : Fin n ↦ gaussianReal 0 1)).map
        (MeasurableEquiv.toLp 2 (Fin n → ℝ))
    let cube : Set (EuclideanSpace ℝ (Fin n)) :=
      {x | ∀ i, |x i| ≤ 1}
    let support (T : Set (EuclideanSpace ℝ (Fin n)))
        (g : EuclideanSpace ℝ (Fin n)) : ℝ :=
      sSup ((fun x ↦ ⟪g, x⟫_ℝ) '' T)
    let width (T : Set (EuclideanSpace ℝ (Fin n))) : ℝ :=
      ∫ g, support T g ∂μ
    width cube =
        (∫ g : EuclideanSpace ℝ (Fin n), ∑ i, |g i| ∂μ) ∧
      (∫ g : EuclideanSpace ℝ (Fin n), ∑ i, |g i| ∂μ) =
        (n : ℝ) * (∫ x : ℝ, |x| ∂gaussianReal 0 1) ∧
      (n : ℝ) * (∫ x : ℝ, |x| ∂gaussianReal 0 1) =
        Real.sqrt (2 / Real.pi) * n
