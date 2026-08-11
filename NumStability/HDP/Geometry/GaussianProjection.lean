import NumStability.HDP.Geometry.GaussianWidth
import NumStability.HDP.Process.GaussianMatrices
import NumStability.HDP.Source.Packages.Split3.BrownianFoundation.Gaussian.Gaussian
import Mathlib.Probability.Moments.SubGaussian

/-!
# Gaussian projection substrate

This module collects deterministic infrastructure used by the Chapter 7
Gaussian projection rows without changing the evidence-bound width module.
-/

open Set
open MeasureTheory ProbabilityTheory
open scoped BigOperators InnerProductSpace Pointwise

namespace NumStability.HDP.Geometry.GaussianProjection

/-- A centered real Gaussian random variable is sub-Gaussian with parameter
its variance, in Mathlib's MGF formulation. -/
theorem hasSubgaussianMGF_of_hasGaussianLaw_centered
    {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} {X : Ω → ℝ}
    (hX : HasGaussianLaw X P) (hmean : P[X] = 0) :
    HasSubgaussianMGF X (Var[X; P].toNNReal) P := by
  rw [← HasSubgaussianMGF.id_map_iff hX.aemeasurable]
  rw [hX.map_eq_gaussianReal, hmean]
  constructor
  · intro t
    exact integrable_exp_mul_gaussianReal t
  · intro t
    rw [mgf_id_gaussianReal]
    simp

/-- A standard Gaussian `m × n` matrix, represented as a flattened Euclidean
vector with independent scalar `N(0,1)` coordinates. -/
abbrev GaussianMatrixSample (m n : ℕ) :=
  EuclideanSpace ℝ (Fin m × Fin n)

/-- The standard Gaussian law on flattened `m × n` matrix samples. -/
noncomputable abbrev standardGaussianMatrix (m n : ℕ) :
    Measure (GaussianMatrixSample m n) :=
  stdGaussian (GaussianMatrixSample m n)

/-- Matrix-vector multiplication by a flattened Gaussian matrix. -/
noncomputable def gaussianMatrixMul {m n : ℕ}
    (G : GaussianMatrixSample m n) (x : EuclideanSpace ℝ (Fin n)) :
    EuclideanSpace ℝ (Fin m) :=
  WithLp.toLp 2 (fun i ↦ ∑ j, G (i, j) * x j)

/-- The flattened rank-one direction for the scalar projection
`⟪z, Gx⟫`. -/
def gaussianMatrixProjectionDirection {m n : ℕ}
    (z : EuclideanSpace ℝ (Fin m)) (x : EuclideanSpace ℝ (Fin n)) :
    GaussianMatrixSample m n :=
  WithLp.toLp 2 (fun p ↦ z p.1 * x p.2)

private theorem real_inner_eq_mul (a b : ℝ) : ⟪a, b⟫_ℝ = a * b := by
  rw [show a = a • (1 : ℝ) by simp, show b = b • (1 : ℝ) by simp]
  simp only [real_inner_smul_left, real_inner_smul_right]
  simp [mul_comm]

/-- Scalar projections of `Gx` are linear functionals of the flattened
Gaussian matrix. -/
theorem inner_gaussianMatrixMul_eq_inner_projectionDirection {m n : ℕ}
    (G : GaussianMatrixSample m n)
    (z : EuclideanSpace ℝ (Fin m)) (x : EuclideanSpace ℝ (Fin n)) :
    ⟪z, gaussianMatrixMul G x⟫_ℝ =
      ⟪gaussianMatrixProjectionDirection z x, G⟫_ℝ := by
  rw [gaussianMatrixMul, gaussianMatrixProjectionDirection]
  simp only [PiLp.inner_apply, Fintype.sum_prod_type, real_inner_eq_mul]
  calc
    ∑ i, z i * ∑ j, G (i, j) * x j =
        ∑ i, ∑ j, z i * (G (i, j) * x j) := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [Finset.mul_sum]
    _ = ∑ i, ∑ j, z i * x j * G (i, j) := by
      apply Finset.sum_congr rfl
      intro i hi
      apply Finset.sum_congr rfl
      intro j hj
      ring

