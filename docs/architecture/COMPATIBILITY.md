# Compatibility policy and path map

This migration changes canonical module paths without changing declaration
names or the historical meaning of `import NumStability`. Every old path in
the table remains an import-only forwarding module.

## Current forwarding paths

| Historical path | Canonical path |
| --- | --- |
| `NumStability.Algorithms.Ch5LejaProducer` | `NumStability.Algorithms.Horner`, `NumStability.Source.Higham.Chapter05.Problem04.LejaOrdering.Basic` |
| `NumStability.Algorithms.Ch5NewtonForm` | `NumStability.Algorithms.Horner`, `NumStability.Analysis.Rounding`, `NumStability.FloatingPoint.Model`, `NumStability.Source.Higham.Chapter05.Section03.NewtonEvaluation.Basic` |
| `NumStability.Algorithms.HighamLemma88Entrywise` | `NumStability.Source.Higham.Chapter08.Lemma08.Entrywise.Basic` |
| `NumStability.Algorithms.OrderingExamples` | `NumStability.Algorithms.Summation.Insertion.ActiveList`, `NumStability.Algorithms.Summation.Recursive.Core`, `NumStability.Algorithms.Summation.Tree.Core`, `NumStability.Source.Higham.Chapter04.Equation05.OrderingExamples.Basic` |
| `NumStability.Analysis.Accumulation` | `NumStability.Analysis.FloatingPointArithmetic.Format`, `NumStability.Analysis.FloatingPointArithmetic.NearestRoundingError`, `NumStability.Analysis.Rounding`, `NumStability.Source.Higham.Chapter01.Problem05.CompensatedLogarithm.Basic`, `NumStability.Source.Higham.Chapter01.Section11.Accumulation.Basic` |
| `NumStability.Analysis.CalculatorWords` | `NumStability.Source.Higham.Chapter01.Problem06.CalculatorWords.Basic` |
| `NumStability.Analysis.Counting` | `NumStability.Analysis.FloatingPointArithmetic`, `NumStability.Source.Higham.Chapter02.Problem01.FloatingPointCounts.Basic` |
| `NumStability.Analysis.HighamChapter2GradualUnderflowExact` | `NumStability.Analysis.FloatingPointArithmetic`, `NumStability.Source.Higham.Chapter02.Problem19.GradualUnderflowExactness.Basic` |
| `NumStability.Analysis.HighamChapter2Tablemaker` | `NumStability.Analysis.FloatingPointArithmetic`, `NumStability.Source.Higham.Chapter02.Section10.Tablemaker.FiniteSeparation.Basic` |
| `NumStability.Analysis.MullerRecurrence` | `NumStability.Source.Higham.Chapter01.Problem08.MullerRecurrence.Basic` |
| `NumStability.Analysis.NearInteger` | `NumStability.Source.Higham.Chapter01.Problem02.NearIntegerTable.Basic` |
| `NumStability.Analysis.Problem2_15_16` | `NumStability.Analysis.FloatingPointArithmetic`, `NumStability.Source.Higham.Chapter02.Problems15And16.SpecialValueProbes.Basic` |
| `NumStability.Analysis.Problem2_18` | `NumStability.Source.Higham.Chapter02.Problem18.ExactSubtractionCounterexample.Basic` |
| `NumStability.Analysis.Problem2_19` | `NumStability.Source.Higham.Chapter02.Problem20.SquareRootIdentities.Basic` |
| `NumStability.Analysis.Problem2_23` | `NumStability.Analysis.FloatingPointArithmetic`, `NumStability.Source.Higham.Chapter02.Problem24.GuardDigitCancellation.Basic` |
| `NumStability.Analysis.Problem2_25` | `NumStability.Source.Higham.Chapter02.Problem27.KahanDeterminant.Basic` |
| `NumStability.Analysis.Problem2_26` | `NumStability.Analysis.Problem2_14`, `NumStability.Source.Higham.Chapter02.Section06.ReciprocalIteration.Basic` |
| `NumStability.Analysis.Problem2_5` | `NumStability.Analysis.FloatingPointArithmetic`, `NumStability.Source.Higham.Chapter02.Problem05.BinaryOneTenth.Basic` |
| `NumStability.Analysis.Problem2_6` | `NumStability.Analysis.FloatingPointArithmetic`, `NumStability.Source.Higham.Chapter02.Problem06.IntegerRepresentability.Basic` |
| `NumStability.Algorithms.HighamChapter8FanInClosure` | `NumStability.Source.Higham.Chapter08.Equation15.GlobalEnvelopeCounterexample.RawCube` |
| `NumStability.Algorithms.IterativeRefinement` | `NumStability.Algorithms.LinearSystems.IterativeRefinement.Core`, `NumStability.Source.Higham.Chapter12.IterativeRefinement.Chapter12Bounds`, and `NumStability.Source.Higham.Chapter12.IterativeRefinement.LegacyChapter11Surface` |
| `NumStability.Algorithms.PriestFiniteFormat` | `NumStability.Algorithms.Summation.Compensated.Priest.FiniteFormat` and `NumStability.Source.Higham.Chapter04.Algorithm03.Priest.SourceAssumptions` |
| `NumStability.Algorithms.TriangularArbitraryOrder` | `NumStability.Algorithms.Summation.Tree.ArbitraryOrderError.PivotNormalized` and `NumStability.Source.Higham.Chapter08.Section03.TriangularSystems.ArbitraryOrder` |
| `NumStability.Algorithms.TriangularNoGuard` | `NumStability.Algorithms.LinearSystems.Triangular.ErrorAnalysis.NoGuardBackward`, `NumStability.Algorithms.LinearSystems.Triangular.ErrorAnalysis.NoGuardForward`, `NumStability.Source.Higham.Chapter08.Problem01.NoGuardSubstitution.BackwardSubstitution`, and `NumStability.Source.Higham.Chapter08.Problem01.NoGuardSubstitution.ForwardSubstitution` |
| `NumStability.Analysis.CramersRule` | `NumStability.Algorithms.LinearSystems.CramersRule.Core`, `NumStability.Source.Higham.Chapter01.Problem09.CramersRule.ForwardError`, and `NumStability.Source.Higham.Chapter01.Section10.CramersRule.PrintedComparison` |
| `NumStability.Analysis.Error` | `NumStability.Analysis.Error.Measures.AccuracyPrecision`, `NumStability.Analysis.Error.Measures.Componentwise`, `NumStability.Analysis.Error.Measures.ScalarDefinitions`, `NumStability.Analysis.Error.Measures.ScalarProperties`, `NumStability.Analysis.Error.Measures.ScalarWitnesses`, `NumStability.Analysis.FloatingPointArithmetic.ErrorModels.Additive`, `NumStability.Analysis.FloatingPointArithmetic.ErrorModels.AdditiveProperties`, `NumStability.Analysis.FloatingPointArithmetic.ErrorModels.NoGuardBasic`, `NumStability.Analysis.FloatingPointArithmetic.ErrorModels.NoGuardModel`, `NumStability.Source.Higham.Chapter01.Problem01.RelativeError.Bounds`, `NumStability.Source.Higham.Chapter01.Section03.ErrorSources.Core`, `NumStability.Source.Higham.Chapter01.Section07.Cancellation.Basic`, and `NumStability.Source.Higham.Chapter02.Section04.NoGuardModel.BinaryT3Example` |
| `NumStability.Analysis.FusedMultiplyAdd` | `NumStability.FloatingPoint.FusedMultiplyAdd.Core`, `NumStability.FloatingPoint.FusedMultiplyAdd.DotProductCounts`, `NumStability.Source.Higham.Chapter02.Problem26.ExactProduct.Discrepancy`, and `NumStability.Source.Higham.Chapter02.Section06.FusedMultiplyAdd.DotProductCount` |
| `NumStability.Analysis.Midpoint` | `NumStability.Analysis.FloatingPointArithmetic.MidpointRounding.DecimalTieExamples` and `NumStability.Source.Higham.Chapter02.Problem08.MidpointRounding.Counterexample` |
| `NumStability.Analysis.ProblemDependentStability` | `NumStability.Analysis.ProblemDependentStability.HessenbergDeterminant`, `NumStability.Source.Higham.Chapter01.Section16.ProblemDependentStability.ExactExample`, and `NumStability.Source.Higham.Chapter01.Section16.ProblemDependentStability.Table13IeeeSingle` |
| `NumStability.Analysis.RoundingProductBounds` | `NumStability.Analysis.Error.RoundingProducts.Core` and `NumStability.Source.Higham.Chapter03.Problem02.ProductBounds.PositiveFactors` |
| `NumStability.Analysis.TrigCancellation` | `NumStability.Analysis.FloatingPointArithmetic.TrigonometricCancellation.Core`, `NumStability.Source.Higham.Chapter01.Problem03.CancellationRewrites.Algebra`, and `NumStability.Source.Higham.Chapter01.Section07.TrigonometricCancellation.Example` |
| `NumStability.Higham` | `NumStability.Source.Higham` |
| `NumStability.Higham.Chapter02.Problem04` | `NumStability.Source.Higham.Chapter02.Problem04` |
| `NumStability.Higham.Chapter02.Problem07` | `NumStability.Source.Higham.Chapter02.Problem07` |
| `NumStability.Higham.Chapter02.Problem22` | `NumStability.Source.Higham.Chapter02.Problem23` |
| `NumStability.Higham.Chapter08.Lemma8_8Discrepancy` | `NumStability.Source.Higham.Chapter08.Lemma08Discrepancy` |
| `NumStability.Higham.Chapter10.Theorem10_7` | `NumStability.Source.Higham.Chapter10.Theorem07` |
| `NumStability.Higham.Chapter11.Theorem11_7Capstone` | `NumStability.Source.Higham.Chapter11.Theorem07` |
| `NumStability.Higham.Chapter13.Table13_1` | `NumStability.Source.Higham.Chapter13.Equation25` and `NumStability.Source.Higham.Chapter13.Table01` |
| `NumStability.Higham.Chapter14.Discrepancies` | `NumStability.Source.Higham.Chapter14.Discrepancies` |
| `NumStability.Higham.Chapter20.SourceAliases` | `NumStability.Source.Higham.Chapter20.Equation32`, `NumStability.Source.Higham.Chapter20.Lemma06`, and `NumStability.Source.Higham.Chapter20.Theorem01` |
| `NumStability.Higham.CrossChapter.Chapter02To03NoGuardDot` | `NumStability.Algorithms.Arithmetic.DotProduct.NoGuard` and `NumStability.Source.Higham.CrossChapter.NoGuardDotProduct` |
| `NumStability.Higham.CrossChapter.Chapter07To15PracticalBound` | `NumStability.Source.Higham.CrossChapter.PracticalConditionBound` |
| `NumStability.Higham.CrossChapter.Chapter09To12GenericSolver` | `NumStability.Source.Higham.CrossChapter.LUSolverWeights.Factorization` |
| `NumStability.Higham.CrossChapter.Chapter09To12Solver` | `NumStability.Source.Higham.CrossChapter.LUSolverWeights.Doolittle` |
| `NumStability.Algorithms.Chapter06Lemma66` | `NumStability.Source.Higham.Chapter06.Lemma06` |
| `NumStability.Algorithms.RecursiveSum` | `NumStability.Algorithms.Summation.Recursive` |
| `NumStability.Algorithms.PairwiseSum` | `NumStability.Algorithms.Summation.Pairwise` |
| `NumStability.Algorithms.InsertionSum` | `NumStability.Algorithms.Summation.Insertion` |
| `NumStability.Algorithms.SumTree` | `NumStability.Algorithms.Summation.Tree` |
| `NumStability.Algorithms.Summation.Tree.RecursiveBridge` | `NumStability.Algorithms.Summation.Tree.Chain` |
| `NumStability.Algorithms.PlusMinusSum` | `NumStability.Algorithms.Summation.PlusMinus` |
| `NumStability.Algorithms.CompensatedSum` | `NumStability.Algorithms.Summation.Compensated` |
| `NumStability.Algorithms.KahanCompensatedFiniteFormat` | `NumStability.Source.Higham.Chapter04.Section03.FiniteFormat` |
| `NumStability.Algorithms.DoublyCompensatedSum` | `NumStability.Algorithms.Summation.DoublyCompensated` |
| `NumStability.Algorithms.AccumulatorSum` | `NumStability.Algorithms.Summation.Accumulator` |
| `NumStability.Algorithms.TriangularSolve` | `NumStability.Algorithms.LinearSystems.Triangular.BackSubstitution` |
| `NumStability.Algorithms.ForwardSub` | `NumStability.Algorithms.LinearSystems.Triangular.ForwardSubstitution` |
| `NumStability.Algorithms.TriangularForwardBound` | `NumStability.Algorithms.LinearSystems.Triangular.DiagonalDominance` |
| `NumStability.Algorithms.InverseBounds` | `NumStability.Algorithms.LinearSystems.Triangular.InverseBounds` |
| `NumStability.Algorithms.TriangularForwardComparison` | `NumStability.Algorithms.LinearSystems.Triangular.ComparisonBounds` |
| `NumStability.Algorithms.TriangularSolveCombined` | `NumStability.Algorithms.LinearSystems.Triangular.Combined` |
| `NumStability.Analysis.Higham6Asides` | `NumStability.Source.Higham.Chapter06.Asides` |
| `NumStability.Analysis.Higham6BlockAntidiag` | `NumStability.Source.Higham.Chapter06.BlockAntidiagonalNorm.InducedLp` |
| `NumStability.Analysis.HighamChapter2PowerLeadingDigits` | `NumStability.Source.Higham.Chapter02.Problem11` and `NumStability.Source.Higham.Chapter02.Section07.PowerLeadingDigits` |
| `NumStability.Analysis.HighamChapter6Duality` | `NumStability.Source.Higham.Chapter06.Equation02` |
| `NumStability.Analysis.LeadingDigitDistribution` | `NumStability.Analysis.LeadingDigits.LogarithmicDistribution` |
| `NumStability.Analysis.Norms` | `NumStability.Analysis.Norms.Core` and `NumStability.Source.Higham.Chapter06.Norms` |
| `NumStability.Analysis.Problem2_11` | `NumStability.Source.Higham.Chapter02.Problem11` |
| `NumStability.Analysis.Problem2_2` | `NumStability.Source.Higham.Chapter02.Problem02` |
| `NumStability.Analysis.Problem2_4` | `NumStability.Source.Higham.Chapter02.Problem04` |
| `NumStability.Analysis.Problem2_7` | `NumStability.FloatingPoint.OperationLaws` and `NumStability.Source.Higham.Chapter02.Problem07` |
| `NumStability.Analysis.Problem2_21` | `NumStability.Source.Higham.Chapter02.Problem22` |
| `NumStability.Analysis.Problem2_22` | `NumStability.Source.Higham.Chapter02.Problem23` |
| `NumStability.Algorithms.HighamChapter8Lemma88SourceDiscrepancy` | `NumStability.Source.Higham.Chapter08.Lemma08Discrepancy` |
| `NumStability.Algorithms.HighamChapter9` | `NumStability.Source.Higham.Chapter09.Problems`, `NumStability.Source.Higham.Chapter09.Section01`, `NumStability.Source.Higham.Chapter09.Section02`, `NumStability.Source.Higham.Chapter09.Section03`, `NumStability.Source.Higham.Chapter09.Section04`, `NumStability.Source.Higham.Chapter09.Section05`, `NumStability.Source.Higham.Chapter09.Section06`, `NumStability.Source.Higham.Chapter09.Section08`, `NumStability.Source.Higham.Chapter09.Section10`, and `NumStability.Source.Higham.Chapter09.Section11` |
| `NumStability.Algorithms.HighamChapter9CompletePivotSharpClosure` | `NumStability.Source.Higham.Chapter09.CompletePivotSharpClosure` |
| `NumStability.Algorithms.HighamChapter9ComplexClosure` | `NumStability.Source.Higham.Chapter09.ComplexClosure` |
| `NumStability.Algorithms.HighamChapter9ComputedCorrection` | `NumStability.Source.Higham.Chapter09.ComputedCorrection` |
| `NumStability.Algorithms.HighamChapter9DoolittleClosure` | `NumStability.Source.Higham.Chapter09.DoolittleClosure` |
| `NumStability.Algorithms.HighamChapter9Theorem914Actual` | `NumStability.Source.Higham.Chapter09.Theorem914Actual` |
| `NumStability.Algorithms.HighamChapter9Theorem914DiagDominant` | `NumStability.Source.Higham.Chapter09.Theorem914DiagDominant` |
| `NumStability.Algorithms.HighamChapter9Theorem914Primitive` | `NumStability.Source.Higham.Chapter09.Theorem914Primitive` |
| `NumStability.Algorithms.HighamChapter9Theorem97Classification` | `NumStability.Source.Higham.Chapter09.Theorem97Classification` |
| `NumStability.Algorithms.HighamChapter9Theorem99Closure` | `NumStability.Source.Higham.Chapter09.Theorem99Closure` |
| `NumStability.Algorithms.HighamChapter9Theorem99ComplexClosure` | `NumStability.Source.Higham.Chapter09.Theorem99ComplexClosure` |
| `NumStability.Algorithms.Cholesky.Higham10Theorem10_7Source` | `NumStability.Source.Higham.Chapter10.Theorem07` |
| `NumStability.Algorithms.Cholesky.BunchTridiagonalCapstoneCh11Closure` | `NumStability.Source.Higham.Chapter11.Theorem07` |
| `NumStability.Algorithms.HighamChapter11` | `NumStability.Source.Higham.Chapter11.Section01.Basic`, `NumStability.Source.Higham.Chapter11.Section01.CompletePivoting`, `NumStability.Source.Higham.Chapter11.Section01.PartialPivoting`, `NumStability.Source.Higham.Chapter11.Section01.RookPivoting`, `NumStability.Source.Higham.Chapter11.Section01.Tridiagonal`, `NumStability.Source.Higham.Chapter11.Section02.Aasen`, `NumStability.Source.Higham.Chapter11.Section03.SkewSymmetric`, and `NumStability.Source.Higham.Chapter11.Problems` |
| `NumStability.Algorithms.Cholesky.Aasen118ReducedCh11Closure` | `NumStability.Source.Higham.Chapter11.Aasen118Reduced` |
| `NumStability.Algorithms.Cholesky.AasenAdjacentPivotOperationalMiddleCh11` | `NumStability.Source.Higham.Chapter11.AasenAdjacentPivotOperationalMiddle` |
| `NumStability.Algorithms.Cholesky.AasenAdjacentPivotResidualDomainCh11Discrepancy` | `NumStability.Source.Higham.Chapter11.AasenAdjacentPivotResidualDomain` |
| `NumStability.Algorithms.Cholesky.AasenAdjacentPivotSourceResidualCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenAdjacentPivotSourceResidual` |
| `NumStability.Algorithms.Cholesky.AasenAdjacentPivotTridiagExecutorCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenAdjacentPivotTridiagExecutor` |
| `NumStability.Algorithms.Cholesky.AasenAdjacentPivotTridiagForwardCounterexampleCh11` | `NumStability.Source.Higham.Chapter11.AasenAdjacentPivotTridiagForwardCounterexample` |
| `NumStability.Algorithms.Cholesky.AasenCoupledFpCh11Closure` | `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.Aasen.AasenCoupledFp` |
| `NumStability.Algorithms.Cholesky.AasenDirect118Ch11Closure` | `NumStability.Source.Higham.Chapter11.AasenDirect118` |
| `NumStability.Algorithms.Cholesky.AasenDirectTridiagGEPPSolveCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenDirectTridiagGEPPSolve` |
| `NumStability.Algorithms.Cholesky.AasenFactorNormCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenFactorNorm` |
| `NumStability.Algorithms.Cholesky.AasenFactorResidualCh11Closure` | `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.Aasen.AasenFactorResidual` |
| `NumStability.Algorithms.Cholesky.AasenGrowthCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenGrowth` |
| `NumStability.Algorithms.Cholesky.AasenMiddleGEPPCh11Counterexample` | `NumStability.Source.Higham.Chapter11.AasenMiddleGEPPCh11Counterexample` |
| `NumStability.Algorithms.Cholesky.AasenOriginalCoordinateCorrectionCh11` | `NumStability.Source.Higham.Chapter11.AasenOriginalCoordinateCorrection` |
| `NumStability.Algorithms.Cholesky.AasenPermutationSourceCorrectionCh11` | `NumStability.Source.Higham.Chapter11.AasenPermutationSourceCorrection` |
| `NumStability.Algorithms.Cholesky.AasenPrintedCoefficientAlgebraCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenPrintedCoefficientAlgebra` |
| `NumStability.Algorithms.Cholesky.AasenSourceSharpFactorResidualCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenSourceSharpFactorResidual` |
| `NumStability.Algorithms.Cholesky.AasenTheorem118ScalarEdgeCh11Discrepancy` | `NumStability.Source.Higham.Chapter11.AasenTheorem118ScalarEdge` |
| `NumStability.Algorithms.Cholesky.AasenTridiagGEPPCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenTridiagGEPP` |
| `NumStability.Algorithms.Cholesky.AasenUnitOuterSolveCh11Closure` | `NumStability.Source.Higham.Chapter11.AasenUnitOuterSolve` |
| `NumStability.Algorithms.Cholesky.BlockLDLTAllOneByOnePrintedCh11Closure` | `NumStability.Source.Higham.Chapter11.BlockLDLTAllOneByOnePrinted` |
| `NumStability.Algorithms.Cholesky.BlockLDLTBunchTridiagonalCh11Closure` | `NumStability.Source.Higham.Chapter11.BlockLDLTBunchTridiagonal` |
| `NumStability.Algorithms.Cholesky.BlockLDLTMixedPivotCh11Closure` | `NumStability.Source.Higham.Chapter11.BlockLDLTMixedPivot` |
| `NumStability.Algorithms.Cholesky.BlockLDLTSolveBackwardCh11Closure` | `NumStability.Source.Higham.Chapter11.BlockLDLTSolveBackward` |
| `NumStability.Algorithms.Cholesky.BunchKaufmanSolveCh11Closure` | `NumStability.Source.Higham.Chapter11.BunchKaufmanSolve` |
| `NumStability.Algorithms.Cholesky.BunchTridiagonalActualSolveCh11Closure` | `NumStability.Source.Higham.Chapter11.BunchTridiagonalActualSolve` |
| `NumStability.Algorithms.Cholesky.BunchTridiagonalFactorBoundCh11Closure` | `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.BlockLDLT.BunchTridiagonalFactorBound` |
| `NumStability.Algorithms.Cholesky.BunchTridiagonalGrowthCh11Closure` | `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.BlockLDLT.BunchTridiagonalGrowth` |
| `NumStability.Algorithms.Cholesky.BunchTridiagonalGrowthInvariantCh11Closure` | `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.BlockLDLT.BunchTridiagonalGrowthInvariant` |
| `NumStability.Algorithms.Cholesky.BunchTridiagonalHFactorCh11Closure` | `NumStability.Source.Higham.Chapter11.BunchTridiagonalHFactor` |
| `NumStability.Algorithms.Cholesky.BunchTridiagonalSparseFactorCh11Closure` | `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.BlockLDLT.BunchTridiagonalSparseFactor` |
| `NumStability.Algorithms.Cholesky.BunchTridiagonalSparseSolveCh11Closure` | `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.BlockLDLT.BunchTridiagonalSparseSolve` |
| `NumStability.Algorithms.Cholesky.Higham11BunchActualSharpGrowthClosure` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Bunch.CertifiedSharpGrowth` |
| `NumStability.Algorithms.Cholesky.Higham11BunchExactTrace` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Bunch.ExactTrace` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanActualSelector` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.PivotSelection` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanExactGrowth` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExactGrowthBounds` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanExactGrowthArithmetic` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExactArithmetic` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanExactTrace` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExactTrace` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanExplicitInverseSolve` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExplicitInverseSolve` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanExplicitInverseTerminalClosedForm` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExplicitInverseClosedFormErrorBound` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedAccumulated` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.LocalFactorProducts` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedBridge` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.TwoByTwoSolve` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedClosure` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.PivotResiduals` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedExecution` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.Execution` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedFactors` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GlobalFactors` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedGlobal` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GlobalResidual` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedGrowth` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GrowthBounds` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedGrowthSolve` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GrowthSolveError` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedMiddleSolve` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.MiddleSolveError` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedSolve` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.SolveError` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedTerminal` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.ErrorBound` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanRoundedTerminalClosedForm` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.ClosedFormErrorBound` |
| `NumStability.Algorithms.Cholesky.Higham11BunchKaufmanSourceCorrection` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ComputedProductCorrection` |
| `NumStability.Algorithms.Cholesky.Higham11BunchSharpGrowthBridge` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Bunch.SharpGrowthAnalysis` |
| `NumStability.Algorithms.Cholesky.Higham11BunchTraceHadamard` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Bunch.TraceHadamardBounds` |
| `NumStability.Algorithms.Cholesky.Higham11Chapter9ActualExecutorBridge` | `NumStability.Source.Higham.CrossChapter.Chapter09To11.ExecutorForwardError` |
| `NumStability.Algorithms.Cholesky.Higham11Chapter9BridgeClosure` | `NumStability.Source.Higham.CrossChapter.Chapter09To11.SymmetricIndefiniteErrorBounds` |
| `NumStability.Algorithms.Cholesky.Higham11RookExactTrace` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Rook.ExactTrace` |
| `NumStability.Algorithms.Cholesky.Higham11RookExecutorAdapter` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Rook.MixedExecutor` |
| `NumStability.Algorithms.Cholesky.Higham11RookRoundedGap` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Rook.RoundedCounterexample` |
| `NumStability.Algorithms.Cholesky.Higham11RookSourceClosure` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Rook.GrowthAndErrorBounds` |
| `NumStability.Algorithms.Cholesky.Higham11SkewActualSelector` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.SkewSymmetric.PivotSelection` |
| `NumStability.Algorithms.Cholesky.Higham11SkewExactTrace` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.SkewSymmetric.ExactTrace` |
| `NumStability.Algorithms.Cholesky.Higham11SkewSourceCorrection` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.SkewSymmetric.MultiplierCorrection` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchActualSharpGrowthClosure` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Bunch.CertifiedSharpGrowth` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchExactTrace` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Bunch.ExactTrace` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanActualSelector` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.PivotSelection` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanExactGrowth` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExactGrowthBounds` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanExactGrowthArithmetic` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExactArithmetic` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanExactTrace` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExactTrace` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanExplicitInverseSolve` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExplicitInverseSolve` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanExplicitInverseTerminalClosedForm` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ExplicitInverseClosedFormErrorBound` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedAccumulated` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.LocalFactorProducts` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedBridge` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.TwoByTwoSolve` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedClosure` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.PivotResiduals` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedExecution` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.Execution` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedFactors` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GlobalFactors` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedGlobal` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GlobalResidual` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedGrowth` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GrowthBounds` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedGrowthSolve` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.GrowthSolveError` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedMiddleSolve` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.MiddleSolveError` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedSolve` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.SolveError` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedTerminal` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.ErrorBound` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanRoundedTerminalClosedForm` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.Rounded.ClosedFormErrorBound` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchKaufmanSourceCorrection` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.BunchKaufman.ComputedProductCorrection` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchSharpGrowthBridge` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Bunch.SharpGrowthAnalysis` |
| `NumStability.Source.Higham.Chapter11.Higham11BunchTraceHadamard` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Bunch.TraceHadamardBounds` |
| `NumStability.Source.Higham.Chapter11.Higham11Chapter9ActualExecutorBridge` | `NumStability.Source.Higham.CrossChapter.Chapter09To11.ExecutorForwardError` |
| `NumStability.Source.Higham.Chapter11.Higham11Chapter9BridgeClosure` | `NumStability.Source.Higham.CrossChapter.Chapter09To11.SymmetricIndefiniteErrorBounds` |
| `NumStability.Source.Higham.Chapter11.Higham11RookExactTrace` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Rook.ExactTrace` |
| `NumStability.Source.Higham.Chapter11.Higham11RookExecutorAdapter` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Rook.MixedExecutor` |
| `NumStability.Source.Higham.Chapter11.Higham11RookRoundedGap` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Rook.RoundedCounterexample` |
| `NumStability.Source.Higham.Chapter11.Higham11RookSourceClosure` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.Rook.GrowthAndErrorBounds` |
| `NumStability.Source.Higham.Chapter11.Higham11SkewActualSelector` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.SkewSymmetric.PivotSelection` |
| `NumStability.Source.Higham.Chapter11.Higham11SkewExactTrace` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.SkewSymmetric.ExactTrace` |
| `NumStability.Source.Higham.Chapter11.Higham11SkewSourceCorrection` | `NumStability.Source.Higham.Chapter11.SymmetricIndefinite.SkewSymmetric.MultiplierCorrection` |
| `NumStability.Algorithms.Cholesky.TwoByTwoSchurStepCh11Closure` | `NumStability.Source.Higham.Chapter11.TwoByTwoSchurStep` |
| `NumStability.Algorithms.HighamChapter12` | `NumStability.Source.Higham.Chapter12.IterativeRefinement` |
| `NumStability.Algorithms.HighamChapter12OmegaDiscontinuity` | `NumStability.Source.Higham.Chapter12.OmegaDiscontinuity` |
| `NumStability.Algorithms.HighamChapter12Problem12_2` | `NumStability.Source.Higham.Chapter12.Problem02` |
| `NumStability.Algorithms.LU.BlockLU` | `NumStability.Algorithms.LinearSystems.LU.BlockLU` and `NumStability.Source.Higham.Chapter13.BlockLU` |
| `NumStability.Algorithms.LU.BlockLUArbitraryNormSourceClosure` | `NumStability.Algorithms.LinearSystems.LU.BlockLU.ArbitraryNorm` and `NumStability.Source.Higham.Chapter13.Section03.ArbitraryNormDominance` |
| `NumStability.Algorithms.LU.BlockLUComputationSourceClosure` | `NumStability.Source.Higham.Chapter13.Theorem06.Computation` |
| `NumStability.Algorithms.LU.BlockLUFirstOrderFamilies` | `NumStability.Algorithms.LinearSystems.LU.BlockLU.FirstOrderFamilies`, `NumStability.Source.Higham.Chapter13.Section01.OperationModelFamilies`, `NumStability.Source.Higham.Chapter13.Table01.Families`, and `NumStability.Source.Higham.Chapter13.Theorem05.FamilyErrorAnalysis` |
| `NumStability.Algorithms.LU.BlockLUPointRowGrowthSourceClosure` | `NumStability.Source.Higham.Chapter13.Equation23.PointRowGrowth` |
| `NumStability.Algorithms.LU.BlockLURowSourceClosure` | `NumStability.Source.Higham.Chapter13.Section03.RowDominanceClosure` |
| `NumStability.Algorithms.LU.BlockLUScalarGrowthBridge` | `NumStability.Source.Higham.Chapter13.Problem04.ScalarGrowthBridge` |
| `NumStability.Algorithms.LU.BlockLUSourceClosure` | `NumStability.Algorithms.LinearSystems.LU.BlockLU.OperatorTwo` and `NumStability.Source.Higham.Chapter13.Section03.ColumnDominanceClosure` |
| `NumStability.Algorithms.LU.BlockLUSPDFamilies` | `NumStability.Source.Higham.Chapter13.Equation25.Families` |
| `NumStability.Algorithms.LU.BlockLUSPDSourceClosure` | `NumStability.Algorithms.LinearSystems.LU.BlockLU.PositiveDefinite`, `NumStability.Algorithms.LinearSystems.LU.BlockLU.PositiveDefiniteFactorBounds`, `NumStability.Source.Higham.Chapter13.Equation25.Factorization`, and `NumStability.Source.Higham.Chapter13.Section03.SPDFactorBounds` |
| `NumStability.Algorithms.LU.BlockLUTable13_1Families` | `NumStability.Source.Higham.Chapter13.Equation25` and `NumStability.Source.Higham.Chapter13.Table01` |
| `NumStability.Algorithms.LU.BlockLUVarying` | `NumStability.Algorithms.LinearSystems.LU.BlockLU.VaryingBlocks` |
| `NumStability.Algorithms.LU.Higham13DemmelSharpMultiplier` | `NumStability.Source.Higham.Chapter13.DemmelSharpMultiplier` |
| `NumStability.Algorithms.Ch14AsymptoticFamilies` | `NumStability.Source.Higham.Chapter14.AsymptoticFamilies` |
| `NumStability.Algorithms.Ch14BlockTriInverse` | `NumStability.Source.Higham.Chapter14.Section02.TriangularInversion.Method1B.BlockTriInverse` |
| `NumStability.Algorithms.Ch14Cor146UniformInverseBridge` | `NumStability.Source.Higham.Chapter14.Corollary06.SPD.FinalizedUniformInverse` |
| `NumStability.Algorithms.Ch14Cor147FinalDivisionFamilyClosure` | `NumStability.Source.Higham.Chapter14.Corollary07.DiagonalDominance.FinalizedFamilyBounds` |
| `NumStability.Algorithms.Ch14Cor147SourceDomainConstructor` | `NumStability.Source.Higham.Chapter14.Corollary07.DiagonalDominance.SourceDomainConstructor` |
| `NumStability.Algorithms.Ch14Corollary146Closure` | `NumStability.Source.Higham.Chapter14.Corollary06.SPD.Closure` |
| `NumStability.Algorithms.Ch14Corollary146Concrete` | `NumStability.Source.Higham.Chapter14.Corollary06.SPD.Concrete` |
| `NumStability.Algorithms.Ch14Corollary146SourceClosure` | `NumStability.Source.Higham.Chapter14.Corollary06.SPD.SourceClosure` |
| `NumStability.Algorithms.Ch14Corollary147` | `NumStability.Source.Higham.Chapter14.Corollary07.DiagonalDominance.Basic` |
| `NumStability.Algorithms.Ch14Corollary147Closure` | `NumStability.Source.Higham.Chapter14.Corollary07.DiagonalDominance.Closure` |
| `NumStability.Algorithms.Ch14Corollary147Concrete` | `NumStability.Source.Higham.Chapter14.Corollary07.DiagonalDominance.Concrete` |
| `NumStability.Algorithms.Ch14Corollary147SourceClosure` | `NumStability.Source.Higham.Chapter14.Corollary07.DiagonalDominance.SourceFamilyBounds` |
| `NumStability.Algorithms.Ch14Corollary147WeakFamily` | `NumStability.Source.Higham.Chapter14.Corollary07.DiagonalDominance.WeakFamilyBounds` |
| `NumStability.Algorithms.Ch14ForwardErrorEndpoint` | `NumStability.Source.Higham.Chapter14.ForwardErrorEndpoints` |
| `NumStability.Algorithms.Ch14GJEActualDoolittleAdapter` | `NumStability.Source.Higham.Chapter14.Algorithm04.Execution.GJEActualDoolittleAdapter` |
| `NumStability.Algorithms.Ch14GJEAsymptoticFamilies` | `NumStability.Source.Higham.Chapter14.Theorem05.ForwardError.AsymptoticBounds` |
| `NumStability.Algorithms.Ch14GJEFinalDivisionClosure` | `NumStability.Source.Higham.Chapter14.Theorem05.ForwardError.FinalDivisionBounds` |
| `NumStability.Algorithms.Ch14GJEOperationalBridge` | `NumStability.Source.Higham.Chapter14.Algorithm04.Execution.GJEOperationalBridge` |
| `NumStability.Algorithms.Ch14GJEPrintedEnvelopeClosure` | `NumStability.Source.Higham.Chapter14.Theorem05.ForwardError.PrintedEnvelopeBounds` |
| `NumStability.Algorithms.Ch14GJESourceAccumulationBridge` | `NumStability.Source.Higham.Chapter14.Algorithm04.Accumulation.GJESourceAccumulationBridge` |
| `NumStability.Algorithms.Ch14GJETheorem145SourceClosure` | `NumStability.Source.Higham.Chapter14.Theorem05.ForwardError.SourceEndpoints` |
| `NumStability.Algorithms.Ch14GaussJordanAccumulation` | `NumStability.Source.Higham.Chapter14.Algorithm04.Accumulation.GaussJordanAccumulation` |
| `NumStability.Algorithms.Ch14GaussJordanQConstruction` | `NumStability.Source.Higham.Chapter14.Theorem05.ForwardError.GaussJordanQConstruction` |
| `NumStability.Algorithms.Ch14GaussJordanSPDCorollary` | `NumStability.Source.Higham.Chapter14.Corollary06.SPD.GaussJordanSPDCorollary` |
| `NumStability.Algorithms.Ch14GaussJordanSourceClosure` | `NumStability.Source.Higham.Chapter14.Algorithm04.Execution.GaussJordanSourceClosure` |
| `NumStability.Algorithms.Ch14GaussJordanStep` | `NumStability.Source.Higham.Chapter14.Algorithm04.SecondStage.GaussJordanStep` |
| `NumStability.Algorithms.Ch14Method1BWhole` | `NumStability.Source.Higham.Chapter14.Section02.TriangularInversion.Method1B.WholeMatrixResidual` |
| `NumStability.Algorithms.Ch14Method2C` | `NumStability.Source.Higham.Chapter14.Section02.TriangularInversion.Method2C.BlockResidual` |
| `NumStability.Algorithms.Ch14Method2CWhole` | `NumStability.Source.Higham.Chapter14.Section02.TriangularInversion.Method2C.WholeMatrixResidual` |
| `NumStability.Algorithms.Ch14Method2Loop` | `NumStability.Source.Higham.Chapter14.Section02.TriangularInversion.Method2.Method2Loop` |
| `NumStability.Algorithms.Ch14MethodDLeftResidual` | `NumStability.Source.Higham.Chapter14.Section03.LUFactorInversion.MethodD.MethodDLeftResidual` |
| `NumStability.Algorithms.Ch14MethodDProductDischarge` | `NumStability.Source.Higham.Chapter14.Section03.LUFactorInversion.MethodD.MethodDProductDischarge` |
| `NumStability.Algorithms.Ch14MethodDUpperCertificate` | `NumStability.Source.Higham.Chapter14.Section03.LUFactorInversion.MethodD.MethodDUpperCertificate` |
| `NumStability.Algorithms.Ch14MethodsBC` | `NumStability.Source.Higham.Chapter14.Section03.LUFactorInversion.MethodC.MethodsBC` |
| `NumStability.Algorithms.Ch14Problem142` | `NumStability.Source.Higham.Chapter14.Problem02.TriangularInversion.TwoBlockDerivations` |
| `NumStability.Algorithms.Ch14Problem142Families` | `NumStability.Source.Higham.Chapter14.Problem02.TriangularInversion.TwoBlockFamilies` |
| `NumStability.Algorithms.Ch14Problem142Method2B` | `NumStability.Source.Higham.Chapter14.Problem02.TriangularInversion.Method2B.TwoBlockDerivation` |
| `NumStability.Algorithms.Ch14ProductErrorNotation` | `NumStability.Source.Higham.Chapter14.Section01.ProductErrorNotation.ProductErrorNotation` |
| `NumStability.Algorithms.Ch15CondEstimators` | `NumStability.Algorithms.NormEstimation.ClassicalEstimators` |
| `NumStability.Algorithms.Ch15DixonClosure` | `NumStability.Source.Higham.Chapter15.Theorem06.ProbabilityBound` |
| `NumStability.Algorithms.Ch15DixonProbability` | `NumStability.Source.Higham.Chapter15.Theorem06.GaussianDirection` |
| `NumStability.Algorithms.Chapter15CondEst` | `NumStability.Source.Higham.Chapter15.Section03.OneNormEstimators` |
| `NumStability.Algorithms.CondEstimation` | `NumStability.Algorithms.NormEstimation.OneNorm.PowerMethod` |
| `NumStability.Algorithms.HighamChapter15BoydBridges` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.FixedPointConvergence` |
| `NumStability.Algorithms.HighamChapter15BoydConcreteLemma3` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.WeightedSecondVariation` |
| `NumStability.Algorithms.HighamChapter15BoydLocalStability` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.LocalStability` |
| `NumStability.Algorithms.HighamChapter15BoydRowwiseDomain` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.RowwiseSmoothness` |
| `NumStability.Algorithms.HighamChapter15BoydScalar` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.ScalarCase` |
| `NumStability.Algorithms.HighamChapter15BoydSourceClosure` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.CorrectedConvergence` |
| `NumStability.Algorithms.HighamChapter15BoydSourceDomain` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.SmoothnessDomain` |
| `NumStability.Algorithms.HighamChapter15BoydSourceLocal` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.LocalLinearization` |
| `NumStability.Algorithms.HighamChapter15BoydSourceSecondDerivative` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.SecondDerivative` |
| `NumStability.Algorithms.HighamChapter15BoydUniqueness` | `NumStability.Source.Higham.Chapter15.Algorithm01.Boyd.FixedPointUniqueness` |
| `NumStability.Algorithms.HighamChapter15ConvergenceProse` | `NumStability.Source.Higham.Chapter15.Algorithm01.Convergence` |
| `NumStability.Algorithms.HighamChapter15RectTermination` | `NumStability.Source.Higham.Chapter15.Algorithm01.RectangularTermination` |
| `NumStability.Algorithms.LU.Higham15Problem15_4` | `NumStability.Source.Higham.Chapter15.Problem04.LUInverseBounds` |
| `NumStability.Algorithms.LU.Higham15Problem15_6` | `NumStability.Source.Higham.Chapter15.Problem06.Recurrences` |
| `NumStability.Algorithms.LU.Higham15Problem15_6Closure` | `NumStability.Source.Higham.Chapter15.Problem06.InverseNormFormula` |
| `NumStability.Algorithms.LU.Higham15Problem15_6Operational` | `NumStability.Source.Higham.Chapter15.Problem06.StoredExecution` |
| `NumStability.Algorithms.LU.TridiagonalCondCh15` | `NumStability.Source.Higham.Chapter15.Section06.TridiagonalConditioning.Statements` |
| `NumStability.Algorithms.LU.TridiagonalCondCh15Closure` | `NumStability.Source.Higham.Chapter15.Section06.TridiagonalConditioning.DiagonalDominance` |
| `NumStability.Algorithms.LU.TridiagonalCondCh15IkebeClosure` | `NumStability.Source.Higham.Chapter15.Section06.TridiagonalConditioning.Ikebe` |
| `NumStability.Algorithms.PNormPowerMethod` | `NumStability.Algorithms.NormEstimation.PNorm.Iteration` |
| `NumStability.Algorithms.PNormPowerMethodGeneralP` | `NumStability.Algorithms.NormEstimation.PNorm.RealLp` |
| `NumStability.Algorithms.PNormPowerMethodRect` | `NumStability.Algorithms.NormEstimation.PNorm.Rectangular` |
| `NumStability.Algorithms.GaussJordan` | `NumStability.Source.Higham.Chapter14.Corollary07.DiagonalDominance.CumulativeProductBounds` |
| `NumStability.Algorithms.GaussJordanPivoting` | `NumStability.Source.Higham.Chapter14.Algorithm04.Pivoting.GaussJordanPivoting` |
| `NumStability.Algorithms.MatrixInversion` | `NumStability.Source.Higham.Chapter14.MatrixInversionProblems` |
| `NumStability.Algorithms.MatrixInversionMethod2BInstance` | `NumStability.Source.Higham.Chapter14.Section02.TriangularInversion.Method2B.MatrixInversionMethod2BInstance` |
| `NumStability.Algorithms.Ch14HymanDeterminant` | `NumStability.Source.Higham.Chapter14.Problem14` |
| `NumStability.Algorithms.Ch14Problem1413Boundary` | `NumStability.Source.Higham.Chapter14.Problem13` |
| `NumStability.Algorithms.Ch14SchulzIteration` | `NumStability.Source.Higham.Chapter14.Section05.SquareIteration` |
| `NumStability.Algorithms.Ch14SchulzRectangular` | `NumStability.Source.Higham.Chapter14.Section05.RectangularIteration` |
| `NumStability.Algorithms.Ch14SchulzSpectralConvergence` | `NumStability.Source.Higham.Chapter14.Section05.SpectralConvergence` |
| `NumStability.Algorithms.Ch14SourceCorrections` | `NumStability.Source.Higham.Chapter14.Discrepancies` |
| `NumStability.Algorithms.Chapter14Problem1415Weyl` | `NumStability.Source.Higham.Chapter14.Problem15` |
| `NumStability.Algorithms.Ch4KahanFiniteFamily` | `NumStability.Source.Higham.Chapter04.Equation08.FiniteFamily` |
| `NumStability.Algorithms.QR.GivensMatrixStep` | `NumStability.Algorithms.LinearSystems.QR.GivensMatrixStep` |
| `NumStability.Algorithms.QR.GivensQR` | `NumStability.Algorithms.LinearSystems.QR.GivensQR` |
| `NumStability.Algorithms.QR.GivensSpec` | `NumStability.Algorithms.LinearSystems.QR.GivensSpec` |
| `NumStability.Algorithms.QR.GramSchmidt` | `NumStability.Algorithms.LinearSystems.QR.GramSchmidt` |
| `NumStability.Algorithms.QR.GramSchmidtPolar` | `NumStability.Algorithms.LinearSystems.QR.GramSchmidtPolar` |
| `NumStability.Algorithms.QR.Higham19` | `NumStability.Source.Higham.Chapter19.Core` |
| `NumStability.Algorithms.QR.Higham19Alg11CGSRounded` | `NumStability.Source.Higham.Chapter19.Algorithm11.CGSRounded` |
| `NumStability.Algorithms.QR.Higham19Alg12MGSClosure` | `NumStability.Source.Higham.Chapter19.Algorithm12.MGSClosure` |
| `NumStability.Algorithms.QR.Higham19Alg12MGSNonbreakdown` | `NumStability.Source.Higham.Chapter19.Algorithm12.MGSNonbreakdown` |
| `NumStability.Algorithms.QR.Higham19Alg12MGSPaddedClosure` | `NumStability.Source.Higham.Chapter19.Algorithm12.MGSPaddedClosure` |
| `NumStability.Algorithms.QR.Higham19Alg12MGSRepair` | `NumStability.Source.Higham.Chapter19.Algorithm12.MGSRepair` |
| `NumStability.Algorithms.QR.Higham19Alg12MGSRounded` | `NumStability.Source.Higham.Chapter19.Algorithm12.MGSRounded` |
| `NumStability.Algorithms.QR.Higham19Alg12MGSSourceRate` | `NumStability.Source.Higham.Chapter19.Algorithm12.MGSSourceRate` |
| `NumStability.Algorithms.QR.Higham19FormedQ` | `NumStability.Source.Higham.Chapter19.FormedQ` |
| `NumStability.Algorithms.QR.Higham19Labels` | `NumStability.Source.Higham.Chapter19.Labels` |
| `NumStability.Algorithms.QR.Higham19Lemma3ActualSequence` | `NumStability.Source.Higham.Chapter19.Lemma03.ActualSequence` |
| `NumStability.Algorithms.QR.Higham19Lemma7Gamma4` | `NumStability.Source.Higham.Chapter19.Lemma07.Gamma4` |
| `NumStability.Algorithms.QR.Higham19Lemma9DisjointSweep` | `NumStability.Source.Higham.Chapter19.Lemma09.DisjointSweep` |
| `NumStability.Algorithms.QR.Higham19PolarNearest` | `NumStability.Source.Higham.Chapter19.PolarNearest` |
| `NumStability.Algorithms.QR.Higham19Problem19_10` | `NumStability.Source.Higham.Chapter19.Problem10` |
| `NumStability.Algorithms.QR.Higham19Problem19_9` | `NumStability.Source.Higham.Chapter19.Problem09` |
| `NumStability.Algorithms.QR.Higham19Problem6ActualStep` | `NumStability.Source.Higham.Chapter19.Problem06.ActualStep` |
| `NumStability.Algorithms.QR.Higham19Sensitivity` | `NumStability.Source.Higham.Chapter19.Sensitivity` |
| `NumStability.Algorithms.QR.Higham19SensitivityClosure` | `NumStability.Source.Higham.Chapter19.Sensitivity.Closure` |
| `NumStability.Algorithms.QR.Higham19StoredLoop` | `NumStability.Source.Higham.Chapter19.StoredLoop` |
| `NumStability.Algorithms.QR.Higham19StoredLoopAllPivots` | `NumStability.Source.Higham.Chapter19.StoredLoop.AllPivots` |
| `NumStability.Algorithms.QR.Higham19StoredLoopStrongModel` | `NumStability.Source.Higham.Chapter19.StoredLoop.StrongModel` |
| `NumStability.Algorithms.QR.Higham19SunBischof` | `NumStability.Source.Higham.Chapter19.SunBischof` |
| `NumStability.Algorithms.QR.Higham19Theorem10ActualMatrix` | `NumStability.Source.Higham.Chapter19.Theorem10.ActualMatrix` |
| `NumStability.Algorithms.QR.Higham19Theorem5Nonbreakdown` | `NumStability.Source.Higham.Chapter19.Theorem05.Nonbreakdown` |
| `NumStability.Algorithms.QR.Higham19Theorem5SourceClosure` | `NumStability.Source.Higham.Chapter19.Theorem05.SourceClosure` |
| `NumStability.Algorithms.QR.Higham19Theorem6ActualSource` | `NumStability.Source.Higham.Chapter19.Theorem06.ActualSource` |
| `NumStability.Algorithms.QR.Higham19Thm6ColPivot` | `NumStability.Source.Higham.Chapter19.Theorem06.ColumnPivot` |
| `NumStability.Algorithms.QR.Higham19Thm6ColPivotFull` | `NumStability.Source.Higham.Chapter19.Theorem06.ColumnPivotFull` |
| `NumStability.Algorithms.QR.Higham19Thm6CoxHigham` | `NumStability.Source.Higham.Chapter19.Theorem06.CoxHigham` |
| `NumStability.Algorithms.QR.Higham19Thm6CoxHighamAssembly` | `NumStability.Source.Higham.Chapter19.Theorem06.CoxHighamAssembly` |
| `NumStability.Algorithms.QR.Higham19Thm6CoxHighamConcrete` | `NumStability.Source.Higham.Chapter19.Theorem06.CoxHighamConcrete` |
| `NumStability.Algorithms.QR.Higham19Thm6CoxHighamFull` | `NumStability.Source.Higham.Chapter19.Theorem06.CoxHighamFull` |
| `NumStability.Algorithms.QR.Higham19Thm6Elementwise` | `NumStability.Source.Higham.Chapter19.Theorem06.Elementwise` |
| `NumStability.Algorithms.QR.Higham19Thm6ElementwiseEntry` | `NumStability.Source.Higham.Chapter19.Theorem06.ElementwiseEntry` |
| `NumStability.Algorithms.QR.Higham19Thm6ElementwisePackaged` | `NumStability.Source.Higham.Chapter19.Theorem06.ElementwisePackaged` |
| `NumStability.Algorithms.QR.Higham19Thm6Final` | `NumStability.Source.Higham.Chapter19.Theorem06.Final` |
| `NumStability.Algorithms.QR.Higham19Thm6Pivoted` | `NumStability.Source.Higham.Chapter19.Theorem06.Pivoted` |
| `NumStability.Algorithms.QR.Higham19Thm6RowSpecific` | `NumStability.Source.Higham.Chapter19.Theorem06.RowSpecific` |
| `NumStability.Algorithms.QR.Higham19Thm6StrongModel` | `NumStability.Source.Higham.Chapter19.Theorem06.StrongModel` |
| `NumStability.Algorithms.QR.Higham19TurnbullAitken` | `NumStability.Source.Higham.Chapter19.TurnbullAitken` |
| `NumStability.Algorithms.QR.Higham19WYApplicationClosure` | `NumStability.Source.Higham.Chapter19.WYApplicationClosure` |
| `NumStability.Algorithms.QR.HouseholderApply` | `NumStability.Algorithms.LinearSystems.QR.HouseholderApply` |
| `NumStability.Algorithms.QR.HouseholderApplySupport` | `NumStability.Algorithms.LinearSystems.QR.HouseholderApplySupport` |
| `NumStability.Algorithms.QR.HouseholderConstruction2` | `NumStability.Algorithms.LinearSystems.QR.HouseholderConstruction2` and `NumStability.Source.Higham.Chapter19.Lemma01.Construction2` |
| `NumStability.Algorithms.QR.HouseholderMatrixStep` | `NumStability.Algorithms.LinearSystems.QR.HouseholderMatrixStep` |
| `NumStability.Algorithms.QR.HouseholderOneStep` | `NumStability.Algorithms.LinearSystems.QR.HouseholderOneStep` |
| `NumStability.Algorithms.QR.HouseholderQApply` | `NumStability.Algorithms.LinearSystems.QR.HouseholderQApply` |
| `NumStability.Algorithms.QR.HouseholderQR` | `NumStability.Algorithms.LinearSystems.QR.HouseholderQR` |
| `NumStability.Algorithms.QR.HouseholderQRSupport` | `NumStability.Algorithms.LinearSystems.QR.HouseholderQRSupport` |
| `NumStability.Algorithms.QR.HouseholderReflector` | `NumStability.Algorithms.LinearSystems.QR.HouseholderReflector` |
| `NumStability.Algorithms.QR.HouseholderSpec` | `NumStability.Algorithms.LinearSystems.QR.HouseholderSpec` |
| `NumStability.Algorithms.QR.HouseholderSpecSupport` | `NumStability.Algorithms.LinearSystems.QR.HouseholderSpecSupport` |
| `NumStability.Algorithms.QR.QRSolve` | `NumStability.Algorithms.LinearSystems.QR.QRSolve` |
| `NumStability.Algorithms.LeastSquares.Higham20Algorithms` | `NumStability.Algorithms.LeastSquares.LSQRSolve`, `NumStability.Algorithms.LinearSystems.LeastSquares.Refinement`, `NumStability.Analysis.Perturbation.LeastSquares.Basic`, and `NumStability.Source.Higham.Chapter20.Section02.Algorithms` |
| `NumStability.Algorithms.LeastSquares.Higham20AlternativeBound` | `NumStability.Algorithms.LeastSquares.LSQRSolve`, `NumStability.Algorithms.LinearSystems.LeastSquares.Basic`, `NumStability.Analysis.Perturbation.LeastSquares.AlternativeBound`, and `NumStability.Source.Higham.Chapter20.Theorem02.AlternativeBound` |
| `NumStability.Algorithms.LeastSquares.Higham20CrossProductExample` | `Mathlib.Tactic.FinCases`, `Mathlib.Tactic.NormNum`, `NumStability.Algorithms.LeastSquares.LSNormalEquations`, and `NumStability.Source.Higham.Chapter20.Examples.CrossProduct` |
| `NumStability.Algorithms.LeastSquares.Higham20EliminationActual` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7`, `NumStability.Algorithms.LeastSquares.LSE`, `NumStability.Algorithms.LinearSystems.LeastSquares.RowSorting`, and `NumStability.Source.Higham.Chapter20.Theorem07.Elimination` |
| `NumStability.Algorithms.LeastSquares.Higham20Equations` | `Mathlib.Tactic.Linarith`, `Mathlib.Tactic.Ring`, `NumStability.Algorithms.LeastSquares.LSNormalEquations`, `NumStability.Algorithms.LeastSquares.LSQRSolve`, `NumStability.Analysis.Perturbation.LeastSquares.Basic`, `NumStability.Source.Higham.Chapter12.IterativeRefinement`, and `NumStability.Source.Higham.Chapter20.Equations` |
| `NumStability.Algorithms.LeastSquares.Higham20ExampleCondition` | `NumStability.Algorithms.LeastSquares.Higham20Prose`, `NumStability.Algorithms.Underdetermined.UnderdeterminedSpec`, and `NumStability.Source.Higham.Chapter20.Examples.Condition` |
| `NumStability.Algorithms.LeastSquares.Higham20GeneralWedin` | `NumStability.Algorithms.LeastSquares.Higham20Lemma20_12`, `NumStability.Analysis.Perturbation.LeastSquares.Wedin`, and `NumStability.Source.Higham.Chapter20.Examples.GeneralRank` |
| `NumStability.Algorithms.LeastSquares.Higham20Lemma20_11` | `NumStability.Algorithms.LeastSquares.LSPerturbation`, `NumStability.Algorithms.Underdetermined.UnderdeterminedSpec`, `NumStability.Analysis.SingularValues.WeylMirsky`, and `NumStability.Source.Higham.Chapter20.Lemma11` |
| `NumStability.Algorithms.LeastSquares.Higham20Lemma20_12` | `NumStability.Algorithms.LeastSquares.LSPerturbation`, `NumStability.Algorithms.Underdetermined.UnderdeterminedSpec`, `NumStability.Analysis.Perturbation.LeastSquares.Projection`, and `NumStability.Source.Higham.Chapter20.Lemma12` |
| `NumStability.Algorithms.LeastSquares.Higham20MGSStability` | `NumStability.Algorithms.LeastSquares.LSQRSolve`, `NumStability.Algorithms.QR.Higham19`, `NumStability.Algorithms.QR.Higham19Alg12MGSRepair`, `NumStability.Algorithms.QR.Higham19Alg12MGSRounded`, and `NumStability.Source.Higham.Chapter20.Problem05.MGSStability` |
| `NumStability.Algorithms.LeastSquares.Higham20MPProse` | `NumStability.Algorithms.LeastSquares.Higham20Lemma20_11`, `NumStability.Algorithms.LeastSquares.LSQRSolve`, and `NumStability.Source.Higham.Chapter20.Prose.MoorePenrose` |
| `NumStability.Algorithms.LeastSquares.Higham20MinimumNormBackwardError` | `NumStability.Algorithms.LeastSquares.Higham20WeightedLimit`, `NumStability.Analysis.Perturbation.LeastSquares.MinimumNorm`, and `NumStability.Source.Higham.Chapter20.MinimumNormBackwardError` |
| `NumStability.Algorithms.LeastSquares.Higham20NormalEquationsNorms` | `NumStability.Algorithms.LeastSquares.Higham20Equations`, `NumStability.Algorithms.LeastSquares.Higham20Remaining`, `NumStability.Analysis.Perturbation.LeastSquares.NormalEquations`, and `NumStability.Source.Higham.Chapter20.NormalEquations` |
| `NumStability.Algorithms.LeastSquares.Higham20Problem20_3` | `NumStability.Algorithms.LeastSquares.Higham20MPProse`, and `NumStability.Source.Higham.Chapter20.Problem03` |
| `NumStability.Algorithms.LeastSquares.Higham20Prose` | `NumStability.Algorithms.LeastSquares.LSQRSolve`, `NumStability.Analysis.Perturbation.LeastSquares.Conditioning`, `NumStability.Source.Higham.Chapter20.Prose`, and `NumStability.Source.Higham.Chapter21.ProjectorComplementNorm` |
| `NumStability.Algorithms.LeastSquares.Higham20QuantitativeProse` | `NumStability.Algorithms.LeastSquares.Higham20Prose`, and `NumStability.Source.Higham.Chapter20.Prose.Quantitative` |
| `NumStability.Algorithms.LeastSquares.Higham20Refinement` | `Mathlib.Tactic.Linarith`, `Mathlib.Tactic.Ring`, `NumStability.Algorithms.LeastSquares.Higham20Equations`, `NumStability.Algorithms.LinearSystems.LeastSquares.Refinement`, `NumStability.Analysis.Perturbation.LeastSquares.Basic`, and `NumStability.Source.Higham.Chapter20.Theorem04.Refinement` |
| `NumStability.Algorithms.LeastSquares.Higham20Remaining` | `Mathlib.Tactic.Linarith`, `Mathlib.Tactic.Ring`, `NumStability.Source.Higham.Chapter10.Endpoints`, `NumStability.Algorithms.LeastSquares.LSE`, `NumStability.Algorithms.LeastSquares.LSNormalEquations`, and `NumStability.Source.Higham.Chapter20.Remaining` |
| `NumStability.Algorithms.LeastSquares.Higham20ResidualQuality` | `NumStability.Algorithms.LeastSquares.Higham20AlternativeBound`, `NumStability.Algorithms.LeastSquares.Higham20Theorem20_3`, `NumStability.Algorithms.LinearSystems.LeastSquares.Basic`, `NumStability.Analysis.Perturbation.LeastSquares.ResidualQuality`, and `NumStability.Source.Higham.Chapter20.Theorem03.ResidualQuality` |
| `NumStability.Algorithms.LeastSquares.Higham20RowSorting` | `NumStability.Algorithms.LeastSquares.Higham20EliminationActual`, `NumStability.Analysis.Perturbation.LeastSquares.Basic`, and `NumStability.Source.Higham.Chapter20.Theorem07.RowPolicy` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_10` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_3`, `NumStability.Algorithms.LeastSquares.LSE`, `NumStability.Analysis.Perturbation.LeastSquares.Equality.MixedStability`, and `NumStability.Source.Higham.Chapter20.Theorem10` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_3` | `NumStability.Algorithms.LeastSquares.LSQRSolve`, `NumStability.Algorithms.QR.Higham19`, and `NumStability.Source.Higham.Chapter20.Theorem03` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_4Absorption` | `NumStability.Algorithms.LeastSquares.Higham20Refinement`, `NumStability.Analysis.Perturbation.LeastSquares.Absorption`, and `NumStability.Source.Higham.Chapter20.Theorem04` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7` | `NumStability.Algorithms.LeastSquares.LSQRSolve`, `NumStability.Algorithms.LinearSystems.LeastSquares.TraceKernel`, `NumStability.Algorithms.LinearSystems.QR.HouseholderApply`, `NumStability.Algorithms.LinearSystems.QR.HouseholderQRSupport`, `NumStability.Algorithms.QR.Higham19Thm6CoxHigham`, `NumStability.Algorithms.QR.Higham19Thm6CoxHighamConcrete`, `NumStability.Analysis.Perturbation.LeastSquares.Contract`, and `NumStability.Source.Higham.Chapter20.Theorem07` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualAssembly` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualRhs`, and `NumStability.Source.Higham.Chapter20.Theorem07.ActualAssembly` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualBackSub` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualAssembly`, and `NumStability.Source.Higham.Chapter20.Theorem07.ActualBackSub` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualClosure` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualTrace`, and `NumStability.Source.Higham.Chapter20.Theorem07.ActualClosure` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualGrowth` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualClosure`, and `NumStability.Source.Higham.Chapter20.Theorem07.ActualGrowth` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualRhs` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualGrowth`, and `NumStability.Source.Higham.Chapter20.Theorem07.ActualRhs` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7ActualTrace` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7SourceTrace`, `NumStability.Algorithms.LinearSystems.LeastSquares.TraceKernel`, and `NumStability.Source.Higham.Chapter20.Theorem07.ActualTrace` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7Contract` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7QdR`, `NumStability.Algorithms.QR.Higham19Thm6RowSpecific`, and `NumStability.Source.Higham.Chapter20.Theorem07.Contract` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7QdR` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7`, `NumStability.Algorithms.LinearSystems.LeastSquares.TraceKernel`, `NumStability.Analysis.Perturbation.LeastSquares.Contract`, and `NumStability.Source.Higham.Chapter20.Theorem07.QdR` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7Runtime` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7Contract`, `NumStability.Algorithms.LinearSystems.LeastSquares.TraceKernel`, and `NumStability.Source.Higham.Chapter20.Theorem07.Runtime` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7SourceTrace` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_7Contract`, `NumStability.Algorithms.LinearSystems.LeastSquares.TraceKernel`, and `NumStability.Source.Higham.Chapter20.Theorem07.SourceTrace` |
| `NumStability.Algorithms.LeastSquares.Higham20Theorem20_8` | `NumStability.Algorithms.LeastSquares.LSE`, `NumStability.Analysis.Perturbation.LeastSquares.Equality.KKTInverse`, and `NumStability.Source.Higham.Chapter20.Theorem08` |
| `NumStability.Algorithms.LeastSquares.Higham20WeightedLimit` | `NumStability.Algorithms.LeastSquares.LSE`, `NumStability.Analysis.Perturbation.LeastSquares.WeightedLimit`, and `NumStability.Source.Higham.Chapter20.Equations.WeightedLimit` |
| `NumStability.Algorithms.LeastSquares.Higham20ZeroDeltaB` | `NumStability.Algorithms.LeastSquares.Higham20Theorem20_3`, `NumStability.Algorithms.QR.Higham19Labels`, `NumStability.Algorithms.Underdetermined.UnderdeterminedSolve`, and `NumStability.Source.Higham.Chapter20.Theorem03.ZeroDeltaB` |
| `NumStability.Algorithms.LeastSquares.LSE` | `Mathlib.Algebra.BigOperators.Group.Finset.Basic`, `Mathlib.Algebra.Order.BigOperators.Group.Finset`, `Mathlib.Data.Fin.Tuple.Sort`, `Mathlib.Data.Real.Basic`, `Mathlib.LinearAlgebra.Dual.Lemmas`, `Mathlib.Tactic.Linarith`, `Mathlib.Tactic.Ring`, `NumStability.Algorithms.LeastSquares.LSQRSolve`, `NumStability.Algorithms.LinearSystems.LeastSquares.Equality.Basic`, `NumStability.Algorithms.LinearSystems.LeastSquares.Equality.GQR`, `NumStability.Algorithms.LinearSystems.LeastSquares.Equality.KKT`, `NumStability.Algorithms.LinearSystems.QR.GramSchmidtPolar`, `NumStability.Algorithms.QR.Higham19`, `NumStability.Algorithms.QR.Higham19Thm6ColPivot`, `NumStability.Algorithms.QR.Higham19Thm6CoxHigham`, `NumStability.Algorithms.QR.Higham19Thm6CoxHighamConcrete`, `NumStability.Algorithms.QR.Higham19Thm6ElementwisePackaged`, `NumStability.Algorithms.QR.Higham19Thm6RowSpecific`, `NumStability.Algorithms.Underdetermined.UnderdeterminedSpec`, `NumStability.Analysis.Perturbation.LeastSquares.Equality.MixedStability`, `NumStability.Analysis.Perturbation.LeastSquares.Equality.Perturbation`, `NumStability.Analysis.Perturbation.LeastSquares.Equality.RowwiseBackwardError`, and `NumStability.Source.Higham.Chapter20.Theorem08.LSE` |
| `NumStability.Algorithms.LeastSquares.LSNormalEquations` | `Mathlib.Algebra.BigOperators.Group.Finset.Basic`, `Mathlib.Algebra.Order.BigOperators.Group.Finset`, `Mathlib.Data.Real.Basic`, `Mathlib.Tactic.FinCases`, `Mathlib.Tactic.Linarith`, `Mathlib.Tactic.NormNum`, `Mathlib.Tactic.Ring`, `NumStability.Algorithms.LinearSystems.Cholesky.Solve.Basic`, `NumStability.Algorithms.Cholesky.CholeskySpec`, `NumStability.Algorithms.LinearSystems.LeastSquares.NormalEquations`, `NumStability.Algorithms.MatMul`, `NumStability.Analysis.MatrixAlgebra`, `NumStability.Analysis.Perturbation.LeastSquares.NormalEquations`, `NumStability.Analysis.PerturbationTheory`, `NumStability.Analysis.Rounding`, and `NumStability.FloatingPoint.Model` |
| `NumStability.Algorithms.LeastSquares.LSPerturbation` | `Mathlib.Data.Real.Basic`, `NumStability.Analysis.MatrixAlgebra`, `NumStability.Analysis.MatrixSpectral`, `NumStability.Analysis.Perturbation.LeastSquares.Basic`, `NumStability.Analysis.Perturbation.LeastSquares.Wedin`, `NumStability.Analysis.SingularValues.Realification`, and `NumStability.Source.Higham.Chapter20.Lemma11.Support` |
| `NumStability.Algorithms.LeastSquares.LSQRSolve` | `Mathlib.Algebra.BigOperators.Group.Finset.Basic`, `Mathlib.Algebra.Order.BigOperators.Group.Finset`, `Mathlib.Analysis.Matrix.Spectrum`, `Mathlib.Data.Real.Basic`, `Mathlib.LinearAlgebra.Matrix.Rank`, `Mathlib.Tactic.FieldSimp`, `Mathlib.Tactic.Linarith`, `Mathlib.Tactic.Ring`, `NumStability.Algorithms.LeastSquares.LSPerturbation`, `NumStability.Algorithms.LinearSystems.LeastSquares.AugmentedSystem`, `NumStability.Algorithms.LinearSystems.LeastSquares.Basic`, `NumStability.Algorithms.LinearSystems.LeastSquares.GramBasis`, `NumStability.Algorithms.LinearSystems.LeastSquares.MGS`, `NumStability.Algorithms.LinearSystems.LeastSquares.NormalEquations`, `NumStability.Algorithms.LinearSystems.LeastSquares.QRSolve`, `NumStability.Algorithms.LinearSystems.LeastSquares.RankGeometry`, `NumStability.Algorithms.LinearSystems.LeastSquares.StoredQR`, `NumStability.Algorithms.LinearSystems.QR.HouseholderQRSupport`, `NumStability.Algorithms.LinearSystems.QR.QRSolve`, `NumStability.Algorithms.LinearSystems.Triangular.BackSubstitution`, `NumStability.Algorithms.LinearSystems.Triangular.ForwardSubstitution`, `NumStability.Algorithms.LinearSystems.Triangular.InverseBounds`, `NumStability.Algorithms.RandomizedLinearAlgebra.LowRankApproximation.ColumnSketches.Core`, `NumStability.Algorithms.RandomizedLinearAlgebra.LowRankApproximation.RankFactorizations.Core`, `NumStability.Analysis.MatrixAlgebra`, `NumStability.Analysis.Perturbation.LeastSquares.AugmentedSystem`, `NumStability.Analysis.Perturbation.LeastSquares.BackwardError`, `NumStability.Analysis.Perturbation.LeastSquares.Basic`, `NumStability.Analysis.Perturbation.LeastSquares.GramBasis`, `NumStability.Analysis.Perturbation.LeastSquares.NormalEquations`, `NumStability.Analysis.Perturbation.LeastSquares.Normwise`, `NumStability.Analysis.PerturbationTheory`, `NumStability.Analysis.SingularValues.Realification`, `NumStability.Source.Higham.Chapter20.Theorem03.QRSolve`, and `NumStability.Source.DrineasMahoney.RandNLA2016.Equation09.LowRankApproximation.Endpoints` |
| `NumStability.Algorithms.LeastSquares.Higham20SourceAliases` | `NumStability.Source.Higham.Chapter20.Equation32`, `NumStability.Source.Higham.Chapter20.Lemma06`, and `NumStability.Source.Higham.Chapter20.Theorem01` |
| `NumStability.Algorithms.Underdetermined.Higham21` | `NumStability.Source.Higham.Chapter21` |
| `NumStability.Algorithms.Underdetermined.Higham21Attainability` | `NumStability.Source.Higham.Chapter21.Theorem01.Attainability` |
| `NumStability.Algorithms.Underdetermined.Higham21Condition` | `NumStability.Source.Higham.Chapter21.RowScalingInvariance` |
| `NumStability.Algorithms.Underdetermined.Higham21Eq21_11Uniform` | `NumStability.Source.Higham.Chapter21.Equation11.UniformFixedRadius` |
| `NumStability.Algorithms.Underdetermined.Higham21Eq21_8` | `NumStability.Source.Higham.Chapter21.Equation08` |
| `NumStability.Algorithms.Underdetermined.Higham21Eq21_9` | `NumStability.Source.Higham.Chapter21.Equation09` |
| `NumStability.Algorithms.Underdetermined.Higham21Equation21_11` | `NumStability.Source.Higham.Chapter21.Equation11.QuadraticRemainder` |
| `NumStability.Algorithms.Underdetermined.Higham21Equation21_11Scalar` | `NumStability.Source.Higham.Chapter21.Equation11.ScalarEndpoint` |
| `NumStability.Algorithms.Underdetermined.Higham21Givens` | `NumStability.Source.Higham.Chapter21.Theorem04.Givens.QMethod` |
| `NumStability.Algorithms.Underdetermined.Higham21GivensClosure` | `NumStability.Source.Higham.Chapter21.Theorem04.Givens.ConcreteReplay` |
| `NumStability.Algorithms.Underdetermined.Higham21GivensRounded` | `NumStability.Source.Higham.Chapter21.Theorem04.Givens.StoredReplay` |
| `NumStability.Algorithms.Underdetermined.Higham21MGS` | `NumStability.Source.Higham.Chapter21.Theorem04.ModifiedGramSchmidt.ComparisonBounds` |
| `NumStability.Algorithms.Underdetermined.Higham21MGSRounded` | `NumStability.Source.Higham.Chapter21.Theorem04.ModifiedGramSchmidt.RoundedFormation` |
| `NumStability.Algorithms.Underdetermined.Higham21Perturbation` | `NumStability.Source.Higham.Chapter21.Theorem01.PerturbationBounds` |
| `NumStability.Algorithms.Underdetermined.Higham21PerturbationRadius` | `NumStability.Source.Higham.Chapter21.Theorem01.FixedRadius` |
| `NumStability.Algorithms.Underdetermined.Higham21ProjectorNorm` | `NumStability.Source.Higham.Chapter21.ProjectorComplementNorm` |
| `NumStability.Algorithms.Underdetermined.Higham21QRFoundations` | `NumStability.Source.Higham.Chapter21.QRFoundations` |
| `NumStability.Algorithms.Underdetermined.Higham21RankStability` | `NumStability.Source.Higham.Chapter21.Theorem01.RankStability` |
| `NumStability.Algorithms.Underdetermined.Higham21RowwiseMeasure` | `NumStability.Source.Higham.Chapter21.Theorem04.RowwiseBackwardError` |
| `NumStability.Algorithms.Underdetermined.Higham21SNEActualOutput` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.ComputedOutput` |
| `NumStability.Algorithms.Underdetermined.Higham21SNEClosure` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.HouseholderAnalysis` |
| `NumStability.Algorithms.Underdetermined.Higham21SNEConditionTransfer` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.ConditionTransfer` |
| `NumStability.Algorithms.Underdetermined.Higham21SNEEnvelopeTransfer` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.EnvelopeTransfer` |
| `NumStability.Algorithms.Underdetermined.Higham21SNEForward` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.ForwardError` |
| `NumStability.Algorithms.Underdetermined.Higham21SNEQRMajorant` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.QRMajorant` |
| `NumStability.Algorithms.Underdetermined.Higham21SNERemainderBounds` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.RemainderBounds` |
| `NumStability.Algorithms.Underdetermined.Higham21SNESigned` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.SignedFactorAnalysis` |
| `NumStability.Algorithms.Underdetermined.Higham21SNEUniform` | `NumStability.Source.Higham.Chapter21.SemiNormalEquations.UniformBounds` |
| `NumStability.Algorithms.Underdetermined.Higham21Theorem214SourceClosure` | `NumStability.Source.Higham.Chapter21.Theorem04.SourceEndpoint` |
| `NumStability.Algorithms.Underdetermined.Higham21Theorem21_3Attainment` | `NumStability.Source.Higham.Chapter21.Theorem03.Attainment` |
| `NumStability.Algorithms.Vandermonde.Higham22` | `NumStability.Source.Higham.Chapter22.VandermondeSystems` |
| `NumStability.Algorithms.Vandermonde.Higham22MonomialClosure` | `NumStability.Source.Higham.Chapter22.MonomialResidual` |
| `NumStability.Algorithms.Vandermonde.Higham22Problem22_7` | `NumStability.Source.Higham.Chapter22.Problem07` |
| `NumStability.Algorithms.Vandermonde.Higham22Ch12RefinementBridge` | `NumStability.Source.Higham.Chapter22.Section03.RealRefinement` |
| `NumStability.Algorithms.Vandermonde.Higham22ComplexConfluentRefinementBridge` | `NumStability.Source.Higham.Chapter22.Section03.ComplexConfluentRefinement` |
| `NumStability.Algorithms.FastMatMul.Higham23` | `NumStability.Algorithms.FastMatMul.Internal.LegacyBounds`, `NumStability.Source.Higham.Chapter23.BalancedScaling`, `NumStability.Source.Higham.Chapter23.BilinearAlgorithm`, `NumStability.Source.Higham.Chapter23.BlockAlgorithms`, `NumStability.Source.Higham.Chapter23.ConventionalMultiplication`, `NumStability.Source.Higham.Chapter23.ErrorRecurrences`, `NumStability.Source.Higham.Chapter23.GammaAsymptotics`, `NumStability.Source.Higham.Chapter23.ThreeM`, and `NumStability.Source.Higham.Chapter23.WinogradInnerProduct` |
| `NumStability.Algorithms.FastMatMul.Higham23Bini` | `NumStability.Algorithms.FastMatMul.Internal.LegacyBounds`, `NumStability.Source.Higham.Chapter23.BalancedScaling`, `NumStability.Source.Higham.Chapter23.BilinearAlgorithm`, `NumStability.Source.Higham.Chapter23.BiniLotti`, `NumStability.Source.Higham.Chapter23.BlockAlgorithms`, `NumStability.Source.Higham.Chapter23.ConventionalMultiplication`, `NumStability.Source.Higham.Chapter23.Equation11`, `NumStability.Source.Higham.Chapter23.ErrorRecurrences`, `NumStability.Source.Higham.Chapter23.GammaAsymptotics`, `NumStability.Source.Higham.Chapter23.Theorem02`, `NumStability.Source.Higham.Chapter23.Theorem03`, `NumStability.Source.Higham.Chapter23.ThreeM`, and `NumStability.Source.Higham.Chapter23.WinogradInnerProduct` |
| `NumStability.Algorithms.FastMatMul.Higham23Problem23_8` | `NumStability.Algorithms.FastMatMul.Internal.LegacyBounds`, `NumStability.Source.Higham.Chapter23.BalancedScaling`, `NumStability.Source.Higham.Chapter23.BilinearAlgorithm`, `NumStability.Source.Higham.Chapter23.BlockAlgorithms`, `NumStability.Source.Higham.Chapter23.ConventionalMultiplication`, `NumStability.Source.Higham.Chapter23.ErrorRecurrences`, `NumStability.Source.Higham.Chapter23.GammaAsymptotics`, `NumStability.Source.Higham.Chapter23.Problem08`, `NumStability.Source.Higham.Chapter23.Theorem02`, `NumStability.Source.Higham.Chapter23.Theorem03.Execution`, `NumStability.Source.Higham.Chapter23.ThreeM`, and `NumStability.Source.Higham.Chapter23.WinogradInnerProduct` |
| `NumStability.Algorithms.FastMatMul.Higham23Recursive` | `NumStability.Algorithms.FastMatMul.Internal.LegacyBounds`, `NumStability.Source.Higham.Chapter23.BalancedScaling`, `NumStability.Source.Higham.Chapter23.BilinearAlgorithm`, `NumStability.Source.Higham.Chapter23.BlockAlgorithms`, `NumStability.Source.Higham.Chapter23.ConventionalMultiplication`, `NumStability.Source.Higham.Chapter23.ErrorRecurrences`, `NumStability.Source.Higham.Chapter23.GammaAsymptotics`, `NumStability.Source.Higham.Chapter23.Theorem02`, `NumStability.Source.Higham.Chapter23.Theorem03.Execution`, `NumStability.Source.Higham.Chapter23.ThreeM`, and `NumStability.Source.Higham.Chapter23.WinogradInnerProduct` |
| `NumStability.Algorithms.FastMatMul.Higham23Remaining` | `NumStability.Algorithms.FastMatMul.Internal.LegacyBounds`, `NumStability.Source.Higham.Chapter23.BalancedScaling`, `NumStability.Source.Higham.Chapter23.BilinearAlgorithm`, `NumStability.Source.Higham.Chapter23.BlockAlgorithms`, `NumStability.Source.Higham.Chapter23.ConventionalMultiplication`, `NumStability.Source.Higham.Chapter23.Equation11`, `NumStability.Source.Higham.Chapter23.ErrorRecurrences`, `NumStability.Source.Higham.Chapter23.GammaAsymptotics`, `NumStability.Source.Higham.Chapter23.Theorem02`, `NumStability.Source.Higham.Chapter23.Theorem03`, `NumStability.Source.Higham.Chapter23.ThreeM`, and `NumStability.Source.Higham.Chapter23.WinogradInnerProduct` |
| `NumStability.Algorithms.FastMatMul.Higham23ThreeMStrassen` | `NumStability.Algorithms.FastMatMul.Internal.LegacyBounds`, `NumStability.Source.Higham.Chapter23.BalancedScaling`, `NumStability.Source.Higham.Chapter23.BilinearAlgorithm`, `NumStability.Source.Higham.Chapter23.BiniLotti`, `NumStability.Source.Higham.Chapter23.BlockAlgorithms`, `NumStability.Source.Higham.Chapter23.ConventionalMultiplication`, `NumStability.Source.Higham.Chapter23.Equation11`, `NumStability.Source.Higham.Chapter23.ErrorRecurrences`, `NumStability.Source.Higham.Chapter23.GammaAsymptotics`, `NumStability.Source.Higham.Chapter23.Theorem02`, `NumStability.Source.Higham.Chapter23.Theorem03`, `NumStability.Source.Higham.Chapter23.ThreeM`, `NumStability.Source.Higham.Chapter23.ThreeMStrassen`, and `NumStability.Source.Higham.Chapter23.WinogradInnerProduct` |
| `NumStability.Algorithms.FFT.Higham24` | `NumStability.Source.Higham.Chapter24.FourierTransform` |
| `NumStability.Algorithms.FFT.Higham24Radix2` | `NumStability.Source.Higham.Chapter24.Radix2FFT` |
| `NumStability.Algorithms.Circulant.Higham24` | `NumStability.Source.Higham.Chapter24.CirculantSystems` |
| `NumStability.Algorithms.Circulant.Higham24ForwardPerturbation` | `NumStability.Source.Higham.Chapter24.ForwardFFTPerturbation` |
| `NumStability.Algorithms.Circulant.Higham24Rounded` | `NumStability.Source.Higham.Chapter24.RoundedDiagonalSolve` |
| `NumStability.Algorithms.Circulant.Higham24InverseFFT` | `NumStability.Source.Higham.Chapter24.InverseFFT` |
| `NumStability.Algorithms.Circulant.Higham24LiteralSolver` | `NumStability.Source.Higham.Chapter24.RoundedCirculantSolver` |
| `NumStability.Algorithms.Circulant.Higham24BackwardStability` | `NumStability.Source.Higham.Chapter24.FFTBackwardStability` |
| `NumStability.Algorithms.Circulant.Higham24Structured` | `NumStability.Source.Higham.Chapter24.StructuredMixedStability` |
| `NumStability.Algorithms.Circulant.Higham24ForwardError` | `NumStability.Source.Higham.Chapter24.CirculantForwardError` |
| `NumStability.Algorithms.Nonlinear.Higham25` | `NumStability.Source.Higham.Chapter25.NonlinearSystems` |
| `NumStability.Algorithms.Nonlinear.Higham25EigenClosure` | `NumStability.Source.Higham.Chapter25.Eigenproblem` |
| `NumStability.Algorithms.Nonlinear.Higham25Problem25_1` | `NumStability.Source.Higham.Chapter25.Problem01` |
| `NumStability.Algorithms.SoftwareIssues.Higham27` | `NumStability.Source.Higham.Chapter27.SoftwareEnvironment` |
| `NumStability.Algorithms.SoftwareIssues.Higham27Pythag` | `NumStability.Source.Higham.Chapter27.Problem06` |
| `NumStability.Algorithms.TestMatrices.Higham28` | `NumStability.Source.Higham.Chapter28.TestMatrixGallery` |
| `NumStability.Algorithms.TestMatrices.Higham28Asymptotics` | `NumStability.Source.Higham.Chapter28.Asymptotics` |
| `NumStability.Algorithms.TestMatrices.Higham28Cauchy` | `NumStability.Source.Higham.Chapter28.Cauchy.Identities` |
| `NumStability.Algorithms.TestMatrices.Higham28Companion` | `NumStability.Source.Higham.Chapter28.Companion.Basic` |
| `NumStability.Algorithms.TestMatrices.Higham28CompanionSpectral` | `NumStability.Source.Higham.Chapter28.Companion.Spectral` |
| `NumStability.Algorithms.TestMatrices.Higham28Contracts` | `NumStability.Source.Higham.Chapter28.TestMatrixContracts` |
| `NumStability.Algorithms.TestMatrices.Higham28Exact` | `NumStability.Source.Higham.Chapter28.Hilbert.ExactIdentities` |
| `NumStability.Algorithms.TestMatrices.Higham28GaussianAbsoluteMoment` | `NumStability.Analysis.Probability.Gaussian.AbsoluteMoment` |
| `NumStability.Algorithms.TestMatrices.Higham28GaussianDirection` | `NumStability.Source.Higham.Chapter28.Probability.GaussianDirection` |
| `NumStability.Algorithms.TestMatrices.Higham28GaussianOrthogonal` | `NumStability.Source.Higham.Chapter28.Probability.GaussianOrthogonalInvariance` |
| `NumStability.Algorithms.TestMatrices.Higham28GaussianQRHaar` | `NumStability.Source.Higham.Chapter28.Probability.GaussianQRHaar` |
| `NumStability.Algorithms.TestMatrices.Higham28Ginibre` | `NumStability.Source.Higham.Chapter28.RealGinibre.ExpectedCountAsymptotic` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreAbsoluteDetRecurrence` | `NumStability.Source.Higham.Chapter28.RealGinibre.AbsoluteDeterminantRecurrence` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreAtlas` | `NumStability.Source.Higham.Chapter28.RealGinibre.EigenpairAtlas` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreCharacteristicProduct` | `NumStability.Source.Higham.Chapter28.RealGinibre.CharacteristicProduct` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreComplexPairs` | `NumStability.Source.Higham.Chapter28.RealGinibre.ConjugatePairs` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreCorollary31Factor` | `NumStability.Source.Higham.Chapter28.RealGinibre.Corollary31Normalization` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreDeterminantIntegral` | `NumStability.Source.Higham.Chapter28.RealGinibre.DeterminantIntegral` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreDeterminantMoment` | `NumStability.Source.Higham.Chapter28.RealGinibre.AbsoluteCharacteristicMoment` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreDimensionTwo` | `NumStability.Source.Higham.Chapter28.RealGinibre.DimensionTwo` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreExpectationGlue` | `NumStability.Source.Higham.Chapter28.RealGinibre.ExpectationRecurrence` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreFiniteFormula` | `NumStability.Source.Higham.Chapter28.RealGinibre.FiniteExpectationFormula` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreGaussianBridge` | `NumStability.Source.Higham.Chapter28.RealGinibre.GaussianIncidenceExpectation` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreIncidence` | `NumStability.Source.Higham.Chapter28.RealGinibre.EigenpairIncidence` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreIntegral` | `NumStability.Source.Higham.Chapter28.RealGinibre.IncidenceIntegral` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreJointDensity` | `NumStability.Source.Higham.Chapter28.RealGinibre.JointDensity` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreMeasure` | `NumStability.Source.Higham.Chapter28.RealGinibre.Density` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreMultiplicity` | `NumStability.Source.Higham.Chapter28.RealGinibre.IncidenceMultiplicity` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreOrthogonalFiber` | `NumStability.Source.Higham.Chapter28.RealGinibre.OrthogonalFiber` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreParity` | `NumStability.Source.Higham.Chapter28.RealGinibre.ParityFormula` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibrePlaneChart` | `NumStability.Source.Higham.Chapter28.RealGinibre.InvariantPlaneChart` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibrePlaneIncidence` | `NumStability.Source.Higham.Chapter28.RealGinibre.InvariantPlaneIncidence` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibrePlaneSylvester` | `NumStability.Source.Higham.Chapter28.RealGinibre.InvariantPlaneSylvesterDeterminant` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreProjectiveIntegral` | `NumStability.Source.Higham.Chapter28.RealGinibre.ProjectiveIntegral` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreRecurrence` | `NumStability.Source.Higham.Chapter28.RealGinibre.Recurrence` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreRoots` | `NumStability.Source.Higham.Chapter28.RealGinibre.RootMeasurability` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedConclusion` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedRecurrenceConclusion` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedExpectation` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedExpectation` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedGaussian` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedGaussianIntegral` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedIncidence` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedIncidence` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedIncidenceAlgebra` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedIncidenceAlgebra` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedKernel` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedKernel` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedRank` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedRootRank` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedRankTransfer` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedRankTransfer` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreSignedScalar` | `NumStability.Source.Higham.Chapter28.RealGinibre.SignedScalarIntegral` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreTraceDensity` | `NumStability.Source.Higham.Chapter28.RealGinibre.TraceDensity` |
| `NumStability.Algorithms.TestMatrices.Higham28GinibreTruncatedIncidence` | `NumStability.Source.Higham.Chapter28.RealGinibre.TruncatedSignedIncidence` |
| `NumStability.Algorithms.TestMatrices.Higham28HaarFibers` | `NumStability.Analysis.Probability.Haar.HomogeneousSpaceUniqueness` |
| `NumStability.Algorithms.TestMatrices.Higham28HilbertAsymptotic` | `NumStability.Source.Higham.Chapter28.Hilbert.DeterminantAsymptotic` |
| `NumStability.Algorithms.TestMatrices.Higham28HilbertCondition` | `NumStability.Source.Higham.Chapter28.Hilbert.ConditionNumber` |
| `NumStability.Algorithms.TestMatrices.Higham28HilbertRatioDiscrepancy` | `NumStability.Source.Higham.Chapter28.Equation02.RatioDiscrepancy` |
| `NumStability.Algorithms.TestMatrices.Higham28Moments` | `NumStability.Source.Higham.Chapter28.MomentRepresentations` |
| `NumStability.Algorithms.TestMatrices.Higham28OrthogonalCoordinates` | `NumStability.Source.Higham.Chapter28.Orthogonal.Coordinates` |
| `NumStability.Algorithms.TestMatrices.Higham28OrthogonalFibers` | `NumStability.Source.Higham.Chapter28.Orthogonal.Fibers` |
| `NumStability.Algorithms.TestMatrices.Higham28OrthogonalHaar` | `NumStability.Source.Higham.Chapter28.Orthogonal.Haar` |
| `NumStability.Algorithms.TestMatrices.Higham28OrthogonalSphere` | `NumStability.Source.Higham.Chapter28.Orthogonal.Sphere` |
| `NumStability.Algorithms.TestMatrices.Higham28Pascal` | `NumStability.Source.Higham.Chapter28.Pascal.CubeRoot` |
| `NumStability.Algorithms.TestMatrices.Higham28PascalCondition` | `NumStability.Source.Higham.Chapter28.Pascal.ConditionNumber` |
| `NumStability.Algorithms.TestMatrices.Higham28PascalDualFlag` | `NumStability.Source.Higham.Chapter28.Pascal.OscillationDualFlag` |
| `NumStability.Algorithms.TestMatrices.Higham28PascalOscillation` | `NumStability.Source.Higham.Chapter28.Pascal.OscillationSetup` |
| `NumStability.Algorithms.TestMatrices.Higham28PascalOscillationCore` | `NumStability.Source.Higham.Chapter28.Pascal.OscillationCore` |
| `NumStability.Algorithms.TestMatrices.Higham28PascalOscillationExact` | `NumStability.Source.Higham.Chapter28.Pascal.OscillationConclusion` |
| `NumStability.Algorithms.TestMatrices.Higham28PascalSpectral` | `NumStability.Source.Higham.Chapter28.Pascal.SpectralPerturbation` |
| `NumStability.Algorithms.TestMatrices.Higham28PascalTotalPositivity` | `NumStability.Source.Higham.Chapter28.Pascal.TotalPositivity` |
| `NumStability.Algorithms.TestMatrices.Higham28Probability` | `NumStability.Source.Higham.Chapter28.ProbabilityStatements` |
| `NumStability.Algorithms.TestMatrices.Higham28RandsvdNorm` | `NumStability.Source.Higham.Chapter28.Randsvd.ConditionNumber` |
| `NumStability.Algorithms.TestMatrices.Higham28ReciprocalSPD` | `NumStability.Source.Higham.Chapter28.ReciprocalSPD` |
| `NumStability.Algorithms.TestMatrices.Higham28ShiftedHilbert` | `NumStability.Source.Higham.Chapter28.Hilbert.ShiftedNorm` |
| `NumStability.Algorithms.TestMatrices.Higham28Stewart` | `NumStability.Source.Higham.Chapter28.Stewart.Construction` |
| `NumStability.Algorithms.TestMatrices.Higham28StewartHaar` | `NumStability.Source.Higham.Chapter28.Stewart.HaarCoordinateSplit` |
| `NumStability.Algorithms.TestMatrices.Higham28StewartRawFiber` | `NumStability.Source.Higham.Chapter28.Stewart.RawFiber` |
| `NumStability.Algorithms.TestMatrices.Higham28StewartRecursion` | `NumStability.Source.Higham.Chapter28.Stewart.Recursion` |
| `NumStability.Algorithms.TestMatrices.Higham28ToeplitzCondition` | `NumStability.Source.Higham.Chapter28.Toeplitz.SecondDifferenceCondition` |
| `NumStability.Algorithms.TestMatrices.Higham28ToeplitzGeneral` | `NumStability.Source.Higham.Chapter28.Toeplitz.TridiagonalSpectrum` |
| `NumStability.Algorithms.TestMatrices.Higham28ToeplitzSpectrum` | `NumStability.Source.Higham.Chapter28.Toeplitz.CharacteristicPolynomial` |
| `NumStability.Algorithms.HighamChapter3NoGuardDotBridge` | `NumStability.Algorithms.Arithmetic.DotProduct.NoGuard` and `NumStability.Source.Higham.CrossChapter.NoGuardDotProduct` |
| `NumStability.Algorithms.HighamChapter15Ch7PracticalBoundBridge` | `NumStability.Source.Higham.CrossChapter.PracticalConditionBound` |
| `NumStability.Algorithms.HighamChapter12Ch9GenericSolverBridge` | `NumStability.Source.Higham.CrossChapter.LUSolverWeights.Factorization` |
| `NumStability.Algorithms.HighamChapter12Ch9SolverBridge` | `NumStability.Source.Higham.CrossChapter.LUSolverWeights.Doolittle` |
| `NumStability.Algorithms.AutomaticErrorAnalysis.Higham26` | `NumStability.Source.Higham.Chapter26.AlternatingDirections.ExactExecution`, `NumStability.Source.Higham.Chapter26.CubicRoots.DepressedCubic`, `NumStability.Source.Higham.Chapter26.CubicRoots.MonicCubic`, `NumStability.Source.Higham.Chapter26.Equation01`, `NumStability.Source.Higham.Chapter26.Equation02`, `NumStability.Source.Higham.Chapter26.Equation03`, `NumStability.Source.Higham.Chapter26.Equation04`, `NumStability.Source.Higham.Chapter26.Equation05.CardanoRoots`, `NumStability.Source.Higham.Chapter26.Equation05.ComplexBranches`, `NumStability.Source.Higham.Chapter26.Equation05.RealBranches`, `NumStability.Source.Higham.Chapter26.Equation05.ZeroBranchDiscrepancy`, `NumStability.Source.Higham.Chapter26.Equation06`, `NumStability.Source.Higham.Chapter26.Equation07`, `NumStability.Source.Higham.Chapter26.Equation08`, `NumStability.Source.Higham.Chapter26.IntervalArithmetic.DependencyExamples`, `NumStability.Source.Higham.Chapter26.IntervalArithmetic.DirectedRounding`, `NumStability.Source.Higham.Chapter26.IntervalArithmetic.ExactOperations`, `NumStability.Source.Higham.Chapter26.MultidirectionalSearch.Execution`, and `NumStability.Source.Higham.Chapter26.MultidirectionalSearch.Simplex` |
| `NumStability.Algorithms.AutomaticErrorAnalysis.Higham26SourceSearch` | `NumStability.Source.Higham.Chapter26` |
| `NumStability.Algorithms.HighamChapter4KaoWangScope` | `NumStability.Source.Higham.Chapter04.Section02.KaoWangCitationDiscrepancy` |
| `NumStability.Algorithms.Problem44SixTerm` | `NumStability.Source.Higham.Chapter04.Problem04` |
| `NumStability.Algorithms.StationaryIterationSeries` | `NumStability.Source.Higham.Chapter17.Equation08`, `NumStability.Source.Higham.Chapter17.Equation12`, `NumStability.Source.Higham.Chapter17.Equation15`, `NumStability.Source.Higham.Chapter17.Equation16`, `NumStability.Source.Higham.Chapter17.Equation17`, `NumStability.Source.Higham.Chapter17.Equation20`, and `NumStability.Source.Higham.Chapter17.Problem01` |
| `NumStability.Analysis.Ch17SemiconvergentBlockFormSourceClosure` | `NumStability.Source.Higham.Chapter17.Equation22` |
| `NumStability.Analysis.NonrandomRounding` | `NumStability.Source.Higham.Chapter01.Section17` |
| `NumStability.Analysis.NonrandomRounding.Conclusions` | `NumStability.Source.Higham.Chapter01.Section17.ErrorSpread` |
| `NumStability.Analysis.NonrandomRounding.Core` | `NumStability.Source.Higham.Chapter01.Section17.HornerEvaluation` |
| `NumStability.Analysis.NonrandomRounding.GridVariation` | `NumStability.Source.Higham.Chapter01.Section17.GridVariation` |
| `NumStability.Analysis.NonrandomRounding.SourceInterval` | `NumStability.Source.Higham.Chapter01.Section17.SourceInterval` |
| `NumStability.Analysis.NonrandomRounding.StoredGrid` | `NumStability.Source.Higham.Chapter01.Section17.StoredGrid` |
| `NumStability.Algorithms.Ch10ActualSourceClosure` | `NumStability.Source.Higham.Chapter10.Theorem06.RoundedCholesky.ScaledForwardError` |
| `NumStability.Algorithms.Ch10ComplexPositiveDefiniteSourceClosure` | `NumStability.Source.Higham.Chapter10.Equation30.ComplexPositiveDefinite.ErrorBounds` |
| `NumStability.Algorithms.Ch10KahanSharpnessSource` | `NumStability.Source.Higham.Chapter10.Lemma13.KahanSharpness.TailNormBounds` |
| `NumStability.Algorithms.Ch10PivotedPSDSourceClosure` | `NumStability.Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.StoppingErrorBounds` |
| `NumStability.Algorithms.Ch10Theorem108Componentwise` | `NumStability.Source.Higham.Chapter10.Theorem08.ComponentwisePerturbation.ComponentwiseBounds` |
| `NumStability.Algorithms.Ch10Theorem108Source` | `NumStability.Source.Higham.Chapter10.Theorem08.NormwiseDiscrepancy.FactorUniqueness` |
| `NumStability.Algorithms.Cholesky.Higham1014Equation1022` | `NumStability.Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.SchurAsymptotics` |
| `NumStability.Algorithms.Cholesky.Higham1014SourceError` | `NumStability.Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.RankSensitiveError` |
| `NumStability.Algorithms.Cholesky.Higham1029Source` | `NumStability.Source.Higham.Chapter10.Section04.PositiveDefiniteSymmetricPart.LUGrowth` |
| `NumStability.Algorithms.Cholesky.HighamMathiasSource` | `NumStability.Source.Higham.Chapter10.Equation29.Mathias.ConditionBounds` |
| `NumStability.Algorithms.HighamChapter10` | `NumStability.Source.Higham.Chapter10.Endpoints` |
| `NumStability.Algorithms.Ch10Ch14Lemma66Op2Bridge` | `NumStability.Source.Higham.Chapter10.Endpoints`, `NumStability.Source.Higham.Chapter06.Lemma06`, `NumStability.Source.Higham.Chapter06.Lemma06.OperatorTwoNormBound.Bridge`, `NumStability.Source.Higham.Chapter10.Equation07.AbsoluteFactorNorm.Bridge`, `NumStability.Source.Higham.Chapter14.Section03.ResidualOperatorTwoNorm.Bridge` |
| `NumStability.Algorithms.Ch10KahanSharpness` | `NumStability.Source.Higham.Chapter10.Endpoints`, `NumStability.Source.Higham.Chapter10.Lemma13.KahanSharpness.Limit` |
| `NumStability.Algorithms.Ch10Lemma1011Source` | `NumStability.Source.Higham.Chapter10.Endpoints`, `NumStability.Source.Higham.Chapter10.Lemma11.PivotSequenceStability.SourceClosure` |
| `NumStability.Algorithms.Ch10Theorem107FailureVacuity` | `NumStability.Algorithms.HighamChapters1To9SourceClosure`, `NumStability.Source.Higham.Chapter10.Theorem07.FailureVacuity.Vacuity` |
| `NumStability.Algorithms.Cholesky.CholeskyIndefinite` | `NumStability.Algorithms.LU.GaussianElimination`, `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.ErrorAnalysis.BlockLDLT`, `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.ErrorAnalysis.BlockLDLTStep`, `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.ErrorAnalysis.Predicates`, `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.ErrorAnalysis.SkewSymmetric`, `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.Pivoting.Basic`, `NumStability.Algorithms.LinearSystems.SymmetricIndefinite.Pivoting.Tridiagonal`, `NumStability.Analysis.Rounding`, `NumStability.FloatingPoint.Model`, `NumStability.Source.Higham.Chapter11.Theorem07.TridiagonalTwoByTwoResidual.Basic` |
| `NumStability.Algorithms.Cholesky.CholeskyPerturbation` | `NumStability.Algorithms.Cholesky.CholeskySpec`, `NumStability.Algorithms.LU.GaussianElimination`, `NumStability.Algorithms.LU.GrowthFactor`, `NumStability.Algorithms.LinearSystems.Cholesky.Perturbation.Basic`, `NumStability.Analysis.Rounding`, `NumStability.FloatingPoint.Model` |
| `NumStability.Algorithms.Cholesky.CholeskySolve` | `NumStability.Algorithms.Cholesky.CholeskySpec`, `NumStability.Algorithms.LU.LUSolve`, `NumStability.Algorithms.LinearSystems.Cholesky.Solve.Basic`, `NumStability.Algorithms.LinearSystems.Triangular.BackSubstitution`, `NumStability.Algorithms.LinearSystems.Triangular.ForwardSubstitution`, `NumStability.Analysis.Rounding`, `NumStability.FloatingPoint.Model` |
| `NumStability.Algorithms.Cholesky.Higham1014SourceSuccess` | `NumStability.Source.Higham.Chapter10.Theorem07`, `NumStability.Source.Higham.Chapter10.Theorem14.CompletePivotedPSD.SourceSuccess` |
| `NumStability.Algorithms.Cholesky.Higham10Problem10_3` | `NumStability.Algorithms.Summation.Tree.ArbitraryOrderError.PivotNormalized`, `NumStability.Source.Higham.Chapter08.Section03.TriangularSystems.ArbitraryOrder`, `NumStability.Source.Higham.Chapter10.Problem03.ArbitraryEvaluationOrder.Basic` |
| `NumStability.Algorithms.Cholesky.HighamMathiasFirstBreakdown` | `NumStability.Source.Higham.Chapter10.Section04.PositiveDefiniteSymmetricPart.LUGrowth`, `NumStability.Source.Higham.Chapter09.DoolittleClosure`, `NumStability.Source.Higham.Chapter10.Equation29.Mathias.FirstBreakdown` |
| `NumStability.HDP.ContractSignatures.C_01_hcor_h1_d2_d5` | `NumStability.Source.Vershynin.Chapter01.Section02.Corollary05.Signature` |
| `NumStability.HDP.ContractSignatures.C_01_hex_h1_d2_d2` | `NumStability.Source.Vershynin.Chapter01.Section02.Exercise02.Signature` |
| `NumStability.HDP.ContractSignatures.C_01_hlem_h1_d2_d1` | `NumStability.Source.Vershynin.Chapter01.Section02.Lemma01.Signature` |
| `NumStability.HDP.ContractSignatures.C_01_hprop_h1_d2_d4` | `NumStability.Source.Vershynin.Chapter01.Section02.Proposition04.Signature` |
| `NumStability.HDP.ContractSignatures.C_01_hthm_h1_d3_d1` | `NumStability.Source.Vershynin.Chapter01.Section03.Theorem01.Signature` |
| `NumStability.HDP.ContractSignatures.C_01_hthm_hcauchy_hschwarz` | `NumStability.Source.Vershynin.Chapter01.CauchySchwarz.Signature` |
| `NumStability.HDP.ContractSignatures.C_01_hthm_hjensen` | `NumStability.Source.Vershynin.Chapter01.JensenInequality.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_heq_h2_d12` | `NumStability.Source.Vershynin.Chapter02.Equation12.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hex_h2_d2_d10b` | `NumStability.Source.Vershynin.Chapter02.Section02.Exercise10B.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hex_h2_d3_d5` | `NumStability.Source.Vershynin.Chapter02.Section03.Exercise05.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hex_h2_d5_d1` | `NumStability.Source.Vershynin.Chapter02.Section05.Exercise01.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hex_h2_d5_d5a` | `NumStability.Source.Vershynin.Chapter02.Section05.Exercise05A.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hex_h2_d6_d9` | `NumStability.Source.Vershynin.Chapter02.Section06.Exercise09.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hexample_h2_d5_d8b` | `NumStability.Source.Vershynin.Chapter02.Section05.Example08B.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hexample_h2_d5_d8c` | `NumStability.Source.Vershynin.Chapter02.Section05.Example08C.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hexample_h2_d7_d13` | `NumStability.Source.Vershynin.Chapter02.Section07.Example13.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hlem_h2_d6_d8` | `NumStability.Source.Vershynin.Chapter02.Section06.Lemma08.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hlem_hexponential_hmarkov` | `NumStability.Source.Vershynin.Chapter02.ExponentialMarkov.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hlem_hmgf_hindependent_hsum` | `NumStability.Source.Vershynin.Chapter02.IndependentSumMGF.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hprop_h2_d5_d2` | `NumStability.Source.Vershynin.Chapter02.Section05.Proposition02.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hprop_h2_d6_d1` | `NumStability.Source.Vershynin.Chapter02.Section06.Proposition01.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hrem_h2_d5_d3` | `NumStability.Source.Vershynin.Chapter02.Section05.Remark03.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hrem_h2_d7_d9` | `NumStability.Source.Vershynin.Chapter02.Section07.Remark09.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hthm_h2_d2_d6` | `NumStability.Source.Vershynin.Chapter02.Section02.Theorem06.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hthm_h2_d6_d2` | `NumStability.Source.Vershynin.Chapter02.Section06.Theorem02.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hthm_h2_d6_d3` | `NumStability.Source.Vershynin.Chapter02.Section06.Theorem03.Signature` |
| `NumStability.HDP.ContractSignatures.C_02_hthm_hpsi2_hnorm_hcharacterizations` | `NumStability.Source.Vershynin.Chapter02.PsiTwoNormCharacterizations.Signature` |
| `NumStability.HDP.ContractSignatures.C_05_hex_h5_d1_d13` | `NumStability.Source.Vershynin.Chapter05.Section01.Exercise13.Signature` |
| `NumStability.HDP.ContractSignatures.C_05_hex_h5_d1_d14` | `NumStability.Source.Vershynin.Chapter05.Section01.Exercise14.Signature` |
| `NumStability.HDP.ContractSignatures.C_05_hex_h5_d2_d11` | `NumStability.Source.Vershynin.Chapter05.Section02.Exercise11.Signature` |
| `NumStability.HDP.Contracts.C_01_hcor_h1_d2_d5` | `NumStability.Source.Vershynin.Chapter01.Section02.Corollary05.Contract` |
| `NumStability.HDP.Contracts.C_01_hdef_hbernoulli_hbinomial` | `NumStability.Source.Vershynin.Chapter01.BernoulliAndBinomial.Contract` |
| `NumStability.HDP.Contracts.C_01_hdef_hcdf_htail` | `NumStability.Source.Vershynin.Chapter01.CDFAndTail.Contract` |
| `NumStability.HDP.Contracts.C_01_hdef_hconvergence_hin_hdistribution` | `NumStability.Source.Vershynin.Chapter01.ConvergenceInDistribution.Contract` |
| `NumStability.HDP.Contracts.C_01_hdef_hexpectation_hvariance` | `NumStability.Source.Vershynin.Chapter01.ExpectationAndVariance.Contract` |
| `NumStability.HDP.Contracts.C_01_hdef_hl2_hgeometry` | `NumStability.Source.Vershynin.Chapter01.L2Geometry.Contract` |
| `NumStability.HDP.Contracts.C_01_hdef_hstandard_hnormal` | `NumStability.Source.Vershynin.Chapter01.StandardNormal.Contract` |
| `NumStability.HDP.Contracts.C_01_hdef_hstdev_hcovariance` | `NumStability.Source.Vershynin.Chapter01.StandardDeviationAndCovariance.Contract` |
| `NumStability.HDP.Contracts.C_01_hex_h1_d2_d2` | `NumStability.Source.Vershynin.Chapter01.Section02.Exercise02.Contract` |
| `NumStability.HDP.Contracts.C_01_hlem_h1_d2_d1` | `NumStability.Source.Vershynin.Chapter01.Section02.Lemma01.Contract` |
| `NumStability.HDP.Contracts.C_01_hprop_h1_d2_d4` | `NumStability.Source.Vershynin.Chapter01.Section02.Proposition04.Contract` |
| `NumStability.HDP.Contracts.C_01_hthm_h1_d3_d1` | `NumStability.Source.Vershynin.Chapter01.Section03.Theorem01.Contract` |
| `NumStability.HDP.Contracts.C_01_hthm_hcauchy_hschwarz` | `NumStability.Source.Vershynin.Chapter01.CauchySchwarz.Contract` |
| `NumStability.HDP.Contracts.C_01_hthm_hjensen` | `NumStability.Source.Vershynin.Chapter01.JensenInequality.Contract` |
| `NumStability.HDP.Contracts.C_02_hdef_h2_d2_d1` | `NumStability.Source.Vershynin.Chapter02.Section02.Definition01.Contract` |
| `NumStability.HDP.Contracts.C_02_hdef_h2_d5_d6` | `NumStability.Source.Vershynin.Chapter02.Section05.Definition06.Contract` |
| `NumStability.HDP.Contracts.C_02_hdef_herdos_hrenyi` | `NumStability.Source.Vershynin.Chapter02.ErdosRenyiModel.Contract` |
| `NumStability.HDP.Contracts.C_02_heq_h2_d12` | `NumStability.Source.Vershynin.Chapter02.Equation12.Contract` |
| `NumStability.HDP.Contracts.C_02_heq_h2_d18` | `NumStability.Source.Vershynin.Chapter02.Equation18.Contract` |
| `NumStability.HDP.Contracts.C_02_hex_h2_d2_d10b` | `NumStability.Source.Vershynin.Chapter02.Section02.Exercise10B.Contract` |
| `NumStability.HDP.Contracts.C_02_hex_h2_d3_d5` | `NumStability.Source.Vershynin.Chapter02.Section03.Exercise05.Contract` |
| `NumStability.HDP.Contracts.C_02_hex_h2_d5_d1` | `NumStability.Source.Vershynin.Chapter02.Section05.Exercise01.Contract` |
| `NumStability.HDP.Contracts.C_02_hexample_h2_d5_d8b` | `NumStability.Source.Vershynin.Chapter02.Section05.Example08B.Contract` |
| `NumStability.HDP.Contracts.C_02_hexample_h2_d5_d8c` | `NumStability.Source.Vershynin.Chapter02.Section05.Example08C.Contract` |
| `NumStability.HDP.Contracts.C_02_hexample_h2_d7_d12` | `NumStability.Source.Vershynin.Chapter02.Section07.Example12.Contract` |
| `NumStability.HDP.Contracts.C_02_hexample_h2_d7_d13` | `NumStability.Source.Vershynin.Chapter02.Section07.Example13.Contract` |
| `NumStability.HDP.Contracts.C_02_hlem_h2_d6_d8` | `NumStability.Source.Vershynin.Chapter02.Section06.Lemma08.Contract` |
| `NumStability.HDP.Contracts.C_02_hlem_hexponential_hmarkov` | `NumStability.Source.Vershynin.Chapter02.ExponentialMarkov.Contract` |
| `NumStability.HDP.Contracts.C_02_hlem_hmgf_hindependent_hsum` | `NumStability.Source.Vershynin.Chapter02.IndependentSumMGF.Contract` |
| `NumStability.HDP.Contracts.C_02_hprop_h2_d5_d2` | `NumStability.Source.Vershynin.Chapter02.Section05.Proposition02.Contract` |
| `NumStability.HDP.Contracts.C_02_hprop_h2_d6_d1` | `NumStability.Source.Vershynin.Chapter02.Section06.Proposition01.Contract` |
| `NumStability.HDP.Contracts.C_02_hrem_h2_d5_d3` | `NumStability.Source.Vershynin.Chapter02.Section05.Remark03.Contract` |
| `NumStability.HDP.Contracts.C_02_hthm_h2_d2_d6` | `NumStability.Source.Vershynin.Chapter02.Section02.Theorem06.Contract` |
| `NumStability.HDP.Contracts.C_02_hthm_h2_d6_d2` | `NumStability.Source.Vershynin.Chapter02.Section06.Theorem02.Contract` |
| `NumStability.HDP.Contracts.C_02_hthm_h2_d6_d3` | `NumStability.Source.Vershynin.Chapter02.Section06.Theorem03.Contract` |
| `NumStability.HDP.Contracts.C_02_hthm_hpsi2_hnorm_hcharacterizations` | `NumStability.Source.Vershynin.Chapter02.PsiTwoNormCharacterizations.Contract` |
| `NumStability.HDP.Contracts.C_05_hex_h5_d1_d13` | `NumStability.Source.Vershynin.Chapter05.Section01.Exercise13.Contract` |
| `NumStability.HDP.Contracts.C_05_hex_h5_d1_d14` | `NumStability.Source.Vershynin.Chapter05.Section01.Exercise14.Contract` |
| `NumStability.HDP.Contracts.C_05_hex_h5_d2_d11` | `NumStability.Source.Vershynin.Chapter05.Section02.Exercise11.Contract` |
| `NumStability.Algorithms.RandNLA` | `NumStability.Algorithms.RandomizedLinearAlgebra`, `NumStability.Source.DrineasMahoney.RandNLA2016` |
| `NumStability.Algorithms.RandNLA.ElementwiseSampling` | `NumStability.Algorithms.RandomizedLinearAlgebra.Sampling.Elementwise.Core`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm01.ElementwiseSampling.Sampling` |
| `NumStability.Algorithms.RandNLA.ElementwiseSpectral` | `NumStability.Algorithms.RandomizedLinearAlgebra.Concentration.SpectralTransfer.Elementwise`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation02.SpectralApproximation.ElementwiseSpectral`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation02.SpectralApproximation.FiniteSampleBounds` |
| `NumStability.Algorithms.RandNLA.ElementwiseTraceMGF` | `NumStability.Algorithms.RandomizedLinearAlgebra.Concentration.TraceMGF.Elementwise`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm01.ElementwiseSampling.TraceMGF` |
| `NumStability.Algorithms.RandNLA.HitCountConcentration` | `NumStability.Algorithms.RandomizedLinearAlgebra.Concentration.HitCounts.Bounds`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm01.ElementwiseSampling.HitCountConcentration`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm01.ElementwiseSampling.TwoPointMass` |
| `NumStability.Algorithms.RandNLA.LeastSquaresSketch` | `NumStability.Algorithms.RandomizedLinearAlgebra.LeastSquaresSketching.Objectives.Core`, `NumStability.Algorithms.RandomizedLinearAlgebra.LeastSquaresSketching.RowSampling.Core`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation08.LeastSquaresSketch.Endpoints`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation08.LeastSquaresSketch.FiniteSampleBounds` |
| `NumStability.Algorithms.RandNLA.LowRankApprox` | `NumStability.Algorithms.RandomizedLinearAlgebra.LowRankApproximation.ColumnSketches.Core`, `NumStability.Algorithms.RandomizedLinearAlgebra.LowRankApproximation.RankFactorizations.Core`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation09.LowRankApproximation.Endpoints` |
| `NumStability.Algorithms.RandNLA.Preconditioning` | `NumStability.Algorithms.RandomizedLinearAlgebra.Preconditioning.ExactTransforms.Core`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm03.RandomProjectionPreconditioning.CountSketchProbability`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm03.RandomProjectionPreconditioning.Preconditioning` |
| `NumStability.Algorithms.RandNLA.RowSampling` | `NumStability.Algorithms.RandomizedLinearAlgebra.Sampling.RowNorm.Core`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm02.RowSampling.Endpoints`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation04.RowSamplingProbability.Normalization` |
| `NumStability.Algorithms.RandNLA.RowSamplingGram` | `NumStability.Algorithms.RandomizedLinearAlgebra.Sampling.RowNorm.Gram`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation05.GramApproximation.Bounds`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation05.GramApproximation.FiniteSampleBounds` |
| `NumStability.Algorithms.RandNLA.RowSamplingLeverage` | `NumStability.Algorithms.RandomizedLinearAlgebra.Sampling.LeverageScore.Core`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation06.LeverageProbability.Normalization`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation07.SubspaceEmbedding.FiniteSampleLeverage`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation07.SubspaceEmbedding.Leverage` |
| `NumStability.Algorithms.RandNLA.RowSamplingLeverageComputedBasis` | `NumStability.Algorithms.RandomizedLinearAlgebra.Sampling.LeverageScore.ComputedBasis`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation07.SubspaceEmbedding.ComputedBasis` |
| `NumStability.Algorithms.RandNLA.RowSamplingLeverageMGF` | `NumStability.Algorithms.RandomizedLinearAlgebra.Concentration.TraceMGF.LeverageScore`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation07.SubspaceEmbedding.LeverageTraceMGF` |
| `NumStability.Algorithms.RandNLA.RowSamplingTraceMGF` | `NumStability.Algorithms.RandomizedLinearAlgebra.Concentration.TraceMGF.RowNorm`, `NumStability.Source.DrineasMahoney.RandNLA2016.Equation07.SubspaceEmbedding.RowNormTraceMGF` |
| `NumStability.Algorithms.RandNLA.UniformRowSampling` | `NumStability.Algorithms.RandomizedLinearAlgebra.Sampling.UniformRows.Core`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm03.RandomProjectionPreconditioning.UniformRowProbability`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm03.RandomProjectionPreconditioning.UniformRows` |
| `NumStability.Algorithms.RandNLA.UniformRowSamplingComposition` | `NumStability.Algorithms.RandomizedLinearAlgebra.Preconditioning.ExactTransforms.UniformRowComposition`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm03.RandomProjectionPreconditioning.UniformRowComposition`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm03.RandomProjectionPreconditioning.UniformRowJointEvent` |
| `NumStability.Algorithms.RandNLA.UniformRowSamplingFP` | `NumStability.Algorithms.RandomizedLinearAlgebra.Sampling.UniformRows.FloatingPoint`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm03.RandomProjectionPreconditioning.FloatingPoint`, `NumStability.Source.DrineasMahoney.RandNLA2016.Algorithm03.RandomProjectionPreconditioning.FloatingPointProbability` |
| `NumStability.Algorithms.RandNLA.UniformRowSamplingMGF` | `NumStability.Algorithms.RandomizedLinearAlgebra.Concentration.TraceMGF.UniformRows` |
| `NumStability.Algorithms.MatrixPowers` | `NumStability.Algorithms.MatrixPowers.ComputedIteration.Model`, `NumStability.Analysis.LinearOperators.MatrixPowers.ExactNormBounds.Real`, `NumStability.Analysis.LinearOperators.MatrixPowers.JordanScaling.RealDiagonal`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.Equations04And05.RealDiagonal`, `NumStability.Source.Higham.Chapter18.Section02.FinitePrecisionPowers.Equations08To14.ComputedIteration`, `NumStability.Source.Higham.Chapter18.Section02.FinitePrecisionPowers.Theorems01And02.RealCases` |
| `NumStability.Algorithms.MatrixPowersComplex` | `NumStability.Analysis.LinearOperators.MatrixPowers.ExactNormBounds.Complex`, `NumStability.Analysis.LinearOperators.MatrixPowers.JordanScaling.Complex`, `NumStability.Source.Higham.Chapter18.Section02.FinitePrecisionPowers.Equations08To14.ComplexSimilarity`, `NumStability.Source.Higham.Chapter18.Section02.FinitePrecisionPowers.Theorems01And02.ComplexJordan` |
| `NumStability.Algorithms.MatrixPowersJordan` | `NumStability.Analysis.LinearOperators.MatrixPowers.JordanScaling.RealJordan`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.Equations04And05.RealJordan`, `NumStability.Source.Higham.Chapter18.Section02.FinitePrecisionPowers.Theorems01And02.RealJordan` |
| `NumStability.Algorithms.MatrixPowersLp` | `NumStability.Analysis.LinearOperators.MatrixPowers.LpBounds.ComplexDiagonal`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.Equations04And05.LpDiagonal` |
| `NumStability.Algorithms.MatrixPowersLpJordan` | `NumStability.Analysis.LinearOperators.MatrixPowers.LpBounds.ComplexJordan`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.Equations04And05.LpJordan` |
| `NumStability.Algorithms.MatrixPowersPseudospectral` | `NumStability.Analysis.LinearOperators.Pseudospectra.Perturbation.Definitions`, `NumStability.Source.Higham.Chapter18.Section02.FinitePrecisionPowers.Theorems01And02.PseudospectralPackaging` |
| `NumStability.Algorithms.MatrixPowersPseudospectralCriterion` | `NumStability.Analysis.LinearOperators.Pseudospectra.Perturbation.ConvergenceCriterion`, `NumStability.Source.Higham.Chapter18.Section02.FinitePrecisionPowers.Theorems01And02.PseudospectralCriterion` |
| `NumStability.Algorithms.MatrixPowersSpectral` | `NumStability.Analysis.LinearOperators.MatrixPowers.ExactNormBounds.SpectralRadius`, `NumStability.Source.Higham.Chapter18.Section02.FinitePrecisionPowers.Theorems01And02.SpectralCriterion` |
| `NumStability.Analysis.MatrixPowersBaiDemmelGu` | `NumStability.Analysis.LinearOperators.MatrixPowers.BaiDemmelGu.StabilityRadius`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.NamedBounds.BaiDemmelGu` |
| `NumStability.Analysis.MatrixPowersBaiDemmelGuDistance` | `NumStability.Analysis.LinearOperators.MatrixPowers.BaiDemmelGu.DistanceToInstability` |
| `NumStability.Analysis.MatrixPowersBinomialBound` | `NumStability.Analysis.LinearOperators.MatrixPowers.Henrici.BinomialPowerBound` |
| `NumStability.Analysis.MatrixPowersGautschi` | `NumStability.Analysis.LinearOperators.MatrixPowers.Gautschi.Bounds`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.NamedBounds.Gautschi` |
| `NumStability.Analysis.MatrixPowersHenrici` | `NumStability.Analysis.LinearOperators.MatrixPowers.Henrici.DepartureFromNormality` |
| `NumStability.Analysis.MatrixPowersHenriciNormal` | `NumStability.Analysis.LinearOperators.MatrixPowers.Henrici.NormalMatrices` |
| `NumStability.Analysis.MatrixPowersKreiss` | `NumStability.Analysis.LinearOperators.MatrixPowers.Kreiss.ResolventBound`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.NamedBounds.Kreiss` |
| `NumStability.Analysis.MatrixPowersKreissSpijker` | `NumStability.Analysis.LinearOperators.MatrixPowers.Spijker.KreissBridge`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.NamedBounds.SpijkerKreiss` |
| `NumStability.Analysis.MatrixPowersLaszlo` | `NumStability.Analysis.LinearOperators.MatrixPowers.Laszlo.NearestNormal`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.NamedBounds.Laszlo` |
| `NumStability.Analysis.MatrixPowersLp185Primary` | `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.Equations04And05.Equation05Primary` |
| `NumStability.Analysis.MatrixPowersSchur` | `NumStability.Analysis.LinearOperators.MatrixPowers.ExactNormBounds.Schur` |
| `NumStability.Analysis.MatrixPowersSpijkerClosure` | `NumStability.Analysis.LinearOperators.MatrixPowers.Spijker.KreissBounds`, `NumStability.Source.Higham.Chapter18.Section01.MatrixPowerBounds.NamedBounds.SpijkerKreiss` |
| `NumStability.Analysis.MatrixPowersSpijkerPlanar` | `NumStability.Analysis.LinearOperators.MatrixPowers.Spijker.PlanarAlgebra` |
| `NumStability.Analysis.MatrixPowersSpijkerPlanarAnalysis` | `NumStability.Analysis.LinearOperators.MatrixPowers.Spijker.PlanarAnalysis` |
| `NumStability.Analysis.MatrixPowersSpijkerRational` | `NumStability.Analysis.LinearOperators.MatrixPowers.Spijker.Rational` |
| `NumStability.Algorithms.Sylvester.Higham16` | `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.SchurTransformClosure` |
| `NumStability.Algorithms.Sylvester.Higham16AutoCondition` | `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.AutomaticBounds.Equations23To28` |
| `NumStability.Algorithms.Sylvester.Higham16Eq9Assembly` | `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.TriangularBartelsStewart.ResidualAssembly`, `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.SchurTransformClosure`, `NumStability.Analysis.Rounding`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equation09.Assembly`, `NumStability.Source.Higham.Chapter19.Core` |
| `NumStability.Algorithms.Sylvester.Higham16Eq9EndToEnd` | `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.TriangularBartelsStewart.EndToEnd`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.TriangularBartelsStewart.ResidualAssembly`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.TriangularBartelsStewart.RoundedSolve`, `NumStability.Algorithms.LinearSystems.Triangular.BackSubstitution`, `NumStability.Analysis.Rounding`, `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.SchurTransformClosure`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equation09.Assembly`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.SpectralCompletion`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedTriangular`, `NumStability.Source.Higham.Chapter19.Core`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equation09.EndToEnd` |
| `NumStability.Algorithms.Sylvester.Higham16HessenbergRounded` | `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.AutomaticRealSchur` |
| `NumStability.Algorithms.Sylvester.Higham16HessenbergSchur` | `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.ShiftedHessenbergSolvability` |
| `NumStability.Algorithms.Sylvester.Higham16Lyapunov` | `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.StructuredLyapunov`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Diagonal`, `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.FirstOrder`, `NumStability.Algorithms.MatrixEquations.Sylvester.Perturbation.Basic`, `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.SchurTransformClosure`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation22`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation23`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation24`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation25`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation26`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation27`, `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.Equation28` |
| `NumStability.Algorithms.Sylvester.Higham16LyapunovSigmaMin` | `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.SigmaMinBounds.Lyapunov`, `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.SingularValue`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.SigmaMinCorollaries.Lyapunov` |
| `NumStability.Algorithms.Sylvester.Higham16Minimizers` | `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.Equation29Extensions.AttainedMinimizerCompletion` |
| `NumStability.Algorithms.Sylvester.Higham16NormEstimator` | `NumStability.Algorithms.NormEstimation.OneNorm.PowerMethod`, `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.PracticalErrorBounds`, `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.PracticalEstimator.OneNorm`, `NumStability.Algorithms.NormEstimation.OneNorm.GeneralIndex`, `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.NormEstimator.Equation29` |
| `NumStability.Algorithms.Sylvester.Higham16PerturbationSigmaMin` | `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.SigmaMinBounds.SylvesterPerturbation`, `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.SingularValue`, `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.SchurTransformClosure`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.SigmaMinCorollaries.SylvesterPerturbation` |
| `NumStability.Algorithms.Sylvester.Higham16PivotedSmallBlocks` | `NumStability.Algorithms.LU.GaussianElimination`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.PivotedSmallBlocks.CompletePivot`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.QuasiQuasiSolve`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.SmallSystemRounding`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedSylvesterCompletion`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.QuasiQuasiSylvester`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.PivotedSmallBlocks` |
| `NumStability.Algorithms.Sylvester.Higham16Problem16_2` | `NumStability.Source.Higham.Chapter16.Problem02.LyapunovIntegral.SemigroupCompletion` |
| `NumStability.Algorithms.Sylvester.Higham16Psi` | `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.StructuredSylvester`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Diagonal`, `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.FirstOrder`, `NumStability.Algorithms.MatrixEquations.Sylvester.Perturbation.Basic`, `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.SchurTransformClosure`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation22`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation25`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation27`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation23`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation24` |
| `NumStability.Algorithms.Sylvester.Higham16PsiSigmaMin` | `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.SigmaMinBounds.StructuredSylvester`, `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.SingularValue`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.SigmaMinCorollaries.StructuredSylvester` |
| `NumStability.Algorithms.Sylvester.Higham16QuasiQuasiRounded` | `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.SmallSystemRounding`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedSylvesterCompletion` |
| `NumStability.Algorithms.Sylvester.Higham16QuasiQuasiSylvester` | `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.QuasiQuasiSolve`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.SmallSystemRounding`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedSylvesterCompletion`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.QuasiQuasiSylvester` |
| `NumStability.Algorithms.Sylvester.Higham16QuasiRoundedSolve` | `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.RoundedBlockBackSubstitution` |
| `NumStability.Algorithms.Sylvester.Higham16QuasiRoundedSylvester` | `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedSylvesterCompletion` |
| `NumStability.Algorithms.Sylvester.Higham16RoundedExecutor` | `NumStability.Algorithms.MatMul`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.Executor`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.TriangularBartelsStewart.EndToEnd`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.TriangularBartelsStewart.ResidualAssembly`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.TriangularBartelsStewart.RoundedSolve`, `NumStability.Algorithms.LinearSystems.Triangular.BackSubstitution`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.QuasiQuasiSolve`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.QuasiTriangularBartelsStewart.SmallSystemRounding`, `NumStability.Analysis.Rounding`, `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.SchurTransformClosure`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equation09.Assembly`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equation09.EndToEnd`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.SpectralCompletion`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedTriangular`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedSylvesterCompletion`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.QuasiQuasiSylvester`, `NumStability.Source.Higham.Chapter19.Core`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedExecutor` |
| `NumStability.Algorithms.Sylvester.Higham16RoundedTriangular` | `NumStability.Algorithms.LinearSystems.Triangular.BackSubstitution`, `NumStability.Algorithms.MatrixEquations.Sylvester.Solvers.TriangularBartelsStewart.RoundedSolve`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.SpectralCompletion`, `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.RoundedTriangular` |
| `NumStability.Algorithms.Sylvester.Higham16Spectrum` | `NumStability.Source.Higham.Chapter16.Section02.BartelsStewart.Equations04To08.SpectralCompletion` |
| `NumStability.Algorithms.Sylvester.Higham16SpectrumMinimizers` | `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.Equation29Extensions.SpectralMinimizers` |
| `NumStability.Algorithms.Sylvester.Higham16VecNorm` | `NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.Equation29Extensions.VectorizedCompletion` |
| `NumStability.Algorithms.Sylvester.Higham16VecPermutationNotes` | `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Vectorization`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.VectorizationIdentities.KroneckerPermutation`, `NumStability.Source.Higham.Chapter16.Section01.SylvesterEquation.VectorizationNotes.Notes`, `NumStability.Source.Higham.Chapter16.Section01.SylvesterEquation.VectorizationNotes.PermutationIdentity` |
| `NumStability.Algorithms.Sylvester.SylvesterBackward` | `NumStability.Algorithms.MatrixEquations.Sylvester.BackwardError.LyapunovSpectral`, `NumStability.Algorithms.MatrixEquations.Sylvester.BackwardError.SylvesterSVD`, `NumStability.Algorithms.MatrixEquations.Sylvester.BackwardError.Specification`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Basic`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Lyapunov`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation10`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation11`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation12`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.LyapunovDefinition`, `NumStability.Analysis.MatrixAlgebra`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation13`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation15`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation16`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation18`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation19`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation21` |
| `NumStability.Algorithms.Sylvester.SylvesterPerturbation` | `NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.FirstOrder`, `NumStability.Algorithms.MatrixEquations.Sylvester.Perturbation.Basic`, `NumStability.Algorithms.MatrixEquations.Sylvester.BackwardError.Specification`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Basic`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Lyapunov`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation10`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation11`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation12`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation21`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.LyapunovDefinition`, `NumStability.Analysis.MatrixAlgebra`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation22`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation23`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation24`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation25`, `NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.Equation27` |
| `NumStability.Algorithms.Sylvester.SylvesterSpec` | `NumStability.Algorithms.MatrixEquations.Sylvester.BackwardError.Specification`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Basic`, `NumStability.Algorithms.MatrixEquations.Sylvester.Equation.Lyapunov`, `NumStability.Analysis.MatrixAlgebra`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation10`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation11`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation12`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.Equation21`, `NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.LyapunovDefinition` |

