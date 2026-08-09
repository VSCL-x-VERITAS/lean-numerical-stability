import NumStability.HDP.Scalar.IndependentSums.Hoeffding

/-! Proof-free frozen contract signature for Theorem 2.2.2. -/

noncomputable section

open MeasureTheory
open ProbabilityTheory
open NumStability.HDP.Scalar.IndependentSums.Hoeffding

namespace NumStability.HDP.Contract

def hdp_02_hthm_h2_d2_d2__contract_type : Prop :=
  ∀ {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ι → Ω → ℝ} {a : ι → ℝ} {t : ℝ}
    (hX : ∀ i, Measurable (X i))
    (hIndep : iIndepFun X μ)
    (hLaw : ∀ i, Measure.map (X i) μ = rademacherPMF.toMeasure)
    (hExp : ∀ (lam : ℝ) (i : ι),
      Integrable (fun ω => Real.exp (lam * (a i * X i ω))) μ)
    (ht : 0 ≤ t) (hv : 0 < ∑ i, (a i) ^ 2),
    μ.real {ω | ∑ i, a i * X i ω ≥ t} ≤
      Real.exp (-t ^ 2 / (2 * ∑ i, (a i) ^ 2))

end NumStability.HDP.Contract
