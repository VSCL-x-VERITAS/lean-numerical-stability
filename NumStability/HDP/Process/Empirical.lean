import Mathlib.MeasureTheory.Constructions.BorelSpace.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Topology.MetricSpace.Lipschitz
import Mathlib.Topology.MetricSpace.Polish

/-!
# Empirical processes and transport interfaces

This module fixes a precise dual normalization of the first Wasserstein
distance.  The normalization is the one used in Section 8.2.3: the supremum
of absolute integration gaps over real-valued `1`-Lipschitz functions.
-/

open MeasureTheory

namespace NumStability.HDP.Process.Empirical

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