The frozen Chapter 16 Sylvester wave promotes all 28 W05/W06 historical paths
to exact declaration-free compatibility routes. The seven non-aggregate
production consumers and the historical discovery aggregate now import only
semantic algorithms or Chapter 16 source endpoints. The 805 retained compiler
declarations (755 public and 50 private) moved in their typed atomic closures;
all public names remain unchanged and compile through isolated canonical-only
and legacy-only routes.

The remaining W06 and W08 reviewed historical shims outside this Chapter 16
family stay outside the compatibility tier until their own dependency-closed
waves retarget every production consumer. Their declaration routing and
retention evidence remains recorded in the delivery ledgers.

The single-target chapter rows above are exact one-to-one forwarders. The
canonical chapter aggregates are discovery entry points, not wrapper targets:
`NumStability.Source.Higham.Chapter02`,
`NumStability.Source.Higham.Chapter12`,
`NumStability.Source.Higham.Chapter14`,
`NumStability.Source.Higham.Chapter14.Section05`,
`NumStability.Source.Higham.Chapter21`,
`NumStability.Source.Higham.Chapter21.Equation11`,
`NumStability.Source.Higham.Chapter21.SemiNormalEquations`,
`NumStability.Source.Higham.Chapter21.Theorem01`,
`NumStability.Source.Higham.Chapter21.Theorem03`,
`NumStability.Source.Higham.Chapter21.Theorem04`,
`NumStability.Source.Higham.Chapter21.Theorem04.Givens`,
`NumStability.Source.Higham.Chapter21.Theorem04.ModifiedGramSchmidt`,
`NumStability.Source.Higham.Chapter22`,
`NumStability.Source.Higham.Chapter22.Section03`,
`NumStability.Source.Higham.Chapter27`,
`NumStability.Source.Higham.Chapter28`,
`NumStability.Source.Higham.Chapter28.Asymptotics`,
`NumStability.Source.Higham.Chapter28.Cauchy`,
`NumStability.Source.Higham.Chapter28.Companion`,
`NumStability.Source.Higham.Chapter28.Equation02`,
`NumStability.Source.Higham.Chapter28.Hilbert`,
`NumStability.Source.Higham.Chapter28.Orthogonal`,
`NumStability.Source.Higham.Chapter28.Pascal`,
`NumStability.Source.Higham.Chapter28.PositiveMatrices`,
`NumStability.Source.Higham.Chapter28.Probability`,
`NumStability.Source.Higham.Chapter28.ProbabilityStatements`,
`NumStability.Source.Higham.Chapter28.Randsvd`,
`NumStability.Source.Higham.Chapter28.RealGinibre`,
`NumStability.Source.Higham.Chapter28.Stewart`,
`NumStability.Source.Higham.Chapter28.TestMatrices`,
`NumStability.Source.Higham.Chapter28.Theorem01`, and
`NumStability.Source.Higham.Chapter28.Toeplitz` contain only documentation and imports.
The reusable `NumStability.Analysis.Equidistribution`, `LeadingDigits`,
`Asymptotics`, `Conditioning`, `LinearOperators`, `MatrixNorms`,
`OperatorNorms`, `Probability.Haar`, `Probability.RandomMatrices`,
`SingularValues`, and `VectorNorms`
aggregates, and the source `NumStability.Source.Higham.Chapter02.Section07` and
`NumStability.Source.Higham.Chapter06.Norms` aggregates, are likewise
declaration-free discovery entry points. `NumStability.Analysis.Norms.Core` is
also declaration-free and is audited as a reusable entry point for its former
reusable subset; numbered Chapter 6 results are intentionally exposed through
the source aggregate and the broader historical `Analysis.Norms` facade.

