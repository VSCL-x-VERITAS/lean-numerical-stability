import Mathlib.Analysis.Convex.Function
import Mathlib.Analysis.Calculus.Taylor
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
import Mathlib.MeasureTheory.Function.L1Space.Integrable
import Mathlib.Probability.Distributions.Exponential
import Mathlib.Probability.Moments.IntegrableExpMul
import NumStability.HDP.ContractSignatures.C_02_hrem_h2_d7_d9
import Mathlib.Tactic

/-!
# Orlicz functions

This module records the source-level Orlicz-function interface from Chapter 2,
Section 2.7.1.  The domain is represented by `ℝ`, with the defining
properties restricted to the nonnegative half-line.
-/

noncomputable section

open Filter Set TopologicalSpace
open MeasureTheory
open ProbabilityTheory
open scoped Topology ENNReal

namespace NumStability.HDP.Scalar.SubExponential

/-- A convex, nondecreasing function with the defining Orlicz properties. -/
structure OrliczFunction where
  toFun : ℝ → ℝ
  nonnegative : ∀ x, 0 ≤ x → 0 ≤ toFun x
  convexOn_nonneg : ConvexOn ℝ (Set.Ici 0) toFun
  monotoneOn_nonneg : MonotoneOn toFun (Set.Ici 0)
  map_zero : toFun 0 = 0
  tendsto_atTop : Tendsto toFun atTop atTop

instance : CoeFun OrliczFunction (fun _ => ℝ → ℝ) :=
  ⟨OrliczFunction.toFun⟩

/-- The Orlicz function separates every positive scale from zero. -/
theorem OrliczFunction.tendsto_scale_separation
    (ψ : OrliczFunction) {δ : ℝ} (hδ : 0 < δ) :
    Tendsto (fun t : ℝ => ψ (δ / t)) (𝓝[>] 0) atTop := by
  have hinv : Tendsto (fun t : ℝ => t⁻¹) (𝓝[>] (0 : ℝ)) atTop :=
    tendsto_inv_nhdsGT_zero
  have hscale : Tendsto (fun t : ℝ => δ / t) (𝓝[>] (0 : ℝ)) atTop := by
    have hmul := hinv.atTop_mul_pos hδ (tendsto_const_nhds :
      Tendsto (fun _ : ℝ => δ) (𝓝[>] (0 : ℝ)) (𝓝 δ))
    simpa [div_eq_mul_inv, mul_comm] using hmul
  exact ψ.tendsto_atTop.comp hscale

/-! The Luxemburg/Orlicz gauge and its a.e. quotient-level space. -/
def orliczIntegral {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) (X : Ω → ℝ) (t : ℝ≥0∞) : ENNReal :=
  ∫⁻ ω, ENNReal.ofReal (ψ (|X ω| / t.toReal)) ∂μ

def orliczAdmissible {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) (X : Ω → ℝ) (t : ℝ≥0∞) : Prop :=
  t ≠ 0 ∧ t ≠ ∞ ∧ orliczIntegral ψ μ X t ≤ 1

noncomputable def orliczGauge {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) (X : Ω → ℝ) : ℝ≥0∞ :=
  sInf {t : ℝ≥0∞ | orliczAdmissible ψ μ X t}

def orliczMember {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) (X : Ω → ℝ) : Prop :=
  orliczGauge ψ μ X < ∞

def orliczRepresentative {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) :=
  {X : Ω → ℝ // AEStronglyMeasurable X μ ∧ orliczMember ψ μ X}

def orliczAESetoid {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) : Setoid (orliczRepresentative ψ μ) where
  r X Y := X.1 =ᵐ[μ] Y.1
  iseqv := ⟨fun _ => Filter.Eventually.of_forall (fun _ => rfl),
    fun h => h.symm, fun h₁ h₂ => h₁.trans h₂⟩

def orliczSpace {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) :=
  Quotient (orliczAESetoid ψ μ)

structure OrliczNormSpaceModelData
    {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) where
  representativeGauge : (Ω → ℝ) → ℝ≥0∞
  representativeGauge_eq : ∀ X, representativeGauge X = orliczGauge ψ μ X
  representativeMember : (Ω → ℝ) → Prop
  representativeMember_iff : ∀ X, representativeMember X ↔ orliczMember ψ μ X
  quotient : Type _
  quotient_eq : quotient = orliczSpace ψ μ

def orliczNormSpaceModel
    {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) : OrliczNormSpaceModelData ψ μ :=
  { representativeGauge := fun X => orliczGauge ψ μ X
    representativeGauge_eq := fun _ => rfl
    representativeMember := fun X => orliczMember ψ μ X
    representativeMember_iff := fun _ => Iff.rfl
    quotient := orliczSpace ψ μ
    quotient_eq := rfl }

lemma orliczAdmissible_smul_iff
    {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) (X : Ω → ℝ)
    {c t : ℝ} (hc : 0 < c) (ht : 0 < t) :
    orliczAdmissible ψ μ X (ENNReal.ofReal t) ↔
      orliczAdmissible ψ μ (fun ω => c * X ω) (ENNReal.ofReal (c * t)) := by
  have ht0 : ENNReal.ofReal t ≠ 0 := (ENNReal.ofReal_ne_zero_iff).2 ht
  have htTop : ENNReal.ofReal t ≠ ∞ := ENNReal.ofReal_ne_top
  have hct0 : ENNReal.ofReal (c * t) ≠ 0 :=
    (ENNReal.ofReal_ne_zero_iff).2 (mul_pos hc ht)
  have hctTop : ENNReal.ofReal (c * t) ≠ ∞ := ENNReal.ofReal_ne_top
  have harg : (fun ω =>
      |c * X ω| / (ENNReal.ofReal (c * t)).toReal) =
      (fun ω => |X ω| / (ENNReal.ofReal t).toReal) := by
    funext ω
    simp only [ENNReal.toReal_ofReal (le_of_lt ht),
      ENNReal.toReal_ofReal (le_of_lt (mul_pos hc ht)), abs_mul, abs_of_pos hc]
    field_simp
  have hInt : orliczIntegral ψ μ (fun ω => c * X ω) (ENNReal.ofReal (c * t)) =
      orliczIntegral ψ μ X (ENNReal.ofReal t) := by
    unfold orliczIntegral
    have hfun : (fun ω => ENNReal.ofReal
        (ψ (|c * X ω| / (ENNReal.ofReal (c * t)).toReal))) =
        (fun ω => ENNReal.ofReal
          (ψ (|X ω| / (ENNReal.ofReal t).toReal))) := by
      funext ω
      rw [congrFun harg ω]
    rw [hfun]
  constructor
  · intro h
    exact ⟨hct0, hctTop, hInt ▸ h.2.2⟩
  · intro h
    exact ⟨ht0, htTop, hInt ▸ h.2.2⟩

lemma orliczIntegral_mono
    {Ω : Type*} [MeasurableSpace Ω]
    (ψ : OrliczFunction) (μ : Measure Ω) {X Y : Ω → ℝ} {t : ℝ≥0∞}
    (hXY : ∀ ω, |X ω| ≤ |Y ω|) (ht0 : t ≠ 0) (htTop : t ≠ ∞) :
    orliczIntegral ψ μ X t ≤ orliczIntegral ψ μ Y t := by
  have htpos : 0 < t.toReal := ENNReal.toReal_pos ht0 htTop
  apply lintegral_mono_ae
  exact Filter.Eventually.of_forall (fun ω => by
    apply ENNReal.ofReal_le_ofReal
    apply ψ.monotoneOn_nonneg
    · exact div_nonneg (abs_nonneg _) htpos.le
    · exact div_nonneg (abs_nonneg _) htpos.le
    · exact div_le_div_of_nonneg_right (hXY ω) htpos.le)

/-! The moment-to-MGF implication from Proposition 2.7.1. -/

/- The root-free integral form of the source's `‖X‖ₚ ≤ K p` hypothesis.  The
real-parameter formulation keeps the statement faithful to the printed
proposition; the proof below specializes it to the integer moments appearing
in the exponential series. -/
def LpMomentGrowth {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (K : ℝ) : Prop :=
  AEMeasurable X μ ∧
    ∀ p : ℝ, 1 ≤ p →
      Integrable (fun ω => |X ω| ^ p) μ ∧
        (∫ ω, |X ω| ^ p ∂μ) ≤ (K * p) ^ p

def absMGFTerm {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (n : ℕ) (ω : Ω) : ENNReal :=
  ENNReal.ofReal (((|lam| * |X ω|) ^ n) / (n.factorial : ℝ))

lemma absMGFTerm_aemeasurable
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ}
    (hX : AEMeasurable X μ) (lam : ℝ) (n : ℕ) :
    AEMeasurable (absMGFTerm X lam n) μ := by
  unfold absMGFTerm
  fun_prop

lemma exp_abs_series (x : ℝ) (hx : 0 ≤ x) :
    ENNReal.ofReal (Real.exp x) =
      ∑' n : ℕ, ENNReal.ofReal (x ^ n / (n.factorial : ℝ)) := by
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity)
    (NormedSpace.expSeries_div_summable x)]
  rw [NormedSpace.expSeries_div_hasSum_exp x |>.tsum_eq]
  rw [← Real.exp_eq_exp_ℝ]

