import NumStability.HDP.Scalar.SubExponential

/-! Stable Chapter 2 contract for Example 2.7.12. -/

noncomputable section

open MeasureTheory

namespace NumStability.HDP.Contract

def hdp_02_hexample_h2_d7_d12__contract_type : Prop :=
  ∀ {Ω : Type*} [MeasurableSpace Ω]
    (ψ : NumStability.HDP.Scalar.SubExponential.OrliczFunction)
    (μ : Measure Ω) (p : NNReal),
    0 < p →
    (∀ x : ℝ, 0 ≤ x → ψ x = x ^ (p : ℝ)) →
    (∀ X : Ω → ℝ,
      NumStability.HDP.Scalar.SubExponential.orliczGauge ψ μ X =
        eLpNorm X (p : ENNReal) μ) ∧
    (∀ X : Ω → ℝ, AEStronglyMeasurable X μ →
      (NumStability.HDP.Scalar.SubExponential.orliczMember ψ μ X ↔
        MemLp X (p : ENNReal) μ))

theorem hdp_02_hexample_h2_d7_d12 :
    hdp_02_hexample_h2_d7_d12__contract_type := by
  intro Ω _ ψ μ p hp hψ
  constructor
  · intro X
    exact NumStability.HDP.Scalar.SubExponential.powerOrliczGauge_eq_eLpNorm
        ψ μ X p hp hψ
  · intro X hX
    exact NumStability.HDP.Scalar.SubExponential.powerOrliczMember_iff_memLp
        ψ μ X p hp hψ hX

end NumStability.HDP.Contract
