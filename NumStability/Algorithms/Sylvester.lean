import NumStability.Algorithms.MatrixEquations.Sylvester.BackwardError.All
import NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.All
import NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.AttainedMinima
import NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.AutomaticBounds
import NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.PracticalEstimator
import NumStability.Algorithms.MatrixEquations.Sylvester.Conditioning.SigmaMinBounds
import NumStability.Algorithms.MatrixEquations.Sylvester.Equation.All
import NumStability.Algorithms.MatrixEquations.Sylvester.Equation.VectorizationIdentities
import NumStability.Algorithms.MatrixEquations.Sylvester.GeneralizedEquations.All
import NumStability.Algorithms.MatrixEquations.Sylvester.Perturbation.All
import NumStability.Algorithms.MatrixEquations.Sylvester.Solvers
import NumStability.Algorithms.NormEstimation.OneNorm
import NumStability.Source.Higham.Chapter16.Problem02
import NumStability.Source.Higham.Chapter16.Section01.SylvesterEquation
import NumStability.Source.Higham.Chapter16.Section01.SylvesterEquation.All
import NumStability.Source.Higham.Chapter16.Section02.BartelsStewart
import NumStability.Source.Higham.Chapter16.Section02.RealSchurDecomposition.All
import NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError
import NumStability.Source.Higham.Chapter16.Section02.SylvesterAndLyapunovBackwardError.All
import NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning
import NumStability.Source.Higham.Chapter16.Section03.PerturbationAndConditioning.All
import NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds
import NumStability.Source.Higham.Chapter16.Section04.PracticalErrorBounds.All
import NumStability.Source.Higham.Chapter16.Section05.GeneralizedMatrixEquations.All
import NumStability.Source.Higham.Chapter16.SylvesterEquationCompletion

/-!
# Sylvester-equation family

Complete discovery aggregate for the historical Sylvester implementation and
Higham Chapter 16 correspondence modules. This is a mixed family surface;
implementation modules should prefer the narrowest leaf import they need.
-/
