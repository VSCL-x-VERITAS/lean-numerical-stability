/-
SPDX-License-Identifier: MIT
-/

import NumStability.Source.LeVeque.Chapter01.AcousticsConservationForm
import NumStability.Source.LeVeque.Chapter01.AcousticsEigenvalues
import NumStability.Source.LeVeque.Chapter01.AcousticsModes
import NumStability.Source.LeVeque.Chapter01.AdvectionLinearFlux
import NumStability.Source.LeVeque.Chapter01.AdvectionWaveIdentity
import NumStability.Source.LeVeque.Chapter01.DimensionalSplitting
import NumStability.Source.LeVeque.Chapter01.EigenvalueWaveSpeeds
import NumStability.Source.LeVeque.Chapter01.Equation01
import NumStability.Source.LeVeque.Chapter01.Equation02
import NumStability.Source.LeVeque.Chapter01.Equation03
import NumStability.Source.LeVeque.Chapter01.Equation03AdvectedProfile
import NumStability.Source.LeVeque.Chapter01.Equation04
import NumStability.Source.LeVeque.Chapter01.Equation04Model
import NumStability.Source.LeVeque.Chapter01.Equation05
import NumStability.Source.LeVeque.Chapter01.Equation06
import NumStability.Source.LeVeque.Chapter01.Equation07
import NumStability.Source.LeVeque.Chapter01.Equation08
import NumStability.Source.LeVeque.Chapter01.Equation09
import NumStability.Source.LeVeque.Chapter01.Equation10
import NumStability.Source.LeVeque.Chapter01.Equation11
import NumStability.Source.LeVeque.Chapter01.FiniteVolumeCellAverage
import NumStability.Source.LeVeque.Chapter01.FiniteVolumeFluxUpdate
import NumStability.Source.LeVeque.Chapter01.HeterogeneousCellAveraging
import NumStability.Source.LeVeque.Chapter01.Hyperbolicity
import NumStability.Source.LeVeque.Chapter01.IntegralToDifferential
import NumStability.Source.LeVeque.Chapter01.LinearFluxSpecialization
import NumStability.Source.LeVeque.Chapter01.RiemannInterfaceFlux
import NumStability.Source.LeVeque.Chapter01.ScalarHyperbolicity

/-!
# LeVeque, Chapter 1

Source-local wrappers for Chapter 1 of LeVeque's *Finite Volume Methods for
Hyperbolic Problems*.
-/