The compatibility inventory now contains 663 wrappers with 1,159 direct project
targets.

The randomized linear algebra wave replaces 17 declaration owners and the
historical family aggregate with 18 exact declaration-free compatibility
wrappers. Reusable randomized sampling, concentration, sketching, low-rank,
and preconditioning declarations now live under
`NumStability.Algorithms.RandomizedLinearAlgebra`; Algorithm 1--3 and Equation
2, 4--9 source correspondence now lives under
`NumStability.Source.DrineasMahoney.RandNLA2016`. Canonical-only and old-only
tests cover every queued route independently.

The Higham Chapter 16 Sylvester wave replaces 12 retained declaration owners
and 16 existing import locators with 28 exact declaration-free compatibility
wrappers. The source-independent rounded block-back-substitution closure now
lives under `NumStability.Algorithms.MatrixEquations.Sylvester`; the other
typed retained closures now live at exact `NumStability.Source.Higham.Chapter16`
endpoints. The 144 direct wrapper targets preserve each former import surface,
and 28 canonical-only plus 28 legacy-only leaves exercise every route.

The remaining Higham Chapter 10 wave replaces 11 retained declaration owners
with exact one-target forwarding modules. Their declarations now live in the
chapter endpoint owner and ten semantic theorem, equation, lemma, and section
leaves under `NumStability.Source.Higham.Chapter10`. Earlier W03 work had
already separated the reusable Cholesky and matrix-analysis foundations, so
this retained closure is source-only. Canonical-only and legacy-only leaves
exercise every route independently.

