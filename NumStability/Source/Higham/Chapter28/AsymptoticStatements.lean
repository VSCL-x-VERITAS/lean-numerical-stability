/-
Copyright (c) 2026 QED. All rights reserved.
Released under Apache 2.0 license as described in LICENSES/Apache-2.0.txt.
SPDX-License-Identifier: Apache-2.0
See LICENSES/Apache-2.0.txt.
Authors: QED
-/
import NumStability.Source.Higham.Chapter28.Hilbert.ExactIdentities
import Mathlib.Analysis.SpecialFunctions.Stirling

/-! # Higham Chapter 28: precise asymptotic statement surfaces

Exact filter-based formulations of the chapter's Hilbert, shifted-Hilbert,
Pascal, and second-difference asymptotic prose. Literal rounded or
source-discrepant readings are retained as statement surfaces rather than
asserted theorems.
-/

namespace NumStability

open Filter Asymptotics

/-- Spectral two-norm condition number using the explicit Hilbert inverse
from (28.1). -/
noncomputable def hilbertConditionTwo (n : ℕ) : ℝ :=
  opNorm2 (hilbertMatrix n) * opNorm2 (hilbertInverseFormula n)

/-- The shifted Hilbert family `1/(i+j+2)` from p. 514. -/
noncomputable def shiftedHilbertMatrix (n : ℕ) : RSqMat n :=
  fun i j => 1 / (i.val + j.val + 2 : ℕ)

/-- Two-norm condition number of the symmetric Pascal matrix. -/
noncomputable def pascalConditionTwo (n : ℕ) : ℝ :=
  opNorm2 (pascalMatrix n) *
    opNorm2 ((signedPascal n).transpose * signedPascal n)

/-- Two-norm condition number of the second-difference Toeplitz matrix. -/
noncomputable def secondDifferenceConditionTwo (n : ℕ) : ℝ :=
  opNorm2 (tridiagonalToeplitz n (-1) 2 (-1)) *
    opNorm2 (secondDifferenceInverse n)

/-- Literal ratio-equivalence reading of the determinant display after
(28.2). -/
def HilbertDetAsymptotic : Prop :=
  IsEquivalent atTop
    (fun n : ℕ => Matrix.det (hilbertMatrix n))
    (fun n : ℕ => (2 : ℝ) ^ (-2 * (n : ℝ) ^ 2))

/-- Log-scale formulation of the leading exponential determinant rate. -/
def HilbertDetLeadingLogRate : Prop :=
  Tendsto
    (fun n : ℕ => Real.log (Matrix.det (hilbertMatrix n)) / (n : ℝ) ^ 2)
    atTop (nhds (-2 * Real.log 2))

/-- Literal ratio-equivalence reading of the rounded Hilbert condition
estimate. -/
def HilbertConditionAsymptotic : Prop :=
  IsEquivalent atTop hilbertConditionTwo
    (fun n : ℕ => Real.exp (3.5 * n))

/-- Precise Big-O reading of `‖H̃ₙ‖₂ = π + O(1/log n)`. -/
def ShiftedHilbertNormAsymptotic : Prop :=
  (fun n : ℕ => opNorm2 (shiftedHilbertMatrix n) - Real.pi) =O[atTop]
    (fun n : ℕ => 1 / Real.log n)

/-- Literal ratio-equivalence reading of the displayed Pascal condition
estimate. -/
def PascalConditionAsymptotic : Prop :=
  IsEquivalent atTop pascalConditionTwo
    (fun n : ℕ => (16 : ℝ) ^ n / (n * Real.pi))

/-- Precise asymptotic-equivalence reading of the p. 522 second-difference
condition estimate. -/
def SecondDifferenceConditionAsymptotic : Prop :=
  IsEquivalent atTop secondDifferenceConditionTwo
    (fun n : ℕ => 4 * (n : ℝ) ^ 2 / Real.pi ^ 2)

/-- Exact extremal-eigenvalue quotient suggested by the discrete sine
diagonalization. -/
noncomputable def secondDifferenceConditionClosedForm (n : ℕ) : ℝ :=
  let θ := Real.pi / (n + 1 : ℕ)
  (2 + 2 * Real.cos θ) / (2 - 2 * Real.cos θ)

end NumStability
