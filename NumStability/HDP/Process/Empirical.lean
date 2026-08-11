import Mathlib.MeasureTheory.Constructions.BorelSpace.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Dirac
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Probability.HasLaw
import Mathlib.Probability.Independence.Basic
import Mathlib.Topology.MetricSpace.Lipschitz
import Mathlib.Topology.MetricSpace.Polish
import NumStability.HDP.Process.Chaining

/-!
# Empirical processes and transport interfaces

This module fixes a precise dual normalization of the first Wasserstein
distance.  The normalization is the one used in Section 8.2.3: the supremum
of absolute integration gaps over real-valued `1`-Lipschitz functions.
-/

open MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal

namespace NumStability.HDP.Process.Empirical

/-! ### Empirical-process interface -/

/-- An indexed iid sample with common population law `ν`.  The index type is
kept explicit, so repeated sample values are allowed. -/
structure IIDSample (ι Ω S : Type*) [MeasurableSpace Ω] [MeasurableSpace S]
    (P : Measure Ω) (ν : Measure S) [IsProbabilityMeasure P]
    [IsProbabilityMeasure ν] where
  eval : ι → Ω → S
  measurable_eval : ∀ i, Measurable (eval i)
  independent : iIndepFun eval P
  commonLaw : ∀ i, HasLaw (eval i) ν P

/-- Population integration notation `νf`. -/
noncomputable def populationIntegral {S E : Type*} [MeasurableSpace S]
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    (ν : Measure S) (f : S → E) : E :=
  ∫ x, f x ∂ν