/-- The scalar family `(z,x,G) ↦ ⟪z,Gx⟫` is a Gaussian process under the
standard Gaussian matrix law. -/
theorem gaussianMatrixProjection_isGaussianProcess {m n : ℕ} :
    IsGaussianProcess
      (fun zx : EuclideanSpace ℝ (Fin m) × EuclideanSpace ℝ (Fin n) ↦
        fun G : GaussianMatrixSample m n ↦ ⟪zx.1, gaussianMatrixMul G zx.2⟫_ℝ)
      (standardGaussianMatrix m n) := by
  refine (Process.GaussianMatrices.isGaussianProcess_inner_stdGaussian
    (fun zx : EuclideanSpace ℝ (Fin m) × EuclideanSpace ℝ (Fin n) ↦
      gaussianMatrixProjectionDirection zx.1 zx.2)).congr ?_
  intro zx
  filter_upwards with G
  exact (inner_gaussianMatrixMul_eq_inner_projectionDirection G zx.1 zx.2).symm

/-- Each scalar projection of a standard Gaussian matrix has a Gaussian law. -/
theorem gaussianMatrixProjection_hasGaussianLaw {m n : ℕ}
    (z : EuclideanSpace ℝ (Fin m)) (x : EuclideanSpace ℝ (Fin n)) :
    HasGaussianLaw (fun G : GaussianMatrixSample m n ↦ ⟪z, gaussianMatrixMul G x⟫_ℝ)
      (standardGaussianMatrix m n) :=
  gaussianMatrixProjection_isGaussianProcess.hasGaussianLaw_eval (z, x)

/-- Scalar Gaussian matrix projections are centered. -/
theorem integral_gaussianMatrixProjection {m n : ℕ}
    (z : EuclideanSpace ℝ (Fin m)) (x : EuclideanSpace ℝ (Fin n)) :
    (∫ G : GaussianMatrixSample m n, ⟪z, gaussianMatrixMul G x⟫_ℝ
      ∂standardGaussianMatrix m n) = 0 := by
  rw [standardGaussianMatrix]
  have hcongr :
      (fun G : GaussianMatrixSample m n ↦ ⟪z, gaussianMatrixMul G x⟫_ℝ) =ᵐ[
        stdGaussian (GaussianMatrixSample m n)]
        (fun G : GaussianMatrixSample m n ↦
          ⟪gaussianMatrixProjectionDirection z x, G⟫_ℝ) := by
    exact ae_of_all _ fun G ↦ inner_gaussianMatrixMul_eq_inner_projectionDirection G z x
  rw [integral_congr_ae hcongr]
  exact Process.GaussianMatrices.integral_inner_stdGaussian
    (gaussianMatrixProjectionDirection z x)

/-- Variance of a scalar Gaussian matrix projection, expressed by its
flattened rank-one direction. -/
theorem variance_gaussianMatrixProjection {m n : ℕ}
    (z : EuclideanSpace ℝ (Fin m)) (x : EuclideanSpace ℝ (Fin n)) :
    Var[fun G : GaussianMatrixSample m n ↦ ⟪z, gaussianMatrixMul G x⟫_ℝ;
      standardGaussianMatrix m n] =
      ‖gaussianMatrixProjectionDirection z x‖ ^ 2 := by
  rw [standardGaussianMatrix]
  have hcongr :
      (fun G : GaussianMatrixSample m n ↦ ⟪z, gaussianMatrixMul G x⟫_ℝ) =ᵐ[
        stdGaussian (GaussianMatrixSample m n)]
        (fun G : GaussianMatrixSample m n ↦
          ⟪gaussianMatrixProjectionDirection z x, G⟫_ℝ) := by
    exact ae_of_all _ fun G ↦ inner_gaussianMatrixMul_eq_inner_projectionDirection G z x
  exact (variance_congr hcongr).trans
    (Process.GaussianMatrices.variance_inner_stdGaussian
      (gaussianMatrixProjectionDirection z x))

