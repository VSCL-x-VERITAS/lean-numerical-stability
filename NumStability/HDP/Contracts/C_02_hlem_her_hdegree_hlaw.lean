import NumStability.HDP.Scalar.IndependentSums.Chernoff

/-! Stable Chapter 2 contract for the fixed-vertex Erdős--Rényi degree law. -/

noncomputable section

open MeasureTheory ProbabilityTheory

namespace NumStability.HDP.Contract

theorem hdp_02_hlem_her_hdegree_hlaw
    (n : ℕ) (p : Set.Icc (0 : ℝ) 1) (v : Fin n) :
    HasLaw ((NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).degree v)
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.graphBinomialLaw n p)
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).graphLaw := by
  have h := NumStability.HDP.Scalar.IndependentSums.Chernoff.graphDegreeSum_hasLaw p v
  have hcongr :
      (NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel n p).degree v =
        NumStability.HDP.Scalar.IndependentSums.Chernoff.graphDegreeSum v := by
    funext G
    exact NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel_degree_eq_graphDegreeSum
      n p v G
  have h' := h.congr (Filter.Eventually.of_forall (fun G => congrFun hcongr G))
  simpa [NumStability.HDP.Scalar.IndependentSums.Chernoff.erdosRenyiModel] using h'

end NumStability.HDP.Contract