The Higham Chapter 14 / Gauss--Jordan wave replaces 18 declaration owners and
24 declaration-free locator modules with 42 exact one-target compatibility
wrappers. The unchanged declarations now live under semantic
`NumStability.Source.Higham.Chapter14` owners, while the existing reusable
Gauss--Jordan and matrix-inversion cores remain under `NumStability.Algorithms`.
The pre-existing declaration-owning `Problem02.TriangularInversion.Method2B`
module was split into a `Method2B.Core` owner and a declaration-free Method2B
family umbrella when the new two-block derivation child was added. Canonical-only
and old-only tests cover every queued route independently.

The Higham Chapter 15 / tridiagonal wave replaces 27 declaration owners with
27 exact one-target, declaration-free compatibility wrappers. Reusable
one-norm and p-norm estimator foundations now live under
`NumStability.Algorithms.NormEstimation`; numbered Chapter 15 algorithms,
theorems, problems, and tridiagonal-conditioning statements now live under
`NumStability.Source.Higham.Chapter15`. Canonical-only and old-only tests cover
every queued route independently.

The Higham Chapter 28 real-Ginibre wave replaces 36 declaration-bearing
`Higham28Ginibre*` owners and the two mixed `Higham28Probability` and
`Higham28Asymptotics` owners with 38 exact declaration-free compatibility
wrappers. Reusable probability and central-binomial foundations now live under
`NumStability.Analysis`; numbered and source-specific statements live under
`NumStability.Source.Higham.Chapter28`. Canonical-only and old-only import
tests cover every migrated owner independently.

