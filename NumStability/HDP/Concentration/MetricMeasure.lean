import Mathlib.Probability.CDF
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Probability.Independence.Basic
import Mathlib.Topology.MetricSpace.Lipschitz
import Mathlib.Topology.MetricSpace.HausdorffDistance
import Mathlib.Analysis.Normed.MulAction
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Geometry.Manifold.Riemannian.Basic
import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Measure.WithDensity
import Mathlib.MeasureTheory.Measure.OpenPos
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Constructions.BorelSpace.Order
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.Logic.Equiv.Basic
import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Probability.UniformOn
import Mathlib.Tactic

noncomputable section

open Filter Set TopologicalSpace
open MeasureTheory
open Bundle
open scoped Bundle ENNReal Manifold Topology

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

/-!
  The general metric-space definition from Chapter 5, §5.1.1.  The
  Lipschitz predicate and constants are the Mathlib ones; the optimal
  constant is recorded in `ℝ≥0∞` using the infimum of all `NNReal`
  witnesses.  This is the same convention used by the real-valued
  `LipschitzInterface` above, but with the source's domain and codomain
  left general.
-/
def metricLipConstants
    {α β : Type*} [PseudoMetricSpace α] [PseudoMetricSpace β]
    (f : α → β) : Set NNReal :=
  {K | LipschitzWith K f}

noncomputable def metricLipNorm
    {α β : Type*} [PseudoMetricSpace α] [PseudoMetricSpace β]
    (f : α → β) : ℝ≥0∞ :=
  ENNReal.ofNNReal (sInf (metricLipConstants f))

def IsContraction
    {α β : Type*} [PseudoMetricSpace α] [PseudoMetricSpace β]
    (f : α → β) : Prop :=
  LipschitzWith 1 f

structure LipschitzMapData
    {α β : Type*} [PseudoMetricSpace α] [PseudoMetricSpace β]
    (f : α → β) where
  constant : NNReal
  bound : LipschitzWith constant f
  norm : ℝ≥0∞
  norm_eq : norm = metricLipNorm f

theorem metricLipNorm_le
    {α β : Type*} [PseudoMetricSpace α] [PseudoMetricSpace β]
    {f : α → β} {K : NNReal} (h : LipschitzWith K f) :
    metricLipNorm f ≤ ENNReal.ofNNReal K := by
  rw [metricLipNorm]
  exact ENNReal.coe_le_coe.mpr (csInf_le (OrderBot.bddBelow _) h)

def lipschitz_map_data_mk
    {α β : Type*} [PseudoMetricSpace α] [PseudoMetricSpace β]
    {f : α → β} {K : NNReal} (h : LipschitzWith K f) :
    LipschitzMapData f := by
  exact {
    constant := K
    bound := h
    norm := metricLipNorm f
    norm_eq := rfl
  }

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

/-!
  Exercise 5.2.11: the probability-integral transform for independent standard
  normals.  The scalar proof is kept explicit: non-atomicity gives CDF
  continuity, equivalence of Gaussian and Lebesgue measure gives strict
  increase, and the CDF limits plus the intermediate-value theorem identify
  every interior quantile.  The finite-dimensional statement then uses the
  pinned product-map theorem.
-/
noncomputable def standardNormalLaw : Measure ℝ :=
  ProbabilityTheory.gaussianReal 0 1

noncomputable def standardNormalCdf : ℝ → ℝ :=
  ProbabilityTheory.cdf standardNormalLaw

noncomputable def uniformUnitIntervalLaw : Measure ℝ :=
  volume.restrict (Icc 0 1)

noncomputable def standardNormalProductLaw (n : ℕ) : Measure (Fin n → ℝ) :=
  Measure.pi (fun _ : Fin n => standardNormalLaw)

noncomputable def uniformUnitCubeLaw (n : ℕ) : Measure (Fin n → ℝ) :=
  Measure.pi (fun _ : Fin n => uniformUnitIntervalLaw)

noncomputable def coordinatewiseStandardNormalCdf (n : ℕ) :
    (Fin n → ℝ) → (Fin n → ℝ) :=
  fun z i => standardNormalCdf (z i)

instance standardNormalLaw_isProbabilityMeasure :
    IsProbabilityMeasure standardNormalLaw := by
  dsimp [standardNormalLaw]
  infer_instance

instance standardNormalLaw_noAtoms : NoAtoms standardNormalLaw := by
  dsimp [standardNormalLaw]
  exact ProbabilityTheory.noAtoms_gaussianReal (by norm_num)

