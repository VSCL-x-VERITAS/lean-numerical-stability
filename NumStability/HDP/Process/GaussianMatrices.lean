import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Matrix.Normed
import Mathlib.Probability.Distributions.Gaussian.IsGaussianProcess.Basic
import NumStability.HDP.Source.Packages.Split3.BrownianFoundation.Gaussian.MultivariateGaussian

/-!
# Gaussian matrix process geometry

This module develops the deterministic rank-one matrix estimates used in the
Gaussian comparison arguments of Chapter 7.
-/

open MeasureTheory ProbabilityTheory Set
open scoped BigOperators InnerProductSpace Matrix.Norms.Frobenius ENNReal

namespace NumStability.HDP.Process.GaussianMatrices

/-- The squared Frobenius norm is the sum of the squared entries. -/
theorem frobenius_norm_sq_eq_sum
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (A : Matrix ι κ ℝ) :
    ‖A‖ ^ 2 = ∑ i, ∑ j, (A i j) ^ 2 := by
  rw [Matrix.frobenius_norm_def]
  have hsum : 0 ≤ ∑ i, ∑ j, (A i j) ^ 2 := by positivity
  calc
    ((∑ i, ∑ j, ‖A i j‖ ^ (2 : ℝ)) ^ (1 / 2 : ℝ)) ^ 2 =
        ((∑ i, ∑ j, (A i j) ^ 2) ^ ((2 : ℕ) : ℝ)⁻¹) ^ 2 := by
      congr 2
      · simp
      · norm_num
    _ = ∑ i, ∑ j, (A i j) ^ 2 :=
      Real.rpow_inv_natCast_pow hsum (by norm_num)

/-- The rank-one matrix `u vᵀ`, with Euclidean vectors indexed by arbitrary
finite types. -/
noncomputable def rankOneMatrix
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ) : Matrix ι κ ℝ :=
  Matrix.vecMulVec (fun i ↦ u i) (fun j ↦ v j)

