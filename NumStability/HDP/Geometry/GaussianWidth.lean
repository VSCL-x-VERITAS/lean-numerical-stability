import Mathlib.Analysis.InnerProductSpace.LinearMap
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Analysis.Normed.Module.Ball.Pointwise
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar
import Mathlib.MeasureTheory.Measure.Lebesgue.VolumeOfBalls
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Topology.Order.Bornology

/-!
# Directional width and its minimum containing slab

This file formalizes the deterministic geometry underlying spherical and
Gaussian width.  Suprema and infima are used throughout, so no supporting
hyperplane is assumed to meet a nonclosed set.
-/

open Set
open scoped InnerProductSpace Pointwise
open scoped Nat

namespace NumStability.HDP.Geometry.GaussianWidth

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Scalar projection onto a direction. -/
def projection (θ x : E) : ℝ :=
  ⟪θ, x⟫_ℝ

/-- The set of scalar projections of `T` onto `θ`. -/
def projectionSet (θ : E) (T : Set E) : Set ℝ :=
  projection θ '' T

/-- The width of `T` in direction `θ`, represented as the supremum of all
ordered projection differences.  By `directionalWidth_eq_pairwise`, this is
exactly `sup_{x,y ∈ T} ⟪θ, x-y⟫` from equation (7.15).

Source: Vershynin, Section 7.5.2, printed pages 175–176, equation (7.15)
(`HDP-07-DEF-DIRECTIONAL-WIDTH`). -/
noncomputable def directionalWidth (θ : E) (T : Set E) : ℝ :=
  sSup (Set.image2 (· - ·) (projectionSet θ T) (projectionSet θ T))

/-- The closed slab between projection levels `a` and `b`, with boundary
hyperplanes orthogonal to `θ`. -/
def slab (θ : E) (a b : ℝ) : Set E :=
  {x | a ≤ projection θ x ∧ projection θ x ≤ b}

/-- The canonical containing slab uses the infimum and supremum projection
levels.  Its boundary need not meet `T`. -/
noncomputable def canonicalSlab (θ : E) (T : Set E) : Set E :=
  slab θ (sInf (projectionSet θ T)) (sSup (projectionSet θ T))

theorem projectionSet_nonempty {θ : E} {T : Set E} (hT : T.Nonempty) :
    (projectionSet θ T).Nonempty :=
  hT.image _

theorem projectionSet_isBounded {θ : E} {T : Set E}
    (hT : Bornology.IsBounded T) :
    Bornology.IsBounded (projectionSet θ T) := by
  simpa [projectionSet, projection, innerSL_apply_apply] using
    (innerSL ℝ θ).lipschitz.isBounded_image hT

/-- The image-based definition unfolds to the book's ordered-pair formula. -/
theorem directionalWidth_eq_pairwise (θ : E) (T : Set E) :
    directionalWidth θ T =
      sSup {r : ℝ | ∃ x ∈ T, ∃ y ∈ T, ⟪θ, x - y⟫_ℝ = r} := by
  unfold directionalWidth
  congr 1
  ext r
  constructor
  · rintro ⟨px, ⟨x, hx, rfl⟩, py, ⟨y, hy, rfl⟩, rfl⟩
    exact ⟨x, hx, y, hy, by simp [projection, inner_sub_right]⟩
  · rintro ⟨x, hx, y, hy, rfl⟩
    exact ⟨projection θ x, ⟨x, hx, rfl⟩, projection θ y, ⟨y, hy, rfl⟩,
      by simp [projection, inner_sub_right]⟩

/-- Directional width is the difference between the extreme projection
levels.  The extremes are not required to be attained. -/
theorem directionalWidth_eq_projection_span {θ : E} {T : Set E}
    (hTne : T.Nonempty) (hT : Bornology.IsBounded T) :
    directionalWidth θ T =
      sSup (projectionSet θ T) - sInf (projectionSet θ T) := by
  let P := projectionSet θ T
  have hPne : P.Nonempty := projectionSet_nonempty hTne
  have hPbdd : Bornology.IsBounded P := projectionSet_isBounded hT
  unfold directionalWidth
  change sSup (Set.image2 (· - ·) P P) = sSup P - sInf P
  refine csSup_image2_eq_csSup_csInf
    (u₁ := fun b c : ℝ => c + b) (u₂ := fun a c : ℝ => a - c) ?_ ?_
    hPne hPbdd.bddAbove hPne hPbdd.bddBelow
  · intro b a c
    constructor <;> intro h <;> linarith
  · intro a b c
    change a - OrderDual.ofDual b ≤ c ↔ a - c ≤ OrderDual.ofDual b
    constructor <;> intro h <;> linarith

