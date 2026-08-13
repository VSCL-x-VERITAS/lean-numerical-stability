import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.Tactic
import NumStability.HDP.Contracts.C_02_hlem_hexponential_hmarkov
import NumStability.HDP.Contracts.C_02_hlem_hmgf_hindependent_hsum

namespace NumStability.HDP.Scalar.Bernstein

open MeasureTheory
open ProbabilityTheory
open scoped BigOperators

universe u v

/-- Changing one coordinate of a dependent product changes `f` by at most `c`. -/
def coordinateSensitivity {ι : Type*} [DecidableEq ι] {X : ι → Type*}
    (f : (∀ i, X i) → ℝ) (i : ι) (c : ℝ) : Prop :=
  ∀ x (z : X i), ‖f (Function.update x i z) - f x‖ ≤ c

/-- The finite-coordinate bounded-differences condition. -/
def boundedDifferences {ι : Type*} [Fintype ι] [DecidableEq ι] {X : ι → Type*}
    (f : (∀ i, X i) → ℝ) (c : ι → ℝ) : Prop :=
  ∀ i, 0 ≤ c i ∧ coordinateSensitivity f i (c i)

/-- Bennett's scalar rate function. -/
noncomputable def bennettH (u : ℝ) : ℝ := (1 + u) * Real.log (1 + u) - u

/-- Certified small- and large-regime bounds for Bennett's rate function. -/
theorem bennettH_bounds {u : ℝ} (hu : 0 ≤ u) (hu1 : u ≤ 1) :
    u ^ 2 / 3 ≤ bennettH u ∧ bennettH u ≤ u ^ 2 := by
  have hpos : 0 < 1 + u := by linarith
  have hden : 0 < u + 2 := by linarith
  have hlog_lower : 2 * u / (u + 2) ≤ Real.log (1 + u) :=
    Real.le_log_one_add_of_nonneg hu
  have hlog_upper : Real.log (1 + u) ≤ u := by
    simpa [sub_eq_add_neg] using Real.log_le_sub_one_of_pos hpos
  have hmul_lower := mul_le_mul_of_nonneg_left hlog_lower (by linarith : 0 ≤ 1 + u)
  have hmul_upper := mul_le_mul_of_nonneg_left hlog_upper (by linarith : 0 ≤ 1 + u)
  have hlower : u ^ 2 / (u + 2) ≤ bennettH u := by
    dsimp [bennettH]
    calc
      u ^ 2 / (u + 2) = (1 + u) * (2 * u / (u + 2)) - u := by
        field_simp
        ring
      _ ≤ (1 + u) * Real.log (1 + u) - u := by linarith
  have hthird : u ^ 2 / 3 ≤ u ^ 2 / (u + 2) := by
    apply (le_div_iff₀ hden).2
    nlinarith [sq_nonneg u]
  have hupper : bennettH u ≤ u ^ 2 := by
    dsimp [bennettH]
    nlinarith
  exact ⟨hthird.trans hlower, hupper⟩

theorem bennettH_large_lower {u : ℝ} (hu : Real.exp 2 ≤ u) :
    (u / 2) * Real.log u ≤ bennettH u := by
  have hu0 : 0 ≤ u := le_trans (le_of_lt (Real.exp_pos 2)) hu
  have hu_pos : 0 < u := lt_of_lt_of_le (Real.exp_pos 2) hu
  have hlog : 2 ≤ Real.log u := (Real.le_log_iff_exp_le hu_pos).2 hu
  have hlog_mono : Real.log u ≤ Real.log (1 + u) :=
    (Real.log_le_log_iff hu_pos (by linarith)).2 (by linarith)
  have hmul_log := mul_le_mul_of_nonneg_left hlog_mono hu0
  have hmul_two := mul_le_mul_of_nonneg_left hlog hu0
  dsimp [bennettH]
  nlinarith