/-- Coordinate expansion of the squared Frobenius distance between two
rank-one matrices. -/
theorem rankOne_sq_expansion
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ) :
    (∑ i, ∑ j, (u i * v j - w i * z j) ^ 2) =
      (∑ i, (u i) ^ 2) * (∑ j, (v j) ^ 2) +
      (∑ i, (w i) ^ 2) * (∑ j, (z j) ^ 2) -
      2 * (∑ i, u i * w i) * (∑ j, v j * z j) := by
  have huv : (∑ i, ∑ j, (u i * v j) ^ 2) =
      (∑ i, (u i) ^ 2) * (∑ j, (v j) ^ 2) := by
    symm
    rw [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro i hi
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro j hj
    ring
  have hwz : (∑ i, ∑ j, (w i * z j) ^ 2) =
      (∑ i, (w i) ^ 2) * (∑ j, (z j) ^ 2) := by
    symm
    rw [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro i hi
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro j hj
    ring
  have hcross : (∑ i, ∑ j, 2 * (u i * v j) * (w i * z j)) =
      2 * (∑ i, u i * w i) * (∑ j, v j * z j) := by
    calc
      (∑ i, ∑ j, 2 * (u i * v j) * (w i * z j)) =
          ∑ i, ∑ j, (2 * (u i * w i)) * (v j * z j) := by
        apply Finset.sum_congr rfl
        intro i hi
        apply Finset.sum_congr rfl
        intro j hj
        ring
      _ = ∑ i, (2 * (u i * w i)) * (∑ j, v j * z j) := by
        apply Finset.sum_congr rfl
        intro i hi
        rw [Finset.mul_sum]
      _ = (∑ i, 2 * (u i * w i)) * (∑ j, v j * z j) := by
        simpa using
          (Finset.sum_mul Finset.univ (fun i : ι ↦ 2 * (u i * w i))
            (∑ j : κ, v j * z j)).symm
      _ = 2 * (∑ i, u i * w i) * (∑ j, v j * z j) := by
        have htwo : (∑ i, 2 * (u i * w i)) = 2 * (∑ i, u i * w i) := by
          simpa using
            (Finset.mul_sum Finset.univ (fun i : ι ↦ u i * w i) 2).symm
        rw [htwo]
  simp_rw [sub_sq, Finset.sum_add_distrib, Finset.sum_sub_distrib]
  rw [huv, hwz, hcross]
  ring

/-- For unit Euclidean vectors, the rank-one embedding into Frobenius matrix
space does not increase the product squared distance.

Source: Vershynin, Exercise 7.3.2, printed page 169
(`HDP-07-EX-7.3.2`). -/
theorem rankOneMatrix_dist_sq_le
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ)
    (hu : ‖u‖ = 1) (hw : ‖w‖ = 1) (hv : ‖v‖ = 1) (hz : ‖z‖ = 1) :
    ‖rankOneMatrix u v - rankOneMatrix w z‖ ^ 2 ≤
      ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 := by
  rw [frobenius_norm_sq_eq_sum]
  simp only [rankOneMatrix, Matrix.sub_apply, Matrix.vecMulVec_apply]
  rw [rankOne_sq_expansion]
  have huu : ∑ i, (u i) ^ 2 = 1 := by
    calc
      ∑ i, (u i) ^ 2 = ∑ i, ‖u i‖ ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ = ‖u‖ ^ 2 := (EuclideanSpace.norm_sq_eq u).symm
      _ = 1 := by rw [hu]; norm_num
  have hww : ∑ i, (w i) ^ 2 = 1 := by
    calc
      ∑ i, (w i) ^ 2 = ∑ i, ‖w i‖ ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ = ‖w‖ ^ 2 := (EuclideanSpace.norm_sq_eq w).symm
      _ = 1 := by rw [hw]; norm_num
  have hvv : ∑ j, (v j) ^ 2 = 1 := by
    calc
      ∑ j, (v j) ^ 2 = ∑ j, ‖v j‖ ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ = ‖v‖ ^ 2 := (EuclideanSpace.norm_sq_eq v).symm
      _ = 1 := by rw [hv]; norm_num
  have hzz : ∑ j, (z j) ^ 2 = 1 := by
    calc
      ∑ j, (z j) ^ 2 = ∑ j, ‖z j‖ ^ 2 := by simp [Real.norm_eq_abs, sq_abs]
      _ = ‖z‖ ^ 2 := (EuclideanSpace.norm_sq_eq z).symm
      _ = 1 := by rw [hz]; norm_num
  have hinner_uw : (∑ i, u i * w i) = ⟪u, w⟫_ℝ := by
    rw [PiLp.inner_apply]
    apply Finset.sum_congr rfl
    intro i hi
    change u i * w i = w i * u i
    ring
  have hinner_vz : (∑ j, v j * z j) = ⟪v, z⟫_ℝ := by
    rw [PiLp.inner_apply]
    apply Finset.sum_congr rfl
    intro j hj
    change v j * z j = z j * v j
    ring
  rw [huu, hww, hvv, hzz]
  rw [hinner_uw, hinner_vz, norm_sub_sq_real, norm_sub_sq_real,
    hu, hw, hv, hz]
  have huw : ⟪u, w⟫_ℝ ≤ 1 := real_inner_le_one_of_norm_eq_one hu hw
  have hvz : ⟪v, z⟫_ℝ ≤ 1 := real_inner_le_one_of_norm_eq_one hv hz
  nlinarith [mul_nonneg (sub_nonneg.mpr huw) (sub_nonneg.mpr hvz)]

noncomputable section

variable {E T : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- Scalar projections of a standard Gaussian vector form a Gaussian process. -/
theorem isGaussianProcess_inner_stdGaussian (d : T → E) :
    IsGaussianProcess (fun t x ↦ ⟪d t, x⟫_ℝ) (stdGaussian E) := by
  constructor
  intro I
  let L : E →L[ℝ] (I → ℝ) :=
    { toFun := fun x t ↦ ⟪d t, x⟫_ℝ
      map_add' := by intros; ext; simp [inner_add_right]
      map_smul' := by intros; ext; simp [real_inner_smul_right]
      cont := by fun_prop }
  simpa only [Function.comp_apply, L] using
    (IsGaussian.hasGaussianLaw_id (μ := stdGaussian E)).map_fun L

/-- Every scalar projection of a standard Gaussian vector is centered. -/
theorem integral_inner_stdGaussian (d : E) :
    (∫ x, ⟪d, x⟫_ℝ ∂stdGaussian E) = 0 := by
  simpa only [innerSL_apply_apply] using isCentered_stdGaussian ((innerSL ℝ) d)

/-- The variance of a standard Gaussian projection is the squared norm of
its direction. -/
theorem variance_inner_stdGaussian (d : E) :
    Var[fun x ↦ ⟪d, x⟫_ℝ; stdGaussian E] = ‖d‖ ^ 2 := by
  simpa only [innerSL_apply_apply, innerSL_apply_norm] using
    variance_dual_stdGaussian ((innerSL ℝ) d)

/-- A real Gaussian matrix represented in flattened Frobenius coordinates. -/
abbrev MatrixSample (ι κ : Type*) := EuclideanSpace ℝ (ι × κ)

/-- The Hilbert direct sum carrying the independent comparison vectors
`(g,h)`. -/
abbrev SeparatedSample (ι κ : Type*) :=
  WithLp 2 (EuclideanSpace ℝ ι × EuclideanSpace ℝ κ)

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

private theorem real_inner_eq_mul (x y : ℝ) : ⟪x, y⟫_ℝ = x * y := by
  rw [show x = x • (1 : ℝ) by simp, show y = y • (1 : ℝ) by simp]
  simp only [real_inner_smul_left, real_inner_smul_right]
  simp [mul_comm]

/-- Flattened coordinates of the rank-one matrix `u vᵀ`. -/
def rankOneVector (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ) :
    MatrixSample ι κ :=
  WithLp.toLp 2 (fun p ↦ u p.1 * v p.2)

/-- The Gaussian matrix process `X_{uv} = ⟪Au,v⟫`, with `A` flattened in
Frobenius coordinates. -/
def matrixBilinearProcess (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ)
    (A : MatrixSample ι κ) : ℝ :=
  ⟪rankOneVector u v, A⟫_ℝ

/-- Direction in the Hilbert direct sum associated to `(u,v)`. -/
def separatedDirection (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ) :
    SeparatedSample ι κ :=
  WithLp.toLp 2 (u, v)

/-- The comparison process `Y_{uv} = ⟪g,u⟫ + ⟪h,v⟫`. -/
def separatedProcess (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ)
    (gh : SeparatedSample ι κ) : ℝ :=
  ⟪separatedDirection u v, gh⟫_ℝ

/-- The flattened definition is the matrix bilinear form `uᵀAv`. -/
theorem matrixBilinearProcess_eq_sum
    (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ) (A : MatrixSample ι κ) :
    matrixBilinearProcess u v A = ∑ i, ∑ j, A (i, j) * u i * v j := by
  rw [matrixBilinearProcess, rankOneVector, PiLp.inner_apply, Fintype.sum_prod_type]
  simp only [real_inner_eq_mul]
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro j hj
  change u i * v j * A (i, j) = A (i, j) * u i * v j
  ring

/-- The direct-sum definition expands to the two source projections. -/
theorem separatedProcess_eq
    (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ)
    (gh : SeparatedSample ι κ) :
    separatedProcess u v gh = ⟪gh.fst, u⟫_ℝ + ⟪gh.snd, v⟫_ℝ := by
  simp [separatedProcess, separatedDirection, WithLp.prod_inner_apply, real_inner_comm]

/-- Flattening preserves the squared Frobenius distance of rank-one
matrices. -/
theorem rankOneVector_sub_norm_sq
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ) :
    ‖rankOneVector u v - rankOneVector w z‖ ^ 2 =
      ‖rankOneMatrix u v - rankOneMatrix w z‖ ^ 2 := by
  rw [EuclideanSpace.real_norm_sq_eq]
  rw [frobenius_norm_sq_eq_sum]
  rw [Fintype.sum_prod_type]
  simp [rankOneVector, rankOneMatrix, Matrix.vecMulVec_apply]

/-- The Gaussian matrix family is a centered Gaussian process. -/
theorem matrixBilinear_isGaussianProcess :
    IsGaussianProcess
      (fun uv : EuclideanSpace ℝ ι × EuclideanSpace ℝ κ ↦
        matrixBilinearProcess uv.1 uv.2)
      (stdGaussian (MatrixSample ι κ)) := by
  simpa only [matrixBilinearProcess] using
    isGaussianProcess_inner_stdGaussian
      (fun uv : EuclideanSpace ℝ ι × EuclideanSpace ℝ κ ↦ rankOneVector uv.1 uv.2)

/-- The separated comparison family is a centered Gaussian process. -/
theorem separated_isGaussianProcess :
    IsGaussianProcess
      (fun uv : EuclideanSpace ℝ ι × EuclideanSpace ℝ κ ↦
        separatedProcess uv.1 uv.2)
      (stdGaussian (SeparatedSample ι κ)) := by
  simpa only [separatedProcess] using
    isGaussianProcess_inner_stdGaussian
      (fun uv : EuclideanSpace ℝ ι × EuclideanSpace ℝ κ ↦ separatedDirection uv.1 uv.2)

theorem matrixBilinear_centered (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ) :
    (∫ A, matrixBilinearProcess u v A ∂stdGaussian (MatrixSample ι κ)) = 0 :=
  integral_inner_stdGaussian (rankOneVector u v)

theorem separated_centered (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ) :
    (∫ gh, separatedProcess u v gh ∂stdGaussian (SeparatedSample ι κ)) = 0 :=
  integral_inner_stdGaussian (separatedDirection u v)

/-- Exact increment variance for the Gaussian matrix process. -/
theorem matrixBilinear_increment_variance
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ) :
    Var[fun A ↦ matrixBilinearProcess u v A - matrixBilinearProcess w z A;
        stdGaussian (MatrixSample ι κ)] =
      ‖rankOneMatrix u v - rankOneMatrix w z‖ ^ 2 := by
  rw [← rankOneVector_sub_norm_sq]
  have hfun :
      (fun A ↦ matrixBilinearProcess u v A - matrixBilinearProcess w z A) =
        fun A ↦ ⟪rankOneVector u v - rankOneVector w z, A⟫_ℝ := by
    funext A
    simp [matrixBilinearProcess, inner_sub_left]
  rw [hfun, variance_inner_stdGaussian]

