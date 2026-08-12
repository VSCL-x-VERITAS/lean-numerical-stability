import NumStability.HDP.Scalar.LimitTheorems

/-! Frozen proof-free signature for the finite independent-sum variance
identity. -/

noncomputable section

open MeasureTheory

namespace NumStability.HDP.Contract

def hdp_01_hlem_hindependent_hvariance_hsum__contract_type : Prop :=
  ∀ {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ]
    {X : ι → Ω → ℝ} (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : Pairwise ((· ⟂ᵢ[μ] ·) on X)),
    Var[∑ i, X i; μ] = ∑ i, Var[X i; μ]

end NumStability.HDP.Contract