The remaining Higham Chapter 28 test-matrix wave replaces 34 declaration-bearing
`NumStability.Algorithms.TestMatrices.Higham28*` owners with exact one-target,
declaration-free compatibility wrappers. Their unchanged declarations now live
under the Cauchy, companion, Hilbert, orthogonal, Pascal, probability, randsvd,
Stewart, and Toeplitz source families, together with the Chapter 28 gallery,
moment, contract, and reciprocal-SPD leaves. Canonical-only and old-only import
tests cover every queued route independently through the declaration-free
`NumStability.Source.Higham.Chapter28.TestMatrices` discovery aggregate.

Phase 12 completes the cutover of the historical
`NumStability.Algorithms.LU.BlockLU` declaration owner. That path is now a
declaration-free two-target facade over the
canonical reusable `NumStability.Algorithms.LinearSystems.LU.BlockLU` family
and the source-facing `NumStability.Source.Higham.Chapter13.BlockLU` family.
Production consumers use those semantic owners directly; the old-only import
test preserves the complete historical surface. The follow-on ownership
contract also moves all 287 declarations from the ten historical BlockLU
sibling modules into 22 reusable and Chapter 13 destinations. Those ten paths
are now exact declaration-free wrappers with isolated old-only tests; no
production consumer imports them.

