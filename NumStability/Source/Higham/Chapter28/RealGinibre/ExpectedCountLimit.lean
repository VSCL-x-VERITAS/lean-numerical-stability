/-
Copyright (c) 2026 QED. All rights reserved.
Released under Apache 2.0 license as described in LICENSES/Apache-2.0.txt.
SPDX-License-Identifier: Apache-2.0
See LICENSES/Apache-2.0.txt.
Authors: QED
-/
import NumStability.Analysis.Probability.RandomMatrices.RealGinibre

/-! # Higham Chapter 28: real-Ginibre expected-count limit

Source-facing statement and finite-formula transfer for the real-Ginibre
expected-real-eigenvalue limit on pp. 516--517.
-/

namespace NumStability

open Filter

/-- Precise standard-limit formulation of the real-Ginibre prose on p. 517. -/
def RealGinibreExpectedCountLimit : Prop :=
  Tendsto (fun n : ℕ => expectedRealEigenvalueCount n / Real.sqrt n)
    atTop (nhds (Real.sqrt (2 / Real.pi)))

/-- Explicit-domain transfer of the real-Ginibre expected-real-root limit from
a finite coefficient formula and its asymptotic estimate. -/
theorem realGinibreExpectedCountLimit_of_coefficient_formula
    (a : ℕ → ℝ)
    (hfinite : ∀ n, expectedRealEigenvalueCount n = a n)
    (hestimate : Tendsto (fun n : ℕ => a n / Real.sqrt n)
      atTop (nhds (Real.sqrt (2 / Real.pi)))) :
    RealGinibreExpectedCountLimit := by
  unfold RealGinibreExpectedCountLimit
  convert hestimate using 1
  funext n
  rw [hfinite]

end NumStability
