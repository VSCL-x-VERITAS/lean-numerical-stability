import Mathlib.Probability.ProbabilityMassFunction.Binomial
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.MeasureTheory.Function.ConvergenceInDistribution
import Mathlib.Tactic

/-!
# Bernoulli and binomial laws

This is the first current-main port from the archival Vershynin formalization.
The source target is Chapter 1, Section 1.3, p. 10.  The canonical laws are
Mathlib PMFs; the natural-valued Bernoulli law is the pushforward of the Bool
Bernoulli PMF, and the binomial law is the pushforward of Mathlib's finite
binomial PMF.
-/

noncomputable section

open MeasureTheory
open scoped BigOperators ENNReal NNReal

namespace NumStability.HDP.Scalar.LimitTheorems

/-- The probability law of an almost-everywhere measurable real random variable. -/
noncomputable def probabilityLaw
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    (X : Ω → ℝ) (hX : AEMeasurable X μ) :
    MeasureTheory.ProbabilityMeasure ℝ :=
  ⟨Measure.map X μ, Measure.isProbabilityMeasure_map hX⟩

/-- Convergence in distribution as weak convergence of pushforward probability laws. -/
noncomputable def convergenceInDistribution
    {Ω ι : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ι → Ω → ℝ) (l : Filter ι) (Z : Ω → ℝ)
    (hX : ∀ i, AEMeasurable (X i) μ) (hZ : AEMeasurable Z μ) : Prop :=
  Filter.Tendsto (fun i => probabilityLaw (X i) (hX i)) l
    (nhds (probabilityLaw Z hZ))

/-! ## The standard normal law -/

/--
The standard normal law from Chapter 1, equation (1.6).  Mathlib's
`gaussianReal` is parameterized by mean and variance, so the source law is the
specialization `(μ, v) = (0, 1)`.
-/
noncomputable def standardNormalLaw : Measure ℝ :=
  ProbabilityTheory.gaussianReal 0 1

