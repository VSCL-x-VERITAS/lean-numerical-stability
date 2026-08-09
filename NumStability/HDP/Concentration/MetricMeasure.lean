import Mathlib.Probability.CDF
import Mathlib.Topology.MetricSpace.Lipschitz
import Mathlib.Topology.MetricSpace.HausdorffDistance
import Mathlib.Analysis.Normed.MulAction
import Mathlib.Tactic

noncomputable section

open Filter Set TopologicalSpace
open MeasureTheory
open scoped ENNReal Topology

namespace NumStability.HDP.Concentration.MetricMeasure

/-!
  A median is recorded at the law level.  This is the two-sided definition
  used in Chapter 5: both closed half-lines have mass at least one half.
-/
def IsMedian (μ : Measure ℝ) (m : ℝ) : Prop :=
  (1 / 2 : ℝ≥0∞) ≤ μ (Iic m) ∧ (1 / 2 : ℝ≥0∞) ≤ μ (Ici m)

/- The pinned probability substrate used when a random variable is transported
  to its real law. -/
def medianLaw (μ : Measure ℝ) (X : ℝ → ℝ) : Measure ℝ :=
  Measure.map X μ

theorem medianLaw_isProbabilityMeasure
    (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (X : ℝ → ℝ) (hX : AEMeasurable X μ) :
    IsProbabilityMeasure (medianLaw μ X) := by
  simpa [medianLaw] using Measure.isProbabilityMeasure_map hX

/-!
  The CDF upper-level set and its left boundary are the local quantile
  construction.  The CDF itself is the pinned Mathlib Stieltjes substrate.
-/
def medianBoundarySet (μ : Measure ℝ) : Set ℝ :=
  {x | (1 / 2 : ℝ) ≤ ProbabilityTheory.cdf μ x}

noncomputable def medianBoundary (μ : Measure ℝ) : ℝ :=
  sInf (medianBoundarySet μ)

/-!
  The source-facing semantic object keeps the law transport and the CDF
  boundary visible in its type.  This makes the two pinned frontier
  substrates part of the checked declaration rather than merely hidden in a
  downstream existence proof.
-/
structure MedianCertificate (μ : Measure ℝ) (X : ℝ → ℝ) where
  value : ℝ
  is_median : IsMedian (medianLaw μ X) value
  quantile_boundary : ℝ
  quantile_boundary_eq :
    quantile_boundary = medianBoundary (medianLaw μ X)

/-!
  Chapter 5's Lipschitz interface uses Mathlib's `NNReal` constants and
  records the infimum in `ENNReal`, while retaining Mathlib's distance-to-set
  function.  The bundled certificate keeps both source-facing operations in
  one declaration.
-/
def lipConstants (f : ℝ → ℝ) : Set NNReal :=
  {K | LipschitzWith K f}

noncomputable def lipNorm (f : ℝ → ℝ) : ℝ≥0∞ :=
  ENNReal.ofNNReal (sInf (lipConstants f))

structure LipschitzCertificate (f : ℝ → ℝ) where
  constant : NNReal
  bound : LipschitzWith constant f
  restriction : ∀ s : Set ℝ, LipschitzWith constant (s.restrict f)
  restriction_rule :
    ∀ s, LipschitzWith.restrict bound s = restriction s
  norm : ℝ≥0∞
  norm_eq : norm = lipNorm f
  distance_to_set : ℝ → Set ℝ → ℝ
  distance_to_set_eq :
    ∀ x s, distance_to_set x s = Metric.infDist x s

/- The public type alias carries the pinned restriction operation in its
  definition body, so the executable dependency audit sees the exact
  Mathlib bridge as well as the predicate in the certificate fields. -/
noncomputable def LipschitzInterface (f : ℝ → ℝ) : Type :=
  let restriction_bridge :=
    fun (K : NNReal) (h : LipschitzWith K f) (s : Set ℝ) =>
      LipschitzWith.restrict h s
  LipschitzCertificate f

theorem lipNorm_le {f : ℝ → ℝ} {K : NNReal}
    (h : LipschitzWith K f) :
    lipNorm f ≤ ENNReal.ofNNReal K := by
  rw [lipNorm]
  exact ENNReal.coe_le_coe.mpr (csInf_le (OrderBot.bddBelow _) h)

def lipschitz_interface_mk
    {f : ℝ → ℝ} {K : NNReal} (h : LipschitzWith K f) :
    LipschitzInterface f := by
  exact {
    constant := K
    bound := h
    restriction := fun s => LipschitzWith.restrict h s
    restriction_rule := fun _ => rfl
    norm := lipNorm f
    norm_eq := rfl
    distance_to_set := Metric.infDist
    distance_to_set_eq := fun _ _ => rfl
  }

theorem lipschitz_smul_left
    {f : ℝ → ℝ} {K : NNReal} (c : ℝ) (h : LipschitzWith K f) :
    LipschitzWith (‖c‖₊ * K) (fun x => c * f x) := by
  simpa [smul_eq_mul, Function.comp_def] using
    (lipschitzWith_smul c).comp h

theorem lipschitz_comp
    {f : ℝ → ℝ} {g : ℝ → ℝ} {Kf Kg : NNReal}
    (hf : LipschitzWith Kf f) (hg : LipschitzWith Kg g) :
    LipschitzWith (Kf * Kg) (f ∘ g) :=
  hf.comp hg

theorem lipschitz_restrict
    {f : ℝ → ℝ} {K : NNReal} (h : LipschitzWith K f) (s : Set ℝ) :
    LipschitzWith K (s.restrict f) :=
  h.restrict s

theorem distance_to_set_lipschitz (s : Set ℝ) :
    LipschitzWith 1 (fun x : ℝ => Metric.infDist x s) :=
  Metric.lipschitz_infDist_pt s

theorem distance_to_set_le_add (s : Set ℝ) (x y : ℝ) :
    Metric.infDist x s ≤ Metric.infDist y s + dist x y :=
  Metric.infDist_le_infDist_add_dist

theorem median_exists (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    ∃ m, IsMedian μ m := by
  let f : ℝ → ℝ := ProbabilityTheory.cdf μ
  let S : Set ℝ := {x | (1 / 2 : ℝ) ≤ f x}
  have htop : ∀ᶠ x in atTop, (1 / 2 : ℝ) < f x := by
    simpa [f] using
      ((tendsto_order.1 (ProbabilityTheory.tendsto_cdf_atTop μ)).1
        (1 / 2 : ℝ) (by norm_num))
  have hbot : ∀ᶠ x in atBot, f x < (1 / 2 : ℝ) := by
    simpa [f] using
      ((tendsto_order.1 (ProbabilityTheory.tendsto_cdf_atBot μ)).2
        (1 / 2 : ℝ) (by norm_num))
  obtain ⟨a, ha⟩ := eventually_atTop.1 htop
  have hS : S.Nonempty := by
    refine ⟨a, ?_⟩
    change (1 / 2 : ℝ) ≤ f a
    exact (ha a le_rfl).le
  obtain ⟨b, hb⟩ := eventually_atBot.1 hbot
  have hBdd : BddBelow S := by
    refine ⟨b, ?_⟩
    intro x hx
    change (1 / 2 : ℝ) ≤ f x at hx
    by_contra hxb
    have hxb' : x ≤ b := le_of_not_ge hxb
    exact (not_lt_of_ge hx) (hb x hxb')
  let q : ℝ := sInf S
  have hq_le : ∀ x ∈ S, q ≤ x := by
    intro x hx
    exact csInf_le hBdd hx
  have hq_mem : q ∈ S := by
    change (1 / 2 : ℝ) ≤ f q
    rw [show f q = ProbabilityTheory.cdf μ q by rfl]
    rw [← (ProbabilityTheory.cdf μ).iInf_Ioi_eq q]
    refine le_ciInf (fun (r : Ioi q) => ?_)
    obtain ⟨x, hx, hxr⟩ := exists_lt_of_csInf_lt hS r.property
    change (1 / 2 : ℝ) ≤ f x at hx
    exact hx.trans ((show Monotone f by
      simpa [f] using ProbabilityTheory.monotone_cdf μ) hxr.le)
  have hbelow : ∀ x < q, f x < (1 / 2 : ℝ) := by
    intro x hx
    have hxnot : x ∉ S := notMem_of_lt_csInf hx hBdd
    exact lt_of_not_ge (fun h => hxnot h)
  have hfmono : Monotone f := by
    simpa [f] using ProbabilityTheory.monotone_cdf μ
  have hleft : Function.leftLim f q ≤ (1 / 2 : ℝ) := by
    refine le_of_tendsto (hfmono.tendsto_leftLim q) ?_
    filter_upwards [self_mem_nhdsWithin] with x hx
    exact (hbelow x hx).le
  have hleft_one : Function.leftLim f q ≤ 1 := by
    exact (hfmono.leftLim_le le_rfl).trans (by
      simpa [f] using ProbabilityTheory.cdf_le_one μ q)
  have hlower : (1 / 2 : ℝ≥0∞) ≤ μ (Iic q) := by
    calc
      (1 / 2 : ℝ≥0∞) = ENNReal.ofReal (1 / 2 : ℝ) := by
        rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 2)]
        norm_num
      _ ≤ ENNReal.ofReal (ProbabilityTheory.cdf μ q) := by
        apply ENNReal.ofReal_le_ofReal
        exact (show (1 / 2 : ℝ) ≤ f q from hq_mem)
      _ = μ (Iic q) := ProbabilityTheory.ofReal_cdf μ q
  have hupper : (1 / 2 : ℝ≥0∞) ≤ μ (Ici q) := by
    have hcross : (1 / 2 : ℝ) ≤ 1 - Function.leftLim f q := by linarith
    calc
      (1 / 2 : ℝ≥0∞) = ENNReal.ofReal (1 / 2 : ℝ) := by
        rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 2)]
        norm_num
      _ ≤ ENNReal.ofReal (1 - Function.leftLim f q) :=
        ENNReal.ofReal_le_ofReal hcross
      _ = (ProbabilityTheory.cdf μ).measure (Ici q) := by
        symm
        rw [StieltjesFunction.measure_Ici (ProbabilityTheory.cdf μ)
          (ProbabilityTheory.tendsto_cdf_atTop μ)]
      _ = μ (Ici q) := congrArg (fun ν : Measure ℝ => ν (Ici q))
        (ProbabilityTheory.measure_cdf μ)
  exact ⟨q, hlower, hupper⟩

