import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.Probability.Independence.Basic

open scoped BigOperators InnerProductSpace MeasureTheory

/-- Frozen proof-free proposition for the outbound contract supplied by
`HDP-00-EX-0.0.3A`. -/
def NumStability.HDP.Contract.hdp_00_hex_h0_d0_d3a__contract_type : Prop :=
  ∀ {ι Ω E : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]
    [MeasurableSpace E] [BorelSpace E] [SecondCountableTopology E]
    (Z : ι → Ω → E),
    (∀ i, MeasureTheory.MemLp (Z i) 2 μ) →
    (∀ i, ∫ ω, Z i ω ∂μ = 0) →
    ProbabilityTheory.iIndepFun Z μ →
    (∫ ω, ‖∑ i, Z i ω‖ ^ 2 ∂μ) =
      ∑ i, ∫ ω, ‖Z i ω‖ ^ 2 ∂μ