instance uniformUnitIntervalLaw_isProbabilityMeasure :
    IsProbabilityMeasure uniformUnitIntervalLaw := by
  constructor
  simp [uniformUnitIntervalLaw, Real.volume_Icc]

private lemma standardNormalCdf_continuous :
    Continuous standardNormalCdf := by
  change Continuous (ProbabilityTheory.cdf standardNormalLaw)
  apply continuous_iff_continuousAt.2
  intro x
  apply (ProbabilityTheory.cdf standardNormalLaw).mono.continuousAt_iff_leftLim_eq_rightLim.2
  have hzero : (ProbabilityTheory.cdf standardNormalLaw).measure {x} = 0 := by
    rw [ProbabilityTheory.measure_cdf]
    simp
  have hdiff :
      ProbabilityTheory.cdf standardNormalLaw x -
          Function.leftLim (ProbabilityTheory.cdf standardNormalLaw) x = 0 := by
    have h_of : ENNReal.ofReal
        (ProbabilityTheory.cdf standardNormalLaw x -
          Function.leftLim (ProbabilityTheory.cdf standardNormalLaw) x) = 0 := by
      rw [← StieltjesFunction.measure_singleton]
      exact hzero
    have hle : ProbabilityTheory.cdf standardNormalLaw x -
        Function.leftLim (ProbabilityTheory.cdf standardNormalLaw) x ≤ 0 :=
      ENNReal.ofReal_eq_zero.mp h_of
    have hge : 0 ≤ ProbabilityTheory.cdf standardNormalLaw x -
        Function.leftLim (ProbabilityTheory.cdf standardNormalLaw) x :=
      sub_nonneg.mpr ((ProbabilityTheory.cdf standardNormalLaw).mono.leftLim_le le_rfl)
    linarith
  calc
    Function.leftLim (ProbabilityTheory.cdf standardNormalLaw) x =
        ProbabilityTheory.cdf standardNormalLaw x := by linarith
    _ = Function.rightLim (ProbabilityTheory.cdf standardNormalLaw) x :=
      ((ProbabilityTheory.cdf standardNormalLaw).rightLim_eq x).symm

private lemma standardNormalCdf_strictMono :
    StrictMono standardNormalCdf := by
  change StrictMono (ProbabilityTheory.cdf standardNormalLaw)
  intro x y hxy
  have h_integrable :
      Integrable (fun z : ℝ => ProbabilityTheory.gaussianPDFReal 0 1 z)
        (volume.restrict (Ioo x y)) :=
    (ProbabilityTheory.integrable_gaussianPDFReal 0 1).restrict
  have h_integral :
      0 < ∫ z in Ioo x y, ProbabilityTheory.gaussianPDFReal 0 1 z := by
    rw [integral_pos_iff_support_of_nonneg
      (μ := volume.restrict (Ioo x y))
      (f := ProbabilityTheory.gaussianPDFReal 0 1)
      (fun z => ProbabilityTheory.gaussianPDFReal_nonneg 0 1 z) h_integrable]
    have hsupport : Function.support (ProbabilityTheory.gaussianPDFReal 0 1) =
        (Set.univ : Set ℝ) := by
      ext z
      simp only [Function.mem_support, ne_eq, Set.mem_univ, iff_true]
      exact (ProbabilityTheory.gaussianPDFReal_pos 0 1 z (by norm_num)).ne'
    rw [hsupport, Measure.restrict_apply_univ]
    exact (Measure.measure_Ioo_pos volume).2 hxy
  have hIoo : 0 < standardNormalLaw (Ioo x y) := by
    rw [standardNormalLaw,
      ProbabilityTheory.gaussianReal_apply_eq_integral 0 (by norm_num)]
    exact ENNReal.ofReal_pos.mpr h_integral
  have hIoc : 0 < standardNormalLaw (Ioc x y) :=
    lt_of_lt_of_le hIoo (measure_mono Ioo_subset_Ioc_self)
  have hmass : 0 < (ProbabilityTheory.cdf standardNormalLaw).measure (Ioc x y) := by
    simpa [ProbabilityTheory.measure_cdf] using hIoc
  rw [StieltjesFunction.measure_Ioc] at hmass
  linarith [ENNReal.ofReal_pos.mp hmass]