/-- Every point of a nonempty bounded set lies in the canonical slab. -/
theorem subset_canonicalSlab {θ : E} {T : Set E}
    (hT : Bornology.IsBounded T) :
    T ⊆ canonicalSlab θ T := by
  intro x hx
  have hP := projectionSet_isBounded (θ := θ) hT
  exact ⟨csInf_le hP.bddBelow ⟨x, hx, rfl⟩,
    le_csSup hP.bddAbove ⟨x, hx, rfl⟩⟩

/-- Any slab containing `T` has width at least the directional width. -/
theorem directionalWidth_le_slabWidth {θ : E} {T : Set E} {a b : ℝ}
    (hTne : T.Nonempty) (hT : Bornology.IsBounded T)
    (hcontain : T ⊆ slab θ a b) :
    directionalWidth θ T ≤ b - a := by
  rw [directionalWidth_eq_projection_span hTne hT]
  have hPne := projectionSet_nonempty (θ := θ) hTne
  have hP := projectionSet_isBounded (θ := θ) hT
  have hsup : sSup (projectionSet θ T) ≤ b := by
    refine (csSup_le_iff hP.bddAbove hPne).2 ?_
    rintro _ ⟨x, hx, rfl⟩
    exact (hcontain hx).2
  have hinf : a ≤ sInf (projectionSet θ T) := by
    refine (le_csInf_iff hP.bddBelow hPne).2 ?_
    rintro _ ⟨x, hx, rfl⟩
    exact (hcontain hx).1
  linarith

/-- For a unit direction, the canonical slab contains `T`, its scalar width
equals the directional width, and every other containing orthogonal slab is
at least as wide.  Thus it realizes the minimum slab width even when its
boundary hyperplanes do not meet `T`. -/
theorem directionalWidth_eq_minimum_slab {θ : E} {T : Set E}
    (hθ : ‖θ‖ = 1) (hTne : T.Nonempty) (hT : Bornology.IsBounded T) :
    T ⊆ canonicalSlab θ T ∧
      directionalWidth θ T =
        sSup (projectionSet θ T) - sInf (projectionSet θ T) ∧
      ∀ a b, T ⊆ slab θ a b → directionalWidth θ T ≤ b - a := by
  have _ := hθ
  exact ⟨subset_canonicalSlab hT,
    directionalWidth_eq_projection_span hTne hT,
    fun _ _ => directionalWidth_le_slabWidth hTne hT⟩

/-! ### Volumetric comparisons for cubes and cross-polytopes -/

/-- The coordinate cube `B_∞ⁿ = [-1,1]ⁿ`. -/
def cubeBall (n : ℕ) : Set (Fin n → ℝ) :=
  Set.pi Set.univ (fun _ ↦ Set.Icc (-1) 1)

/-- The cross-polytope `B₁ⁿ`, represented by its coordinate `ℓ₁` inequality. -/
def crossPolytope (n : ℕ) : Set (Fin n → ℝ) :=
  {x | ∑ i, |x i| ≤ 1}

/-- The closed Euclidean ball in dimension `n`. -/
def euclideanBall (n : ℕ) (r : ℝ) : Set (EuclideanSpace ℝ (Fin n)) :=
  Metric.closedBall 0 r

/-- Real-valued Lebesgue volume of the closed Euclidean ball. -/
noncomputable def euclideanBallVolume (n : ℕ) (r : ℝ) : ℝ :=
  MeasureTheory.volume.real (euclideanBall n r)

/-- The coordinate cube has volume exactly `2ⁿ`. -/
theorem volume_cubeBall (n : ℕ) :
    MeasureTheory.volume (cubeBall n) = ENNReal.ofReal ((2 : ℝ) ^ n) := by
  rw [cubeBall, MeasureTheory.volume_pi_pi]
  simp [Real.volume_Icc]
  norm_num

/-- The cross-polytope has volume exactly `2ⁿ / n!`. -/
theorem volume_crossPolytope {n : ℕ} (hn : 0 < n) :
    MeasureTheory.volume (crossPolytope n) =
      ENNReal.ofReal ((2 : ℝ) ^ n / (n.factorial : ℝ)) := by
  letI : Nonempty (Fin n) := Fin.pos_iff_nonempty.mp hn
  have hGamma : Real.Gamma ((1 : ℝ) + 1) = 1 := by
    convert Real.Gamma_nat_eq_factorial 1 using 1 <;> norm_num
  have hGammaN : Real.Gamma ((n : ℝ) + 1) = (n.factorial : ℝ) :=
    Real.Gamma_nat_eq_factorial n
  simpa [crossPolytope, hGamma, hGammaN] using
    (MeasureTheory.volume_sum_rpow_le (Fin n) (p := (1 : ℝ)) le_rfl 1)