/-- Scalar projections of a standard Gaussian matrix are sub-Gaussian with
their exact variance parameter. -/
theorem gaussianMatrixProjection_hasSubgaussianMGF {m n : ℕ}
    (z : EuclideanSpace ℝ (Fin m)) (x : EuclideanSpace ℝ (Fin n)) :
    HasSubgaussianMGF
      (fun G : GaussianMatrixSample m n ↦ ⟪z, gaussianMatrixMul G x⟫_ℝ)
      (Var[fun G : GaussianMatrixSample m n ↦ ⟪z, gaussianMatrixMul G x⟫_ℝ;
        standardGaussianMatrix m n].toNNReal)
      (standardGaussianMatrix m n) :=
  hasSubgaussianMGF_of_hasGaussianLaw_centered
    (gaussianMatrixProjection_hasGaussianLaw z x)
    (integral_gaussianMatrixProjection z x)

/-- One-sided Chernoff tail bound for a scalar Gaussian matrix projection. -/
theorem gaussianMatrixProjection_measure_ge_le {m n : ℕ}
    (z : EuclideanSpace ℝ (Fin m)) (x : EuclideanSpace ℝ (Fin n))
    {ε : ℝ} (hε : 0 ≤ ε) :
    (standardGaussianMatrix m n).real
        {G : GaussianMatrixSample m n | ε ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ} ≤
      Real.exp
        (-ε ^ 2 /
          (2 *
            (Var[fun G : GaussianMatrixSample m n ↦ ⟪z, gaussianMatrixMul G x⟫_ℝ;
              standardGaussianMatrix m n].toNNReal))) :=
  (gaussianMatrixProjection_hasSubgaussianMGF z x).measure_ge_le hε

/-- Finite union bound for scalar projection tail events indexed by a finite
net in the range and a finite set in the source. -/
theorem gaussianMatrixProjection_finset_exists_tail_le {m n : ℕ}
    (N : Finset (EuclideanSpace ℝ (Fin m)))
    (S : Finset (EuclideanSpace ℝ (Fin n)))
    {ε : ℝ} (hε : 0 ≤ ε) :
    (standardGaussianMatrix m n).real
        {G : GaussianMatrixSample m n |
          ∃ z ∈ N, ∃ x ∈ S, ε ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ} ≤
      ∑ z ∈ N, ∑ x ∈ S,
        Real.exp
          (-ε ^ 2 /
            (2 *
              (Var[fun G : GaussianMatrixSample m n ↦
                ⟪z, gaussianMatrixMul G x⟫_ℝ;
                standardGaussianMatrix m n].toNNReal))) := by
  calc
    (standardGaussianMatrix m n).real
        {G : GaussianMatrixSample m n |
          ∃ z ∈ N, ∃ x ∈ S, ε ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ}
        =
      (standardGaussianMatrix m n).real
        (⋃ z ∈ N, ⋃ x ∈ S,
          {G : GaussianMatrixSample m n |
            ε ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ}) := by
        congr 1
        ext G
        simp
    _ ≤
      ∑ z ∈ N,
        (standardGaussianMatrix m n).real
          (⋃ x ∈ S,
            {G : GaussianMatrixSample m n |
              ε ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ}) :=
        measureReal_biUnion_finset_le N
          (fun z ↦ ⋃ x ∈ S,
            {G : GaussianMatrixSample m n |
              ε ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ})
    _ ≤
      ∑ z ∈ N, ∑ x ∈ S,
        (standardGaussianMatrix m n).real
          {G : GaussianMatrixSample m n |
            ε ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ} := by
        gcongr with z hz
        exact measureReal_biUnion_finset_le S
          (fun x ↦
            {G : GaussianMatrixSample m n |
              ε ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ})
    _ ≤
      ∑ z ∈ N, ∑ x ∈ S,
        Real.exp
          (-ε ^ 2 /
            (2 *
              (Var[fun G : GaussianMatrixSample m n ↦
                ⟪z, gaussianMatrixMul G x⟫_ℝ;
                standardGaussianMatrix m n].toNNReal))) := by
        gcongr with z hz x hx
        exact gaussianMatrixProjection_measure_ge_le z x hε

