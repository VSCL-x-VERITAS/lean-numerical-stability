import Mathlib.Probability.Distributions.Gaussian.Real

/-! Frozen proof-free signature for Proposition 2.1.2. -/

noncomputable section

open MeasureTheory
open ProbabilityTheory

namespace NumStability.HDP.Contract

def hdp_02_hprop_h2_d1_d2__contract_type : Prop :=
  (∀ t : ℝ, 0 < t →
    (ENNReal.ofReal
        ((1 / t - 1 / t ^ 3) * gaussianPDFReal 0 1 t) ≤
        (gaussianReal 0 1) (Set.Ici t) ∧
      (gaussianReal 0 1) (Set.Ici t) ≤ ENNReal.ofReal
        ((1 / t) * gaussianPDFReal 0 1 t))) ∧
    (∀ t : ℝ, 1 ≤ t →
      (gaussianReal 0 1) (Set.Ici t) ≤
        ENNReal.ofReal (gaussianPDFReal 0 1 t))

end NumStability.HDP.Contract