/-- A Stirling-strength lower bound and the elementary upper bound for
factorials.  This is the locally owned foundation helper for
`EXT-FACTORIAL-STIRLING`. -/
theorem factorial_exponential_bounds (n : ℕ) (hn : 0 < n) :
    ((n : ℝ) / Real.exp 1) ^ n ≤ (n.factorial : ℝ) ∧
      (n.factorial : ℝ) ≤ (n : ℝ) ^ n := by
  constructor
  · have hsqrt : 1 ≤ Real.sqrt (2 * Real.pi * n) := by
      rw [Real.le_sqrt (by norm_num : (0 : ℝ) ≤ 1) (by positivity)]
      have hn1 : (1 : ℝ) ≤ n := by exact_mod_cast hn
      have hprod : (3 : ℝ) * 1 ≤ Real.pi * n :=
        mul_le_mul Real.pi_gt_three.le hn1 (by norm_num) Real.pi_pos.le
      nlinarith
    calc
      ((n : ℝ) / Real.exp 1) ^ n =
          1 * ((n : ℝ) / Real.exp 1) ^ n := by ring
      _ ≤ Real.sqrt (2 * Real.pi * n) * ((n : ℝ) / Real.exp 1) ^ n :=
        mul_le_mul_of_nonneg_right hsqrt (by positivity)
      _ ≤ (n.factorial : ℝ) := Stirling.le_factorial_stirling n
  · exact_mod_cast Nat.factorial_le_pow n

/-- Odd double factorials are bounded above by the largest factor to the
number of nontrivial factors. -/
theorem oddDoubleFactorial_le_pow (k : ℕ) :
    (2 * k + 1)‼ ≤ (2 * k + 1) ^ k := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [show 2 * (k + 1) + 1 = (2 * k + 1) + 2 by omega,
        Nat.doubleFactorial_add_two, pow_succ]
      rw [mul_comm ((2 * k + 1 + 2) ^ k) (2 * k + 1 + 2)]
      exact Nat.mul_le_mul le_rfl
        (ih.trans (Nat.pow_le_pow_left (by omega) k))

/-- Odd double factorials dominate the corresponding ordinary factorial. -/
theorem factorial_succ_le_oddDoubleFactorial (k : ℕ) :
    (k + 1)! ≤ (2 * k + 1)‼ := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [show 2 * (k + 1) + 1 = (2 * k + 1) + 2 by omega,
        Nat.doubleFactorial_add_two, Nat.factorial_succ]
      exact Nat.mul_le_mul (by omega) ih

theorem euclideanBallVolume_even (k : ℕ) (hk : 0 < k) :
    euclideanBallVolume (2 * k) (Real.sqrt (2 * k)) =
      ((2 * k : ℕ) : ℝ) ^ k * Real.pi ^ k / (k.factorial : ℝ) := by
  letI : Nonempty (Fin (2 * k)) := Fin.pos_iff_nonempty.mp (by omega)
  have hv := InnerProductSpace.volume_closedBall_of_dim_even
    (E := EuclideanSpace ℝ (Fin (2 * k))) (k := k) (by simp) 0 (Real.sqrt (2 * k))
  rw [euclideanBallVolume, euclideanBall, MeasureTheory.measureReal_def, hv]
  simp only [ENNReal.toReal_mul, ENNReal.toReal_pow, ENNReal.toReal_ofReal,
    Real.sqrt_nonneg]
  rw [show Module.finrank ℝ (EuclideanSpace ℝ (Fin (2 * k))) = 2 * k by simp,
    pow_mul, Real.sq_sqrt (by positivity)]
  rw [ENNReal.toReal_ofReal]
  · push_cast
    ring
  · positivity

theorem euclideanBallVolume_odd (k : ℕ) :
    euclideanBallVolume (2 * k + 1) (Real.sqrt (2 * k + 1)) =
      Real.sqrt (2 * k + 1) ^ (2 * k + 1) *
        (Real.pi ^ k * 2 ^ (k + 1) / ((2 * k + 1).doubleFactorial : ℝ)) := by
  letI : Nonempty (Fin (2 * k + 1)) := Fin.pos_iff_nonempty.mp (by omega)
  have hv := InnerProductSpace.volume_closedBall_of_dim_odd
    (E := EuclideanSpace ℝ (Fin (2 * k + 1))) (k := k) (by simp) 0
      (Real.sqrt (2 * k + 1))
  rw [euclideanBallVolume, euclideanBall, MeasureTheory.measureReal_def, hv]
  simp only [ENNReal.toReal_mul, ENNReal.toReal_pow, ENNReal.toReal_ofReal,
    Real.sqrt_nonneg]
  rw [ENNReal.toReal_ofReal]
  · simp
  · positivity