/-- Exact increment variance for the separated comparison process. -/
theorem separated_increment_variance
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ) :
    Var[fun gh ↦ separatedProcess u v gh - separatedProcess w z gh;
        stdGaussian (SeparatedSample ι κ)] =
      ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 := by
  have hdir : separatedDirection u v - separatedDirection w z =
      separatedDirection (u - w) (v - z) := by
    apply WithLp.ofLp_injective
    rfl
  have hfun :
      (fun gh ↦ separatedProcess u v gh - separatedProcess w z gh) =
        fun gh ↦ ⟪separatedDirection u v - separatedDirection w z, gh⟫_ℝ := by
    funext gh
    simp [separatedProcess, inner_sub_left]
  rw [hfun, variance_inner_stdGaussian, hdir]
  simp [separatedDirection, WithLp.prod_norm_sq_eq_of_L2]

/-- Product of the two closed Euclidean unit balls. -/
def unitProduct : Set (EuclideanSpace ℝ ι × EuclideanSpace ℝ κ) :=
  Metric.closedBall 0 1 ×ˢ Metric.closedBall 0 1

private noncomputable def unitSupportPoint {F : Type*} [NormedAddCommGroup F]
    [InnerProductSpace ℝ F] (x : F) : F :=
  by
    classical
    exact if x = 0 then 0 else ‖x‖⁻¹ • x

