import NumStability.Source.Higham.Chapter10.Endpoints
import NumStability.Source.Higham.Chapter10.Theorem08.NormwiseDiscrepancy.LiteralSource

/-!
# Higham Theorem 10.8 factor uniqueness

Uniqueness of the source's displayed positive-diagonal perturbed Cholesky
factor.
-/

open scoped BigOperators Matrix.Norms.L2Operator

noncomputable section

namespace NumStability

/-- The displayed perturbed factor is not merely a witness: it is the unique
positive-diagonal Cholesky factor required by the source. -/
theorem higham10_8_counterRhat_unique
    (S : Fin 2 → Fin 2 → ℝ)
    (hS : CholeskyFactSpec 2 higham10_8_counterAplus S) :
    ∀ i j : Fin 2, S i j = higham10_8_counterRhat i j :=
  higham10_1_cholesky_uniqueness 2 higham10_8_counterAplus S
    higham10_8_counterRhat hS higham10_8_counterRhat_cholesky

end NumStability

end