theorem euclideanBallVolume_even_bounds (k : ℕ) (hk : 0 < k) :
    (1 / 24 : ℝ) ^ (2 * k) ≤
        euclideanBallVolume (2 * k) (Real.sqrt (2 * k)) ∧
      euclideanBallVolume (2 * k) (Real.sqrt (2 * k)) ≤
        (24 : ℝ) ^ (2 * k) := by
  rw [euclideanBallVolume_even k hk]
  have hfac := factorial_exponential_bounds k hk
  have hfacpos : (0 : ℝ) < k.factorial := by positivity
  have hk0 : (0 : ℝ) ≤ k := by positivity
  have hpie : Real.pi * Real.exp 1 ≤ 12 := by
    calc
      Real.pi * Real.exp 1 ≤ 4 * Real.exp 1 :=
        mul_le_mul_of_nonneg_right Real.pi_le_four (Real.exp_pos 1).le
      _ ≤ 4 * 3 := mul_le_mul_of_nonneg_left Real.exp_one_lt_three.le (by norm_num)
      _ = 12 := by norm_num
  constructor
  · have hstrong : (2 : ℝ) ^ (2 * k) ≤
        ((2 * k : ℕ) : ℝ) ^ k * Real.pi ^ k / k.factorial := by
      rw [le_div_iff₀ hfacpos]
      calc
        (2 : ℝ) ^ (2 * k) * k.factorial ≤
            (2 : ℝ) ^ (2 * k) * (k : ℝ) ^ k :=
          mul_le_mul_of_nonneg_left hfac.2 (by positivity)
        _ = ((4 : ℝ) * k) ^ k := by
          rw [pow_mul]
          ring
        _ ≤ (((2 : ℝ) * k) * Real.pi) ^ k := by
          have hpi2 : (2 : ℝ) ≤ Real.pi := by linarith [Real.pi_gt_three]
          have hm : (2 : ℝ) * (2 * k) ≤ Real.pi * (2 * k) :=
            mul_le_mul_of_nonneg_right hpi2 (mul_nonneg (by norm_num) hk0)
          refine pow_le_pow_left₀ (a := (4 : ℝ) * k)
            (b := (2 : ℝ) * k * Real.pi) (by positivity) ?_ k
          nlinarith
        _ = ((2 * k : ℕ) : ℝ) ^ k * Real.pi ^ k := by
          push_cast
          ring
    exact (pow_le_pow_left₀ (a := (1 / 24 : ℝ)) (b := 2)
      (by norm_num) (by norm_num) (2 * k)).trans hstrong
  · rw [div_le_iff₀ hfacpos]
    have hbase : (2 : ℝ) * k * Real.pi ≤
        576 * ((k : ℝ) / Real.exp 1) := by
      rw [show (576 : ℝ) * (k / Real.exp 1) =
        (576 * k) / Real.exp 1 by ring, le_div_iff₀ (Real.exp_pos 1)]
      have hkpie := mul_le_mul_of_nonneg_right hpie hk0
      nlinarith
    calc
      ((2 * k : ℕ) : ℝ) ^ k * Real.pi ^ k =
          ((2 : ℝ) * k * Real.pi) ^ k := by
        push_cast
        ring
      _ ≤ (576 * ((k : ℝ) / Real.exp 1)) ^ k := by gcongr
      _ = (24 : ℝ) ^ (2 * k) * ((k : ℝ) / Real.exp 1) ^ k := by
        rw [pow_mul]
        ring
      _ ≤ (24 : ℝ) ^ (2 * k) * k.factorial :=
        mul_le_mul_of_nonneg_left hfac.1 (by positivity)

