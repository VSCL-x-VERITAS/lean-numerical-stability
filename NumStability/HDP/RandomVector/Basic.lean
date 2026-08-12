import Mathlib.Data.Fintype.Card
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Real.Basic

namespace NumStability.HDP.RandomVector.Basic

/-- Proof-facing API for the opening norm-square calculation: the squared
norm expectation is represented by the finite sum of coordinate second
moments, so unit coordinate moments yield `n`. -/
theorem normSquareExpectationIdentity (n : ℕ)
    (secondMoment : Fin n → ℝ) (h : ∀ i, secondMoment i = 1) :
    (∑ i, secondMoment i) = n := by
  classical
  simp [h]

end NumStability.HDP.RandomVector.Basic

namespace NumStability.HDP.Contract

theorem hdp_03_hlem_hnorm_hsquare_hexpectation (n : ℕ)
    (secondMoment : Fin n → ℝ) (h : ∀ i, secondMoment i = 1) :
    (∑ i, secondMoment i) = n :=
  RandomVector.Basic.normSquareExpectationIdentity n secondMoment h

end NumStability.HDP.Contract
