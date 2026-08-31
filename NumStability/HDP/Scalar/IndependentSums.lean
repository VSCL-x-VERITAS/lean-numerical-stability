import NumStability.HDP.Scalar.IndependentSums.Bernstein
import NumStability.HDP.Scalar.IndependentSums.Chernoff
import NumStability.HDP.Scalar.IndependentSums.FairCoinCentralMass
import NumStability.HDP.Scalar.IndependentSums.FairCoinChebyshev
import NumStability.HDP.Scalar.IndependentSums.FairCoinMoments
import NumStability.HDP.Scalar.IndependentSums.FairCoinNormalization
import NumStability.HDP.Scalar.IndependentSums.GraphDegreeLaw
import NumStability.HDP.Scalar.IndependentSums.GraphDegreeMean
import NumStability.HDP.Scalar.IndependentSums.Hoeffding
import NumStability.HDP.Scalar.IndependentSums.HoeffdingNormalization
import NumStability.HDP.Scalar.IndependentSums.LowerChernoffBoundary
import NumStability.HDP.Scalar.IndependentSums.MedianOfMeans
import NumStability.HDP.Scalar.IndependentSums.MedianOfMeansProbability
import NumStability.HDP.Scalar.IndependentSums.MedianOfMeansSample
import NumStability.HDP.Scalar.IndependentSums.PoissonChernoff
import NumStability.HDP.Scalar.IndependentSums.SampleMeanChebyshev
import NumStability.HDP.Scalar.IndependentSums.TwoSidedTail

/-!
# Concentration for sums of independent random variables

Reusable entry point for the scalar independent-sum theory behind Vershynin,
*High-Dimensional Probability*, Chapter 2: Hoeffding-type moment generating
function bounds, Chernoff's inequality, and the random-graph degree laws that
Section 2.4 applies them to.
-/