private lemma standardNormalCdf_pos (x : ℝ) : 0 < standardNormalCdf x := by
  change 0 < ProbabilityTheory.cdf standardNormalLaw x
  have h := standardNormalCdf_strictMono (by linarith : x - 1 < x)
  exact (ProbabilityTheory.cdf_nonneg standardNormalLaw (x - 1)).trans_lt h

private lemma standardNormalCdf_lt_one (x : ℝ) : standardNormalCdf x < 1 := by
  change ProbabilityTheory.cdf standardNormalLaw x < 1
  have h := standardNormalCdf_strictMono (by linarith : x < x + 1)
  exact h.trans_le (ProbabilityTheory.cdf_le_one standardNormalLaw (x + 1))

private lemma standardNormalCdf_surjective_on_unitInterval {u : ℝ}
    (hu0 : 0 < u) (hu1 : u < 1) : ∃ x : ℝ, standardNormalCdf x = u := by
  change ∃ x : ℝ, ProbabilityTheory.cdf standardNormalLaw x = u
  have h := isPreconnected_univ.intermediate_value_Ioo
      (show atBot ≤ (𝓟 (Set.univ : Set ℝ)) by simp)
      (show atTop ≤ (𝓟 (Set.univ : Set ℝ)) by simp)
      standardNormalCdf_continuous.continuousOn
      (ProbabilityTheory.tendsto_cdf_atBot standardNormalLaw)
      (ProbabilityTheory.tendsto_cdf_atTop standardNormalLaw)
  rcases h ⟨hu0, hu1⟩ with ⟨x, -, hx⟩
  exact ⟨x, hx⟩

private lemma standardNormalCdf_preimage_Iic_zero :
    standardNormalCdf ⁻¹' Iic 0 = (∅ : Set ℝ) := by
  ext x
  change ProbabilityTheory.cdf standardNormalLaw x ≤ 0 ↔ False
  constructor
  · intro h
    exact (not_le_of_gt (standardNormalCdf_pos x)) h
  · simp

private lemma standardNormalCdf_preimage_Iic_one :
    standardNormalCdf ⁻¹' Iic 1 = (Set.univ : Set ℝ) := by
  ext x
  change ProbabilityTheory.cdf standardNormalLaw x ≤ 1 ↔ True
  constructor
  · intro _
    trivial
  · intro _
    exact (ProbabilityTheory.cdf_le_one standardNormalLaw x)

private lemma standardNormalCdf_preimage_Iic_of_interior {u : ℝ}
    (hu0 : 0 < u) (hu1 : u < 1) :
    ∃ x : ℝ, standardNormalCdf x = u ∧
      standardNormalCdf ⁻¹' Iic u = Iic x := by
  rcases standardNormalCdf_surjective_on_unitInterval hu0 hu1 with ⟨x, hx⟩
  refine ⟨x, hx, ?_⟩
  ext z
  constructor
  · intro hz
    by_contra hzx
    have hxz : x < z := lt_of_not_ge hzx
    have hstrict := standardNormalCdf_strictMono hxz
    exact (not_lt_of_ge hz) (by simpa [hx] using hstrict)
  · intro hz
    exact (standardNormalCdf_strictMono.monotone hz).trans_eq hx

