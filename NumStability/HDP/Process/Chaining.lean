import Mathlib.Data.EReal.Basic
import Mathlib.MeasureTheory.Function.LpSeminorm.Basic
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Order.Lattice

/-!
# Random-process interface for chaining

The chaining arguments in Chapter 8 first operate on finite index sets.  This
module makes those finite suprema measurable and records the separate,
pointwise countable-determination condition needed to pass to a separable
process.  Processes are represented by actual pointwise functions; no quotient
by almost-everywhere equality is taken implicitly.
-/

open MeasureTheory

namespace NumStability.HDP.Process.Chaining

/-- A real random process on a probability space, together with its canonical
finite pointwise suprema and their measurability.

The evaluator is an actual representative `T → Ω → ℝ`.  This keeps pointwise
finite suprema meaningful; any later passage to an a.e. equivalence class must
be stated and proved explicitly.

Source interface for Chapter 8, especially §§8.1 and 8.5--8.7
(`HDP-08-IFACE-PROCESS`). -/
structure IndexedRealProcess (T Ω : Type*) [MeasurableSpace Ω] (μ : Measure Ω) where
  eval : T → Ω → ℝ
  measurable_eval : ∀ t, Measurable (eval t)
  probability_measure : IsProbabilityMeasure μ
  finiteSupremumWithBot : Finset T → Ω → WithBot ℝ
  finiteSupremumWithBot_eq : ∀ (I : Finset T) (ω : Ω),
    finiteSupremumWithBot I ω = I.sup (fun t => (eval t ω : WithBot ℝ))
  finiteSupremum : ∀ I : Finset T, I.Nonempty → Ω → ℝ
  finiteSupremum_eq : ∀ (I : Finset T) (hI : I.Nonempty) (ω : Ω),
    finiteSupremum I hI ω = I.sup' hI (fun t => eval t ω)
  measurable_finiteSupremum : ∀ (I : Finset T) (hI : I.Nonempty),
    Measurable (finiteSupremum I hI)

/-- Construct the canonical process package from measurable coordinates on a
probability space.  The finite supremum is the actual `Finset.sup'`, not an
independent operation supplied by the caller. -/
noncomputable def measurableIndexedRealProcess
    {T Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : T → Ω → ℝ) (hX : ∀ t, Measurable (X t)) : IndexedRealProcess T Ω μ where
  eval := X
  measurable_eval := hX
  probability_measure := inferInstance
  finiteSupremumWithBot := fun I ω => I.sup (fun t => (X t ω : WithBot ℝ))
  finiteSupremumWithBot_eq := by intros; rfl
  finiteSupremum := fun I hI ω => I.sup' hI (fun t => X t ω)
  finiteSupremum_eq := by intros; rfl
  measurable_finiteSupremum := by
    intro I hI
    have heq : (fun ω => I.sup' hI (fun t => X t ω)) = I.sup' hI X := by
      funext ω
      exact (Finset.sup'_apply hI X ω).symm
    rw [heq]
    exact Finset.measurable_sup' hI fun t _ => hX t

/-- A process is centered when every coordinate has expectation zero. -/
def IsCentered {T Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    (X : IndexedRealProcess T Ω μ) : Prop :=
  ∀ t, ∫ ω, X.eval t ω ∂μ = 0

/-- The extended `L²` increment distance of a process.  Extended values retain
the non-square-integrable case instead of silently assigning a finite default. -/
noncomputable def incrementEDistance {T Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} (X : IndexedRealProcess T Ω μ) (s t : T) : ENNReal :=
  eLpNorm (fun ω => X.eval t ω - X.eval s ω) 2 μ

/-- Pointwise supremum over an arbitrary index subset, valued in `EReal` so
empty and unbounded index families have canonical extended values. -/
noncomputable def pointwiseSupremum {T Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} (X : IndexedRealProcess T Ω μ) (S : Set T) (ω : Ω) : EReal :=
  sSup ((fun t => (X.eval t ω : EReal)) '' S)

/-- The explicit finite-to-separable extension boundary: a countable subset
determines the process supremum pointwise for the chosen representatives.
Using equality for every `ω` avoids silently replacing pointwise evaluation by
almost-everywhere equivalence. -/
def HasSeparableSupremum {T Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    (X : IndexedRealProcess T Ω μ) : Prop :=
  ∃ D : Set T, D.Countable ∧
    ∀ ω, pointwiseSupremum X Set.univ ω = pointwiseSupremum X D ω

end NumStability.HDP.Process.Chaining

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-08-IFACE-PROCESS`. -/
noncomputable def hdp_08_hiface_hprocess
    {T Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : T → Ω → ℝ) (hX : ∀ t, Measurable (X t)) :
    Process.Chaining.IndexedRealProcess T Ω μ :=
  Process.Chaining.measurableIndexedRealProcess μ X hX

end NumStability.HDP.Contract