Phase 11B2 adds four exact one-target wrappers for the former Chapter 6
`Chapter06Lemma66`, `Higham6Asides`, `Higham6BlockAntidiag`, and
`HighamChapter6Duality` paths. Their declarations now live in the canonical
`Source.Higham.Chapter06` tree; isolated old-only tests preserve each former
import surface.

The historical `NumStability.Analysis.Norms` path remains a two-target facade.
It re-exports the declaration-free reusable Core aggregate and the dedicated
`Source.Higham.Chapter06.Norms` aggregate, preserving its former generic
surface together with Problems 6.1, 6.5, 6.9, and 6.10 and Theorem 6.4. New
production code imports the narrow semantic family or source leaf it needs;
no declaration-bearing production module imports the historical facade or
Core. Core is now classified as an aggregate and owns no declarations. This
Phase 11B1 retained 104 wrappers with 204 direct targets. The four Phase 11B2
wrappers produced 108/208; the Phase 12 two-target `Algorithms.LU.BlockLU`
facade produced 109/210, and the ten sibling wrappers produced 119/228. The
first two QR waves add 17 exact historical wrappers and 18 direct targets,
producing 136/246. The completed Chapter 9 split adds 11 historical facades
and 20 direct targets, producing 147/266 before the 41 LSQ wrappers and their
185 project-facing import targets raised the current totals to 188/451.