theorem euclideanBallVolume_odd_bounds (k : ℕ) :
    (1 / 24 : ℝ) ^ (2 * k + 1) ≤
        euclideanBallVolume (2 * k + 1) (Real.sqrt (2 * k + 1)) ∧
      euclideanBallVolume (2 * k + 1) (Real.sqrt (2 * k + 1)) ≤
        (24 : ℝ) ^ (2 * k + 1) := by
  rw [euclideanBallVolume_odd k]
  let n : ℕ := 2 * k + 1
  let a : ℕ := k + 1
  have hn : 0 < n := by simp [n]
  have ha : 0 < a := by simp [a]
  have hn1 : (1 : ℝ) ≤ n := by exact_mod_cast hn
  have hn0 : (0 : ℝ) ≤ n := hn1.trans' zero_le_one
  have hsqrt1 : (1 : ℝ) ≤ Real.sqrt n := by
    rw [Real.le_sqrt (by norm_num : (0 : ℝ) ≤ 1) (by positivity)]
    nlinarith
  have hsqrt_le : Real.sqrt n ≤ n := by
    rw [Real.sqrt_le_left hn0]
    nlinarith
  have hsqrtpow : Real.sqrt n ^ n = (n : ℝ) ^ k * Real.sqrt n := by
    rw [show n = 2 * k + 1 by simp [n], pow_add, pow_mul,
      Real.sq_sqrt hn0, pow_one]
  have hsqrtpow_lower : (n : ℝ) ^ k ≤ Real.sqrt n ^ n := by
    rw [hsqrtpow]
    exact le_mul_of_one_le_right (by positivity) hsqrt1
  have hsqrtpow_upper : Real.sqrt n ^ n ≤ (n : ℝ) ^ a := by
    rw [hsqrtpow, show a = k + 1 by simp [a], pow_succ]
    exact mul_le_mul_of_nonneg_left hsqrt_le (by positivity)
  have hDupper : ((n.doubleFactorial : ℕ) : ℝ) ≤ (n : ℝ) ^ k := by
    exact_mod_cast (show n.doubleFactorial ≤ n ^ k by
      simpa [n] using oddDoubleFactorial_le_pow k)
  have hDlower : ((a.factorial : ℕ) : ℝ) ≤ (n.doubleFactorial : ℝ) := by
    exact_mod_cast (show a.factorial ≤ n.doubleFactorial by
      simpa [a, n] using factorial_succ_le_oddDoubleFactorial k)
  have hDpos : (0 : ℝ) < n.doubleFactorial := by positivity
  have hfac := factorial_exponential_bounds a ha
  have hn_le : (n : ℝ) ≤ 2 * a := by
    exact_mod_cast (show n ≤ 2 * a by simp [n, a])
  have hpi_pow : Real.pi ^ k ≤ (4 : ℝ) ^ k :=
    pow_le_pow_left₀ Real.pi_pos.le Real.pi_le_four k
  have hexp_pow : Real.exp 1 ^ a ≤ (3 : ℝ) ^ a :=
    pow_le_pow_left₀ (Real.exp_pos 1).le Real.exp_one_lt_three.le a
  have hn_pow : (n : ℝ) ^ a ≤ ((2 : ℝ) * a) ^ a :=
    pow_le_pow_left₀ hn0 hn_le a
  have hnumexp :
      (Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a)) * Real.exp 1 ^ a ≤
        (24 : ℝ) ^ n * (a : ℝ) ^ a := by
    calc
      (Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a)) * Real.exp 1 ^ a ≤
          ((n : ℝ) ^ a * (Real.pi ^ k * 2 ^ a)) * Real.exp 1 ^ a :=
        mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_right hsqrtpow_upper (by positivity)) (by positivity)
      _ ≤ ((((2 : ℝ) * a) ^ a) * (Real.pi ^ k * 2 ^ a)) * Real.exp 1 ^ a :=
        mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_right hn_pow (by positivity)) (by positivity)
      _ ≤ ((((2 : ℝ) * a) ^ a) * ((4 : ℝ) ^ k * 2 ^ a)) *
          Real.exp 1 ^ a :=
        mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_left
            (mul_le_mul_of_nonneg_right hpi_pow (by positivity)) (by positivity)) (by positivity)
      _ ≤ ((((2 : ℝ) * a) ^ a) * ((4 : ℝ) ^ k * 2 ^ a)) *
          (3 : ℝ) ^ a :=
        mul_le_mul_of_nonneg_left hexp_pow (by positivity)
      _ = (12 : ℝ) ^ a * (a : ℝ) ^ a * 4 ^ k := by
        rw [show (12 : ℝ) = 2 * 2 * 3 by norm_num]
        simp only [mul_pow]
        ring
      _ ≤ (24 : ℝ) ^ a * (a : ℝ) ^ a * 24 ^ k := by
        exact mul_le_mul
          (mul_le_mul_of_nonneg_right
            (pow_le_pow_left₀ (by norm_num) (by norm_num) a) (by positivity))
          (pow_le_pow_left₀ (by norm_num) (by norm_num) k) (by positivity) (by positivity)
      _ = (24 : ℝ) ^ n * (a : ℝ) ^ a := by
        rw [show n = a + k by simp [n, a]; omega, pow_add]
        ring
  have hnumq : Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a) ≤
      (24 : ℝ) ^ n * (((a : ℝ) / Real.exp 1) ^ a) := by
    rw [div_pow, show (24 : ℝ) ^ n * ((a : ℝ) ^ a / Real.exp 1 ^ a) =
      ((24 : ℝ) ^ n * (a : ℝ) ^ a) / Real.exp 1 ^ a by ring,
      le_div_iff₀ (pow_pos (Real.exp_pos 1) a)]
    exact hnumexp
  have hform :
      Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a / (n.doubleFactorial : ℝ)) =
        (Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a)) / n.doubleFactorial := by ring
  suffices (1 / 24 : ℝ) ^ n ≤
      Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a / (n.doubleFactorial : ℝ)) ∧
    Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a / (n.doubleFactorial : ℝ)) ≤
      (24 : ℝ) ^ n by simpa [n, a] using this
  rw [hform]
  constructor
  · have hone_le_num : (1 : ℝ) ≤
        Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a) / n.doubleFactorial := by
      rw [le_div_iff₀ hDpos]
      simp only [one_mul]
      calc
        (n.doubleFactorial : ℝ) ≤ (n : ℝ) ^ k := hDupper
        _ ≤ Real.sqrt n ^ n := hsqrtpow_lower
        _ = Real.sqrt n ^ n * 1 := by ring
        _ ≤ Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a) := by
          have hpi1 : (1 : ℝ) ≤ Real.pi ^ k :=
            one_le_pow₀ (by linarith [Real.pi_gt_three])
          have htwo1 : (1 : ℝ) ≤ 2 ^ a := one_le_pow₀ (by norm_num)
          have hprod : (1 : ℝ) ≤ Real.pi ^ k * 2 ^ a := by
            simpa only [one_mul] using mul_le_mul hpi1 htwo1 zero_le_one (by positivity)
          exact mul_le_mul_of_nonneg_left hprod (by positivity)
    have hsmall : (1 / 24 : ℝ) ^ n ≤ 1 :=
      pow_le_one₀ (a := (1 / 24 : ℝ)) (by norm_num) (by norm_num)
    exact hsmall.trans hone_le_num
  · rw [div_le_iff₀ hDpos]
    calc
      Real.sqrt n ^ n * (Real.pi ^ k * 2 ^ a) ≤
          (24 : ℝ) ^ n * (((a : ℝ) / Real.exp 1) ^ a) := hnumq
      _ ≤ (24 : ℝ) ^ n * a.factorial :=
        mul_le_mul_of_nonneg_left hfac.1 (by positivity)
      _ ≤ (24 : ℝ) ^ n * n.doubleFactorial :=
        mul_le_mul_of_nonneg_left hDlower (by positivity)

