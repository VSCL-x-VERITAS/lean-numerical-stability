import Mathlib.Data.ENat.Lattice
import Mathlib.Data.Finset.Card

/-!
# Vapnik--Chervonenkis dimension

This module gives the finite shattering and extended-natural VC-dimension
interface used by the empirical-process and statistical-learning chapters.
-/

namespace NumStability.HDP.Process.VC

/-- A class of Boolean functions shatters a finite set when every Boolean
labeling of that set is the restriction of a member of the class.

Source: Vershynin, *High-Dimensional Probability*, Definition 8.3.1,
printed pages 202--203 (`HDP-08-DEF-8.3.1`). -/
def Shatters {Ω : Type*} (𝓕 : Set (Ω → Bool)) (A : Finset Ω) : Prop :=
  ∀ g : A → Bool, ∃ f ∈ 𝓕, ∀ x : A, f x = g x

/-- The VC dimension of a Boolean function class is the supremum, in
`WithTop ℕ`, of the cardinalities of finite sets that it shatters.  Thus an
unbounded family of shattered finite sets has VC dimension `⊤` without
requiring a largest finite witness.

Source: Vershynin, *High-Dimensional Probability*, Definition 8.3.1,
printed pages 202--203 (`HDP-08-DEF-8.3.1`). -/
noncomputable def vcDimension {Ω : Type*} (𝓕 : Set (Ω → Bool)) : WithTop ℕ :=
  sSup {d : WithTop ℕ | ∃ A : Finset Ω, Shatters 𝓕 A ∧ d = A.card}

end NumStability.HDP.Process.VC

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-08-DEF-8.3.1`. -/
noncomputable def hdp_08_hdef_h8_d3_d1 {Ω : Type*} :
    Set (Ω → Bool) → WithTop ℕ :=
  Process.VC.vcDimension

end NumStability.HDP.Contract
