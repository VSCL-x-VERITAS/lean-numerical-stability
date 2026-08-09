import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Tactic

/-!
# Standard-normal MGF

This module proves the standard-normal moment-generating-function identity
used by the Chapter 2 sub-Gaussian development.
-/

noncomputable section

open MeasureTheory
open ProbabilityTheory

namespace NumStability.HDP.Scalar.SubGaussian

/-- The standard-normal MGF is `exp (lam ^ 2 / 2)`. -/
theorem standardNormalMGF (lam : ℝ) :
    ∫ x, Real.exp (lam * x) ∂(gaussianReal 0 1) =
      Real.exp (lam ^ 2 / 2) := by
  rw [integral_gaussianReal_eq_integral_smul (μ := (0 : ℝ)) (v := (1 : NNReal))
    (f := fun x : ℝ => Real.exp (lam * x)) (by norm_num)]
  change (∫ x : ℝ, gaussianPDFReal 0 1 x * Real.exp (lam * x)) =
    Real.exp (lam ^ 2 / 2)
  have hpdf (x : ℝ) :
      gaussianPDFReal 0 1 x =
        (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) := by
    simp [gaussianPDFReal]
  simp_rw [hpdf]
  have hshift :
      ∫ x : ℝ, Real.exp (-(x - lam) ^ 2 / 2) =
        ∫ x : ℝ, Real.exp (-x ^ 2 / 2) :=
    integral_sub_right_eq_self (fun x : ℝ => Real.exp (-x ^ 2 / 2)) lam
  have hpoint :
      (fun x : ℝ =>
        (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) *
          Real.exp (lam * x)) =
        (fun x : ℝ =>
          Real.exp (lam ^ 2 / 2) *
            ((Real.sqrt (2 * Real.pi))⁻¹ *
              Real.exp (-(x - lam) ^ 2 / 2))) := by
    funext x
    calc
      (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x ^ 2 / 2) * Real.exp (lam * x) =
          (Real.sqrt (2 * Real.pi))⁻¹ *
            (Real.exp (-x ^ 2 / 2) * Real.exp (lam * x)) := by ring
      _ = (Real.sqrt (2 * Real.pi))⁻¹ *
            Real.exp (-x ^ 2 / 2 + lam * x) := by
              rw [Real.exp_add]
      _ = Real.exp (lam ^ 2 / 2) *
            ((Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(x - lam) ^ 2 / 2)) := by
              calc
                (Real.sqrt (2 * Real.pi))⁻¹ *
                    Real.exp (-x ^ 2 / 2 + lam * x) =
                    (Real.sqrt (2 * Real.pi))⁻¹ *
                      Real.exp (lam ^ 2 / 2 + (-(x - lam) ^ 2 / 2)) := by
                        congr 1
                        congr 1
                        nlinarith
                _ = Real.exp (lam ^ 2 / 2) *
                      ((Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(x - lam) ^ 2 / 2)) := by
                        rw [Real.exp_add]
                        ring
  have hgauss :
      ∫ x : ℝ, Real.exp (-x ^ 2 / 2) = Real.sqrt (Real.pi / (1 / 2)) := by
    have hnorm := ProbabilityTheory.integral_gaussianPDFReal_eq_one (0 : ℝ)
      (v := (1 : NNReal)) (by norm_num)
    simp_rw [hpdf] at hnorm
    rw [integral_const_mul] at hnorm
    norm_num [Real.sqrt_eq_rpow] at hnorm ⊢
    field_simp at hnorm ⊢
    nlinarith
  rw [hpoint, integral_const_mul, integral_const_mul, hshift, hgauss]
  norm_num [Real.sqrt_eq_rpow]
  field_simp

/-! The moment-to-square-MGF implication from Proposition 2.5.2. -/

