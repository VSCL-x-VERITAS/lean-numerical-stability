import NumStability.HDP.Process.BrownianFoundation.Gaussian.Gaussian
import Mathlib.MeasureTheory.Constructions.Cylinders
import Mathlib.Probability.Independence.CharacteristicFunction

open MeasureTheory ProbabilityTheory Finset WithLp Complex
open scoped NNReal InnerProductSpace

namespace ProbabilityTheory

private lemma real_inner_eq_mul (x y : ℝ) : ⟪x, y⟫_ℝ = x * y := by
  rw [show x = x • (1 : ℝ) by simp, show y = y • (1 : ℝ) by simp]
  simp only [real_inner_smul_left, real_inner_smul_right]
  simp [mul_comm]

variable {ι Ω : Type*} {mΩ : MeasurableSpace Ω} {P : Measure Ω}

section charFun

variable [Fintype ι]

lemma HasGaussianLaw.charFun_toLp_pi {X : ι → Ω → ℝ} (hX : HasGaussianLaw (fun ω ↦ (X · ω)) P)
    (ξ : EuclideanSpace ℝ ι) :
    charFun (P.map (fun ω ↦ toLp 2 (X · ω))) ξ =
      exp (∑ i, ξ i * P[X i] * I - ∑ i, ∑ j, (ξ i : ℂ) * ξ j * (cov[X i, X j; P] / 2)) := by
  have := hX.isProbabilityMeasure
  have h_int (i : ι) : (∫ x, (X i x : ℂ) ∂P) = Complex.ofReal (∫ x, X i x ∂P) :=
    integral_complex_ofReal
  nth_rw 1 [(hX.toLp_pi 2).isGaussian_map.charFun_eq', covarianceBilin_apply_pi,
    EuclideanSpace.real_inner_eq]
  · simp_rw [ofReal_sum, Finset.sum_mul, ← mul_div_assoc, Finset.sum_div,
      ← ofReal_mul, h_int]
    have h_coord (i : ι) :
        (∫ x : EuclideanSpace ℝ ι, x ∂P.map (fun ω ↦ toLp 2 (X · ω))) i =
          ∫ ω, X i ω ∂P := by
      have h_map :
          (∫ x : EuclideanSpace ℝ ι, x ∂P.map (fun ω ↦ toLp 2 (X · ω))) =
            ∫ ω, toLp 2 (X · ω) ∂P := by
        exact integral_map
          ((measurable_toLp 2 _).comp_aemeasurable hX.aemeasurable)
          aestronglyMeasurable_id
      rw [h_map]
      rw [eval_integral_piLp (fun j ↦ by
        simpa only [PiLp.toLp_apply] using (hX.eval j).integrable) i]
    simp only [id_eq]
    simp_rw [h_coord]
    simp only [Complex.ofReal_mul]
  · exact fun i ↦ (hX.eval i).memLp_two

