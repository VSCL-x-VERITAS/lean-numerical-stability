import Mathlib.Analysis.Convex.Function
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.MeasureTheory.Integral.Bochner.Basic
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
open scoped Topology

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
          have hsq : (|lam| * K) ^ 2 = (lam * K) ^ 2 := by
            rw [mul_pow, mul_pow, sq_abs]
          calc
            1 + 2 * (Real.exp 1 * (|lam| * K)) ^ 2 =
                2 * (Real.exp 1 * (|lam| * K)) ^ 2 + 1 := by ring
            _ ≤ Real.exp (2 * (Real.exp 1 * (|lam| * K)) ^ 2) :=
              Real.add_one_le_exp _
            _ = Real.exp (2 * (Real.exp 1 * (lam * K)) ^ 2) := by
              rw [show (Real.exp 1 * (|lam| * K)) ^ 2 =
                (Real.exp 1 * (lam * K)) ^ 2 by
                  rw [mul_pow, mul_pow, sq_abs]
                  ring]

end NumStability.HDP.Scalar.SubExponential

namespace NumStability.HDP.Contract

/-- Stable source-facing alias for the local Orlicz-function interface. -/
def hdp_02_hdef_horlicz_hfunction : Type :=
  NumStability.HDP.Scalar.SubExponential.OrliczFunction

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

end NumStability.HDP.Contract