/- The root-free integral form of the usual `Lᵖ` moment-growth hypothesis. -/
def LpMomentGrowth {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (K : ℝ) : Prop :=
  AEMeasurable X μ ∧
    ∀ p : ℝ, 1 ≤ p →
      Integrable (fun ω => |X ω| ^ p) μ ∧
        (∫ ω, |X ω| ^ p ∂μ) ≤ (K * Real.sqrt p) ^ p

def EvenMomentBound {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (K : ℝ) : Prop :=
  ∀ n : ℕ, 1 ≤ n →
    Integrable (fun ω => |X ω| ^ (2 * n)) μ ∧
      (∫ ω, |X ω| ^ (2 * n) ∂μ) ≤ K ^ (2 * n) * (2 * n : ℝ) ^ n

def squareMGFTerm {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (n : ℕ) (ω : Ω) : ENNReal :=
  ENNReal.ofReal (((lam ^ 2 * X ω ^ 2) ^ n) / (n.factorial : ℝ))

lemma squareMGFTerm_aemeasurable
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ}
    (hX : AEMeasurable X μ) (lam : ℝ) (n : ℕ) :
    AEMeasurable (squareMGFTerm X lam n) μ := by
  unfold squareMGFTerm
  fun_prop

lemma exp_series_pointwise (x : ℝ) (hx : 0 ≤ x) :
    ENNReal.ofReal (Real.exp x) =
      ∑' n : ℕ, ENNReal.ofReal (x ^ n / (n.factorial : ℝ)) := by
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity)
    (NormedSpace.expSeries_div_summable x)]
  rw [NormedSpace.expSeries_div_hasSum_exp x |>.tsum_eq]
  rw [← Real.exp_eq_exp_ℝ]

