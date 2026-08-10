import Mathlib.MeasureTheory.Integral.Layercake
import NumStability.HDP.Scalar.Preliminaries

/-! Frozen proof-free signature for the corrected public form of Exercise 1.2.2.
    The source-level Cauchy obstruction is audited locally; this interface
    exports only the valid positive/negative-part identities and the signed
    formula under integrability. -/

noncomputable section

open MeasureTheory

namespace NumStability.HDP.Contract

def hdp_01_hex_h1_d2_d2__contract_type : Prop :=
  ∀ {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} (hX : Measurable X),
    ((∫⁻ ω, ENNReal.ofReal (max (X ω) 0) ∂μ =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < max (X ω) 0}) ∧
      (∫⁻ ω, ENNReal.ofReal (max (-X ω) 0) ∂μ =
        ∫⁻ t in Set.Ioi 0, μ {ω | t < max (-X ω) 0})) ∧
      (∀ hInt : Integrable X μ,
        (∫ ω, X ω ∂μ) =
          (∫ t in Set.Ioi 0, μ.real {a | t < X a}) -
            (∫ t in Set.Iio 0, μ.real {a | X a < t}))

end NumStability.HDP.Contract