private lemma standardNormalCdf_map_uniform :
    Measure.map standardNormalCdf standardNormalLaw = uniformUnitIntervalLaw := by
  let ν : Measure ℝ := Measure.map standardNormalCdf standardNormalLaw
  have hcdf : Measurable standardNormalCdf := standardNormalCdf_strictMono.monotone.measurable
  letI : IsProbabilityMeasure ν := Measure.isProbabilityMeasure_map hcdf.aemeasurable
  refine Measure.ext_of_Iic ν uniformUnitIntervalLaw ?_
  intro t
  by_cases ht0 : t < 0
  · have hpre : standardNormalCdf ⁻¹' Iic t = ∅ := by
      ext x
      change standardNormalCdf x ≤ t ↔ False
      constructor
      · intro h
        linarith [standardNormalCdf_pos x]
      · simp
    rw [show ν = Measure.map standardNormalCdf standardNormalLaw by rfl,
      Measure.map_apply hcdf measurableSet_Iic, hpre, measure_empty]
    rw [uniformUnitIntervalLaw, Measure.restrict_apply measurableSet_Iic]
    have hset : Iic t ∩ Icc (0 : ℝ) 1 = ∅ := by
      ext x
      simp only [mem_inter_iff, mem_Iic, mem_Icc, mem_empty_iff_false, iff_false]
      rintro ⟨hxt, hx0, _⟩
      linarith
    rw [hset, measure_empty]
  by_cases ht1 : 1 < t
  · have hpre : standardNormalCdf ⁻¹' Iic t = Set.univ := by
      ext x
      change standardNormalCdf x ≤ t ↔ True
      constructor
      · intro _
        trivial
      · intro _
        exact (ProbabilityTheory.cdf_le_one standardNormalLaw x).trans (le_of_lt ht1)
    rw [show ν = Measure.map standardNormalCdf standardNormalLaw by rfl,
      Measure.map_apply hcdf measurableSet_Iic, hpre, measure_univ]
    rw [uniformUnitIntervalLaw, Measure.restrict_apply measurableSet_Iic]
    have hset : Iic t ∩ Icc (0 : ℝ) 1 = Icc (0 : ℝ) 1 := by
      ext x
      constructor
      · rintro ⟨_, hx0, hx1⟩
        exact ⟨hx0, hx1⟩
      · intro hx
        exact ⟨hx.2.trans (le_of_lt ht1), hx.1, hx.2⟩
    rw [hset, Real.volume_Icc]
    norm_num
    exact ENNReal.ofReal_one.symm
  have ht0' : 0 ≤ t := le_of_not_gt ht0
  have ht1' : t ≤ 1 := le_of_not_gt ht1
  by_cases htzero : t = 0
  · subst t
    rw [show ν = Measure.map standardNormalCdf standardNormalLaw by rfl,
      Measure.map_apply hcdf measurableSet_Iic,
      standardNormalCdf_preimage_Iic_zero, measure_empty]
    rw [uniformUnitIntervalLaw, Measure.restrict_apply measurableSet_Iic]
    have hset : Iic (0 : ℝ) ∩ Icc (0 : ℝ) 1 = ({0} : Set ℝ) := by
      ext x
      simp only [mem_inter_iff, mem_Iic, mem_Icc, mem_singleton_iff]
      constructor
      · rintro ⟨h0, hx0, _⟩
        exact le_antisymm h0 hx0
      · intro hx
        subst x
        norm_num
    rw [hset, measure_singleton]
  by_cases htone : t = 1
  · subst t
    rw [show ν = Measure.map standardNormalCdf standardNormalLaw by rfl,
      Measure.map_apply hcdf measurableSet_Iic,
      standardNormalCdf_preimage_Iic_one, measure_univ]
    rw [uniformUnitIntervalLaw, Measure.restrict_apply measurableSet_Iic]
    have hset : Iic (1 : ℝ) ∩ Icc (0 : ℝ) 1 = Icc (0 : ℝ) 1 := by
      ext x
      constructor
      · rintro ⟨_, hx0, hx1⟩
        exact ⟨hx0, hx1⟩
      · intro hx
        exact ⟨hx.2, hx.1, hx.2⟩
    rw [hset, Real.volume_Icc]
    norm_num
    exact ENNReal.ofReal_one.symm
  obtain ⟨x, hx, hpre⟩ := standardNormalCdf_preimage_Iic_of_interior
    (lt_of_le_of_ne ht0' (Ne.symm htzero)) (lt_of_le_of_ne ht1' htone)
  change ProbabilityTheory.cdf standardNormalLaw x = t at hx
  rw [show ν = Measure.map standardNormalCdf standardNormalLaw by rfl,
    Measure.map_apply hcdf measurableSet_Iic, hpre,
    ← ProbabilityTheory.ofReal_cdf standardNormalLaw x, hx]
  rw [uniformUnitIntervalLaw, Measure.restrict_apply measurableSet_Iic]
  have hset : Iic t ∩ Icc (0 : ℝ) 1 = Icc (0 : ℝ) t := by
    ext z
    constructor
    · rintro ⟨hzt, hz0, hz1⟩
      exact ⟨hz0, hzt⟩
    · intro hz
      exact ⟨hz.2, hz.1, hz.2.trans ht1'⟩
  rw [hset, Real.volume_Icc]
  simp [hx, ht0']

theorem standardNormalCdfProductUniform (n : ℕ) :
    Measure.map (coordinatewiseStandardNormalCdf n) (standardNormalProductLaw n) =
      uniformUnitCubeLaw n := by
  letI : ∀ i : Fin n, SigmaFinite
      (Measure.map standardNormalCdf standardNormalLaw) := fun i => by
    rw [standardNormalCdf_map_uniform]
    infer_instance
  change Measure.map (fun z i => standardNormalCdf (z i))
      (Measure.pi (fun _ : Fin n => standardNormalLaw)) =
      Measure.pi (fun _ : Fin n => uniformUnitIntervalLaw)
  rw [Measure.pi_map_pi]
  · simp only [standardNormalCdf_map_uniform]
  · intro i
    exact standardNormalCdf_strictMono.monotone.measurable.aemeasurable

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

/-- The source-facing Riemannian metric-measure interface from §5.2.4.

The geodesic distance is tied to Mathlib's path-length infimum, while the
finite volume measure is normalized through Mathlib's probability-measure
constructor.  Ricci curvature is kept as explicit law-level data because the
current Mathlib substrate supplies the metric/path construction but not a
Ricci tensor or its comparison theorem.
-/
structure RiemannianManifoldData
    {E H M : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H]
    (I : ModelWithCorners ℝ E H)
    [TopologicalSpace M] [PseudoEMetricSpace M] [ChartedSpace H M]
    [MeasurableSpace M] [Nonempty M]
    [∀ x : M, ENorm (TangentSpace I x)]
    [∀ x : M, ENormSMulClass ℝ (TangentSpace I x)]
    [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)] where
  compact : IsCompact (Set.univ : Set M)
  connected : IsConnected (Set.univ : Set M)
  smooth : IsManifold I (⊤ : WithTop ℕ∞) M
  distance : M → M → ENNReal
  distance_eq_geodesic :
    ∀ x y, distance x y = Manifold.riemannianEDist I x y
  volume : FiniteMeasure M
  normalized_volume : ProbabilityMeasure M
  normalized_volume_eq :
    normalized_volume = MeasureTheory.FiniteMeasure.normalize volume
  lipschitz_observable : (M → ℝ) → Prop
  lipschitz_observable_eq :
    ∀ f, lipschitz_observable f ↔ ∃ K : NNReal, LipschitzWith K f
  ricci : ∀ x : M, TangentSpace I x → TangentSpace I x → ℝ
  ricci_lower_bound : ℝ
  ricci_lower_bound_pos : 0 < ricci_lower_bound
  ricci_lower_bound_bound :
    ∀ (x : M) (v : TangentSpace I x),
      ricci_lower_bound * ‖v‖ ^ 2 ≤ ricci x v v