`NumStability.Source.Higham.Chapter02.Problem22` has one temporary
canonical-side compatibility exception: in addition to locating the reusable
Problem 2.22 API, it re-exports `Source.Higham.Chapter02.Problem23` because the
Heron surface was previously published from the incorrectly numbered Problem
22 path. This extra import may be removed only in a planned breaking release,
after the release notes identify `Problem23` as the replacement and downstream
users have had a migration window. It is not a precedent for new canonical
modules to re-export adjacent source problems.

The historical nonrandom-rounding path remains the complete compatibility
import for the canonical Section 1.17 aggregate. Its five historical child
paths are exact import-only wrappers for the corresponding semantic leaves;
new code should import the canonical Chapter 1 paths directly.

CI runs `tools/architecture/check_compatibility.py` to require that every
tabled historical file contains only its documented imports and that
production modules use no tabled old path. Old-only and canonical-only Lean
smoke modules compile the two surfaces independently; summation wrappers and
the Chapter 9-to-12 bridge pair also have isolated per-wrapper checks where
sibling dependencies could otherwise mask a regression.

## Removal rule

No forwarding module is removed in this migration. A future removal requires a
declared breaking release, release-note and migration-guide entries, a search
showing production consumers use canonical paths, and an explicit update to
the old-path smoke tests. Until then, CI compiles both curated entry points and
representative historical imports.
