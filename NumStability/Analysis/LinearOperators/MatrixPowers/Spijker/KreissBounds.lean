import NumStability.Analysis.LinearOperators.MatrixPowers.Spijker.KreissBridge
import NumStability.Analysis.LinearOperators.MatrixPowers.Spijker.PlanarAnalysis

/-!
# Analysis.LinearOperators.MatrixPowers.Spijker.KreissBounds

Canonical semantic owner for the unconditional finite-dimensional Kreiss endpoints. It combines the acyclic rational/analytic Spijker chain with the reusable Kreiss bridge.
-/

/-
# Unconditional finite-dimensional Kreiss endpoints

This small public endpoint module applies the proved Spijker arc-length
theorem from `MatrixPowersSpijkerPlanarAnalysis` to the interface results in
`MatrixPowersKreissSpijker`.
-/

namespace NumStability

open scoped Real Topology ComplexOrder
open Complex Metric Set MeasureTheory

noncomputable section

/-- Unconditional pointwise sharp reverse Kreiss estimate. -/
theorem norm_pow_le_exp_mul_dim_proved
    {n : ℕ} [Nonempty (Fin n)]
    (A : CStarMatrix (Fin n) (Fin n) ℂ) {K : ℝ}
    (hK : KreissResolventBound A K) (k : ℕ) :
    ‖A ^ k‖ ≤ Real.exp 1 * n * K :=
  norm_pow_le_exp_mul_dim_of_spijker
    (spijkerArcLengthBound_proved n) A hK k

/-- Unconditional uniform power bound from the sharp Spijker theorem. -/
theorem powerBound_exp_mul_dim_proved
    {n : ℕ} [Nonempty (Fin n)]
    (A : CStarMatrix (Fin n) (Fin n) ℂ) {K : ℝ}
    (hK : KreissResolventBound A K) :
    PowerBound A (Real.exp 1 * n * K) :=
  powerBound_exp_mul_dim_of_spijker
    (spijkerArcLengthBound_proved n) A hK

end
end NumStability
