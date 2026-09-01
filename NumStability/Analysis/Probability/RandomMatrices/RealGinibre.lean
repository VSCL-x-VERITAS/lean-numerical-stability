/-
Copyright (c) 2026 QED. All rights reserved.
Released under Apache 2.0 license as described in LICENSES/Apache-2.0.txt.
SPDX-License-Identifier: Apache-2.0
See LICENSES/Apache-2.0.txt.
Authors: QED
-/
import NumStability.Analysis.MatrixAlgebra
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Probability.Distributions.Gaussian.Real

/-! # The standard real-Ginibre ensemble

Reusable probability foundations for a square matrix with independent
standard real-Gaussian entries: its law, real-eigenvalue count, expected count,
and normalization.
-/

namespace NumStability

open MeasureTheory ProbabilityTheory

local instance realGinibreMeasurableSpaceRSqMat (n : ℕ) :
    MeasurableSpace (RSqMat n) := MeasurableSpace.pi

/-- Product law of an `n × n` matrix with independent standard real-Gaussian
entries. -/
noncomputable def realGinibreMeasure (n : ℕ) : Measure (RSqMat n) :=
  Measure.pi (fun _ : Fin n => Measure.pi (fun _ : Fin n => gaussianReal 0 1))

/-- Number of real roots, with multiplicity, of a real matrix characteristic
polynomial. -/
noncomputable def realEigenvalueCount (n : ℕ) (A : RSqMat n) : ℕ :=
  (Matrix.charpoly A).roots.card

/-- Expected number of real eigenvalues in the standard real-Ginibre law. -/
noncomputable def expectedRealEigenvalueCount (n : ℕ) : ℝ :=
  ∫ A : RSqMat n, (realEigenvalueCount n A : ℝ) ∂realGinibreMeasure n

/-- The standard real-Ginibre product law is normalized. -/
theorem realGinibreMeasure_univ (n : ℕ) :
    realGinibreMeasure n Set.univ = 1 := by
  unfold realGinibreMeasure
  calc
    (Measure.pi (fun _ : Fin n =>
        Measure.pi (fun _ : Fin n => gaussianReal 0 1))) Set.univ =
        ∏ i : Fin n,
          Measure.pi (fun _ : Fin n => gaussianReal 0 1) Set.univ :=
      MeasureTheory.Measure.pi_univ _
    _ = 1 := by simp

end NumStability