lemma linear_factorial_ratio_bound (n : ℕ) (hn : 1 ≤ n) :
    ((n : ℝ) ^ n) / (n.factorial : ℝ) ≤ (Real.exp 1) ^ n := by
  have hfac := Stirling.le_factorial_stirling n
  have hroot : 1 ≤ Real.sqrt (2 * Real.pi * (n : ℝ)) := by
    rw [Real.one_le_sqrt]
    have hpi : (2 : ℝ) ≤ Real.pi := by
      nlinarith [Real.one_le_pi_div_two]
    have hnpos : (0 : ℝ) < (n : ℝ) := by
      exact_mod_cast (show 0 < n by omega)
    have hn1 : (1 : ℝ) ≤ (n : ℝ) := by exact_mod_cast hn
    have hprod : (1 : ℝ) ≤ Real.pi * n := by
      nlinarith [mul_le_mul_of_nonneg_right hpi (le_of_lt hnpos)]
    nlinarith [hprod]
  have hfac' : (n : ℝ) ^ n / (Real.exp 1) ^ n ≤ (n.factorial : ℝ) := by
    have hfac'' := (le_trans (mul_le_mul_of_nonneg_right hroot
      (by positivity : 0 ≤ ((n : ℝ) / Real.exp 1) ^ n)) hfac)
    simpa [div_pow] using hfac''
  have hmul : (n : ℝ) ^ n ≤ (n.factorial : ℝ) * (Real.exp 1) ^ n := by
    rw [← div_le_iff₀ (by positivity : 0 < (Real.exp 1) ^ n)]
    simpa [div_pow] using hfac'
  exact (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).2
    (by simpa [mul_comm] using hmul)