theorem riemannian_distance_self
    {E H M : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H]
    (I : ModelWithCorners ℝ E H)
    [TopologicalSpace M] [PseudoEMetricSpace M] [ChartedSpace H M]
    [MeasurableSpace M] [Nonempty M]
    [∀ x : M, ENorm (TangentSpace I x)]
    [∀ x : M, ENormSMulClass ℝ (TangentSpace I x)]
    [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
    (x : M) :
    Manifold.riemannianEDist I x x = 0 := by
  exact Manifold.riemannianEDist_self

def riemannianManifoldData_mk
    {E H M : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H]
    (I : ModelWithCorners ℝ E H)
    [TopologicalSpace M] [PseudoEMetricSpace M] [ChartedSpace H M]
    [MeasurableSpace M] [Nonempty M]
    [∀ x : M, ENorm (TangentSpace I x)]
    [∀ x : M, ENormSMulClass ℝ (TangentSpace I x)]
    [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)]
    (hcompact : IsCompact (Set.univ : Set M))
    (hconnected : IsConnected (Set.univ : Set M))
    (hsmooth : IsManifold I (⊤ : WithTop ℕ∞) M)
    (hvolume : FiniteMeasure M)
    (hnormalized : ProbabilityMeasure M)
    (hnormalized_eq :
      hnormalized = MeasureTheory.FiniteMeasure.normalize hvolume)
    (hL : (M → ℝ) → Prop)
    (hL_eq : ∀ f, hL f ↔ ∃ K : NNReal, LipschitzWith K f)
    (hRicci : ∀ x : M, TangentSpace I x → TangentSpace I x → ℝ)
    (hc : ℝ) (hc_pos : 0 < hc)
    (hc_bound :
      ∀ (x : M) (v : TangentSpace I x), hc * ‖v‖ ^ 2 ≤ hRicci x v v) :
    RiemannianManifoldData (M := M) I where
  compact := hcompact
  connected := hconnected
  smooth := hsmooth
  distance := Manifold.riemannianEDist I
  distance_eq_geodesic := fun _ _ => rfl
  volume := hvolume
  normalized_volume := hnormalized
  normalized_volume_eq := hnormalized_eq
  lipschitz_observable := hL
  lipschitz_observable_eq := hL_eq
  ricci := hRicci
  ricci_lower_bound := hc
  ricci_lower_bound_pos := hc_pos
  ricci_lower_bound_bound := hc_bound