/-- Uniform exponential bounds for the volume of the radius-`√n` Euclidean
ball.  This is the locally owned foundation helper for
`EXT-EUCLIDEAN-BALL-VOLUME`. -/
theorem euclideanBallVolume_sqrt_bounds (n : ℕ) (hn : 0 < n) :
    (1 / 24 : ℝ) ^ n ≤ euclideanBallVolume n (Real.sqrt n) ∧
      euclideanBallVolume n (Real.sqrt n) ≤ (24 : ℝ) ^ n := by
  rcases Nat.even_or_odd n with ⟨k, hk⟩ | ⟨k, hk⟩
  · have hkpos : 0 < k := by omega
    simpa [hk, two_mul] using euclideanBallVolume_even_bounds k hkpos
  · simpa [hk] using euclideanBallVolume_odd_bounds k

/-- Real-valued volume of the coordinate cube. -/
noncomputable def cubeVolume (n : ℕ) : ℝ :=
  MeasureTheory.volume.real (cubeBall n)

/-- Real-valued volume of the cross-polytope. -/
noncomputable def crossPolytopeVolume (n : ℕ) : ℝ :=
  MeasureTheory.volume.real (crossPolytope n)

theorem cubeVolume_eq (n : ℕ) : cubeVolume n = (2 : ℝ) ^ n := by
  rw [cubeVolume, MeasureTheory.measureReal_def, volume_cubeBall]
  simp

theorem crossPolytopeVolume_eq {n : ℕ} (hn : 0 < n) :
    crossPolytopeVolume n = (2 : ℝ) ^ n / (n.factorial : ℝ) := by
  rw [crossPolytopeVolume, MeasureTheory.measureReal_def, volume_crossPolytope hn]
  rw [ENNReal.toReal_ofReal]
  positivity