private theorem unitSupportPoint_mem {F : Type*} [NormedAddCommGroup F]
    [InnerProductSpace ℝ F] (x : F) : unitSupportPoint x ∈ Metric.closedBall (0 : F) 1 := by
  by_cases hx : x = 0
  · simp [unitSupportPoint, hx]
  · simp [unitSupportPoint, Metric.mem_closedBall, norm_smul, hx]

private theorem inner_unitSupportPoint {F : Type*} [NormedAddCommGroup F]
    [InnerProductSpace ℝ F] (x : F) : ⟪unitSupportPoint x, x⟫_ℝ = ‖x‖ := by
  by_cases hx : x = 0
  · simp [unitSupportPoint, hx]
  · rw [unitSupportPoint, if_neg hx, real_inner_smul_left,
      real_inner_self_eq_norm_sq]
    field_simp [norm_ne_zero_iff.mpr hx]

/-- Pointwise supremum of the separated process over the two unit balls. -/
noncomputable def separatedSupport (gh : SeparatedSample ι κ) : ℝ :=
  sSup ((fun uv ↦ separatedProcess uv.1 uv.2 gh) '' unitProduct (ι := ι) (κ := κ))

/-- The separated support function is `‖g‖ + ‖h‖`. -/
theorem separatedSupport_eq (gh : SeparatedSample ι κ) :
    separatedSupport gh = ‖gh.fst‖ + ‖gh.snd‖ := by
  let S := (fun uv ↦ separatedProcess uv.1 uv.2 gh) '' unitProduct (ι := ι) (κ := κ)
  have hnonempty : S.Nonempty := by
    refine ⟨separatedProcess 0 0 gh, ⟨(0, 0), ?_, rfl⟩⟩
    simp [unitProduct]
  have hupper : ∀ r ∈ S, r ≤ ‖gh.fst‖ + ‖gh.snd‖ := by
    rintro r ⟨uv, huv, rfl⟩
    have hu : ‖uv.1‖ ≤ 1 := by simpa [unitProduct, Metric.mem_closedBall] using huv.1
    have hv : ‖uv.2‖ ≤ 1 := by simpa [unitProduct, Metric.mem_closedBall] using huv.2
    simp only [separatedProcess, separatedDirection, WithLp.prod_inner_apply]
    calc
      ⟪uv.1, gh.fst⟫_ℝ + ⟪uv.2, gh.snd⟫_ℝ ≤
          ‖uv.1‖ * ‖gh.fst‖ + ‖uv.2‖ * ‖gh.snd‖ :=
        add_le_add (real_inner_le_norm _ _) (real_inner_le_norm _ _)
      _ ≤ 1 * ‖gh.fst‖ + 1 * ‖gh.snd‖ := by gcongr
      _ = ‖gh.fst‖ + ‖gh.snd‖ := by ring
  have hbdd : BddAbove S := ⟨_, hupper⟩
  apply le_antisymm
  · exact csSup_le hnonempty hupper
  · apply le_csSup hbdd
    refine ⟨(unitSupportPoint gh.fst, unitSupportPoint gh.snd), ?_, ?_⟩
    · exact ⟨unitSupportPoint_mem _, unitSupportPoint_mem _⟩
    · simp [separatedProcess, separatedDirection, inner_unitSupportPoint]