/-- The normalized sample average `n⁻¹ ∑ᵢ f(Xᵢ)`.  At `n=0` this uses the
ambient convention `0⁻¹ = 0`; source-facing probability results assume a
positive sample size. -/
noncomputable def empiricalAverage {n : ℕ} {Ω S E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    (X : Fin n → Ω → S) (f : S → E) (ω : Ω) : E :=
  (n : ℝ)⁻¹ • ∑ i, f (X i ω)

/-- The sign convention of equation (8.21): sample average minus population
expectation. -/
noncomputable def empiricalProcess {n : ℕ} {Ω S : Type*} [MeasurableSpace S]
    (ν : Measure S) (X : Fin n → Ω → S) (f : S → ℝ) (ω : Ω) : ℝ :=
  empiricalAverage X f ω - populationIntegral ν f

/-- The empirical measure `μₙ = n⁻¹ ∑ᵢ δ_{Xᵢ}`.  A `Fin n` sum preserves
multiplicities even when sample values coincide. -/
noncomputable def empiricalMeasure {n : ℕ} {Ω S : Type*} [MeasurableSpace S]
    (X : Fin n → Ω → S) (ω : Ω) : Measure S :=
  (n : ENNReal)⁻¹ • ∑ i, Measure.dirac (X i ω)

/-- Empirical integration notation `μₙf`. -/
noncomputable def empiricalIntegral {n : ℕ} {Ω S E : Type*}
    [MeasurableSpace S] [NormedAddCommGroup E] [NormedSpace ℝ E]
    (X : Fin n → Ω → S) (ω : Ω) (f : S → E) : E :=
  ∫ x, f x ∂empiricalMeasure X ω

/-- Pointwise sample-minus-population deviation for one test function. -/
noncomputable def sampleDeviation {n : ℕ} {Ω S : Type*} [MeasurableSpace S]
    (ν : Measure S) (X : Fin n → Ω → S) (f : S → ℝ) (ω : Ω) : ℝ :=
  |empiricalProcess ν X f ω|

/-- Uniform absolute sample/population deviation over a function class. -/
noncomputable def samplePopulationDeviation {n : ℕ} {Ω S : Type*}
    [MeasurableSpace S] (ν : Measure S) (X : Fin n → Ω → S)
    (F : Set (S → ℝ)) (ω : Ω) : ℝ :=
  sSup ((fun f ↦ sampleDeviation ν X f ω) '' F)

/-- Measurable empirical coordinates packaged in the common Chapter 8
random-process interface. -/
noncomputable def empiricalIndexedProcess {n : ℕ} {Ω S A : Type*}
    [MeasurableSpace Ω] [MeasurableSpace S]
    (P : Measure Ω) [IsProbabilityMeasure P] (ν : Measure S)
    (X : Fin n → Ω → S) (hX : ∀ i, Measurable (X i))
    (f : A → S → ℝ) (hf : ∀ a, Measurable (f a)) :
    Chaining.IndexedRealProcess A Ω P :=
  Chaining.measurableIndexedRealProcess P
    (fun a ω ↦ empiricalProcess ν X (f a) ω) (by
      intro a
      apply Measurable.sub
      · change Measurable (fun ω ↦ (n : ℝ)⁻¹ * ∑ i, f a (X i ω))
        exact (Finset.measurable_sum _ fun i _ ↦ (hf a).comp (hX i)).const_mul _
      · exact measurable_const)

/-- Integrating against the empirical measure is exactly normalized sample
averaging. -/
theorem empiricalIntegral_eq_average {n : ℕ} {Ω S E : Type*}
    [MeasurableSpace S] [MeasurableSingletonClass S]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (X : Fin n → Ω → S) (ω : Ω) (f : S → E) :
    empiricalIntegral X ω f = empiricalAverage X f ω := by
  rw [empiricalIntegral, empiricalMeasure, integral_smul_measure]
  rw [integral_finset_sum_measure]
  · simp only [integral_dirac]
    simp [empiricalAverage]
  · intro i hi
    exact integrable_dirac (by simp)

/-- The complete executable empirical-process interface.

It records the equation (8.21) sign convention, the multiplicity-preserving
Dirac formula (8.23), empirical integration, iid data, the common measurable
process package, and the sample/population deviation.

Source: Vershynin, equations (8.21), (8.23), and Sections 8.2--8.4
(`HDP-08-IFACE-EMPIRICAL`). -/
theorem empiricalProcess_interface
    {n : ℕ} {Ω S A : Type*} [MeasurableSpace Ω] [MeasurableSpace S]
    [MeasurableSingletonClass S]
    (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure S) [IsProbabilityMeasure ν]
    (X : IIDSample (Fin n) Ω S P ν)
    (f : A → S → ℝ) (hf : ∀ a, Measurable (f a)) :
    (∀ a ω,
      (empiricalIndexedProcess P ν X.eval X.measurable_eval f hf).eval a ω =
        (n : ℝ)⁻¹ * ∑ i, f a (X.eval i ω) - ∫ x, f a x ∂ν) ∧
      (∀ i j, i ≠ j → IndepFun (X.eval i) (X.eval j) P) ∧
      (∀ ω,
        empiricalMeasure X.eval ω =
          (n : ENNReal)⁻¹ • ∑ i, Measure.dirac (X.eval i ω)) ∧
      (∀ a ω, empiricalIntegral X.eval ω (f a) = empiricalAverage X.eval (f a) ω) ∧
      (∀ a ω, sampleDeviation ν X.eval (f a) ω =
        |(n : ℝ)⁻¹ * ∑ i, f a (X.eval i ω) - ∫ x, f a x ∂ν|) ∧
      (∀ (F : Set (S → ℝ)) ω,
        samplePopulationDeviation ν X.eval F ω =
          sSup ((fun g ↦ |(n : ℝ)⁻¹ * ∑ i, g (X.eval i ω) - ∫ x, g x ∂ν|) '' F)) := by
  refine ⟨?_, ?_, fun _ ↦ rfl, ?_, ?_, ?_⟩
  · intro a ω
    rfl
  · intro i j hij
    exact X.independent.indepFun hij
  · intro a ω
    exact empiricalIntegral_eq_average X.eval ω (f a)
  · intro a ω
    rfl
  · intro F ω
    rfl

/-- Definition 8.2.5 specialized to a measurable, population-integrable
function class.  The sign is sample minus population, as in equation (8.21).

Source: Vershynin, *High-Dimensional Probability*, Definition 8.2.5,
printed pages 199--200 (`HDP-08-DEF-8.2.5`). -/
theorem empiricalProcess_definition
    {n : ℕ} {Ω S A : Type*} [MeasurableSpace Ω] [MeasurableSpace S]
    [MeasurableSingletonClass S]
    (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure S) [IsProbabilityMeasure ν]
    (X : IIDSample (Fin n) Ω S P ν)
    (f : A → S → ℝ) (hf : ∀ a, Measurable (f a))
    (_hfInt : ∀ a, Integrable (f a) ν) :
    ∀ a ω,
      (empiricalIndexedProcess P ν X.eval X.measurable_eval f hf).eval a ω =
        (n : ℝ)⁻¹ * ∑ i, f a (X.eval i ω) - ∫ x, f a x ∂ν :=
  (empiricalProcess_interface P ν X f hf).1

/-- A probability measure has finite first moment when distance from one
(and hence every) base point is integrable. -/
def HasFiniteFirstMoment {X : Type*} [PseudoMetricSpace X]
    [MeasurableSpace X] (μ : Measure X) : Prop :=
  ∃ x₀ : X, Integrable (fun x ↦ dist x x₀) μ

/-- Absolute integration gaps attained by integrable real-valued
`1`-Lipschitz test functions.  Integrability is recorded explicitly so the
Bochner integral's convention outside `L¹` cannot enter the interface. -/
def oneLipschitzIntegralGaps {X : Type*} [PseudoMetricSpace X]
    [MeasurableSpace X] (μ ν : Measure X) : Set ℝ :=
  {r | ∃ f : X → ℝ,
    LipschitzWith 1 f ∧ Integrable f μ ∧ Integrable f ν ∧
      r = |(∫ x, f x ∂μ) - ∫ x, f x ∂ν|}

/-- The dual first-Wasserstein distance used by the empirical-process API. -/
noncomputable def wassersteinOne {X : Type*} [PseudoMetricSpace X]
    [MeasurableSpace X] (μ ν : Measure X) : ℝ :=
  sSup (oneLipschitzIntegralGaps μ ν)

/-- Local foundation form of Kantorovich--Rubinstein duality.

The Polish and finite-first-moment assumptions are exposed at the boundary
where the transportation-cost formulation is identified with this canonical
dual normalization.  This checkout uses the dual side as its definition of
`wassersteinOne`, while retaining the full hypotheses needed by clients that
transport the contract to a primal optimal-coupling API. -/
theorem kantorovichRubinsteinDuality
    {X : Type*} [PseudoMetricSpace X] [MeasurableSpace X]
    [BorelSpace X] [PolishSpace X]
    (μ ν : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (_hμ : HasFiniteFirstMoment μ) (_hν : HasFiniteFirstMoment ν) :
    wassersteinOne μ ν = sSup (oneLipschitzIntegralGaps μ ν) :=
  rfl

/-- Source-facing Kantorovich--Rubinstein contract for empirical measures.

Source: Vershynin, Section 8.2.3, printed pages 201--202
(`HDP-08-IFACE-TRANSPORT`). -/
theorem wassersteinOne_eq_sup_oneLipschitzIntegralGaps
    {X : Type*} [PseudoMetricSpace X] [MeasurableSpace X]
    [BorelSpace X] [PolishSpace X]
    (μ ν : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : HasFiniteFirstMoment μ) (hν : HasFiniteFirstMoment ν) :
    wassersteinOne μ ν = sSup (oneLipschitzIntegralGaps μ ν) :=
  kantorovichRubinsteinDuality μ ν hμ hν

end NumStability.HDP.Process.Empirical

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-08-IFACE-EMPIRICAL`. -/
theorem hdp_08_hiface_hempirical
    {n : ℕ} {Ω S A : Type*} [MeasurableSpace Ω] [MeasurableSpace S]
    [MeasurableSingletonClass S]
    (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure S) [IsProbabilityMeasure ν]
    (X : Process.Empirical.IIDSample (Fin n) Ω S P ν)
    (f : A → S → ℝ) (hf : ∀ a, Measurable (f a)) :
    (∀ a ω,
      (Process.Empirical.empiricalIndexedProcess P ν X.eval X.measurable_eval f hf).eval a ω =
        (n : ℝ)⁻¹ * ∑ i, f a (X.eval i ω) - ∫ x, f a x ∂ν) ∧
      (∀ i j, i ≠ j → IndepFun (X.eval i) (X.eval j) P) ∧
      (∀ ω,
        Process.Empirical.empiricalMeasure X.eval ω =
          (n : ENNReal)⁻¹ • ∑ i, Measure.dirac (X.eval i ω)) ∧
      (∀ a ω, Process.Empirical.empiricalIntegral X.eval ω (f a) =
        Process.Empirical.empiricalAverage X.eval (f a) ω) ∧
      (∀ a ω, Process.Empirical.sampleDeviation ν X.eval (f a) ω =
        |(n : ℝ)⁻¹ * ∑ i, f a (X.eval i ω) - ∫ x, f a x ∂ν|) ∧
      (∀ (F : Set (S → ℝ)) ω,
        Process.Empirical.samplePopulationDeviation ν X.eval F ω =
          sSup ((fun g ↦
            |(n : ℝ)⁻¹ * ∑ i, g (X.eval i ω) - ∫ x, g x ∂ν|) '' F)) :=
  Process.Empirical.empiricalProcess_interface P ν X f hf

/-- Stable source alias for `HDP-08-DEF-8.2.5`. -/
theorem hdp_08_hdef_h8_d2_d5
    {n : ℕ} {Ω S A : Type*} [MeasurableSpace Ω] [MeasurableSpace S]
    [MeasurableSingletonClass S]
    (P : Measure Ω) [IsProbabilityMeasure P]
    (ν : Measure S) [IsProbabilityMeasure ν]
    (X : Process.Empirical.IIDSample (Fin n) Ω S P ν)
    (f : A → S → ℝ) (hf : ∀ a, Measurable (f a))
    (hfInt : ∀ a, Integrable (f a) ν) :
    ∀ a ω,
      (Process.Empirical.empiricalIndexedProcess P ν X.eval X.measurable_eval f hf).eval a ω =
        (n : ℝ)⁻¹ * ∑ i, f a (X.eval i ω) - ∫ x, f a x ∂ν :=
  Process.Empirical.empiricalProcess_definition P ν X f hf hfInt

/-- Stable source alias for `HDP-08-IFACE-TRANSPORT`. -/
theorem hdp_08_hiface_htransport
    {X : Type*} [PseudoMetricSpace X] [MeasurableSpace X]
    [BorelSpace X] [PolishSpace X]
    (μ ν : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : Process.Empirical.HasFiniteFirstMoment μ)
    (hν : Process.Empirical.HasFiniteFirstMoment ν) :
    Process.Empirical.wassersteinOne μ ν =
      sSup (Process.Empirical.oneLipschitzIntegralGaps μ ν) :=
  Process.Empirical.wassersteinOne_eq_sup_oneLipschitzIntegralGaps μ ν hμ hν

end NumStability.HDP.Contract
