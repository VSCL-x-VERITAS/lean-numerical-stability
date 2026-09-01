import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Data.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.ToLin
import NumStability.Analysis.LinearOperators.Schur.Real.InvariantSubspace.Complexification
import NumStability.Analysis.LinearOperators.Schur.Real.InvariantSubspace.Existence
import NumStability.Analysis.LinearOperators.Schur.Real.InvariantSubspace.TwoByTwo
import NumStability.Analysis.LinearOperators.Schur.Real.QuasiTriangular.API
import NumStability.Analysis.LinearOperators.Schur.Real.QuasiTriangular.Basic
import NumStability.Analysis.LinearOperators.Schur.Real.QuasiTriangular.BlockEmbedding
import NumStability.Analysis.LinearOperators.Schur.Real.QuasiTriangular.Deflation
import NumStability.Analysis.LinearOperators.Schur.Real.QuasiTriangular.Existence
import NumStability.Analysis.LinearOperators.Schur.Real.QuasiTriangular.OrthogonalFrame
import NumStability.Analysis.LinearOperators.Schur.Real.QuasiTriangular.Reindex
import NumStability.Analysis.LinearOperators.Schur.Real.QuasiTriangular.TrailingConjugation

/-!
# Analysis.RealQuasiSchur

Historical compatibility facade for the W05 semantic modules.
-/
