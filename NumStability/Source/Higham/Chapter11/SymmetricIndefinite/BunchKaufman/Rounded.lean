import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.ClosedFormErrorBound
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.ErrorBound
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.Execution
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GlobalFactors
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GlobalResidual
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GrowthBounds
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GrowthSolveError
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.LocalFactorProducts
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.MiddleSolveError
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.PivotResiduals
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.SolveError
import NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.TwoByTwoSolve

/-!
# Higham Chapter 11: rounded Bunch--Kaufman analysis

Complete import-only surface for rounded execution, factor reconstruction,
growth, residual, and solve-error correspondence.
-/