/-- Taking expectation of the pointwise support identity gives
`E sup Y = E ‖g‖ + E ‖h‖`. -/
theorem integral_separatedSupport :
    (∫ gh, separatedSupport gh ∂stdGaussian (SeparatedSample ι κ)) =
      (∫ gh, ‖gh.fst‖ ∂stdGaussian (SeparatedSample ι κ)) +
        ∫ gh, ‖gh.snd‖ ∂stdGaussian (SeparatedSample ι κ) := by
  have hfst : Integrable (fun gh : SeparatedSample ι κ ↦ gh.fst)
      (stdGaussian (SeparatedSample ι κ)) :=
    ((IsGaussian.hasGaussianLaw_id
      (μ := stdGaussian (SeparatedSample ι κ))).map_fun (WithLp.fstL 2 ℝ _ _)).integrable
  have hsnd : Integrable (fun gh : SeparatedSample ι κ ↦ gh.snd)
      (stdGaussian (SeparatedSample ι κ)) :=
    ((IsGaussian.hasGaussianLaw_id
      (μ := stdGaussian (SeparatedSample ι κ))).map_fun (WithLp.sndL 2 ℝ _ _)).integrable
  simp_rw [separatedSupport_eq]
  exact integral_add hfst.norm hsnd.norm

/-- Gaussian matrix comparison support for the proof of Theorem 7.3.1.