lemma HasGaussianLaw.charFun_toLp_prodMk {X Y : Ω → ℝ} (hXY : HasGaussianLaw (fun ω ↦ (X ω, Y ω)) P)
    (ξ : WithLp 2 (ℝ × ℝ)) :
    charFun (P.map (fun ω ↦ toLp 2 (X ω, Y ω))) ξ =
      exp ((ξ.fst * P[X] + ξ.snd * P[Y]) * I -
        (ξ.fst ^ 2 * Var[X; P] +
          2 * ξ.fst * ξ.snd * cov[X, Y; P] + ξ.snd ^ 2 * Var[Y; P]) / 2) := by
  have := hXY.isProbabilityMeasure
  have hX_int : (∫ x, (X x : ℂ) ∂P) = Complex.ofReal (∫ x, X x ∂P) :=
    integral_complex_ofReal
  have hY_int : (∫ x, (Y x : ℂ) ∂P) = Complex.ofReal (∫ x, Y x ∂P) :=
    integral_complex_ofReal
  nth_rw 1 [(hXY.toLp_prodMk 2).isGaussian_map.charFun_eq', covarianceBilin_apply_prod]
  · simp only [id_eq, prod_inner_apply, ofLp_fst, ofLp_snd, ofReal_add, ofReal_mul,
      add_div, pow_two]
    simp_rw [real_inner_eq_mul, hX_int, hY_int]
    rw [mul_comm (ξ.fst : ℂ), mul_comm (ξ.snd : ℂ)]
    have h_fst :
        (∫ x : WithLp 2 (ℝ × ℝ), x ∂P.map (fun ω ↦ toLp 2 (X ω, Y ω))).fst =
          ∫ ω, X ω ∂P := by
      rw [integral_map, fst_integral_withLp]
      · simp
      · exact (hXY.toLp_prodMk 2).integrable
      · fun_prop
      · exact aestronglyMeasurable_id
    have h_snd :
        (∫ x : WithLp 2 (ℝ × ℝ), x ∂P.map (fun ω ↦ toLp 2 (X ω, Y ω))).snd =
          ∫ ω, Y ω ∂P := by
      rw [integral_map, snd_integral_withLp]
      · simp
      · exact (hXY.toLp_prodMk 2).integrable
      · fun_prop
      · exact aestronglyMeasurable_id
    simp_rw [h_fst, h_snd]
    congr 1
    simp only [Complex.ofReal_mul]
    ring
  · exact hXY.fst.memLp_two
  · exact hXY.snd.memLp_two

end charFun

variable [Finite ι]

variable {X Y : Ω → ℝ} {μX μY : ℝ} {vX vY : ℝ≥0}

lemma IndepFun.hasLaw_sub_of_gaussian
    (hX : HasLaw X (gaussianReal μX vX) P) (hY : HasLaw Y (gaussianReal μY vY) P)
    (h1 : IndepFun X (Y - X) P) (h2 : vX ≤ vY) :
    HasLaw (Y - X) (gaussianReal (μY - μX) (vY - vX)) P where
  map_eq := by
    have : IsProbabilityMeasure P := hX.hasGaussianLaw.isProbabilityMeasure
    refine Measure.ext_of_charFun <| funext fun t ↦ ?_
    apply mul_left_cancel₀ (a := charFun (P.map X) t)
    · rw [hX.map_eq, charFun_gaussianReal]
      exact Complex.exp_ne_zero _
    · rw [← Pi.mul_apply, ← h1.charFun_map_add_eq_mul, add_sub_cancel, hY.map_eq, hX.map_eq,
        charFun_gaussianReal, charFun_gaussianReal, charFun_gaussianReal, ← Complex.exp_add,
        NNReal.coe_sub h2, Complex.ofReal_sub]
      · congr
        field_simp
        push_cast
        ring
      all_goals fun_prop

lemma IndepFun.hasLaw_gaussianReal_of_add
    (hX : HasLaw X (gaussianReal μX vX) P) (hY : HasLaw (X + Y) (gaussianReal μY vY) P)
    (h : IndepFun X Y P) :
    HasLaw Y (gaussianReal (μY - μX) (vY - vX)) P := by
  have h' := h
  rw [show Y = X + Y - X by simp] at h' ⊢
  apply h'.hasLaw_sub_of_gaussian hX hY
  rw [← @Real.toNNReal_coe vY, ← @variance_id_gaussianReal μY vY, ← hY.variance_eq,
    h.variance_add, hX.variance_eq, variance_id_gaussianReal, Real.toNNReal_add,
    Real.toNNReal_coe]
  any_goals simp
  · exact variance_nonneg _ _
  · exact hX.hasGaussianLaw.memLp_two
  · convert hY.hasGaussianLaw.memLp_two.sub hX.hasGaussianLaw.memLp_two
    simp

lemma IndepFun.hasGaussianLaw_of_add_real
    (hX : HasGaussianLaw X P) (hY : HasGaussianLaw (X + Y) P) (h : IndepFun X Y P) :
    HasGaussianLaw Y P where
  isGaussian_map := by
    have h1 : HasLaw X (gaussianReal _ _) P := ⟨hX.aemeasurable, hX.map_eq_gaussianReal⟩
    have h2 : HasLaw (X + Y) (gaussianReal _ _) P := ⟨hY.aemeasurable, hY.map_eq_gaussianReal⟩
    have := h.hasLaw_gaussianReal_of_add h1 h2
    exact this.hasGaussianLaw.isGaussian_map

end ProbabilityTheory