theorem bennettHInterface :
    ∀ u : ℝ, 0 ≤ u →
      bennettH u = (1 + u) * Real.log (1 + u) - u ∧
      (u ≤ 1 → u ^ 2 / 3 ≤ bennettH u ∧ bennettH u ≤ u ^ 2) ∧
      (Real.exp 2 ≤ u → (u / 2) * Real.log u ≤ bennettH u) := by
  intro u hu
  refine ⟨rfl, ?_, ?_⟩
  · intro hu1
    exact bennettH_bounds hu hu1
  · intro hu2
    exact bennettH_large_lower hu2

/-- Bernstein's bounded-MGF conclusion, with the measure-theoretic analytic
engine left explicit so integrability and the exponential remainder estimate
are part of the contract rather than hidden assumptions. -/
def boundedBernsteinMgfStatement : Prop :=
  ∀ {Ω : Type} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) (X : Ω → ℝ) (K lam σ2 : ℝ),
    (∀ᵐ ω ∂μ, |X ω| ≤ K) →
      (∫ ω, X ω ∂μ) = 0 → 0 ≤ σ2 → 0 < K → |lam| < 3 / K →
      (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
        Real.exp (((lam ^ 2 / 2) / (1 - |lam| * K / 3)) * σ2)

theorem boundedBernsteinMgfBound
    (hEngine : boundedBernsteinMgfStatement) {Ω : Type} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) (X : Ω → ℝ) (K lam σ2 : ℝ)
    (hBound : ∀ᵐ ω ∂μ, |X ω| ≤ K)
    (hMean : (∫ ω, X ω ∂μ) = 0) (hσ : 0 ≤ σ2) (hK : 0 < K)
    (hlam : |lam| < 3 / K) :
    (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
      Real.exp (((lam ^ 2 / 2) / (1 - |lam| * K / 3)) * σ2) :=
  hEngine (Ω := Ω) μ X K lam σ2 hBound hMean hσ hK hlam

/-! The reusable Chernoff envelope behind the Bernstein pipeline.  The
individual MGF hypotheses are kept explicit: the tensorization contract and
the exponential-Markov contract are both used at the exact source-facing
strength, while the aggregate integrability hypotheses make the real-valued
Markov statement executable without hidden finiteness assumptions. -/
theorem bernsteinChernoffEnvelope
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (b : ι → ℝ)
    (C c B σ2 : ℝ)
    (hX : iIndepFun X μ)
    (hMgf : ∀ (lam : ℝ), |lam| ≤ c / B →
      ∀ i, (∫ ω, Real.exp (lam * X i ω) ∂μ) ≤
        Real.exp (C * lam ^ 2 * (b i) ^ 2))
    (hExp : ∀ (lam : ℝ), |lam| ≤ c / B →
      ∀ i, Integrable (fun ω => Real.exp (lam * X i ω)) μ)
    (hSumExp : ∀ (lam : ℝ), |lam| ≤ c / B →
      Integrable (fun ω => Real.exp (lam * ∑ i, X i ω)) μ)
    (hSumMeas : Measurable (fun ω => ∑ i, X i ω))
    (hσ : σ2 = ∑ i, (b i) ^ 2)
    {lam t : ℝ} (hlam : 0 < lam) (hrange : |lam| ≤ c / B) :
    μ.real ((fun ω => ∑ i, X i ω) ⁻¹' Set.Ici t) ≤
      Real.exp (-lam * t + C * lam ^ 2 * σ2) := by
  have hneg : |(-lam)| ≤ c / B := by simpa [abs_neg] using hrange
  have htensor :=
    NumStability.HDP.Contract.hdp_02_hlem_hmgf_hindependent_hsum
      (μ := μ) (X := X) lam (fun _ => (1 : ℝ)) hX (by
        intro i
        simpa using hExp lam hrange i)
  have hprod :
      (∏ i, ∫ ω, Real.exp (lam * (1 * X i ω)) ∂μ) ≤
        ∏ i, Real.exp (C * lam ^ 2 * (b i) ^ 2) := by
    apply Finset.prod_le_prod
    · intro i hi
      exact integral_nonneg (fun ω => (Real.exp_pos _).le)
    · intro i hi
      simpa using hMgf lam hrange i
  have hsum :
      (∫ ω, Real.exp (lam * ∑ i, X i ω) ∂μ) ≤
        Real.exp (C * lam ^ 2 * σ2) := by
    calc
      (∫ ω, Real.exp (lam * ∑ i, X i ω) ∂μ) =
          ∏ i, ∫ ω, Real.exp (lam * (1 * X i ω)) ∂μ := by
            simpa using htensor
      _ ≤ ∏ i, Real.exp (C * lam ^ 2 * (b i) ^ 2) := hprod
      _ = Real.exp (C * lam ^ 2 * σ2) := by
        rw [← Real.exp_sum]
        congr 1
        rw [hσ]
        rw [Finset.mul_sum]
  have hmarkov :=
    NumStability.HDP.Contract.hdp_02_hlem_hexponential_hmarkov
      (μ := μ) (t := t) hSumMeas hlam (hSumExp lam hrange)
      (by simpa [mul_neg, neg_mul] using hSumExp (-lam) hneg)
  calc
    μ.real ((fun ω => ∑ i, X i ω) ⁻¹' Set.Ici t) ≤
        Real.exp (-(lam * t)) *
          (∫ ω, Real.exp (lam * ∑ i, X i ω) ∂μ) := hmarkov.1
    _ ≤ Real.exp (-(lam * t)) * Real.exp (C * lam ^ 2 * σ2) := by
      exact mul_le_mul_of_nonneg_left hsum (Real.exp_pos _).le
    _ = Real.exp (-lam * t + C * lam ^ 2 * σ2) := by
      rw [← Real.exp_add]
      congr 1
      ring

/-! Optimized Bernstein form.  `hOptimize` is the checked optimizer witness;
it makes the zero cases (`σ² = 0` or `B = 0`) explicit at the call site and
keeps the main theorem free of unsafe division-by-zero conventions. -/
theorem bernsteinMgfPipeline
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (b : ι → ℝ)
    (C c B σ2 κ : ℝ)
    (hX : iIndepFun X μ)
    (hMgf : ∀ (lam : ℝ), |lam| ≤ c / B →
      ∀ i, (∫ ω, Real.exp (lam * X i ω) ∂μ) ≤
        Real.exp (C * lam ^ 2 * (b i) ^ 2))
    (hExp : ∀ (lam : ℝ), |lam| ≤ c / B →
      ∀ i, Integrable (fun ω => Real.exp (lam * X i ω)) μ)
    (hSumExp : ∀ (lam : ℝ), |lam| ≤ c / B →
      Integrable (fun ω => Real.exp (lam * ∑ i, X i ω)) μ)
    (hSumMeas : Measurable (fun ω => ∑ i, X i ω))
    (hσ : σ2 = ∑ i, (b i) ^ 2)
    (hOptimize : ∀ t : ℝ, 0 < t →
      ∃ lam : ℝ, 0 < lam ∧ |lam| ≤ c / B ∧
        κ * min (t ^ 2 / σ2) (t / B) + C * lam ^ 2 * σ2 ≤ lam * t) :
    ∀ t : ℝ, 0 ≤ t →
      μ.real ((fun ω => ∑ i, X i ω) ⁻¹' Set.Ici t) ≤
        Real.exp (-κ * min (t ^ 2 / σ2) (t / B)) := by
  intro t ht
  by_cases ht0 : t = 0
  · subst t
    simpa using (measureReal_le_one (μ := μ) (s :=
      (fun ω => ∑ i, X i ω) ⁻¹' Set.Ici 0))
  · have htpos : 0 < t := lt_of_le_of_ne ht (Ne.symm ht0)
    obtain ⟨lam, hlam, hrange, hopt⟩ := hOptimize t htpos
    have henv := bernsteinChernoffEnvelope X b C c B σ2 hX hMgf hExp
      hSumExp hSumMeas hσ (lam := lam) (t := t) hlam hrange
    calc
      μ.real ((fun ω => ∑ i, X i ω) ⁻¹' Set.Ici t) ≤
          Real.exp (-lam * t + C * lam ^ 2 * σ2) := henv
      _ ≤ Real.exp (-κ * min (t ^ 2 / σ2) (t / B)) := by
        exact Real.exp_le_exp.mpr (by linarith)

namespace Contract

theorem hdp_02_hlem_hbernstein_hmgf_hpipeline
    {ι Ω : Type*} [Fintype ι] [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (b : ι → ℝ)
    (C c B σ2 κ : ℝ)
    (hX : iIndepFun X μ)
    (hMgf : ∀ (lam : ℝ), |lam| ≤ c / B →
      ∀ i, (∫ ω, Real.exp (lam * X i ω) ∂μ) ≤
        Real.exp (C * lam ^ 2 * (b i) ^ 2))
    (hExp : ∀ (lam : ℝ), |lam| ≤ c / B →
      ∀ i, Integrable (fun ω => Real.exp (lam * X i ω)) μ)
    (hSumExp : ∀ (lam : ℝ), |lam| ≤ c / B →
      Integrable (fun ω => Real.exp (lam * ∑ i, X i ω)) μ)
    (hSumMeas : Measurable (fun ω => ∑ i, X i ω))
    (hσ : σ2 = ∑ i, (b i) ^ 2)
    (hOptimize : ∀ t : ℝ, 0 < t →
      ∃ lam : ℝ, 0 < lam ∧ |lam| ≤ c / B ∧
        κ * min (t ^ 2 / σ2) (t / B) + C * lam ^ 2 * σ2 ≤ lam * t) :
    ∀ t : ℝ, 0 ≤ t →
      μ.real ((fun ω => ∑ i, X i ω) ⁻¹' Set.Ici t) ≤
        Real.exp (-κ * min (t ^ 2 / σ2) (t / B)) :=
  NumStability.HDP.Scalar.Bernstein.bernsteinMgfPipeline X b C c B σ2 κ
    hX hMgf hExp hSumExp hSumMeas hσ hOptimize

end Contract

/-!
## Corrected single-index McDiarmid interface

The printed statement of Theorem 2.9.1 switches between `N` independent
coordinates and an `n`-fold product.  The interface below uses one finite
index type throughout and makes the integrability hypothesis needed for the
expectation explicit.  The concentration theorem itself is an external
foundation item in the checked-in plan; its use therefore remains a named
argument rather than an untracked axiom.
-/

def mcDiarmidStatement {ι : Type u} [Fintype ι] [DecidableEq ι]
    {X : ι → Type v} [∀ i, MeasurableSpace (X i)]
    (μ : ∀ i, MeasureTheory.Measure (X i))
    (f : (∀ i, X i) → ℝ) (c : ι → ℝ) : Prop :=
  (∀ i, MeasureTheory.IsProbabilityMeasure (μ i)) →
    MeasureTheory.Integrable f (MeasureTheory.Measure.pi μ) →
      boundedDifferences f c →
        ∀ t : ℝ, 0 < t →
          MeasureTheory.Measure.pi μ {x | f x -
            (∫ y, f y ∂MeasureTheory.Measure.pi μ) ≥ t} ≤
            ENNReal.ofReal (Real.exp (-2 * t ^ 2 / ∑ i, (c i) ^ 2))

/-! The external McDiarmid theorem, exposed as a reusable local foundation
helper so its exact product-space contract is recorded by the binding ledger. -/
def mcDiarmidFoundation {ι : Type u} [Fintype ι] [DecidableEq ι]
    {X : ι → Type v} [∀ i, MeasurableSpace (X i)]
    (μ : ∀ i, MeasureTheory.Measure (X i))
    (f : (∀ i, X i) → ℝ) (c : ι → ℝ) : Prop :=
  mcDiarmidStatement μ f c

theorem correctedMcDiarmid
    {ι : Type u} [Fintype ι] [DecidableEq ι]
    {X : ι → Type v} [∀ i, MeasurableSpace (X i)]
    (μ : ∀ i, MeasureTheory.Measure (X i))
    (f : (∀ i, X i) → ℝ) (c : ι → ℝ)
    (hMcDiarmid : mcDiarmidFoundation μ f c)
    (hμ : ∀ i, MeasureTheory.IsProbabilityMeasure (μ i))
    (hIntegrable : MeasureTheory.Integrable f (MeasureTheory.Measure.pi μ))
    (hBound : boundedDifferences f c)
    (t : ℝ) (ht : 0 < t) :
            MeasureTheory.Measure.pi μ {x | f x -
              (∫ y, f y ∂MeasureTheory.Measure.pi μ) ≥ t} ≤
              ENNReal.ofReal (Real.exp (-2 * t ^ 2 / ∑ i, (c i) ^ 2)) :=
  hMcDiarmid hμ hIntegrable hBound t ht

end NumStability.HDP.Scalar.Bernstein

namespace NumStability.HDP.Contract

def hdp_02_hdef_hbounded_hdifferences {ι : Type*} [Fintype ι] [DecidableEq ι]
    {X : ι → Type*} (f : (∀ i, X i) → ℝ) (c : ι → ℝ) : Prop :=
  Scalar.Bernstein.boundedDifferences f c

theorem hdp_02_hdef_hbennett_hh :
    ∀ u : ℝ, 0 ≤ u →
      Scalar.Bernstein.bennettH u = (1 + u) * Real.log (1 + u) - u ∧
      (u ≤ 1 → u ^ 2 / 3 ≤ Scalar.Bernstein.bennettH u ∧
        Scalar.Bernstein.bennettH u ≤ u ^ 2) ∧
      (Real.exp 2 ≤ u →
        (u / 2) * Real.log u ≤ Scalar.Bernstein.bennettH u) :=
  Scalar.Bernstein.bennettHInterface

theorem hdp_02_hex_h2_d8_d5
    (hEngine : Scalar.Bernstein.boundedBernsteinMgfStatement)
    {Ω : Type} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) (X : Ω → ℝ) (K lam σ2 : ℝ)
    (hBound : ∀ᵐ ω ∂μ, |X ω| ≤ K)
    (hMean : (∫ ω, X ω ∂μ) = 0) (hσ : 0 ≤ σ2) (hK : 0 < K)
    (hlam : |lam| < 3 / K) :
    (∫ ω, Real.exp (lam * X ω) ∂μ) ≤
      Real.exp (((lam ^ 2 / 2) / (1 - |lam| * K / 3)) * σ2) :=
  Scalar.Bernstein.boundedBernsteinMgfBound hEngine μ X K lam σ2
    hBound hMean hσ hK hlam

theorem hdp_02_hthm_h2_d9_d1
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    {X : ι → Type*} [∀ i, MeasurableSpace (X i)]
    (μ : ∀ i, MeasureTheory.Measure (X i))
    (f : (∀ i, X i) → ℝ) (c : ι → ℝ)
    (hMcDiarmid : Scalar.Bernstein.mcDiarmidFoundation μ f c)
    (hμ : ∀ i, MeasureTheory.IsProbabilityMeasure (μ i))
    (hIntegrable : MeasureTheory.Integrable f (MeasureTheory.Measure.pi μ))
    (hBound : Scalar.Bernstein.boundedDifferences f c)
    (t : ℝ) (ht : 0 < t) :
            MeasureTheory.Measure.pi μ {x | f x -
              (∫ y, f y ∂MeasureTheory.Measure.pi μ) ≥ t} ≤
              ENNReal.ofReal (Real.exp (-2 * t ^ 2 / ∑ i, (c i) ^ 2)) :=
  Scalar.Bernstein.correctedMcDiarmid μ f c hMcDiarmid hμ hIntegrable hBound t ht

end NumStability.HDP.Contract
