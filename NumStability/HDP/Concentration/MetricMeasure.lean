import Mathlib.Probability.CDF
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

def hdp_05_hdef_h5_d1_hmedian (μ : Measure ℝ) (m : ℝ) :
    Prop := NumStability.HDP.Concentration.MetricMeasure.IsMedian μ m

end NumStability.HDP.Contract
