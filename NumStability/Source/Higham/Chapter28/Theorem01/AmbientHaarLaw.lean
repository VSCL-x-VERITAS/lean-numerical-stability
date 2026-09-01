/-
Copyright (c) 2026 QED. All rights reserved.
Released under Apache 2.0 license as described in LICENSES/Apache-2.0.txt.
SPDX-License-Identifier: Apache-2.0
See LICENSES/Apache-2.0.txt.
Authors: QED
-/
import NumStability.Analysis.MatrixAlgebra
import Mathlib.MeasureTheory.Measure.Haar.Basic

/-! # Higham Theorem 28.1: ambient orthogonal-law surface

Ambient-matrix compatibility predicate used by the source-facing Stewart/Haar
development. The exact group-level endpoint remains in the dedicated Theorem
28.1 development.
-/

namespace NumStability

open MeasureTheory

local instance ambientHaarMeasurableSpaceRSqMat (n : ℕ) :
    MeasurableSpace (RSqMat n) := MeasurableSpace.pi

/-- Compatibility predicate for a normalized, orthogonally supported,
left-invariant ambient matrix law. -/
def IsNormalizedOrthogonalHaarLaw (n : ℕ) (mu : Measure (RSqMat n)) : Prop :=
  mu Set.univ = 1 ∧
    mu {Q | IsOrthogonal n Q} = 1 ∧
    ∀ (U : RSqMat n), IsOrthogonal n U →
      ∀ s : Set (RSqMat n), MeasurableSet s →
        mu ((fun Q => U * Q) ⁻¹' s) = mu s

/-- Constructor from normalization, orthogonal support, and left invariance. -/
theorem stewartLaw_isNormalizedOrthogonalHaarLaw
    {n : ℕ} (mu : Measure (RSqMat n))
    (hmass : mu Set.univ = 1)
    (hsupport : mu {Q | IsOrthogonal n Q} = 1)
    (hinvariant : ∀ (U : RSqMat n), IsOrthogonal n U →
      ∀ s : Set (RSqMat n), MeasurableSet s →
        mu ((fun Q => U * Q) ⁻¹' s) = mu s) :
    IsNormalizedOrthogonalHaarLaw n mu :=
  ⟨hmass, hsupport, hinvariant⟩

/-- Dimension-zero inhabitant of the ambient compatibility predicate. -/
theorem diracIdentity_isNormalizedOrthogonalHaarLaw_zero :
    IsNormalizedOrthogonalHaarLaw 0
      (Measure.dirac (1 : RSqMat 0)) := by
  refine ⟨by simp, ?_, ?_⟩
  · have horth : ∀ Q : RSqMat 0, IsOrthogonal 0 Q := by
      intro Q
      rw [Subsingleton.elim Q (1 : RSqMat 0)]
      exact IsOrthogonal.id 0
    have hset : {Q : RSqMat 0 | IsOrthogonal 0 Q} = Set.univ := by
      ext Q
      simp [horth Q]
    rw [hset]
    simp
  · intro U hU s hs
    have hpre : (fun Q : RSqMat 0 => U * Q) ⁻¹' s = s := by
      ext Q
      have hmul : U * Q = Q := Subsingleton.elim _ _
      change U * Q ∈ s ↔ Q ∈ s
      rw [hmul]
    rw [hpre]

end NumStability