lemma geom_bound (q : ℝ) (hq0 : 0 ≤ q) (hq : q ≤ 1 / 2) :
    (∑' n : ℕ, q ^ n) ≤ Real.exp (2 * q) := by
  have hqlt : q < 1 := lt_of_le_of_lt hq (by norm_num)
  have hsum := (hasSum_geometric_of_lt_one hq0 hqlt).tsum_eq
  rw [hsum]
  have hden : 0 < 1 - q := sub_pos.mpr hqlt
  have hrat : (1 - q)⁻¹ ≤ 1 + 2 * q := by
    rw [inv_eq_one_div]
    apply (div_le_iff₀ hden).2
    nlinarith [mul_nonneg hq0 (sub_nonneg.mpr (by linarith : q ≤ 1 / 2))]
  exact hrat.trans (by simpa [add_comm] using Real.add_one_le_exp (2 * q))

lemma factorial_ratio_bound (n : ℕ) (hn : 1 ≤ n) :
    ((2 * n : ℝ) ^ n) / (n.factorial : ℝ) ≤ (2 * Real.exp 1) ^ n := by
  have hfac := Stirling.le_factorial_stirling n
  have hroot : 1 ≤ Real.sqrt (2 * Real.pi * (n : ℝ)) := by
    rw [Real.one_le_sqrt]
    have hpi : (2 : ℝ) ≤ Real.pi := by
      nlinarith [Real.one_le_pi_div_two]
    have hnpos : (0 : ℝ) < (n : ℝ) := by
      exact_mod_cast (show 0 < n by omega)
    have hn1' : (1 : ℝ) ≤ (n : ℝ) := by exact_mod_cast hn
    have hpn : 2 * (n : ℝ) ≤ Real.pi * n :=
      mul_le_mul_of_nonneg_right hpi (le_of_lt hnpos)
    have hn1 : (1 : ℝ) ≤ 2 * (n : ℝ) := by nlinarith
    have hprod : (1 : ℝ) ≤ Real.pi * n := hn1.trans hpn
    nlinarith [hprod]
  have hn0 : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hepos : 0 < Real.exp 1 := Real.exp_pos _
  have hbase : 0 ≤ (n : ℝ) / Real.exp 1 := by positivity
  have hfac' : (n : ℝ) ^ n / (Real.exp 1) ^ n ≤ (n.factorial : ℝ) := by
    have hfac'' := (le_trans (mul_le_mul_of_nonneg_right hroot
      (by positivity : 0 ≤ ((n : ℝ) / Real.exp 1) ^ n)) hfac)
    simpa [div_pow] using hfac''
  have hmul : (n : ℝ) ^ n ≤ (n.factorial : ℝ) * (Real.exp 1) ^ n := by
    rw [← div_le_iff₀ (by positivity : 0 < (Real.exp 1) ^ n)]
    simpa [div_pow] using hfac'
  have hmul' : (2 * n : ℝ) ^ n ≤ (n.factorial : ℝ) * (2 * Real.exp 1) ^ n := by
    rw [mul_pow]
    calc
      2 ^ n * (n : ℝ) ^ n ≤ 2 ^ n * ((n.factorial : ℝ) * (Real.exp 1) ^ n) :=
        mul_le_mul_of_nonneg_left hmul (by positivity)
      _ = (n.factorial : ℝ) * (2 * Real.exp 1) ^ n := by
        rw [mul_pow]
        ring
  exact (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).2
    (by simpa [mul_comm] using hmul')

lemma squareMGFTerm_eq_mul
    {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (n : ℕ) (ω : Ω) :
    squareMGFTerm X lam n ω =
      ENNReal.ofReal ((lam ^ 2) ^ n / (n.factorial : ℝ)) *
        ENNReal.ofReal (|X ω| ^ (2 * n)) := by
  unfold squareMGFTerm
  rw [← ENNReal.ofReal_mul (by positivity :
    0 ≤ (lam ^ 2) ^ n / (n.factorial : ℝ))]
  congr 1
  rw [mul_pow]
  have hXsq : X ω ^ 2 = |X ω| ^ 2 := (sq_abs _).symm
  rw [hXsq, ← pow_mul]
  ring

lemma evenMomentBound_of_lpMomentGrowth
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ} {K : ℝ}
    (hLp : LpMomentGrowth μ X K) : EvenMomentBound μ X K := by
  intro n hn
  have hp := hLp.2 (2 * (n : ℝ)) (by
    have hn' : (1 : ℝ) ≤ n := by exact_mod_cast hn
    nlinarith)
  have hpn : 2 * (n : ℝ) = ((2 * n : ℕ) : ℝ) := by norm_num
  have hfun : (fun ω => |X ω| ^ (2 * (n : ℝ))) =
      (fun ω => |X ω| ^ (2 * n : ℕ)) := by
    funext ω
    rw [hpn, Real.rpow_natCast]
  rw [hfun] at hp
  have heq : (K * Real.sqrt (2 * (n : ℝ))) ^ (2 * (n : ℕ)) =
      K ^ (2 * (n : ℕ)) * (2 * (n : ℝ)) ^ n := by
    rw [mul_pow, pow_mul, pow_mul]
    rw [Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 2 * (n : ℝ))]
  constructor
  · exact hp.1
  · calc
      (∫ ω, |X ω| ^ (2 * n) ∂μ) ≤
          (K * Real.sqrt (2 * (n : ℝ))) ^ (2 * (n : ℝ)) := hp.2
      _ = (K * Real.sqrt (2 * (n : ℝ))) ^ (2 * n : ℕ) := by
        rw [hpn, Real.rpow_natCast]
      _ = K ^ (2 * n) * (2 * (n : ℝ)) ^ n := heq

lemma squareMGFTerm_lintegral_le_geom
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ} {K lam : ℝ}
    (hMom : EvenMomentBound μ X K) {n : ℕ} (hn : 1 ≤ n) :
    (∫⁻ ω, squareMGFTerm X lam n ω ∂μ) ≤
      ENNReal.ofReal ((2 * Real.exp 1 * (lam * K) ^ 2) ^ n) := by
  have hm := hMom n hn
  have hterm := squareMGFTerm_eq_mul X lam n
  rw [lintegral_congr_ae (Filter.Eventually.of_forall (fun ω => hterm ω))]
  rw [lintegral_const_mul' _ _ (by simp)]
  rw [← ofReal_integral_eq_lintegral_ofReal hm.1
    (Filter.Eventually.of_forall (fun ω => by positivity))]
  have hscalar : 0 ≤ (lam ^ 2) ^ n / (n.factorial : ℝ) := by positivity
  have hbound := mul_le_mul_of_nonneg_left hm.2 hscalar
  rw [← ENNReal.ofReal_mul hscalar]
  apply ENNReal.ofReal_le_ofReal
  calc
    (lam ^ 2) ^ n / (n.factorial : ℝ) *
          (∫ ω, |X ω| ^ (2 * n) ∂μ) ≤
        (lam ^ 2) ^ n / (n.factorial : ℝ) *
          (K ^ (2 * n) * (2 * n : ℝ) ^ n) := hbound
    _ = ((lam * K) ^ (2 * n) * (2 * n : ℝ) ^ n) /
          (n.factorial : ℝ) := by ring
    _ ≤ (2 * Real.exp 1 * (lam * K) ^ 2) ^ n := by
      have hratio := factorial_ratio_bound n hn
      have hnonneg : 0 ≤ (lam * K) ^ (2 * n) := by
        rw [pow_mul]
        positivity
      apply (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).2
      have hratio' : (2 * n : ℝ) ^ n ≤ (2 * Real.exp 1) ^ n * (n.factorial : ℝ) :=
        (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).mp hratio
      calc
        (lam * K) ^ (2 * n) * (2 * n : ℝ) ^ n ≤
            (lam * K) ^ (2 * n) * ((2 * Real.exp 1) ^ n * (n.factorial : ℝ)) := by
              gcongr
        _ = (2 * Real.exp 1 * (lam * K) ^ 2) ^ n * (n.factorial : ℝ) := by
              calc
                (lam * K) ^ (2 * n) * ((2 * Real.exp 1) ^ n * (n.factorial : ℝ)) =
                    ((lam * K) ^ 2) ^ n * (2 * Real.exp 1) ^ n * (n.factorial : ℝ) := by
                      rw [pow_mul]
                      ring
                _ = (2 * Real.exp 1 * (lam * K) ^ 2) ^ n * (n.factorial : ℝ) := by
                      rw [← mul_pow]
                      ring

lemma squareMGF_lintegral_le
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K lam : ℝ}
    (hX : AEMeasurable X μ) (hK : 0 ≤ K)
    (hMom : EvenMomentBound μ X K) (hsmall : |lam| * K ≤ 1 / 4) :
    (∫⁻ ω, ENNReal.ofReal (Real.exp (lam ^ 2 * X ω ^ 2)) ∂μ) ≤
      ENNReal.ofReal (Real.exp (4 * Real.exp 1 * (lam * K) ^ 2)) := by
  let q : ℝ := 2 * Real.exp 1 * (lam * K) ^ 2
  have hprod : |lam * K| ≤ 1 / 4 := by
    rw [abs_mul, abs_of_nonneg hK]
    exact hsmall
  have hsq : (lam * K) ^ 2 ≤ (1 / 4 : ℝ) ^ 2 := by
    apply (sq_le_sq (a := lam * K) (b := (1 / 4 : ℝ))).2
    simpa using hprod
  have hq0 : 0 ≤ q := by positivity
  have hqhalf : q ≤ 1 / 2 := by
    have hfirst : q ≤ 2 * Real.exp 1 * (1 / 4 : ℝ) ^ 2 := by
      dsimp [q]
      exact mul_le_mul_of_nonneg_left hsq (by positivity)
    have hexp : Real.exp 1 ≤ 3 := Real.exp_one_lt_three.le
    nlinarith [hfirst]
  have hqsum : Summable (fun n : ℕ => q ^ n) := by
    exact (hasSum_geometric_of_lt_one hq0
      (lt_of_le_of_lt hqhalf (by norm_num))).summable
  have hterm_sum :
      (∑' n : ℕ, ∫⁻ ω, squareMGFTerm X lam n ω ∂μ) ≤
        ∑' n : ℕ, ENNReal.ofReal (q ^ n) := by
    apply ENNReal.tsum_le_tsum
    intro n
    cases n with
    | zero => simp [squareMGFTerm]
    | succ n =>
        simpa [q] using
          (squareMGFTerm_lintegral_le_geom hMom (n := n + 1) (by omega))
  calc
    (∫⁻ ω, ENNReal.ofReal (Real.exp (lam ^ 2 * X ω ^ 2)) ∂μ) =
        ∫⁻ ω, ∑' n : ℕ, squareMGFTerm X lam n ω ∂μ := by
          apply lintegral_congr_ae
          filter_upwards [] with ω
          exact exp_series_pointwise (lam ^ 2 * X ω ^ 2) (by positivity)
    _ = ∑' n : ℕ, ∫⁻ ω, squareMGFTerm X lam n ω ∂μ := by
          apply lintegral_tsum
          intro n
          exact squareMGFTerm_aemeasurable hX lam n
    _ ≤ ∑' n : ℕ, ENNReal.ofReal (q ^ n) := hterm_sum
    _ = ENNReal.ofReal (∑' n : ℕ, q ^ n) := by
          symm
          exact ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity) hqsum
    _ ≤ ENNReal.ofReal (Real.exp (2 * q)) :=
          ENNReal.ofReal_le_ofReal (geom_bound q hq0 hqhalf)
    _ = ENNReal.ofReal (Real.exp (4 * Real.exp 1 * (lam * K) ^ 2)) := by
          congr 2
          dsimp [q]
          ring

lemma squareMGF_real_le
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K lam : ℝ}
    (hX : AEMeasurable X μ) (hK : 0 ≤ K)
    (hMom : EvenMomentBound μ X K) (hsmall : |lam| * K ≤ 1 / 4) :
    Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
      (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤
        Real.exp (4 * Real.exp 1 * (lam * K) ^ 2) := by
  have hbound := squareMGF_lintegral_le hX hK hMom hsmall
  have hmeas : AEMeasurable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ := by
    fun_prop
  have hfinite :
      (∫⁻ ω, ‖Real.exp (lam ^ 2 * X ω ^ 2)‖ₑ ∂μ) < (⊤ : ENNReal) := by
    have htop : ENNReal.ofReal (Real.exp (4 * Real.exp 1 * (lam * K) ^ 2)) <
        (⊤ : ENNReal) :=
      ENNReal.ofReal_lt_top
    refine lt_of_le_of_lt ?_ htop
    simpa only [← ofReal_norm_eq_enorm, Real.norm_eq_abs,
      abs_of_pos (Real.exp_pos _)] using hbound
  have hInt : Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ :=
    ⟨hmeas.aestronglyMeasurable, (hasFiniteIntegral_iff_enorm).2 hfinite⟩
  refine ⟨hInt, ?_⟩
  have hEq := ofReal_integral_eq_lintegral_ofReal hInt
    (Filter.Eventually.of_forall (fun ω => (Real.exp_pos _).le))
  rw [← hEq] at hbound
  exact (ENNReal.ofReal_le_ofReal_iff (Real.exp_nonneg _)).mp hbound

/-! If the `Lᵖ` moments grow like `K * sqrt p`, then the square-exponential
MGF is bounded on the source's local scale. The displayed constants come from
the Stirling lower bound and the resulting geometric series. -/
theorem momentToSquareMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hLp : LpMomentGrowth μ X K) (lam : ℝ)
    (hsmall : |lam| ≤ (4 * K)⁻¹) :
    Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
      (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤
        Real.exp (4 * Real.exp 1 * (lam * K) ^ 2) := by
  have hsmall' : |lam| * K ≤ 1 / 4 := by
    calc
      |lam| * K ≤ (4 * K)⁻¹ * K :=
        mul_le_mul_of_nonneg_right hsmall hK.le
      _ = 1 / 4 := by field_simp
  exact squareMGF_real_le hLp.1 hK.le
    (evenMomentBound_of_lpMomentGrowth hLp) hsmall'

lemma exp_le_add_exp_sq (x : ℝ) :
    Real.exp x ≤ x + Real.exp (x ^ 2) := by
  have hcosh (y : ℝ) : Real.cosh y ≤ Real.exp (y ^ 2 / 2) :=
    Real.cosh_le_exp_half_sq y
  rcases le_total x 0 with hx | hx
  · have hy : 0 ≤ -x := neg_nonneg.mpr hx
    have hs : -x ≤ Real.sinh (-x) := (Real.self_le_sinh_iff).2 hy
    have hmain : Real.exp x - x ≤ Real.cosh (-x) := by
      rw [Real.cosh_eq]
      simp only [neg_neg]
      have hpos : 0 < Real.exp (-x) := Real.exp_pos _
      have hident : Real.exp x = (Real.exp (-x))⁻¹ := by
        simpa using (Real.exp_neg (-x))
      rw [hident]
      rw [Real.sinh_eq] at hs
      simp only [neg_neg] at hs
      rw [hident] at hs
      field_simp at hs ⊢
      nlinarith [hs]
    have hhalf : Real.exp ((-x) ^ 2 / 2) ≤ Real.exp ((-x) ^ 2) := by
      rw [Real.exp_le_exp]
      nlinarith [sq_nonneg x]
    have hsq : (-x) ^ 2 = x ^ 2 := by ring
    have hchain : Real.cosh (-x) ≤ Real.exp (x ^ 2) := by
      exact (hcosh (-x)).trans (by simpa [hsq] using hhalf)
    linarith [hmain, hchain]
  · have hcoshsub : Real.cosh x - Real.sinh x = Real.exp (-x) :=
      Real.cosh_sub_sinh x
    have hs : Real.sinh x - x ≤ Real.cosh x - 1 := by
      have he : 1 - x ≤ Real.exp (-x) := by
        simpa [sub_eq_add_neg, add_comm] using (Real.add_one_le_exp (-x))
      linarith [hcoshsub]
    have hmain : Real.exp x - x ≤ 2 * Real.cosh x - 1 := by
      rw [← Real.cosh_add_sinh x]
      linarith
    have hsq : 2 * Real.cosh x - 1 ≤ Real.exp (x ^ 2) := by
      have hc := hcosh x
      have hp : 0 ≤ Real.exp (x ^ 2 / 2) := Real.exp_nonneg _
      have hsquare : (Real.exp (x ^ 2 / 2) - 1) ^ 2 ≥ 0 := sq_nonneg _
      have hexp : Real.exp (x ^ 2 / 2) ^ 2 = Real.exp (x ^ 2) := by
        calc
          Real.exp (x ^ 2 / 2) ^ 2 =
              Real.exp (x ^ 2 / 2) * Real.exp (x ^ 2 / 2) := by ring
          _ = Real.exp (x ^ 2 / 2 + x ^ 2 / 2) := by rw [Real.exp_add]
          _ = Real.exp (x ^ 2) := by congr 1 <;> ring
      rw [← hexp]
      nlinarith
    linarith [hmain, hsq]

lemma exp_le_abs_add_exp_sq (x : ℝ) :
    Real.exp x ≤ |x| + Real.exp (x ^ 2) := by
  exact (exp_le_add_exp_sq x).trans (by
    simpa [add_comm] using add_le_add_right (le_abs_self x) (Real.exp (x ^ 2)))

def SquareMGFLocal {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (C : ℝ) : Prop :=
  AEMeasurable X μ ∧
    ∀ t : ℝ, |t| ≤ 1 →
      Integrable (fun ω => Real.exp (t ^ 2 * X ω ^ 2)) μ ∧
        (∫ ω, Real.exp (t ^ 2 * X ω ^ 2) ∂μ) ≤ Real.exp (C * t ^ 2)

lemma integrable_exp_mul_of_square
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : Ω → ℝ} (hX : AEMeasurable X μ) (hIntX : Integrable X μ)
    {a : ℝ} (hSq : Integrable (fun ω => Real.exp (a ^ 2 * X ω ^ 2)) μ) :
    Integrable (fun ω => Real.exp (a * X ω)) μ := by
  have hdom : Integrable (fun ω => |a| * |X ω| +
      Real.exp (a ^ 2 * X ω ^ 2)) μ := by
    have hlin : Integrable (fun ω => |a| * |X ω|) μ :=
      hIntX.norm.const_mul |a|
    exact hlin.add hSq
  refine MeasureTheory.Integrable.mono' hdom ?_ ?_
  · fun_prop
  filter_upwards [] with ω
  have hpoint := exp_le_abs_add_exp_sq (a * X ω)
  have hposExp : 0 < Real.exp (a * X ω) := Real.exp_pos _
  simpa only [Real.norm_eq_abs, abs_of_pos hposExp, abs_mul, mul_pow] using hpoint

/-! A centered local square-MGF bound implies a global linear MGF bound. -/
theorem squareMGFToMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {C : ℝ} (hC : 0 ≤ C)
    (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0)
    (hSquare : SquareMGFLocal μ X C) (lam : ℝ) :
    Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
        Real.exp ((C + 1 / 2) * lam ^ 2) := by
  by_cases hsmall : |lam| ≤ 1
  · have hsq := hSquare.2 lam hsmall
    have hInt := integrable_exp_mul_of_square hSquare.1 hCenter.1 hsq.1
    refine ⟨hInt, ?_⟩
    have hlin : Integrable (fun ω => lam * X ω) μ := hCenter.1.const_mul lam
    have hsum : Integrable (fun ω => lam * X ω +
        Real.exp (lam ^ 2 * X ω ^ 2)) μ := hlin.add hsq.1
    have hmono := MeasureTheory.integral_mono_ae hInt hsum
      (Filter.Eventually.of_forall (fun ω => by
        have hpoint := exp_le_add_exp_sq (lam * X ω)
        convert hpoint using 1 <;> ring))
    calc
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
          ∫ ω, lam * X ω + Real.exp (lam ^ 2 * X ω ^ 2) ∂μ := hmono
      _ = lam * (∫ ω, X ω ∂μ) +
          ∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ := by
            rw [integral_add hlin hsq.1, integral_const_mul]
      _ = ∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ := by
            rw [hCenter.2]
            ring
      _ ≤ Real.exp (C * lam ^ 2) := hsq.2
      _ ≤ Real.exp ((C + 1 / 2) * lam ^ 2) := by
            apply Real.exp_le_exp.mpr
            nlinarith [sq_nonneg lam]
  · have hlam : 1 < |lam| := lt_of_not_ge hsmall
    have hlam2 : 1 ≤ lam ^ 2 := by
      have hsquare := sq_abs lam
      nlinarith
    have hsq := hSquare.2 1 (by norm_num)
    have hInt : Integrable (fun ω => Real.exp (lam * X ω)) μ := by
      have hdom : Integrable (fun ω => Real.exp (lam ^ 2 / 2) *
          Real.exp (X ω ^ 2)) μ := by
        simpa using hsq.1.const_mul (Real.exp (lam ^ 2 / 2))
      refine MeasureTheory.Integrable.mono' hdom
        ((hSquare.1.const_mul lam).exp.aestronglyMeasurable) ?_
      filter_upwards [] with ω
      have hyoung : lam * X ω ≤ lam ^ 2 / 2 + X ω ^ 2 / 2 := by
        nlinarith [sq_nonneg (lam - X ω)]
      have hpos : 0 < Real.exp (lam * X ω) := Real.exp_pos _
      rw [Real.norm_eq_abs, abs_of_pos hpos]
      calc
        Real.exp (lam * X ω) ≤ Real.exp (lam ^ 2 / 2 + X ω ^ 2 / 2) :=
          Real.exp_le_exp.mpr hyoung
        _ = Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2 / 2) := by
          rw [Real.exp_add]
        _ ≤ Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2) := by
          gcongr
          nlinarith [sq_nonneg (X ω)]
    refine ⟨hInt, ?_⟩
    have hdom : Integrable (fun ω => Real.exp (lam ^ 2 / 2) *
        Real.exp (X ω ^ 2)) μ := by
      simpa using hsq.1.const_mul (Real.exp (lam ^ 2 / 2))
    have hmono := MeasureTheory.integral_mono_ae hInt hdom
      (Filter.Eventually.of_forall (fun ω => by
        have hyoung : lam * X ω ≤ lam ^ 2 / 2 + X ω ^ 2 / 2 := by
          nlinarith [sq_nonneg (lam - X ω)]
        calc
          Real.exp (lam * X ω) ≤ Real.exp (lam ^ 2 / 2 + X ω ^ 2 / 2) :=
            Real.exp_le_exp.mpr hyoung
          _ = Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2 / 2) := by
            rw [Real.exp_add]
          _ ≤ Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2) := by
            gcongr
            nlinarith [sq_nonneg (X ω)]))
    calc
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
          ∫ ω, Real.exp (lam ^ 2 / 2) * Real.exp (X ω ^ 2) ∂μ := hmono
      _ = Real.exp (lam ^ 2 / 2) *
          (∫ ω, Real.exp (X ω ^ 2) ∂μ) := by rw [integral_const_mul]
      _ ≤ Real.exp (lam ^ 2 / 2) * Real.exp C := by
        gcongr
        simpa using hsq.2
      _ = Real.exp (lam ^ 2 / 2 + C) := by
        rw [Real.exp_add]
      _ ≤ Real.exp ((C + 1 / 2) * lam ^ 2) := by
        apply Real.exp_le_exp.mpr
        have hprod : 0 ≤ C * (lam ^ 2 - 1) :=
          mul_nonneg hC (sub_nonneg.mpr hlam2)
        nlinarith

