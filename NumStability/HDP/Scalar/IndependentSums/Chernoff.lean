import Mathlib.Probability.Combinatorics.BinomialRandomGraph.Defs
import Mathlib.Combinatorics.SimpleGraph.Finite

/-!
# The Erdős--Rényi random graph interface

This module uses Mathlib's canonical binomial random graph law on finite simple
graphs and exposes the vertex-degree observable used by the Chapter 2
application.
-/

noncomputable section

open MeasureTheory

namespace NumStability.HDP.Scalar.IndependentSums.Chernoff

/-- The source-facing data for `G(n,p)` and its vertex-degree observable. -/
structure ErdosRenyiModelData (n : ℕ) (p : Set.Icc (0 : ℝ) 1) where
  graphLaw : Measure (SimpleGraph (Fin n))
  degree : Fin n → SimpleGraph (Fin n) → ℕ

/-- The Erdős--Rényi model on `Fin n`, with independent edge indicators. -/
noncomputable def erdosRenyiModel (n : ℕ) (p : Set.Icc (0 : ℝ) 1) :
    ErdosRenyiModelData n p :=
  { graphLaw := SimpleGraph.binomialRandom (Fin n) p
    degree := fun v G =>
      @SimpleGraph.degree (Fin n) G v (Fintype.ofFinite (G.neighborSet v)) }

/-- The canonical Erdős--Rényi law is a probability measure. -/
instance erdosRenyiModel.isProbabilityMeasure
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) :
    IsProbabilityMeasure (erdosRenyiModel n p).graphLaw := by
  dsimp [erdosRenyiModel]
  infer_instance

end NumStability.HDP.Scalar.IndependentSums.Chernoff