/-- Image of a set under a flattened Gaussian matrix. -/
noncomputable def gaussianMatrixImage {m n : ℕ}
    (G : GaussianMatrixSample m n) (T : Set (EuclideanSpace ℝ (Fin n))) :
    Set (EuclideanSpace ℝ (Fin m)) :=
  gaussianMatrixMul G '' T

/-- Diameter of a Gaussian image, using Mathlib's metric diameter convention. -/
noncomputable def gaussianMatrixImageDiameter {m n : ℕ}
    (G : GaussianMatrixSample m n) (T : Set (EuclideanSpace ℝ (Fin n))) : ℝ :=
  Metric.diam (gaussianMatrixImage G T)

theorem gaussianMatrixMul_sub {m n : ℕ}
    (G : GaussianMatrixSample m n)
    (x y : EuclideanSpace ℝ (Fin n)) :
    gaussianMatrixMul G (x - y) = gaussianMatrixMul G x - gaussianMatrixMul G y := by
  ext i
  simp only [gaussianMatrixMul, PiLp.toLp_apply]
  calc
    ∑ j, G (i, j) * (x j - y j) =
        ∑ j, (G (i, j) * x j - G (i, j) * y j) := by
      apply Finset.sum_congr rfl
      intro j hj
      ring
    _ = ∑ j, G (i, j) * x j - ∑ j, G (i, j) * y j := by
      rw [Finset.sum_sub_distrib]

theorem gaussianMatrixImageDiameter_le_difference_sup {m n : ℕ}
    (G : GaussianMatrixSample m n) (T : Set (EuclideanSpace ℝ (Fin n)))
    (R : ℝ) (hR0 : 0 ≤ R)
    (hR : ∀ z ∈ (T - T : Set (EuclideanSpace ℝ (Fin n))), ‖gaussianMatrixMul G z‖ ≤ R) :
    gaussianMatrixImageDiameter G T ≤ R := by
  rw [gaussianMatrixImageDiameter]
  refine Metric.diam_le_of_forall_dist_le hR0 ?_
  rintro _ ⟨x, hx, rfl⟩ _ ⟨y, hy, rfl⟩
  rw [dist_eq_norm, ← gaussianMatrixMul_sub]
  exact hR (x - y) ⟨x, hx, y, hy, rfl⟩

/-- A finite half-net of the Euclidean unit sphere. -/
def IsHalfNetOfUnitSphere {m : ℕ}
    (N : Finset (EuclideanSpace ℝ (Fin m))) : Prop :=
  ∀ u : EuclideanSpace ℝ (Fin m), ‖u‖ = 1 →
    ∃ z ∈ N, ‖u - z‖ ≤ (1 / 2 : ℝ)

