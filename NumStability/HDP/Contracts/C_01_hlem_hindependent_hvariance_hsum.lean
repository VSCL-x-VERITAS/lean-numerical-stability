import NumStability.HDP.Scalar.LimitTheorems

/-! Stable Chapter 1 forwarding declaration for the finite independent-sum
variance identity. -/

noncomputable section

open MeasureTheory

namespace NumStability.HDP.Contract

theorem hdp_01_hlem_hindependent_hvariance_hsum
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ]
    {X : ι → Ω → ℝ} (hX : ∀ i, MemLp (X i) 2 μ)
    (hIndep : Pairwise ((· ⟂ᵢ[μ] ·) on X)) :
    Var[∑ i, X i; μ] = ∑ i, Var[X i; μ] :=
  NumStability.HDP.Scalar.LimitTheorems.independentVarianceSum hX hIndep

end NumStability.HDP.Contract
