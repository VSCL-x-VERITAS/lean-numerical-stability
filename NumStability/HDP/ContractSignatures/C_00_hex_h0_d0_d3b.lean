import Mathlib.MeasureTheory.Function.L2Space

open scoped InnerProductSpace MeasureTheory

/-- Frozen proof-free proposition for the outbound contract supplied by
`HDP-00-EX-0.0.3B`. -/
def NumStability.HDP.Contract.hdp_00_hex_h0_d0_d3b__contract_type : Prop :=
  ∀ {Ω E : Type} [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    (Z : Ω → E),
    MeasureTheory.MemLp Z 2 μ →
    (∫ ω, ‖Z ω - ∫ ω, Z ω ∂μ‖ ^ 2 ∂μ) =
      (∫ ω, ‖Z ω‖ ^ 2 ∂μ) - ‖∫ ω, Z ω ∂μ‖ ^ 2