/-- A half-net on the unit sphere controls the norm by finitely many scalar
projections.  This is the deterministic core of the net step used in the
random-projection proof. -/
theorem norm_le_two_finset_sup_halfNet {m : ℕ}
    {N : Finset (EuclideanSpace ℝ (Fin m))} (hNne : N.Nonempty)
    (hN : IsHalfNetOfUnitSphere N) (y : EuclideanSpace ℝ (Fin m)) :
    ‖y‖ ≤ 2 * N.sup' hNne (fun z ↦ ⟪z, y⟫_ℝ) := by
  by_cases hy : y = 0
  · have hNne' := hNne
    obtain ⟨z, hz⟩ := hNne'
    have hle : (0 : ℝ) ≤ N.sup' hNne (fun z ↦ ⟪z, y⟫_ℝ) := by
      have hz0 : ⟪z, y⟫_ℝ = 0 := by simp [hy]
      rw [← hz0]
      exact Finset.le_sup' (s := N) (f := fun z ↦ ⟪z, y⟫_ℝ) hz
    have hnorm : ‖y‖ = 0 := by simp [hy]
    nlinarith
  · let u : EuclideanSpace ℝ (Fin m) := ‖y‖⁻¹ • y
    have hynorm : ‖y‖ ≠ 0 := norm_ne_zero_iff.mpr hy
    have hu : ‖u‖ = 1 := by
      simp [u, norm_smul, hynorm]
    obtain ⟨z, hzN, hzdist⟩ := hN u hu
    have hinner_u : ⟪u, y⟫_ℝ = ‖y‖ := by
      change ⟪‖y‖⁻¹ • y, y⟫_ℝ = ‖y‖
      rw [real_inner_smul_left, real_inner_self_eq_norm_sq]
      field_simp [hynorm]
    have hstep : ‖y‖ ≤ ⟪z, y⟫_ℝ + (1 / 2 : ℝ) * ‖y‖ := by
      calc
        ‖y‖ = ⟪u, y⟫_ℝ := hinner_u.symm
        _ = ⟪z, y⟫_ℝ + ⟪u - z, y⟫_ℝ := by
          rw [inner_sub_left]
          ring
        _ ≤ ⟪z, y⟫_ℝ + ‖u - z‖ * ‖y‖ := by
          simpa [add_comm, add_left_comm, add_assoc] using
            add_le_add_left (real_inner_le_norm (u - z) y) ⟪z, y⟫_ℝ
        _ ≤ ⟪z, y⟫_ℝ + (1 / 2 : ℝ) * ‖y‖ := by
          gcongr
    have hhalf : (1 / 2 : ℝ) * ‖y‖ ≤ ⟪z, y⟫_ℝ := by
      nlinarith
    have hzs : ⟪z, y⟫_ℝ ≤ N.sup' hNne (fun z ↦ ⟪z, y⟫_ℝ) :=
      Finset.le_sup' (s := N) (f := fun z ↦ ⟪z, y⟫_ℝ) hzN
    nlinarith