/-- A random variable has the Chapter 1 standard-normal law. -/
def HasStandardNormalLaw {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (X : Ω → ℝ) : Prop :=
  ProbabilityTheory.HasLaw X standardNormalLaw μ

/-- The standard normal law is a probability measure. -/
instance standardNormalLaw.isProbabilityMeasure :
    IsProbabilityMeasure standardNormalLaw := by
  dsimp [standardNormalLaw]
  infer_instance

/-- The real density of `standardNormalLaw` is the density printed in (1.6). -/
theorem standardNormalLaw_pdf :
    ProbabilityTheory.gaussianPDFReal 0 1 =
      fun x : ℝ => (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-(x ^ 2) / 2) := by
  funext x
  simp only [ProbabilityTheory.gaussianPDFReal, NNReal.coe_one, sub_zero,
    one_mul, Nat.cast_ofNat]
  congr 1
  · congr 1
    ring
  · ring

/-! ## Canonical laws -/

/-- The `{0,1}`-valued Bernoulli PMF on `ℕ`. -/
def bernoulliNatPMF (p : ℝ≥0) (hp : p ≤ 1) : PMF ℕ :=
  (PMF.bernoulli p hp).map fun b => if b then 1 else 0

/-- The binomial PMF on `ℕ`, obtained from Mathlib's finite-support law. -/
def binomialNatPMF (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) : PMF ℕ :=
  (PMF.binomial p hp N).map fun i : Fin (N + 1) => (i : ℕ)

/-- The real-valued Bernoulli PMF, used for expectation and variance. -/
def bernoulliRealPMF (p : ℝ≥0) (hp : p ≤ 1) : PMF ℝ :=
  (PMF.bernoulli p hp).map (cond · 1 0)

@[simp]
theorem bernoulliNatPMF_apply_one {p : ℝ≥0} {hp : p ≤ 1} :
    bernoulliNatPMF p hp 1 = p := by
  simp [bernoulliNatPMF, PMF.map_apply, PMF.bernoulli_apply]

@[simp]
theorem bernoulliNatPMF_apply_zero {p : ℝ≥0} {hp : p ≤ 1} :
    bernoulliNatPMF p hp 0 = 1 - p := by
  simp [bernoulliNatPMF, PMF.map_apply, PMF.bernoulli_apply]

@[simp]
theorem bernoulliNatPMF_apply_of_ne_zero_one
    {p : ℝ≥0} {hp : p ≤ 1} {k : ℕ}
    (hk0 : k ≠ 0) (hk1 : k ≠ 1) :
    bernoulliNatPMF p hp k = 0 := by
  simp [bernoulliNatPMF, PMF.map_apply, PMF.bernoulli_apply, hk0, hk1]

@[simp]
theorem bernoulliRealPMF_apply_zero {p : ℝ≥0} {hp : p ≤ 1} :
    bernoulliRealPMF p hp 0 = 1 - p := by
  simp [bernoulliRealPMF, PMF.map_apply, PMF.bernoulli_apply]

@[simp]
theorem bernoulliRealPMF_apply_one {p : ℝ≥0} {hp : p ≤ 1} :
    bernoulliRealPMF p hp 1 = p := by
  simp [bernoulliRealPMF, PMF.map_apply, PMF.bernoulli_apply]

/-! ## Mean and variance -/

/-- The mean of the real Bernoulli law is its parameter. -/
theorem bernoulliRealPMF_mean (p : ℝ≥0) (hp : p ≤ 1) :
    ∫ x, x ∂(bernoulliRealPMF p hp).toMeasure = p.toReal := by
  unfold bernoulliRealPMF
  rw [← PMF.toMeasure_map]
  · rw [MeasureTheory.integral_map]
    · exact PMF.bernoulli_expectation hp
    · exact (measurable_of_countable _).aemeasurable
    · exact continuous_id.aestronglyMeasurable
  · exact measurable_of_countable _

/-- The second moment of the real Bernoulli law is its parameter. -/
theorem bernoulliRealPMF_second_moment (p : ℝ≥0) (hp : p ≤ 1) :
    ∫ x, x ^ 2 ∂(bernoulliRealPMF p hp).toMeasure = p.toReal := by
  unfold bernoulliRealPMF
  rw [← PMF.toMeasure_map]
  · rw [MeasureTheory.integral_map]
    · rw [PMF.integral_eq_sum]
      simp [PMF.bernoulli_apply]
    · exact (measurable_of_countable _).aemeasurable
    · exact (continuous_id.pow 2).aestronglyMeasurable
  · exact measurable_of_countable _

/-- The variance of the real Bernoulli law is `p (1-p)`. -/
theorem bernoulliRealPMF_variance (p : ℝ≥0) (hp : p ≤ 1) :
    ∫ x, (x - p.toReal) ^ 2 ∂(bernoulliRealPMF p hp).toMeasure =
      p.toReal * (1 - p.toReal) := by
  unfold bernoulliRealPMF
  rw [← PMF.toMeasure_map]
  · rw [MeasureTheory.integral_map]
    · rw [PMF.integral_eq_sum]
      simp [PMF.bernoulli_apply]
      rw [NNReal.coe_sub hp]
      norm_num
      ring_nf
    · exact (measurable_of_countable _).aemeasurable
    · exact ((continuous_id.sub continuous_const).pow 2).aestronglyMeasurable
  · exact measurable_of_countable _

/-! ## The binomial law as a Bernoulli-sum law -/

private def bernoulliTrialWeight (p : ℝ≥0) (N : ℕ) (f : Fin N → Bool) :
    ℝ≥0∞ :=
  ∏ i : Fin N, if f i then (p : ℝ≥0∞) else (1 - p : ℝ≥0∞)

theorem bernoulliTrialWeight_sum_eq_one
    (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) :
    (∑ f : Fin N → Bool, bernoulliTrialWeight p N f) = 1 := by
  classical
  calc
    (∑ f : Fin N → Bool, bernoulliTrialWeight p N f) =
        ∏ _i : Fin N, ∑ b : Bool,
          (if b then (p : ℝ≥0∞) else (1 - p : ℝ≥0∞)) := by
      exact (Fintype.prod_sum fun (_i : Fin N) (b : Bool) =>
        if b then (p : ℝ≥0∞) else (1 - p : ℝ≥0∞)).symm
    _ = 1 := by
      have hsub : (p : ℝ≥0∞) + (1 - p : ℝ≥0∞) = 1 := by
        norm_cast
        exact add_tsub_cancel_of_le hp
      simp [hsub]

def bernoulliTrialVectorPMF
    (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) : PMF (Fin N → Bool) :=
  PMF.ofFintype (bernoulliTrialWeight p N)
    (bernoulliTrialWeight_sum_eq_one p hp N)

def bernoulliSuccessCount (N : ℕ) (f : Fin N → Bool) : ℕ :=
  (Finset.univ.filter fun i => f i).card

private def bernoulliSuccessCountFin (N : ℕ) (f : Fin N → Bool) :
    Fin (N + 1) :=
  ⟨bernoulliSuccessCount N f, by
    unfold bernoulliSuccessCount
    exact Nat.lt_succ_of_le (by simpa [Fintype.card_fin] using
      (Finset.card_le_univ (Finset.univ.filter fun i : Fin N => f i)))⟩

private theorem bernoulliTrialWeight_eq_successCount
    (p : ℝ≥0) (N : ℕ) (f : Fin N → Bool) :
    bernoulliTrialWeight p N f =
      (p : ℝ≥0∞) ^ bernoulliSuccessCount N f *
        (1 - p : ℝ≥0∞) ^ (N - bernoulliSuccessCount N f) := by
  classical
  unfold bernoulliTrialWeight bernoulliSuccessCount
  rw [Finset.prod_ite]
  have hcard :
      (Finset.univ.filter fun i : Fin N => f i = false).card =
        N - (Finset.univ.filter fun i : Fin N => f i).card := by
    have h := Finset.card_filter_add_card_filter_not
      (s := (Finset.univ : Finset (Fin N))) (p := fun i => f i = true)
    have hsum :
        (Finset.univ.filter fun i : Fin N => f i = true).card +
            (Finset.univ.filter fun i : Fin N => f i = false).card = N := by
      simpa using h
    omega
  simp [hcard]

theorem bernoulliSuccessCount_fiber_card (N k : ℕ) :
    Fintype.card {f : Fin N → Bool // bernoulliSuccessCount N f = k} =
      N.choose k := by
  classical
  unfold bernoulliSuccessCount
  let e :
      {f : Fin N → Bool // (Finset.univ.filter fun i => f i).card = k} ≃
        {s : Finset (Fin N) // s.card = k} :=
    { toFun := fun f => ⟨Finset.univ.filter fun i => f.1 i, f.2⟩
      invFun := fun s => ⟨fun i => i ∈ s.1, by
        have hfilter :
            (Finset.univ.filter fun i : Fin N => i ∈ s.1) = s.1 := by
          ext i
          simp
        simpa [hfilter] using s.2⟩
      left_inv := by
        intro f
        apply Subtype.ext
        funext i
        simp
      right_inv := by
        intro s
        apply Subtype.ext
        ext i
        simp }
  calc
    Fintype.card {f : Fin N → Bool //
        (Finset.univ.filter fun i => f i).card = k} =
        Fintype.card {s : Finset (Fin N) // s.card = k} :=
      Fintype.card_congr e
    _ = N.choose k := by
      rw [Fintype.card_finset_len]
      simp

theorem bernoulliTrialVectorPMF_map_successCountFin_eq_binomial
    (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) :
    (bernoulliTrialVectorPMF p hp N).map (bernoulliSuccessCountFin N) =
      PMF.binomial p hp N := by
  classical
  ext i
  rw [bernoulliTrialVectorPMF, PMF.map_ofFintype]
  simp only [PMF.ofFintype_apply]
  rw [PMF.binomial_apply]
  have hfiber_const :
      ∀ f : Fin N → Bool,
        bernoulliSuccessCountFin N f = i →
          bernoulliTrialWeight p N f =
            (p : ℝ≥0∞) ^ (i : ℕ) *
              (1 - p : ℝ≥0∞) ^ (N - (i : ℕ)) := by
    intro f hf
    have hcount : bernoulliSuccessCount N f = (i : ℕ) :=
      congrArg Fin.val hf
    rw [bernoulliTrialWeight_eq_successCount, hcount]
  have hsum :
      (∑ f with bernoulliSuccessCountFin N f = i,
          bernoulliTrialWeight p N f) =
        ((Finset.univ.filter fun f : Fin N → Bool =>
          bernoulliSuccessCountFin N f = i).card : ℕ) •
          ((p : ℝ≥0∞) ^ (i : ℕ) *
            (1 - p : ℝ≥0∞) ^ (N - (i : ℕ))) := by
    calc
      (∑ f with bernoulliSuccessCountFin N f = i,
          bernoulliTrialWeight p N f) =
        ∑ f with bernoulliSuccessCountFin N f = i,
          ((p : ℝ≥0∞) ^ (i : ℕ) *
            (1 - p : ℝ≥0∞) ^ (N - (i : ℕ))) := by
              refine Finset.sum_congr rfl ?_
              intro f hf
              exact hfiber_const f (by simpa using hf)
      _ = ((Finset.univ.filter fun f : Fin N → Bool =>
          bernoulliSuccessCountFin N f = i).card : ℕ) •
          ((p : ℝ≥0∞) ^ (i : ℕ) *
            (1 - p : ℝ≥0∞) ^ (N - (i : ℕ))) := by
              rw [Finset.sum_const]
  have hcard :
      (Finset.univ.filter fun f : Fin N → Bool =>
          bernoulliSuccessCountFin N f = i).card = N.choose (i : ℕ) := by
    have hfilter :
        (Finset.univ.filter fun f : Fin N → Bool =>
            bernoulliSuccessCountFin N f = i) =
          (Finset.univ.filter fun f : Fin N → Bool =>
            bernoulliSuccessCount N f = (i : ℕ)) := by
      ext f
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      constructor
      · intro h
        exact congrArg Fin.val h
      · intro h
        apply Fin.ext
        exact h
    rw [hfilter]
    have hcardSubtype := bernoulliSuccessCount_fiber_card N (i : ℕ)
    rwa [Fintype.card_subtype] at hcardSubtype
  have htarget :
      ((Finset.univ.filter fun f : Fin N → Bool =>
          bernoulliSuccessCountFin N f = i).card : ℕ) •
          ((p : ℝ≥0∞) ^ (i : ℕ) *
            (1 - p : ℝ≥0∞) ^ (N - (i : ℕ))) =
        (p : ℝ≥0∞) ^ (i : ℕ) *
          (1 - p : ℝ≥0∞) ^ (N - (i : ℕ)) *
            (N.choose (i : ℕ) : ℝ≥0∞) := by
    rw [hcard]
    simp [nsmul_eq_mul, mul_comm, mul_left_comm]
  convert hsum.trans htarget using 1
  refine Finset.sum_congr ?_ fun _ _ => rfl
  ext x
  simp

/-- The natural-valued sum of `N` iid Bernoulli trials has the binomial law.

The `iIndepFun` and marginal-law theorem below is the source-facing bridge
used by later CLT and Poisson-limit targets. -/
theorem bernoulliSumPMF_eq_binomialNatPMF
    (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) :
    (bernoulliTrialVectorPMF p hp N).map (bernoulliSuccessCount N) =
      binomialNatPMF p hp N := by
  unfold binomialNatPMF
  have hcomp :
      ((fun i : Fin (N + 1) => (i : ℕ)) ∘ bernoulliSuccessCountFin N) =
        bernoulliSuccessCount N := by
    funext f
    rfl
  rw [← hcomp]
  rw [← PMF.map_comp]
  rw [bernoulliTrialVectorPMF_map_successCountFin_eq_binomial]

/-- The source-facing Bernoulli/binomial package, including its defining facts. -/
structure BernoulliBinomialModelData (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) where
  bernoulli : PMF ℕ
  binomial : PMF ℕ
  mean : ∫ x : ℝ, x ∂(bernoulliRealPMF p hp).toMeasure = p.toReal
  variance :
    ∫ x : ℝ, (x - p.toReal) ^ 2 ∂(bernoulliRealPMF p hp).toMeasure =
      p.toReal * (1 - p.toReal)
  sum_law :
    (bernoulliTrialVectorPMF p hp N).map (bernoulliSuccessCount N) =
      binomialNatPMF p hp N

/-- A Bernoulli-sum model packages the two canonical source laws and their facts. -/
def bernoulliBinomialModel (p : ℝ≥0) (hp : p ≤ 1) (N : ℕ) :
    BernoulliBinomialModelData p hp N :=
  { bernoulli := bernoulliNatPMF p hp
    binomial := binomialNatPMF p hp N
    mean := bernoulliRealPMF_mean p hp
    variance := bernoulliRealPMF_variance p hp
    sum_law := bernoulliSumPMF_eq_binomialNatPMF p hp N }

end NumStability.HDP.Scalar.LimitTheorems