It constructs the two centered Gaussian processes, computes both increment
variances, applies Exercise 7.3.2 to compare them on unit vectors, and
evaluates the separated supremum before and after expectation.

Source: Vershynin, proof of Theorem 7.3.1, printed pages 168--169
(`HDP-07-PROOF-7.3-COMPARISON`). -/
theorem gaussianMatrix_comparison :
    IsGaussianProcess
        (fun uv : EuclideanSpace ℝ ι × EuclideanSpace ℝ κ ↦
          matrixBilinearProcess uv.1 uv.2)
        (stdGaussian (MatrixSample ι κ)) ∧
      IsGaussianProcess
        (fun uv : EuclideanSpace ℝ ι × EuclideanSpace ℝ κ ↦
          separatedProcess uv.1 uv.2)
        (stdGaussian (SeparatedSample ι κ)) ∧
      (∀ (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ),
        (∫ A, matrixBilinearProcess u v A ∂stdGaussian (MatrixSample ι κ)) = 0) ∧
      (∀ (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ),
        (∫ gh, separatedProcess u v gh ∂stdGaussian (SeparatedSample ι κ)) = 0) ∧
      (∀ (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ),
        ‖u‖ = 1 → ‖w‖ = 1 → ‖v‖ = 1 → ‖z‖ = 1 →
          Var[fun A ↦ matrixBilinearProcess u v A - matrixBilinearProcess w z A;
              stdGaussian (MatrixSample ι κ)] =
              ‖rankOneMatrix u v - rankOneMatrix w z‖ ^ 2 ∧
          ‖rankOneMatrix u v - rankOneMatrix w z‖ ^ 2 ≤
              ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 ∧
          ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 =
            Var[fun gh ↦ separatedProcess u v gh - separatedProcess w z gh;
              stdGaussian (SeparatedSample ι κ)]) ∧
      (∀ gh : SeparatedSample ι κ,
        separatedSupport gh = ‖gh.fst‖ + ‖gh.snd‖) ∧
      (∫ gh, separatedSupport gh ∂stdGaussian (SeparatedSample ι κ)) =
        (∫ gh, ‖gh.fst‖ ∂stdGaussian (SeparatedSample ι κ)) +
          ∫ gh, ‖gh.snd‖ ∂stdGaussian (SeparatedSample ι κ) := by
  refine ⟨matrixBilinear_isGaussianProcess, separated_isGaussianProcess,
    matrixBilinear_centered, separated_centered, ?_, separatedSupport_eq,
    integral_separatedSupport⟩
  intro u w v z hu hw hv hz
  exact ⟨matrixBilinear_increment_variance u w v z,
    rankOneMatrix_dist_sq_le u w v z hu hw hv hz,
    (separated_increment_variance u w v z).symm⟩

end

end NumStability.HDP.Process.GaussianMatrices