/-- If every scalar projection indexed by a half-net is bounded on `T - T`,
then the Gaussian image diameter is bounded by twice that scalar envelope. -/
theorem gaussianMatrixImageDiameter_le_two_halfNet_projection_bound {m n : ℕ}
    (G : GaussianMatrixSample m n) (T : Set (EuclideanSpace ℝ (Fin n)))
    {N : Finset (EuclideanSpace ℝ (Fin m))} (hNne : N.Nonempty)
    (hN : IsHalfNetOfUnitSphere N) (A : ℝ) (hA0 : 0 ≤ A)
    (hA : ∀ z ∈ N, ∀ x ∈ (T - T : Set (EuclideanSpace ℝ (Fin n))),
      ⟪z, gaussianMatrixMul G x⟫_ℝ ≤ A) :
    gaussianMatrixImageDiameter G T ≤ 2 * A := by
  refine gaussianMatrixImageDiameter_le_difference_sup G T (2 * A)
    (mul_nonneg (by norm_num) hA0) ?_
  intro x hx
  calc
    ‖gaussianMatrixMul G x‖ ≤
        2 * N.sup' hNne (fun z ↦ ⟪z, gaussianMatrixMul G x⟫_ℝ) :=
      norm_le_two_finset_sup_halfNet hNne hN (gaussianMatrixMul G x)
    _ ≤ 2 * A := by
      gcongr
      rw [Finset.sup'_le_iff]
      exact fun z hz ↦ hA z hz x hx

/-- A finite cover of `T - T`, together with scalar control on a half-net,
controls the Gaussian image diameter. -/
theorem gaussianMatrixImageDiameter_le_two_halfNet_finite_cover {m n : ℕ}
    (G : GaussianMatrixSample m n) (T : Set (EuclideanSpace ℝ (Fin n)))
    {N : Finset (EuclideanSpace ℝ (Fin m))} (hNne : N.Nonempty)
    (hN : IsHalfNetOfUnitSphere N)
    (D : Finset (EuclideanSpace ℝ (Fin n))) (A : ℝ) (hA0 : 0 ≤ A)
    (hD : ∀ x ∈ (T - T : Set (EuclideanSpace ℝ (Fin n))), x ∈ D)
    (hA : ∀ z ∈ N, ∀ x ∈ D, ⟪z, gaussianMatrixMul G x⟫_ℝ ≤ A) :
    gaussianMatrixImageDiameter G T ≤ 2 * A := by
  refine gaussianMatrixImageDiameter_le_two_halfNet_projection_bound G T hNne hN A hA0 ?_
  intro z hz x hx
  exact hA z hz x (hD x hx)

/-- If the image diameter exceeds the finite-net scalar envelope, then some
scalar projection indexed by the net and finite difference cover is large. -/
theorem gaussianMatrixImageDiameter_gt_subset_finset_exists_projection_tail {m n : ℕ}
    (T : Set (EuclideanSpace ℝ (Fin n)))
    {N : Finset (EuclideanSpace ℝ (Fin m))} (hNne : N.Nonempty)
    (hN : IsHalfNetOfUnitSphere N)
    (D : Finset (EuclideanSpace ℝ (Fin n))) {A : ℝ} (hA0 : 0 ≤ A)
    (hD : ∀ x ∈ (T - T : Set (EuclideanSpace ℝ (Fin n))), x ∈ D) :
    {G : GaussianMatrixSample m n | 2 * A < gaussianMatrixImageDiameter G T} ⊆
      {G : GaussianMatrixSample m n |
        ∃ z ∈ N, ∃ x ∈ D, A < ⟪z, gaussianMatrixMul G x⟫_ℝ} := by
  intro G hdiam
  by_contra hnone
  have hA :
      ∀ z ∈ N, ∀ x ∈ D, ⟪z, gaussianMatrixMul G x⟫_ℝ ≤ A := by
    intro z hz x hxD
    by_contra hx
    exact hnone ⟨z, hz, x, hxD, lt_of_not_ge hx⟩
  have hle :
      gaussianMatrixImageDiameter G T ≤ 2 * A :=
    gaussianMatrixImageDiameter_le_two_halfNet_finite_cover G T hNne hN D A hA0 hD hA
  exact not_lt_of_ge hle hdiam

/-- Finite-net diameter tail bound obtained by combining the deterministic
half-net bridge with the scalar Gaussian projection union bound. -/
theorem gaussianMatrixImageDiameter_gt_measure_le_finset {m n : ℕ}
    (T : Set (EuclideanSpace ℝ (Fin n)))
    {N : Finset (EuclideanSpace ℝ (Fin m))} (hNne : N.Nonempty)
    (hN : IsHalfNetOfUnitSphere N)
    (D : Finset (EuclideanSpace ℝ (Fin n))) {A : ℝ} (hA0 : 0 ≤ A)
    (hD : ∀ x ∈ (T - T : Set (EuclideanSpace ℝ (Fin n))), x ∈ D) :
    (standardGaussianMatrix m n).real
        {G : GaussianMatrixSample m n | 2 * A < gaussianMatrixImageDiameter G T} ≤
      ∑ z ∈ N, ∑ x ∈ D,
        Real.exp
          (-A ^ 2 /
            (2 *
              (Var[fun G : GaussianMatrixSample m n ↦
                ⟪z, gaussianMatrixMul G x⟫_ℝ;
                standardGaussianMatrix m n].toNNReal))) := by
  calc
    (standardGaussianMatrix m n).real
        {G : GaussianMatrixSample m n | 2 * A < gaussianMatrixImageDiameter G T}
      ≤
      (standardGaussianMatrix m n).real
        {G : GaussianMatrixSample m n |
          ∃ z ∈ N, ∃ x ∈ D, A ≤ ⟪z, gaussianMatrixMul G x⟫_ℝ} := by
        refine measureReal_mono ?_
        intro G hG
        obtain ⟨z, hz, x, hxD, hx⟩ :=
          gaussianMatrixImageDiameter_gt_subset_finset_exists_projection_tail
            T hNne hN D hA0 hD hG
        exact ⟨z, hz, x, hxD, le_of_lt hx⟩
    _ ≤
      ∑ z ∈ N, ∑ x ∈ D,
        Real.exp
          (-A ^ 2 /
            (2 *
              (Var[fun G : GaussianMatrixSample m n ↦
                ⟪z, gaussianMatrixMul G x⟫_ℝ;
                standardGaussianMatrix m n].toNNReal))) :=
        gaussianMatrixProjection_finset_exists_tail_le N D hA0

end NumStability.HDP.Geometry.GaussianProjection