/-- Scaling the radius-`√n` ball by `1/n` gives the radius-`1/√n` ball,
and Lebesgue measure scales by the `n`-th power. -/
theorem euclideanBallVolume_invSqrt_eq (n : ℕ) (hn : 0 < n) :
    euclideanBallVolume n (1 / Real.sqrt n) =
      (1 / (n : ℝ)) ^ n * euclideanBallVolume n (Real.sqrt n) := by
  letI : Nonempty (Fin n) := Fin.pos_iff_nonempty.mp hn
  have hnR : (0 : ℝ) < n := Nat.cast_pos.mpr hn
  have hsqrt : (0 : ℝ) < Real.sqrt n := Real.sqrt_pos.2 hnR
  have hr : (0 : ℝ) ≤ 1 / n := by positivity
  have hrad : (1 / (n : ℝ)) * Real.sqrt n = 1 / Real.sqrt n := by
    field_simp [hsqrt.ne']
    nlinarith [Real.sq_sqrt hnR.le]
  have hset : (1 / (n : ℝ)) • euclideanBall n (Real.sqrt n) =
      euclideanBall n (1 / Real.sqrt n) := by
    unfold euclideanBall
    rw [smul_closedBall _ _ (Real.sqrt_nonneg _), smul_zero, Real.norm_eq_abs,
      abs_of_nonneg hr, hrad]
  have hscale := MeasureTheory.Measure.addHaar_smul_of_nonneg
    (MeasureTheory.volume : MeasureTheory.Measure (EuclideanSpace ℝ (Fin n))) hr
      (euclideanBall n (Real.sqrt n))
  rw [hset] at hscale
  rw [euclideanBallVolume, euclideanBallVolume, MeasureTheory.measureReal_def,
    hscale, ENNReal.toReal_mul, ENNReal.toReal_ofReal, show
      Module.finrank ℝ (EuclideanSpace ℝ (Fin n)) = n by simp]
  · rfl
  · positivity

theorem cubeVolume_bounds (n : ℕ) :
    (1 / 24 : ℝ) ^ n ≤ cubeVolume n ∧ cubeVolume n ≤ (24 : ℝ) ^ n := by
  rw [cubeVolume_eq]
  constructor <;> gcongr <;> norm_num

theorem crossPolytopeVolume_bounds (n : ℕ) (hn : 0 < n) :
    ((1 / 24 : ℝ) / n) ^ n ≤ crossPolytopeVolume n ∧
      crossPolytopeVolume n ≤ ((24 : ℝ) / n) ^ n := by
  rw [crossPolytopeVolume_eq hn]
  have hfac := factorial_exponential_bounds n hn
  have hnR : (0 : ℝ) < n := Nat.cast_pos.mpr hn
  have hfacpos : (0 : ℝ) < n.factorial := by positivity
  constructor
  · have hbase : (1 / 24 : ℝ) / n ≤ 2 / n := by
      exact div_le_div_of_nonneg_right (by norm_num) hnR.le
    calc
      ((1 / 24 : ℝ) / n) ^ n ≤ (2 / (n : ℝ)) ^ n :=
        pow_le_pow_left₀ (by positivity) hbase n
      _ ≤ (2 : ℝ) ^ n / n.factorial := by
        rw [div_pow, div_le_div_iff₀ (pow_pos hnR n) hfacpos]
        exact mul_le_mul_of_nonneg_left hfac.2 (by positivity)
  · rw [div_pow, div_le_div_iff₀ hfacpos (pow_pos hnR n)]
    have hbase : (2 : ℝ) * n ≤ 24 * ((n : ℝ) / Real.exp 1) := by
      rw [show (24 : ℝ) * (n / Real.exp 1) =
        (24 * n) / Real.exp 1 by ring, le_div_iff₀ (Real.exp_pos 1)]
      have he := Real.exp_one_lt_three.le
      nlinarith [mul_le_mul_of_nonneg_right he hnR.le]
    calc
      (2 : ℝ) ^ n * (n : ℝ) ^ n = ((2 : ℝ) * n) ^ n := by rw [mul_pow]
      _ ≤ (24 * ((n : ℝ) / Real.exp 1)) ^ n :=
        pow_le_pow_left₀ (by positivity) hbase n
      _ = (24 : ℝ) ^ n * ((n : ℝ) / Real.exp 1) ^ n := by rw [mul_pow]
      _ ≤ (24 : ℝ) ^ n * n.factorial :=
        mul_le_mul_of_nonneg_left hfac.1 (by positivity)

theorem euclideanBallVolume_invSqrt_bounds (n : ℕ) (hn : 0 < n) :
    ((1 / 24 : ℝ) / n) ^ n ≤ euclideanBallVolume n (1 / Real.sqrt n) ∧
      euclideanBallVolume n (1 / Real.sqrt n) ≤ ((24 : ℝ) / n) ^ n := by
  rw [euclideanBallVolume_invSqrt_eq n hn]
  have h := euclideanBallVolume_sqrt_bounds n hn
  constructor
  · calc
      ((1 / 24 : ℝ) / n) ^ n =
          (1 / (n : ℝ)) ^ n * (1 / 24 : ℝ) ^ n := by
        rw [div_pow]
        ring
      _ ≤ (1 / (n : ℝ)) ^ n * euclideanBallVolume n (Real.sqrt n) :=
        mul_le_mul_of_nonneg_left h.1 (by positivity)
  · calc
      (1 / (n : ℝ)) ^ n * euclideanBallVolume n (Real.sqrt n) ≤
          (1 / (n : ℝ)) ^ n * (24 : ℝ) ^ n :=
        mul_le_mul_of_nonneg_left h.2 (by positivity)
      _ = ((24 : ℝ) / n) ^ n := by
        rw [div_pow]
        ring

/-- The cube and its circumscribed Euclidean ball have exponential volume,
while the cross-polytope and its inscribed Euclidean ball have volume of order
`(C/n)ⁿ`, with constants uniform in the positive dimension.

Source: Vershynin, Section 7.5.4, printed pages 178–179
(`HDP-07-PROP-7.5.4-VOLUME-COMPARISONS`). -/
theorem volumeComparisons :
    ∃ c C : ℝ, 0 < c ∧ c ≤ C ∧ ∀ n : ℕ, 0 < n →
      cubeVolume n = (2 : ℝ) ^ n ∧
      c ^ n ≤ cubeVolume n ∧ cubeVolume n ≤ C ^ n ∧
      c ^ n ≤ euclideanBallVolume n (Real.sqrt n) ∧
        euclideanBallVolume n (Real.sqrt n) ≤ C ^ n ∧
      crossPolytopeVolume n = (2 : ℝ) ^ n / (n.factorial : ℝ) ∧
      (c / n) ^ n ≤ crossPolytopeVolume n ∧
        crossPolytopeVolume n ≤ (C / n) ^ n ∧
      (c / n) ^ n ≤ euclideanBallVolume n (1 / Real.sqrt n) ∧
        euclideanBallVolume n (1 / Real.sqrt n) ≤ (C / n) ^ n := by
  refine ⟨1 / 24, 24, by norm_num, by norm_num, ?_⟩
  intro n hn
  have hcube := cubeVolume_bounds n
  have heuc := euclideanBallVolume_sqrt_bounds n hn
  have hcross := crossPolytopeVolume_bounds n hn
  have heucsmall := euclideanBallVolume_invSqrt_bounds n hn
  exact ⟨cubeVolume_eq n, hcube.1, hcube.2, heuc.1, heuc.2,
    crossPolytopeVolume_eq hn, hcross.1, hcross.2, heucsmall.1, heucsmall.2⟩

end NumStability.HDP.Geometry.GaussianWidth

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-07-PROP-7.5.4-VOLUME-COMPARISONS`. -/
theorem hdp_07_hprop_h7_d5_d4_hvolume_hcomparisons :
    ∃ c C : ℝ, 0 < c ∧ c ≤ C ∧ ∀ n : ℕ, 0 < n →
      Geometry.GaussianWidth.cubeVolume n = (2 : ℝ) ^ n ∧
      c ^ n ≤ Geometry.GaussianWidth.cubeVolume n ∧
        Geometry.GaussianWidth.cubeVolume n ≤ C ^ n ∧
      c ^ n ≤ Geometry.GaussianWidth.euclideanBallVolume n (Real.sqrt n) ∧
        Geometry.GaussianWidth.euclideanBallVolume n (Real.sqrt n) ≤ C ^ n ∧
      Geometry.GaussianWidth.crossPolytopeVolume n =
          (2 : ℝ) ^ n / (n.factorial : ℝ) ∧
      (c / n) ^ n ≤ Geometry.GaussianWidth.crossPolytopeVolume n ∧
        Geometry.GaussianWidth.crossPolytopeVolume n ≤ (C / n) ^ n ∧
      (c / n) ^ n ≤
          Geometry.GaussianWidth.euclideanBallVolume n (1 / Real.sqrt n) ∧
        Geometry.GaussianWidth.euclideanBallVolume n (1 / Real.sqrt n) ≤ (C / n) ^ n :=
  Geometry.GaussianWidth.volumeComparisons

/-- Stable source alias for `HDP-07-DEF-DIRECTIONAL-WIDTH`. -/
theorem hdp_07_hdef_hdirectional_hwidth
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {θ : E} {T : Set E} (hθ : ‖θ‖ = 1) (hTne : T.Nonempty)
    (hT : Bornology.IsBounded T) :
    T ⊆ Geometry.GaussianWidth.canonicalSlab θ T ∧
      Geometry.GaussianWidth.directionalWidth θ T =
        sSup (Geometry.GaussianWidth.projectionSet θ T) -
          sInf (Geometry.GaussianWidth.projectionSet θ T) ∧
      ∀ a b, T ⊆ Geometry.GaussianWidth.slab θ a b →
        Geometry.GaussianWidth.directionalWidth θ T ≤ b - a :=
  Geometry.GaussianWidth.directionalWidth_eq_minimum_slab hθ hTne hT

end NumStability.HDP.Contract