namespace NumStability.HDP.Contract

/-- Stable source alias for `HDP-07-EX-7.3.2`. -/
theorem hdp_07_hex_h7_d3_d2
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ)
    (hu : ‖u‖ = 1) (hw : ‖w‖ = 1) (hv : ‖v‖ = 1) (hz : ‖z‖ = 1) :
    ‖Process.GaussianMatrices.rankOneMatrix u v -
        Process.GaussianMatrices.rankOneMatrix w z‖ ^ 2 ≤
      ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 :=
  Process.GaussianMatrices.rankOneMatrix_dist_sq_le u w v z hu hw hv hz

/-- Stable source alias for `HDP-07-PROOF-7.3-COMPARISON`. -/
theorem hdp_07_hproof_h7_d3_hcomparison
    {ι κ : Type*} [Fintype ι] [Fintype κ] :
    IsGaussianProcess
        (fun uv : EuclideanSpace ℝ ι × EuclideanSpace ℝ κ ↦
          Process.GaussianMatrices.matrixBilinearProcess uv.1 uv.2)
        (stdGaussian (Process.GaussianMatrices.MatrixSample ι κ)) ∧
      IsGaussianProcess
        (fun uv : EuclideanSpace ℝ ι × EuclideanSpace ℝ κ ↦
          Process.GaussianMatrices.separatedProcess uv.1 uv.2)
        (stdGaussian (Process.GaussianMatrices.SeparatedSample ι κ)) ∧
      (∀ (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ),
        (∫ A, Process.GaussianMatrices.matrixBilinearProcess u v A
          ∂stdGaussian (Process.GaussianMatrices.MatrixSample ι κ)) = 0) ∧
      (∀ (u : EuclideanSpace ℝ ι) (v : EuclideanSpace ℝ κ),
        (∫ gh, Process.GaussianMatrices.separatedProcess u v gh
          ∂stdGaussian (Process.GaussianMatrices.SeparatedSample ι κ)) = 0) ∧
      (∀ (u w : EuclideanSpace ℝ ι) (v z : EuclideanSpace ℝ κ),
        ‖u‖ = 1 → ‖w‖ = 1 → ‖v‖ = 1 → ‖z‖ = 1 →
          Var[fun A ↦ Process.GaussianMatrices.matrixBilinearProcess u v A -
                Process.GaussianMatrices.matrixBilinearProcess w z A;
              stdGaussian (Process.GaussianMatrices.MatrixSample ι κ)] =
              ‖Process.GaussianMatrices.rankOneMatrix u v -
                Process.GaussianMatrices.rankOneMatrix w z‖ ^ 2 ∧
          ‖Process.GaussianMatrices.rankOneMatrix u v -
                Process.GaussianMatrices.rankOneMatrix w z‖ ^ 2 ≤
              ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 ∧
          ‖u - w‖ ^ 2 + ‖v - z‖ ^ 2 =
            Var[fun gh ↦ Process.GaussianMatrices.separatedProcess u v gh -
                Process.GaussianMatrices.separatedProcess w z gh;
              stdGaussian (Process.GaussianMatrices.SeparatedSample ι κ)]) ∧
      (∀ gh : Process.GaussianMatrices.SeparatedSample ι κ,
        Process.GaussianMatrices.separatedSupport gh = ‖gh.fst‖ + ‖gh.snd‖) ∧
      (∫ gh, Process.GaussianMatrices.separatedSupport gh
          ∂stdGaussian (Process.GaussianMatrices.SeparatedSample ι κ)) =
        (∫ gh, ‖gh.fst‖
          ∂stdGaussian (Process.GaussianMatrices.SeparatedSample ι κ)) +
          ∫ gh, ‖gh.snd‖
            ∂stdGaussian (Process.GaussianMatrices.SeparatedSample ι κ) :=
  Process.GaussianMatrices.gaussianMatrix_comparison

end NumStability.HDP.Contract