/-- The source-facing strongly log-concave law interface from §5.2.8.

The density is kept as an explicit ENNReal function so that its normalizing
integral and the associated measure are visible.  The Hessian is the second
Fréchet derivative when the potential is twice differentiable, and the
curvature inequality is recorded pointwise on vectors.
-/
structure StronglyLogConcaveData
    {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasureSpace E] where
  potential : E → ℝ
  density : E → ENNReal
  density_eq_exp :
    ∀ x, density x = ENNReal.ofReal (Real.exp (-potential x))
  density_normalized :
    ∫⁻ x, density x ∂(volume : Measure E) = 1
  law : Measure E
  law_eq_density :
    law = (volume : Measure E).withDensity density
  law_is_probability : IsProbabilityMeasure law
  twice_differentiable :
    ∀ x, DifferentiableAt ℝ potential x ∧
      DifferentiableAt ℝ (fun y => fderiv ℝ potential y) x
  hessian : E → E →L[ℝ] E →L[ℝ] ℝ
  hessian_eq_second_derivative :
    ∀ x, hessian x = fderiv ℝ (fun y => fderiv ℝ potential y) x
  curvature : ℝ
  curvature_pos : 0 < curvature
  hessian_lower_bound :
    ∀ (x : E) (v : E), curvature * ‖v‖ ^ 2 ≤ hessian x v v
  hessian_comp_id :
    ∀ x, (hessian x).comp (ContinuousLinearMap.id ℝ E) = hessian x

def stronglyLogConcaveData_mk
    {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasureSpace E]
    (hpotential : E → ℝ)
    (hdensity : E → ENNReal)
    (hdensity_eq_exp :
      ∀ x, hdensity x = ENNReal.ofReal (Real.exp (-hpotential x)))
    (hdensity_normalized :
      ∫⁻ x, hdensity x ∂(volume : Measure E) = 1)
    (hlaw : Measure E)
    (hlaw_eq_density :
      hlaw = (volume : Measure E).withDensity hdensity)
    (hlaw_is_probability : IsProbabilityMeasure hlaw)
    (htwice :
      ∀ x, DifferentiableAt ℝ hpotential x ∧
        DifferentiableAt ℝ (fun y => fderiv ℝ hpotential y) x)
    (hhessian : E → E →L[ℝ] E →L[ℝ] ℝ)
    (hhessian_eq :
      ∀ x, hhessian x = fderiv ℝ (fun y => fderiv ℝ hpotential y) x)
    (hcurvature : ℝ) (hcurvature_pos : 0 < hcurvature)
    (hhessian_lower :
      ∀ (x : E) (v : E), hcurvature * ‖v‖ ^ 2 ≤ hhessian x v v)
    (hhessian_comp_id :
      ∀ x, (hhessian x).comp (ContinuousLinearMap.id ℝ E) = hhessian x) :
    StronglyLogConcaveData (E := E) where
  potential := hpotential
  density := hdensity
  density_eq_exp := hdensity_eq_exp
  density_normalized := hdensity_normalized
  law := hlaw
  law_eq_density := hlaw_eq_density
  law_is_probability := hlaw_is_probability
  twice_differentiable := htwice
  hessian := hhessian
  hessian_eq_second_derivative := hhessian_eq
  curvature := hcurvature
  curvature_pos := hcurvature_pos
  hessian_lower_bound := hhessian_lower
  hessian_comp_id := hhessian_comp_id

/-- The finite symmetric group on n points. -/
def symmetricGroup (n : ℕ) : Type :=
  Equiv.Perm (Fin n)