end NumStability.HDP.Scalar.SubGaussian

namespace NumStability.HDP.Contract

/-- Stable Chapter 2 alias for the moment-to-square-MGF implication. -/
theorem hdp_02_hlem_hsg_hmoment_hto_hsquare_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hLp : NumStability.HDP.Scalar.SubGaussian.LpMomentGrowth μ X K)
    (lam : ℝ) (hsmall : |lam| ≤ (4 * K)⁻¹) :
    Integrable (fun ω => Real.exp (lam ^ 2 * X ω ^ 2)) μ ∧
      (∫ ω, Real.exp (lam ^ 2 * X ω ^ 2) ∂μ) ≤
        Real.exp (4 * Real.exp 1 * (lam * K) ^ 2) :=
  NumStability.HDP.Scalar.SubGaussian.momentToSquareMGF hK hLp lam hsmall

/-- Stable Chapter 2 alias for the square-MGF-to-MGF implication. -/
theorem hdp_02_hlem_hsg_hsquare_hmgf_hto_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {C : ℝ} (hC : 0 ≤ C)
    (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0)
    (hSquare : NumStability.HDP.Scalar.SubGaussian.SquareMGFLocal μ X C)
    (lam : ℝ) :
    Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
        Real.exp ((C + 1 / 2) * lam ^ 2) :=
  NumStability.HDP.Scalar.SubGaussian.squareMGFToMGF hC hCenter hSquare lam

end NumStability.HDP.Contract