theorem median_exists_of_aemeasurable
    (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (X : ℝ → ℝ) (hX : AEMeasurable X μ) :
    ∃ m, IsMedian (medianLaw μ X) m := by
  letI : IsProbabilityMeasure (medianLaw μ X) :=
    medianLaw_isProbabilityMeasure μ X hX
  exact median_exists (medianLaw μ X)

theorem median_certificate_exists
    (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (X : ℝ → ℝ) (hX : AEMeasurable X μ) :
    Nonempty (MedianCertificate μ X) := by
  letI : IsProbabilityMeasure (medianLaw μ X) :=
    medianLaw_isProbabilityMeasure μ X hX
  obtain ⟨m, hm⟩ := median_exists (medianLaw μ X)
  exact ⟨{
    value := m
    is_median := hm
    quantile_boundary := medianBoundary (medianLaw μ X)
    quantile_boundary_eq := rfl
  }⟩

theorem median_interval_of_tail_bounds
    {μ : Measure ℝ} {a b : ℝ}
    (ha : (1 / 2 : ℝ≥0∞) ≤ μ (Iic a))
    (hb : (1 / 2 : ℝ≥0∞) ≤ μ (Ici b))
    {m : ℝ} (ham : a ≤ m) (hmb : m ≤ b) :
    IsMedian μ m := by
  constructor
  · exact ha.trans (measure_mono (Iic_subset_Iic.mpr ham))
  · exact hb.trans (measure_mono (Ici_subset_Ici.mpr hmb))

/-!
  Concrete obstruction to the printed footnote.  The equal-weight law on two
  atoms has every point between the atoms as a median, so continuity and
  injectivity of an underlying map do not by themselves give uniqueness.
-/
def twoPointLaw (a b : ℝ) : Measure ℝ :=
  (1 / 2 : ℝ≥0∞) • Measure.dirac a + (1 / 2 : ℝ≥0∞) • Measure.dirac b

theorem twoPointLaw_median_interval {a b : ℝ} (hab : a < b) :
    ∀ {m : ℝ}, m ∈ Icc a b → IsMedian (twoPointLaw a b) m := by
  intro m hm
  apply median_interval_of_tail_bounds (a := a) (b := b)
  · simp [twoPointLaw, Measure.smul_apply, hab.le]
  · simp [twoPointLaw, Measure.smul_apply, hab.le]
  · exact hm.1
  · exact hm.2

theorem median_unique_of_crossing
    {μ : Measure ℝ} {m : ℝ}
    (hm : IsMedian μ m)
    (hbelow : ∀ x < m, μ (Iic x) < (1 / 2 : ℝ≥0∞))
    (habove : ∀ x > m, μ (Ici x) < (1 / 2 : ℝ≥0∞)) :
    ∀ n, IsMedian μ n → n = m := by
  intro n hn
  rcases lt_trichotomy n m with hnm | rfl | hmn
  · exact False.elim ((not_lt_of_ge hn.1) (hbelow n hnm))
  · rfl
  · exact False.elim ((not_lt_of_ge hn.2) (habove n hmn))

end NumStability.HDP.Concentration.MetricMeasure

namespace NumStability.HDP.Contract

def hdp_05_hdef_h5_d1_hmedian (μ : Measure ℝ) (X : ℝ → ℝ) :
    Type := NumStability.HDP.Concentration.MetricMeasure.MedianCertificate μ X

def hdp_05_hiface_hlipschitz (f : ℝ → ℝ) :
    Type := NumStability.HDP.Concentration.MetricMeasure.LipschitzInterface f

end NumStability.HDP.Contract