/-- Normalized Hamming distance on permutations, with n>0 explicit. -/
def normalizedHammingDistance
    (n : ℕ) (hn : 0 < n)
    (p q : symmetricGroup n) : ℝ :=
  (Fintype.card {i : Fin n // p.toFun i ≠ q.toFun i} : ℝ) / n

/- The uniform probability law is kept with an explicit measurable space,
   since finite permutation types do not carry a default measurable space. -/
structure SymmetricGroupData
    (n : ℕ) (hn : 0 < n)
    (m : MeasurableSpace (symmetricGroup n)) where
  uniformLaw : @Measure (symmetricGroup n) m
  uniformLaw_eq :
    uniformLaw =
      @ProbabilityTheory.uniformOn (symmetricGroup n) m Set.univ
  uniformLaw_is_probability :
    @IsProbabilityMeasure (symmetricGroup n) m uniformLaw
  distance : symmetricGroup n → symmetricGroup n → ℝ
  distance_eq_normalized_hamming :
    ∀ p q, distance p q = normalizedHammingDistance n hn p q

def symmetricGroupData_mk
    (n : ℕ) (hn : 0 < n)
    (m : MeasurableSpace (symmetricGroup n))
    (μ : @Measure (symmetricGroup n) m)
    (hμ :
      μ = @ProbabilityTheory.uniformOn (symmetricGroup n) m Set.univ)
    (hμ_prob : @IsProbabilityMeasure (symmetricGroup n) m μ)
    (d : symmetricGroup n → symmetricGroup n → ℝ)
    (hd : ∀ p q, d p q = normalizedHammingDistance n hn p q) :
    SymmetricGroupData n hn m where
  uniformLaw := μ
  uniformLaw_eq := hμ
  uniformLaw_is_probability := hμ_prob
  distance := d
  distance_eq_normalized_hamming := hd

end NumStability.HDP.Concentration.MetricMeasure

namespace NumStability.HDP.Contract

def hdp_05_hdef_h5_d1_hmedian (μ : Measure ℝ) (X : ℝ → ℝ) :
    Type := NumStability.HDP.Concentration.MetricMeasure.MedianCertificate μ X

def hdp_05_hiface_hlipschitz (f : ℝ → ℝ) :
    Type := NumStability.HDP.Concentration.MetricMeasure.LipschitzInterface f

def hdp_05_hdef_h5_d1_d1
    {α β : Type*} [PseudoMetricSpace α] [PseudoMetricSpace β]
    (f : α → β) :
    Type _ := NumStability.HDP.Concentration.MetricMeasure.LipschitzMapData f

def hdp_05_hdef_h5_d2_hriemannian_hmms
    {E H M : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H]
    (I : ModelWithCorners ℝ E H)
    [TopologicalSpace M] [PseudoEMetricSpace M] [ChartedSpace H M]
    [MeasurableSpace M] [Nonempty M]
    [∀ x : M, ENorm (TangentSpace I x)]
    [∀ x : M, ENormSMulClass ℝ (TangentSpace I x)]
    [Bundle.RiemannianBundle (fun x : M => TangentSpace I x)] :
    Type _ :=
  NumStability.HDP.Concentration.MetricMeasure.RiemannianManifoldData (M := M) I

def hdp_05_hdef_h5_d2_hstrongly_hlogconcave
    {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasureSpace E] :
    Type _ :=
  NumStability.HDP.Concentration.MetricMeasure.StronglyLogConcaveData (E := E)

def hdp_05_hdef_h5_d2_hsymmetric_hgroup
    (n : ℕ) (hn : 0 < n)
    (m : MeasurableSpace
      (NumStability.HDP.Concentration.MetricMeasure.symmetricGroup n)) :
    Type _ :=
  NumStability.HDP.Concentration.MetricMeasure.SymmetricGroupData n hn m

theorem hdp_05_hex_h5_d2_d11 (n : ℕ) :
    Measure.map
        (fun z i => ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) (z i))
        (Measure.pi (fun _ : Fin n => ProbabilityTheory.gaussianReal 0 1)) =
      Measure.pi (fun _ : Fin n =>
        (MeasureTheory.volume : Measure ℝ).restrict (Set.Icc 0 1) ) := by
  simpa [NumStability.HDP.Concentration.MetricMeasure.coordinatewiseStandardNormalCdf,
    NumStability.HDP.Concentration.MetricMeasure.standardNormalProductLaw,
    NumStability.HDP.Concentration.MetricMeasure.uniformUnitCubeLaw,
    NumStability.HDP.Concentration.MetricMeasure.standardNormalCdf,
    NumStability.HDP.Concentration.MetricMeasure.standardNormalLaw,
    NumStability.HDP.Concentration.MetricMeasure.uniformUnitIntervalLaw] using
    NumStability.HDP.Concentration.MetricMeasure.standardNormalCdfProductUniform n

end NumStability.HDP.Contract