lemma absMGFTerm_lintegral_le_geom
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ} {K lam : ℝ}
    (hK : 0 ≤ K) (hMom : LpMomentGrowth μ X K) {n : ℕ} (hn : 1 ≤ n) :
    (∫⁻ ω, absMGFTerm X lam n ω ∂μ) ≤
      ENNReal.ofReal ((Real.exp 1 * (|lam| * K)) ^ n) := by
  have hp := hMom.2 (n : ℝ) (by exact_mod_cast hn)
  have hterm :
      absMGFTerm X lam n = fun ω =>
        ENNReal.ofReal ((|lam| ^ n / (n.factorial : ℝ)) * |X ω| ^ n) := by
    funext ω
    unfold absMGFTerm
    congr 1
    rw [mul_pow]
    ring
  rw [hterm]
  have hscalar : 0 ≤ |lam| ^ n / (n.factorial : ℝ) := by positivity
  have hfactor :
      (fun ω => ENNReal.ofReal ((|lam| ^ n / (n.factorial : ℝ)) * |X ω| ^ n)) =
        (fun ω => ENNReal.ofReal (|lam| ^ n / (n.factorial : ℝ)) *
          ENNReal.ofReal (|X ω| ^ n)) := by
    funext ω
    rw [ENNReal.ofReal_mul hscalar]
  rw [hfactor, lintegral_const_mul' _ _ (by simp)]
  have hXpow : (fun ω => |X ω| ^ n) = (fun ω => |X ω| ^ (n : ℝ)) := by
    funext ω
    rw [Real.rpow_natCast]
  have hXpowENN :
      (fun ω => ENNReal.ofReal (|X ω| ^ n)) =
        (fun ω => ENNReal.ofReal (|X ω| ^ (n : ℝ))) := by
    funext ω
    rw [Real.rpow_natCast]
  rw [hXpowENN]
  rw [← ofReal_integral_eq_lintegral_ofReal hp.1
    (Filter.Eventually.of_forall (fun ω => by positivity))]
  have hbound := mul_le_mul_of_nonneg_left hp.2 hscalar
  rw [← ENNReal.ofReal_mul hscalar]
  apply ENNReal.ofReal_le_ofReal
  calc
    |lam| ^ n / (n.factorial : ℝ) *
          (∫ ω, |X ω| ^ (n : ℝ) ∂μ) ≤
        |lam| ^ n / (n.factorial : ℝ) * (K * (n : ℝ)) ^ (n : ℝ) := hbound
    _ = ((|lam| * K) ^ n * (n : ℝ) ^ n) / (n.factorial : ℝ) := by
      rw [Real.rpow_natCast]
      rw [mul_pow]
      ring
    _ ≤ (Real.exp 1 * (|lam| * K)) ^ n := by
      have hratio := linear_factorial_ratio_bound n hn
      have hnonneg : 0 ≤ (|lam| * K) ^ n := by positivity
      apply (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).2
      have hratio' : (n : ℝ) ^ n ≤ (Real.exp 1) ^ n * (n.factorial : ℝ) :=
        (div_le_iff₀ (by positivity : (0 : ℝ) < (n.factorial : ℝ))).mp hratio
      calc
        (|lam| * K) ^ n * (n : ℝ) ^ n ≤
            (|lam| * K) ^ n * ((Real.exp 1) ^ n * (n.factorial : ℝ)) := by
              gcongr
        _ = (Real.exp 1 * (|lam| * K)) ^ n * (n.factorial : ℝ) := by
          rw [mul_pow]
          ring

lemma absMGFTerm_eq
    {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (n : ℕ) (ω : Ω) :
    absMGFTerm X lam n ω =
      ENNReal.ofReal ((|lam| ^ n / (n.factorial : ℝ)) * |X ω| ^ n) := by
  unfold absMGFTerm
  congr 1
  rw [mul_pow]
  ring

lemma exp_abs_integrable
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K lam : ℝ} (hMom : LpMomentGrowth μ X K)
    (hK : 0 < K) (hsmall : |lam| * K ≤ (4 * Real.exp 1)⁻¹) :
    Integrable (fun ω => Real.exp (|lam| * |X ω|)) μ ∧
      (∫ ω, Real.exp (|lam| * |X ω|) ∂μ) ≤
        Real.exp (2 * Real.exp 1 * (|lam| * K)) := by
  let q : ℝ := Real.exp 1 * (|lam| * K)
  have hq0 : 0 ≤ q := by positivity
  have hq : q ≤ 1 / 4 := by
    dsimp [q]
    have hepos : 0 < Real.exp 1 := Real.exp_pos _
    have := mul_le_mul_of_nonneg_left hsmall (le_of_lt hepos)
    field_simp at this ⊢
    nlinarith
  have hqsum : Summable (fun n : ℕ => q ^ n) := by
    exact (hasSum_geometric_of_lt_one hq0
      (lt_of_le_of_lt hq (by norm_num))).summable
  have hterm_sum :
      (∑' n : ℕ, ∫⁻ ω, absMGFTerm X lam n ω ∂μ) ≤
        ∑' n : ℕ, ENNReal.ofReal (q ^ n) := by
    apply ENNReal.tsum_le_tsum
    intro n
    cases n with
    | zero => simp [absMGFTerm]
    | succ n =>
        simpa [q] using
          (absMGFTerm_lintegral_le_geom hK.le hMom (n := n + 1) (by omega))
  have hbound :
      (∫⁻ ω, ENNReal.ofReal (Real.exp (|lam| * |X ω|)) ∂μ) ≤
        ENNReal.ofReal (Real.exp (2 * q)) := by
    calc
      (∫⁻ ω, ENNReal.ofReal (Real.exp (|lam| * |X ω|)) ∂μ) =
          ∫⁻ ω, ∑' n : ℕ, absMGFTerm X lam n ω ∂μ := by
            apply lintegral_congr_ae
            filter_upwards [] with ω
            exact exp_abs_series (|lam| * |X ω|) (by positivity)
      _ = ∑' n : ℕ, ∫⁻ ω, absMGFTerm X lam n ω ∂μ := by
            apply lintegral_tsum
            intro n
            exact absMGFTerm_aemeasurable hMom.1 lam n
      _ ≤ ∑' n : ℕ, ENNReal.ofReal (q ^ n) := hterm_sum
      _ = ENNReal.ofReal (∑' n : ℕ, q ^ n) := by
            symm
            exact ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity) hqsum
      _ ≤ ENNReal.ofReal (Real.exp (2 * q)) := by
            have hsum := (hasSum_geometric_of_lt_one hq0
              (lt_of_le_of_lt hq (by norm_num))).tsum_eq
            rw [hsum]
            have hden : 0 < 1 - q := by linarith
            have hrat : (1 - q)⁻¹ ≤ 1 + 2 * q := by
              rw [inv_eq_one_div]
              apply (div_le_iff₀ hden).2
              nlinarith [mul_nonneg hq0 (sub_nonneg.mpr (by linarith : q ≤ 1 / 2))]
            exact ENNReal.ofReal_le_ofReal
              (hrat.trans (by simpa [add_comm] using Real.add_one_le_exp (2 * q)))
  rcases hMom.1 with ⟨g, hg, hXg⟩
  have hAbs : AEMeasurable (fun ω => |X ω|) μ := by
    apply (hg.norm.aemeasurable.congr ?_)
    filter_upwards [hXg] with ω hω
    simpa [Real.norm_eq_abs, hω]
  have hmeas : AEMeasurable (fun ω => Real.exp (|lam| * |X ω|)) μ := by
    fun_prop
  have hfinite :
      (∫⁻ ω, ‖Real.exp (|lam| * |X ω|)‖ₑ ∂μ) < (⊤ : ENNReal) := by
    have htop : ENNReal.ofReal (Real.exp (2 * q)) < (⊤ : ENNReal) :=
      ENNReal.ofReal_lt_top
    refine lt_of_le_of_lt ?_ htop
    simpa only [← ofReal_norm_eq_enorm, Real.norm_eq_abs,
      abs_of_pos (Real.exp_pos _)] using hbound
  have hInt : Integrable (fun ω => Real.exp (|lam| * |X ω|)) μ :=
    ⟨hmeas.aestronglyMeasurable, (hasFiniteIntegral_iff_enorm).2 hfinite⟩
  refine ⟨hInt, ?_⟩
  have hEq := ofReal_integral_eq_lintegral_ofReal hInt
    (Filter.Eventually.of_forall (fun ω => (Real.exp_pos _).le))
  rw [← hEq] at hbound
  simpa [q, mul_assoc] using
    (ENNReal.ofReal_le_ofReal_iff (Real.exp_nonneg _)).mp hbound

def mgfRemainderTerm {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (n : ℕ) (ω : Ω) : ENNReal :=
  ENNReal.ofReal (((|lam| * |X ω|) ^ (n + 2)) / ((n + 2).factorial : ℝ))

lemma mgfRemainderTerm_aemeasurable
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ}
    (hX : AEMeasurable X μ) (lam : ℝ) (n : ℕ) :
    AEMeasurable (mgfRemainderTerm X lam n) μ := by
  unfold mgfRemainderTerm
  fun_prop

lemma exp_abs_remainder_series (y : ℝ) :
    ENNReal.ofReal (Real.exp |y| - 1 - |y|) =
      ∑' n : ℕ, ENNReal.ofReal ((|y| ^ (n + 2)) / ((n + 2).factorial : ℝ)) := by
  let f : ℕ → ℝ := fun n => |y| ^ n / (n.factorial : ℝ)
  have hsum : Summable f := by
    dsimp [f]
    exact NormedSpace.expSeries_div_summable |y|
  have hsplit := hsum.sum_add_tsum_nat_add 2
  have hexp : (∑' n : ℕ, f n) = Real.exp |y| := by
    dsimp [f]
    rw [Real.exp_eq_exp_ℝ]
    exact (NormedSpace.expSeries_div_hasSum_exp |y|).tsum_eq
  have htail :
      (∑' n : ℕ, |y| ^ (n + 2) / ((n + 2).factorial : ℝ)) =
        Real.exp |y| - 1 - |y| := by
    have hsplit' :
        f 0 + f 1 + ∑' n : ℕ, f (n + 2) = Real.exp |y| := by
      simpa [Finset.sum_range_succ, f, Nat.factorial] using hsplit.trans hexp
    dsimp [f] at hsplit'
    have hpow : |y| ^ 1 = |y| := by simp
    rw [hpow] at hsplit'
    linarith
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity)]
  · rw [htail]
  · have hinj : Function.Injective (fun n : ℕ => n + 2) := by
      intro a b hab
      change a + 2 = b + 2 at hab
      exact Nat.add_right_cancel hab
    simpa [f] using hsum.comp_injective hinj

lemma mgfRemainderTerm_lintegral_le_geom
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω → ℝ} {K lam : ℝ}
    (hK : 0 ≤ K) (hMom : LpMomentGrowth μ X K) (n : ℕ) :
    (∫⁻ ω, mgfRemainderTerm X lam n ω ∂μ) ≤
      ENNReal.ofReal ((Real.exp 1 * (|lam| * K)) ^ (n + 2)) := by
  have h := absMGFTerm_lintegral_le_geom (lam := lam) hK hMom
    (n := n + 2) (by omega)
  simpa [mgfRemainderTerm, absMGFTerm] using h

lemma mgfRemainder_lintegral_le
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K lam : ℝ} (hK : 0 ≤ K)
    (hMom : LpMomentGrowth μ X K)
    (hsmall : |lam| * K ≤ (4 * Real.exp 1)⁻¹) :
    (∫⁻ ω, ENNReal.ofReal (Real.exp (|lam| * |X ω|) - 1 -
      |lam| * |X ω|) ∂μ) ≤
        ENNReal.ofReal (2 * (Real.exp 1 * (|lam| * K)) ^ 2) := by
  let q : ℝ := Real.exp 1 * (|lam| * K)
  have hq0 : 0 ≤ q := by positivity
  have hq : q ≤ 1 / 4 := by
    dsimp [q]
    have hepos : 0 < Real.exp 1 := Real.exp_pos _
    have := mul_le_mul_of_nonneg_left hsmall (le_of_lt hepos)
    field_simp at this ⊢
    nlinarith
  have hqsum : Summable (fun n : ℕ => q ^ (n + 2)) := by
    have hsum := (hasSum_geometric_of_lt_one hq0
      (lt_of_le_of_lt hq (by norm_num))).summable
    have hinj : Function.Injective (fun n : ℕ => n + 2) := by
      intro a b hab
      change a + 2 = b + 2 at hab
      exact Nat.add_right_cancel hab
    simpa using hsum.comp_injective hinj
  have hterm_sum :
      (∑' n : ℕ, ∫⁻ ω, mgfRemainderTerm X lam n ω ∂μ) ≤
        ∑' n : ℕ, ENNReal.ofReal (q ^ (n + 2)) := by
    apply ENNReal.tsum_le_tsum
    intro n
    simpa [q] using mgfRemainderTerm_lintegral_le_geom hK hMom n
  calc
    (∫⁻ ω, ENNReal.ofReal (Real.exp (|lam| * |X ω|) - 1 -
        |lam| * |X ω|) ∂μ) =
        ∫⁻ ω, ∑' n : ℕ, mgfRemainderTerm X lam n ω ∂μ := by
          apply lintegral_congr_ae
          filter_upwards [] with ω
          simpa [abs_mul, mgfRemainderTerm] using exp_abs_remainder_series (lam * X ω)
    _ = ∑' n : ℕ, ∫⁻ ω, mgfRemainderTerm X lam n ω ∂μ := by
          apply lintegral_tsum
          intro n
          exact mgfRemainderTerm_aemeasurable hMom.1 lam n
    _ ≤ ∑' n : ℕ, ENNReal.ofReal (q ^ (n + 2)) := hterm_sum
    _ = ENNReal.ofReal (∑' n : ℕ, q ^ (n + 2)) := by
          symm
          exact ENNReal.ofReal_tsum_of_nonneg (fun n => by positivity) hqsum
    _ = ENNReal.ofReal (q ^ 2 * (1 - q)⁻¹) := by
          congr 1
          have hgeom : Summable (fun n : ℕ => q ^ n) :=
            (hasSum_geometric_of_lt_one hq0
              (lt_of_le_of_lt hq (by norm_num))).summable
          have hsum := (hasSum_geometric_of_lt_one hq0
            (lt_of_le_of_lt hq (by norm_num))).tsum_eq
          have hmul :
              (∑' n : ℕ, q ^ n * q ^ 2) = (∑' n : ℕ, q ^ n) * q ^ 2 := by
            exact hgeom.tsum_mul_right (q ^ 2)
          rw [show (∑' n : ℕ, q ^ (n + 2)) =
              ∑' n : ℕ, q ^ n * q ^ 2 by
                apply tsum_congr
                intro n
                rw [pow_add]]
          rw [hmul, hsum]
          ring
    _ ≤ ENNReal.ofReal (2 * q ^ 2) := by
          apply ENNReal.ofReal_le_ofReal
          have hden : 0 < 1 - q := by linarith
          have hrat : (1 - q)⁻¹ ≤ 2 := by
            rw [inv_eq_one_div]
            apply (div_le_iff₀ hden).2
            linarith
          nlinarith [mul_le_mul_of_nonneg_left hrat (sq_nonneg q)]
    _ = ENNReal.ofReal (2 * (Real.exp 1 * (|lam| * K)) ^ 2) := by
          congr 2

lemma exp_le_centered_remainder (y : ℝ) :
    Real.exp y ≤ 1 + y + (Real.exp |y| - 1 - |y|) := by
  rcases le_total 0 y with hy | hy
  · simp [abs_of_nonneg hy]
  · have hx : 0 ≤ -y := neg_nonneg.mpr hy
    have hs : -y ≤ Real.sinh (-y) := (Real.self_le_sinh_iff).2 hx
    rw [Real.sinh_eq] at hs
    simp only [neg_neg] at hs
    rw [abs_of_nonpos hy]
    linarith

def mgfRemainder {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (ω : Ω) : ℝ :=
  Real.exp (|lam| * |X ω|) - 1 - |lam| * |X ω|

lemma mgfRemainder_nonneg
    {Ω : Type*} (X : Ω → ℝ) (lam : ℝ) (ω : Ω) :
    0 ≤ mgfRemainder X lam ω := by
  unfold mgfRemainder
  have h := Real.add_one_le_exp (|lam| * |X ω|)
  linarith

lemma mgfRemainder_integrable
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {lam : ℝ} (hX : Integrable X μ)
    (hExp : Integrable (fun ω => Real.exp (|lam| * |X ω|)) μ) :
    Integrable (mgfRemainder X lam) μ := by
  have hlin : Integrable (fun ω => |lam| * |X ω|) μ :=
    hX.norm.const_mul |lam|
  simpa [mgfRemainder] using (hExp.sub (integrable_const 1)).sub hlin

/-! If all moments grow linearly, the centered MGF has a quadratic local
bound.  The proof expands the exponential at order two, bounds the absolute
remainder by the linear moment series, and uses the mean-zero hypothesis to
remove the first-order term. -/
theorem momentToMGF
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0)
    (hLp : LpMomentGrowth μ X K) (lam : ℝ)
    (hsmall : |lam| ≤ (4 * Real.exp 1 * K)⁻¹) :
    Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
        Real.exp (2 * (Real.exp 1 * (lam * K)) ^ 2) := by
  have hsmall' : |lam| * K ≤ (4 * Real.exp 1)⁻¹ := by
    calc
      |lam| * K ≤ (4 * Real.exp 1 * K)⁻¹ * K :=
        mul_le_mul_of_nonneg_right hsmall hK.le
      _ = (4 * Real.exp 1)⁻¹ := by field_simp
  have hAbs := exp_abs_integrable hLp hK hsmall'
  have hIntMgf : Integrable (fun ω => Real.exp (lam * X ω)) μ := by
    have hlin := hCenter.1.const_mul lam
    refine MeasureTheory.Integrable.mono' hAbs.1
      (hlin.aemeasurable.exp).aestronglyMeasurable ?_
    filter_upwards [] with ω
    calc
      ‖Real.exp (lam * X ω)‖ = Real.exp (lam * X ω) := by
        rw [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
      _ ≤ Real.exp (|lam| * |X ω|) := by
        apply Real.exp_le_exp.mpr
        simpa [abs_mul] using le_abs_self (lam * X ω)
  have hRInt : Integrable (mgfRemainder X lam) μ :=
    mgfRemainder_integrable hCenter.1 hAbs.1
  have hsum : Integrable (fun ω => 1 + lam * X ω + mgfRemainder X lam ω) μ := by
    exact (integrable_const 1).add (hCenter.1.const_mul lam) |>.add hRInt
  have hmono := MeasureTheory.integral_mono_ae hIntMgf hsum
    (Filter.Eventually.of_forall (fun ω => by
      simpa [mgfRemainder, abs_mul] using exp_le_centered_remainder (lam * X ω)))
  have hRnonneg : ∀ᵐ ω ∂μ, 0 ≤ mgfRemainder X lam ω :=
    Filter.Eventually.of_forall (mgfRemainder_nonneg X lam)
  have hRboundENN := mgfRemainder_lintegral_le hK.le hLp hsmall'
  have hRboundENN' :
      (∫⁻ ω, ENNReal.ofReal (mgfRemainder X lam ω) ∂μ) ≤
        ENNReal.ofReal (2 * (Real.exp 1 * (|lam| * K)) ^ 2) := by
    simpa [mgfRemainder] using hRboundENN
  have hReq := ofReal_integral_eq_lintegral_ofReal hRInt hRnonneg
  rw [← hReq] at hRboundENN'
  have hRbound :
      (∫ ω, mgfRemainder X lam ω ∂μ) ≤
        2 * (Real.exp 1 * (|lam| * K)) ^ 2 := by
    exact (ENNReal.ofReal_le_ofReal_iff (by positivity)).mp hRboundENN'
  refine ⟨hIntMgf, ?_⟩
  calc
    (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
        ∫ ω, 1 + lam * X ω + mgfRemainder X lam ω ∂μ := hmono
    _ = 1 + lam * (∫ ω, X ω ∂μ) +
        ∫ ω, mgfRemainder X lam ω ∂μ := by
          calc
            (∫ ω, 1 + lam * X ω + mgfRemainder X lam ω ∂μ) =
                (∫ ω, 1 + lam * X ω ∂μ) +
                  ∫ ω, mgfRemainder X lam ω ∂μ := by
                    exact integral_add ((integrable_const 1).add
                      (hCenter.1.const_mul lam)) hRInt
            _ = 1 + lam * (∫ ω, X ω ∂μ) +
                  ∫ ω, mgfRemainder X lam ω ∂μ := by
                    rw [integral_add (integrable_const 1)
                      (hCenter.1.const_mul lam), integral_const, integral_const_mul]
                    simp
    _ = 1 + ∫ ω, mgfRemainder X lam ω ∂μ := by rw [hCenter.2]; ring
    _ ≤ 1 + 2 * (Real.exp 1 * (|lam| * K)) ^ 2 := by gcongr
    _ ≤ Real.exp (2 * (Real.exp 1 * (lam * K)) ^ 2) := by
      calc
        1 + 2 * (Real.exp 1 * (|lam| * K)) ^ 2 =
            2 * (Real.exp 1 * (|lam| * K)) ^ 2 + 1 := by ring
        _ ≤ Real.exp (2 * (Real.exp 1 * (|lam| * K)) ^ 2) :=
          Real.add_one_le_exp _
        _ = Real.exp (2 * (Real.exp 1 * (lam * K)) ^ 2) := by
          congr 2
          rw [mul_pow, mul_pow, sq_abs]
          ring

/-! The endpoint MGF hypothesis used for the reverse implication. -/
def TwoSidedMGFBound {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (K C : ℝ) : Prop :=
  AEMeasurable X μ ∧
    (Integrable (fun ω => Real.exp (X ω / K)) μ ∧
      (∫ ω, Real.exp (X ω / K) ∂μ) ≤ Real.exp C) ∧
    (Integrable (fun ω => Real.exp (-X ω / K)) μ ∧
      (∫ ω, Real.exp (-X ω / K) ∂μ) ≤ Real.exp C)

lemma rpow_le_exp_mul
    {y p : ℝ} (hy : 0 ≤ y) (hp : 1 ≤ p) :
    y ^ p ≤ p ^ p * Real.exp y := by
  have hp0 : 0 < p := lt_of_lt_of_le (by norm_num) hp
  rcases eq_or_lt_of_le hy with rfl | hy
  · simp [hp0.ne']
    positivity
  have hlog := Real.log_le_sub_one_of_pos (div_pos hy hp0)
  rw [Real.log_div hy.ne' hp0.ne'] at hlog
  have hmul := mul_le_mul_of_nonneg_left hlog hp0.le
  have hlogbound : Real.log y * p ≤ Real.log p * p + y := by
    calc
      Real.log y * p = p * (Real.log y - Real.log p) + p * Real.log p := by ring
      _ ≤ p * (y / p - 1) + p * Real.log p :=
        by simpa [add_comm] using add_le_add_right hmul (p * Real.log p)
      _ = y - p + Real.log p * p := by field_simp
      _ ≤ Real.log p * p + y := by nlinarith
  calc
    y ^ p = Real.exp (Real.log y * p) := by
      rw [Real.rpow_def_of_pos hy p]
    _ ≤ Real.exp (Real.log p * p + y) := Real.exp_le_exp.mpr hlogbound
    _ = p ^ p * Real.exp y := by
      rw [Real.rpow_def_of_pos hp0 p, Real.exp_add]

/-! The reverse implication in Proposition 2.7.1.  The endpoint MGF bound
controls the exponential of the absolute value, and the elementary estimate
`|x|^p ≤ p^p exp |x|` then gives every real moment. -/
theorem mgfToMoment
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K C : ℝ} (hK : 0 < K) (hC : 0 ≤ C)
    (hMGF : TwoSidedMGFBound μ X K C) :
    LpMomentGrowth μ X (2 * Real.exp C * K) := by
  rcases hMGF with ⟨hX, hPlus, hMinus⟩
  have hPlus' : Integrable (fun ω => Real.exp (K⁻¹ * X ω)) μ := by
    simpa [div_eq_mul_inv, mul_comm] using hPlus.1
  have hMinus' : Integrable (fun ω => Real.exp (-(K⁻¹) * X ω)) μ := by
    simpa [div_eq_mul_inv, mul_comm] using hMinus.1
  have ht : K⁻¹ ≠ 0 := inv_ne_zero hK.ne'
  have hAbsExp : Integrable (fun ω => Real.exp (|X ω| / K)) μ := by
    convert ProbabilityTheory.integrable_exp_abs_mul_abs
      (X := X) (μ := μ) (t := K⁻¹) hPlus' hMinus' using 1
    funext ω
    congr 1
    rw [abs_of_pos (inv_pos.mpr hK)]
    ring
  have hSumExp : Integrable
      (fun ω => Real.exp (X ω / K) + Real.exp (-X ω / K)) μ :=
    hPlus.1.add hMinus.1
  have hAbsExp_le : ∀ ω, Real.exp (|X ω| / K) ≤
      Real.exp (X ω / K) + Real.exp (-X ω / K) := by
    intro ω
    by_cases hω : 0 ≤ X ω
    · rw [abs_of_nonneg hω]
      exact le_add_of_nonneg_right (Real.exp_nonneg _)
    · rw [abs_of_neg (lt_of_not_ge hω)]
      exact le_add_of_nonneg_left (Real.exp_nonneg _)
  refine ⟨hX, ?_⟩
  intro p hp
  have hp0 : 0 < p := lt_of_lt_of_le (by norm_num) hp
  have hIntMoment : Integrable (fun ω => |X ω| ^ p) μ :=
    ProbabilityTheory.integrable_rpow_abs_of_integrable_exp_mul
      (X := X) (μ := μ) ht hPlus' hMinus' hp0.le
  have hPoint : ∀ ω, |X ω| ^ p ≤
      (K * p) ^ p * (Real.exp (X ω / K) + Real.exp (-X ω / K)) := by
    intro ω
    have hscaled : |X ω| = K * (|X ω| / K) := by field_simp
    have hpow := rpow_le_exp_mul (y := |X ω| / K) (by positivity) hp
    have hexp := hAbsExp_le ω
    calc
      |X ω| ^ p = (K * (|X ω| / K)) ^ p := by
        exact congrArg (fun z : ℝ => z ^ p) hscaled
      _ = K ^ p * (|X ω| / K) ^ p := by
        rw [Real.mul_rpow hK.le (by positivity)]
      _ ≤ K ^ p * (p ^ p * Real.exp (|X ω| / K)) := by
        gcongr
      _ ≤ K ^ p * (p ^ p *
          (Real.exp (X ω / K) + Real.exp (-X ω / K))) := by
        gcongr
      _ = (K * p) ^ p *
          (Real.exp (X ω / K) + Real.exp (-X ω / K)) := by
        rw [Real.mul_rpow hK.le hp0.le]
        ring
  have hDom : Integrable
      (fun ω => (K * p) ^ p *
        (Real.exp (X ω / K) + Real.exp (-X ω / K))) μ :=
    hSumExp.const_mul _
  have hIntegral := MeasureTheory.integral_mono_ae hIntMoment hDom
    (Filter.Eventually.of_forall hPoint)
  have hIntegral' :
      (∫ ω, |X ω| ^ p ∂μ) ≤ (K * p) ^ p * (2 * Real.exp C) := by
    calc
      (∫ ω, |X ω| ^ p ∂μ) ≤
          ∫ ω, (K * p) ^ p *
            (Real.exp (X ω / K) + Real.exp (-X ω / K)) ∂μ := hIntegral
      _ = (K * p) ^ p *
          (∫ ω, Real.exp (X ω / K) + Real.exp (-X ω / K) ∂μ) :=
        MeasureTheory.integral_const_mul _ _
      _ = (K * p) ^ p *
          ((∫ ω, Real.exp (X ω / K) ∂μ) +
            (∫ ω, Real.exp (-X ω / K) ∂μ)) := by
        rw [MeasureTheory.integral_add hPlus.1 hMinus.1]
      _ ≤ (K * p) ^ p * (2 * Real.exp C) := by
        gcongr
        exact (add_le_add hPlus.2 hMinus.2).trans
          (by simp [two_mul])
  have hA : 1 ≤ 2 * Real.exp C := by
    have := Real.one_le_exp hC
    nlinarith
  have hA' : 2 * Real.exp C ≤ (2 * Real.exp C) ^ p := by
    simpa [Real.rpow_one] using
      Real.rpow_le_rpow_of_exponent_le hA hp
  refine ⟨hIntMoment, ?_⟩
  calc
    (∫ ω, |X ω| ^ p ∂μ) ≤ (K * p) ^ p * (2 * Real.exp C) := hIntegral'
    _ ≤ (K * p) ^ p * (2 * Real.exp C) ^ p := by
      exact mul_le_mul_of_nonneg_left hA' (by positivity)
    _ = (2 * Real.exp C * K * p) ^ p := by
      rw [← Real.mul_rpow (by positivity) (by positivity)]
      ring

/-! Remark 2.7.9: a bounded centered unit-variance witness and the domain of the
rate-one exponential MGF.  The symmetric two-point law makes the local Taylor
calculation exact, while the exponential-law calculation is kept in extended
measure form through its density. -/

def remark279Law : Measure ℝ :=
  (1 / 2 : ENNReal) • Measure.dirac (-1) +
    (1 / 2 : ENNReal) • Measure.dirac 1

lemma remark279Law_probability : IsProbabilityMeasure remark279Law := by
  apply isProbabilityMeasure_iff.mpr
  simp [remark279Law, ENNReal.div_eq_inv_mul]
  calc
    (2 : ENNReal)⁻¹ + 2⁻¹ = (2 : ENNReal)⁻¹ + (2 : ENNReal)⁻¹ * 1 := by
      ring
    _ = (2 : ENNReal)⁻¹ * (1 + 1) := by ring
    _ = (2 : ENNReal)⁻¹ * 2 := by norm_num
    _ = 1 := by exact ENNReal.inv_mul_cancel (by norm_num) (by norm_num)

lemma remark279Law_integral (f : ℝ → ℝ) :
    ∫ x, f x ∂remark279Law =
      (1 / 2 : ℝ) * f (-1) + (1 / 2 : ℝ) * f 1 := by
  rw [remark279Law, MeasureTheory.integral_add_measure]
  · rw [MeasureTheory.integral_smul_measure, MeasureTheory.integral_smul_measure,
      MeasureTheory.integral_dirac, MeasureTheory.integral_dirac]
    norm_num
  · apply Integrable.smul_measure
    · exact integrable_dirac (by simp)
    · simp [ENNReal.div_eq_inv_mul]
  · apply Integrable.smul_measure
    · exact integrable_dirac (by simp)
    · simp [ENNReal.div_eq_inv_mul]

lemma remark279_mean :
    (∫ x, x ∂remark279Law) = 0 := by
  rw [remark279Law_integral]
  norm_num

lemma remark279_second_moment :
    (∫ x, x ^ 2 ∂remark279Law) = 1 := by
  rw [remark279Law_integral]
  norm_num

set_option maxRecDepth 10000 in
lemma cosh_local_taylor :
    (fun x : ℝ => Real.cosh x - 1 - x ^ 2 / 2) =o[𝓝 (0 : ℝ)]
      (fun x : ℝ => x ^ 2) := by
  have hc0 : iteratedDeriv 0 Real.cosh 0 = 1 := by
    simp [iteratedDeriv]
  have hc1 : iteratedDeriv 1 Real.cosh 0 = 0 := by
    rw [iteratedDeriv_one, Real.deriv_cosh]
    simp
  have hc2 : iteratedDeriv 2 Real.cosh 0 = 1 := by
    rw [show (2 : ℕ) = 1 + 1 by norm_num, iteratedDeriv_succ,
      iteratedDeriv_one, Real.deriv_cosh, Real.deriv_sinh]
    simp
  have h := Real.taylor_tendsto (f := Real.cosh) (n := 2) (s := Set.univ)
    convex_univ (mem_univ (0 : ℝ)) Real.contDiff_cosh.contDiffOn
  rw [Asymptotics.isLittleO_iff_tendsto]
  · convert h using 1
    · funext x
      simp [taylorWithinEval, taylorWithin, taylorCoeffWithin,
        Finset.sum_range_succ, hc0, hc1, hc2,
        div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] <;>
        ring_nf <;> simp
    · rw [nhdsWithin_univ]
  · simp

lemma remark279_local_taylor :
    (fun lam : ℝ =>
      (∫ x, Real.exp (lam * x) ∂remark279Law) - 1 -
        lam * (∫ x, x ∂remark279Law) -
        lam ^ 2 / 2 * (∫ x, x ^ 2 ∂remark279Law)) =o[𝓝 (0 : ℝ)]
      (fun lam : ℝ => lam ^ 2) := by
  have hcosh := cosh_local_taylor
  convert hcosh using 1
  funext lam
  rw [remark279Law_integral, remark279_mean, remark279_second_moment]
  rw [Real.cosh_eq]
  ring

private lemma remark279_exp_pdf_measurable :
    Measurable (ProbabilityTheory.exponentialPDF 1) := by
  unfold ProbabilityTheory.exponentialPDF
  exact (ProbabilityTheory.measurable_exponentialPDFReal 1).ennreal_ofReal

lemma remark279_exp_mgf_lt_one {lam : ℝ} (hl : lam < 1) :
    Integrable (fun x : ℝ => Real.exp (lam * x)) (expMeasure 1) ∧
      (∫ x, Real.exp (lam * x) ∂(expMeasure 1)) = (1 - lam)⁻¹ := by
  have hpdf := remark279_exp_pdf_measurable
  have hIntBase : Integrable
      (fun x : ℝ => Real.exp (lam * x) *
        (ProbabilityTheory.exponentialPDF 1 x).toReal) volume := by
    have heq : (fun x : ℝ => Real.exp (lam * x) *
        (ProbabilityTheory.exponentialPDF 1 x).toReal) =
        (fun x : ℝ => if 0 ≤ x then Real.exp ((lam - 1) * x) else 0) := by
      funext x
      by_cases hx : 0 ≤ x
      · simp [ProbabilityTheory.exponentialPDF,
          ProbabilityTheory.exponentialPDFReal, ProbabilityTheory.gammaPDFReal,
          hx]
        rw [ENNReal.toReal_ofReal (le_of_lt (Real.exp_pos (-x)))]
        rw [← Real.exp_add]
        congr 1
        ring
      · simp [ProbabilityTheory.exponentialPDF,
          ProbabilityTheory.exponentialPDFReal, ProbabilityTheory.gammaPDFReal,
          hx]
    rw [heq]
    let g : ℝ → ℝ := fun x => Real.exp ((lam - 1) * x)
    have hIoi : IntegrableOn g (Ioi (0 : ℝ)) volume :=
      integrableOn_exp_mul_Ioi (by linarith) 0
    have hIci : IntegrableOn g (Ici (0 : ℝ)) volume :=
      (integrableOn_Ici_iff_integrableOn_Ioi).2 hIoi
    have hInd : Integrable ((Ici (0 : ℝ)).indicator g) volume :=
      hIci.integrable_indicator measurableSet_Ici
    simpa [g, Set.indicator, mem_setOf_eq] using hInd
  have hInt : Integrable (fun x : ℝ => Real.exp (lam * x)) (expMeasure 1) := by
    change Integrable (fun x : ℝ => Real.exp (lam * x))
      (volume.withDensity (ProbabilityTheory.exponentialPDF 1))
    rw [integrable_withDensity_iff hpdf
      (by filter_upwards [] with x; exact ENNReal.coe_lt_top)]
    simpa [smul_eq_mul] using hIntBase
  refine ⟨hInt, ?_⟩
  change (∫ x, Real.exp (lam * x) ∂volume.withDensity
      (ProbabilityTheory.exponentialPDF 1)) = (1 - lam)⁻¹
  rw [integral_withDensity_eq_integral_toReal_smul hpdf
      (by filter_upwards [] with x; exact ENNReal.coe_lt_top)]
  simp_rw [smul_eq_mul]
  have heq2 : (fun x : ℝ => (ProbabilityTheory.exponentialPDF 1 x).toReal *
      Real.exp (lam * x)) =
      (Ici (0 : ℝ)).indicator (fun x : ℝ => Real.exp ((lam - 1) * x)) := by
    funext x
    by_cases hx : 0 ≤ x
    · simp [ProbabilityTheory.exponentialPDF,
        ProbabilityTheory.exponentialPDFReal, ProbabilityTheory.gammaPDFReal,
        hx]
      rw [ENNReal.toReal_ofReal (le_of_lt (Real.exp_pos (-x)))]
      rw [← Real.exp_add]
      congr 1
      ring
    · simp [ProbabilityTheory.exponentialPDF,
        ProbabilityTheory.exponentialPDFReal, ProbabilityTheory.gammaPDFReal,
        hx]
  rw [heq2, integral_indicator measurableSet_Ici, integral_Ici_eq_integral_Ioi]
  rw [integral_exp_mul_Ioi (by linarith) 0]
  simp
  rw [show lam - 1 = -(1 - lam) by ring]
  have hne : 1 - lam ≠ 0 := by linarith
  field_simp [hne]

lemma remark279_exp_mgf_not_integrable {lam : ℝ} (hl : 1 ≤ lam) :
    ¬ Integrable (fun x : ℝ => Real.exp (lam * x)) (expMeasure 1) := by
  intro h
  have hpdf := remark279_exp_pdf_measurable
  have hbase : Integrable
      (fun x : ℝ => Real.exp (lam * x) *
        (ProbabilityTheory.exponentialPDF 1 x).toReal) volume := by
    change Integrable (fun x : ℝ => Real.exp (lam * x))
      (volume.withDensity (ProbabilityTheory.exponentialPDF 1)) at h
    exact (integrable_withDensity_iff hpdf
      (by filter_upwards [] with x; exact ENNReal.coe_lt_top)).1 h
  have hprod : IntegrableOn
      (fun x : ℝ => Real.exp (lam * x) *
        (ProbabilityTheory.exponentialPDF 1 x).toReal) (Ioi (0 : ℝ)) volume :=
    hbase.integrableOn
  have hexp : IntegrableOn (fun x : ℝ => Real.exp ((lam - 1) * x))
      (Ioi (0 : ℝ)) volume := by
    apply hprod.congr_fun
    · intro x hx
      have hx0 : 0 ≤ x := le_of_lt hx
      simp [ProbabilityTheory.exponentialPDF,
        ProbabilityTheory.exponentialPDFReal, ProbabilityTheory.gammaPDFReal,
        hx0]
      rw [ENNReal.toReal_ofReal (le_of_lt (Real.exp_pos (-x)))]
      rw [← Real.exp_add]
      congr 1
      ring
    · exact measurableSet_Ioi
  have hconst : IntegrableOn (fun _ : ℝ => (1 : ℝ)) (Ioi (0 : ℝ)) volume := by
    apply hexp.integrable.mono'
    · fun_prop
    · filter_upwards [self_mem_ae_restrict measurableSet_Ioi] with x hx
      rw [Real.norm_eq_abs, abs_one]
      exact Real.one_le_exp (mul_nonneg (sub_nonneg.mpr hl) (le_of_lt hx))
  exact not_integrableOn_Ioi_rpow 0 (by simpa using hconst)

theorem remark279_contract :
    NumStability.HDP.Contract.hdp_02_hrem_h2_d7_d9__contract_type := by
  refine ⟨remark279Law, (fun x : ℝ => x), remark279Law_probability, ?_⟩
  constructor
  · rfl
  constructor
  · rfl
  constructor
  · simpa using remark279_mean
  constructor
  · simpa using remark279_second_moment
  constructor
  · simpa using remark279_local_taylor
  constructor
  · intro lam
    exact remark279_exp_mgf_lt_one
  · intro lam
    exact remark279_exp_mgf_not_integrable

end NumStability.HDP.Scalar.SubExponential

namespace NumStability.HDP.Contract

/-- Stable source-facing alias for the local Orlicz-function interface. -/
def hdp_02_hdef_horlicz_hfunction : Type :=
  NumStability.HDP.Scalar.SubExponential.OrliczFunction

/-! Stable source-facing alias for the Luxemburg/Orlicz norm-space model. -/
def hdp_02_hdef_horlicz_hnorm_hspace
    {Ω : Type*} [MeasurableSpace Ω]
    (ψ : NumStability.HDP.Scalar.SubExponential.OrliczFunction)
    (μ : Measure Ω) :
    NumStability.HDP.Scalar.SubExponential.OrliczNormSpaceModelData ψ μ :=
  NumStability.HDP.Scalar.SubExponential.orliczNormSpaceModel ψ μ

/-- Stable Chapter 2 alias for the centered moment-to-MGF implication. -/
theorem hdp_02_hlem_hse_hmoment_hto_hmgf
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K : ℝ} (hK : 0 < K)
    (hCenter : Integrable X μ ∧ (∫ ω, X ω ∂μ) = 0)
    (hLp : NumStability.HDP.Scalar.SubExponential.LpMomentGrowth μ X K)
    (lam : ℝ) (hsmall : |lam| ≤ (4 * Real.exp 1 * K)⁻¹) :
    Integrable (fun ω => Real.exp (lam * X ω)) μ ∧
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
        Real.exp (2 * (Real.exp 1 * (lam * K)) ^ 2) :=
  NumStability.HDP.Scalar.SubExponential.momentToMGF hK hCenter hLp lam hsmall

/-- Stable Chapter 2 alias for the endpoint-MGF-to-moment implication. -/
theorem hdp_02_hlem_hse_hmgf_hto_hmoment
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω → ℝ} {K C : ℝ} (hK : 0 < K) (hC : 0 ≤ C)
    (hMGF : NumStability.HDP.Scalar.SubExponential.TwoSidedMGFBound μ X K C) :
    NumStability.HDP.Scalar.SubExponential.LpMomentGrowth μ X
      (2 * Real.exp C * K) :=
  NumStability.HDP.Scalar.SubExponential.mgfToMoment hK hC hMGF

/-! Stable Chapter 2 alias for Remark 2.7.9. -/
theorem hdp_02_hrem_h2_d7_d9 : hdp_02_hrem_h2_d7_d9__contract_type := by
  exact NumStability.HDP.Scalar.SubExponential.remark279_contract

end NumStability.HDP.Contract
