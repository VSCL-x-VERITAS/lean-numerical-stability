import NumStability.HDP.RandomVector.Distributions
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.Probability.Independence.Basic

namespace NumStability.HDP.RandomVector.SphericalUniform

open MeasureTheory

/-- A law admitted by the spherical-uniform interface is finite, since the
interface records total mass one. -/
theorem isFiniteMeasure_of_mem_sphericalUniform {n : ℕ} {r : ℝ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n r surface) :
    IsFiniteMeasure μ := by
  refine ⟨?_⟩
  rw [hμ.2.1]
  exact ENNReal.one_lt_top

/-- The Euclidean sphere used by the spherical-uniform interface is measurable. -/
theorem measurableSet_euclideanSphere (n : ℕ) (r : ℝ) :
    MeasurableSet (Distributions.euclideanSphere n r) := by
  exact (isClosed_eq continuous_norm continuous_const).measurableSet

/-- The spherical-uniform support clause gives almost-sure membership in the
corresponding Euclidean sphere. -/
theorem ae_mem_euclideanSphere_of_mem_sphericalUniform {n : ℕ} {r : ℝ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n r surface) :
    ∀ᵐ x ∂μ, x ∈ Distributions.euclideanSphere n r := by
  haveI : IsFiniteMeasure μ := isFiniteMeasure_of_mem_sphericalUniform hμ
  rw [ae_mem_iff_measure_eq (measurableSet_euclideanSphere n r).nullMeasurableSet]
  rw [hμ.2.2.1, hμ.2.1]

/-- Under the spherical-uniform law, the Euclidean norm is almost surely the
radius parameter. -/
theorem ae_norm_eq_radius_of_mem_sphericalUniform {n : ℕ} {r : ℝ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n r surface) :
    ∀ᵐ x ∂μ, ‖x‖ = r := by
  exact (ae_mem_euclideanSphere_of_mem_sphericalUniform hμ).mono fun _ hx => hx

/-- The radius equality supplies the almost-sure norm bound needed for finite
coordinate moments. -/
theorem ae_norm_le_radius_of_mem_sphericalUniform {n : ℕ} {r : ℝ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n r surface) :
    ∀ᵐ x ∂μ, ‖x‖ ≤ r := by
  exact (ae_norm_eq_radius_of_mem_sphericalUniform hμ).mono fun _ hx => le_of_eq hx

/-- Coordinate projections have all finite `L^p` moments under any finite law
that is almost surely bounded in Euclidean norm. -/
theorem coordinate_memLp_of_ae_norm_le {n : ℕ}
    {μ : Measure (EuclideanSpace ℝ (Fin n))} [IsFiniteMeasure μ]
    (i : Fin n) (p : ENNReal) {R : ℝ}
    (hbound : ∀ᵐ x ∂μ, ‖x‖ ≤ R) :
    MemLp (fun x : EuclideanSpace ℝ (Fin n) => x i) p μ := by
  refine MemLp.of_bound ?_ R ?_
  · exact
      (PiLp.continuous_apply (p := (2 : ENNReal))
        (β := fun _ : Fin n => ℝ) i).aestronglyMeasurable
  · filter_upwards [hbound] with x hx
    exact (PiLp.norm_apply_le (p := 2) x i).trans hx

/-- The moment part of Exercise 3.3.1 reduces to the standard support fact
`‖X‖ ≤ sqrt n` for the normalized spherical law. -/
theorem coordinate_memLp_two_of_sphericalUniform {n : ℕ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (i : Fin n)
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface) :
    MemLp (fun x : EuclideanSpace ℝ (Fin n) => x i) 2 μ := by
  haveI : IsFiniteMeasure μ := isFiniteMeasure_of_mem_sphericalUniform hμ
  exact coordinate_memLp_of_ae_norm_le i 2
    (ae_norm_le_radius_of_mem_sphericalUniform hμ)

/-- On the `sqrt n` sphere, the sum of coordinate squares is almost surely
equal to `n`.  This is the deterministic identity used in the eventual
coordinate-dependence argument. -/
theorem ae_sum_coordinate_sq_eq_of_sphericalUniform {n : ℕ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface) :
    ∀ᵐ x ∂μ, (∑ i : Fin n, (x i) ^ 2) = (n : ℝ) := by
  refine (ae_norm_eq_radius_of_mem_sphericalUniform hμ).mono ?_
  intro x hx
  have hnorm_sq : ‖x‖ ^ 2 = (Real.sqrt (n : ℝ)) ^ 2 := by
    rw [hx]
  rw [EuclideanSpace.norm_sq_eq] at hnorm_sq
  have hsqrt : (Real.sqrt (n : ℝ)) ^ 2 = (n : ℝ) :=
    Real.sq_sqrt (Nat.cast_nonneg n)
  calc
    (∑ i : Fin n, (x i) ^ 2) = ∑ i : Fin n, ‖x i‖ ^ 2 := by
      simp [Real.norm_eq_abs, sq_abs]
    _ = (Real.sqrt (n : ℝ)) ^ 2 := hnorm_sq
    _ = (n : ℝ) := hsqrt

/-- The coordinate-permutation linear isometry on Euclidean space. -/
noncomputable def coordinatePermutation {n : ℕ} (e : Fin n ≃ Fin n) :
    EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n) :=
  LinearIsometryEquiv.piLpCongrLeft (2 : ENNReal) ℝ ℝ e

/-- Coordinate formula for `coordinatePermutation`. -/
theorem coordinatePermutation_apply {n : ℕ} (e : Fin n ≃ Fin n)
    (x : EuclideanSpace ℝ (Fin n)) (k : Fin n) :
    coordinatePermutation e x k = x (e.symm k) := by
  simp [coordinatePermutation, LinearIsometryEquiv.piLpCongrLeft_apply,
    Equiv.piCongrLeft']

/-- Coordinate permutations preserve the Euclidean norm. -/
theorem coordinatePermutation_normPreserving {n : ℕ} (e : Fin n ≃ Fin n) :
    Distributions.normPreserving (coordinatePermutation e) := by
  intro x
  exact (LinearIsometryEquiv.piLpCongrLeft (2 : ENNReal) ℝ ℝ e).norm_map x

/-- The spherical-uniform interface is invariant under coordinate
permutations. -/
theorem map_coordinatePermutation_of_mem_sphericalUniform {n : ℕ} {r : ℝ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n r surface)
    (e : Fin n ≃ Fin n) :
    Measure.map (coordinatePermutation e) μ = μ :=
  hμ.2.2.2.2.1 (coordinatePermutation e)
    (coordinatePermutation_normPreserving e)

/-- The coordinate-square functions are integrable under the normalized
`sqrt n` spherical law. -/
theorem integrable_coordinate_sq_of_sphericalUniform {n : ℕ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (i : Fin n)
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface) :
    Integrable (fun x : EuclideanSpace ℝ (Fin n) => (x i) ^ 2) μ :=
  (coordinate_memLp_two_of_sphericalUniform i hμ).integrable_sq

/-- Rotation invariance implies that all coordinate second moments agree. -/
theorem integral_coordinate_sq_eq_of_sphericalUniform {n : ℕ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface)
    (i j : Fin n) :
    ∫ x, (x i) ^ 2 ∂μ = ∫ x, (x j) ^ 2 ∂μ := by
  let e : Fin n ≃ Fin n := Equiv.swap i j
  have hmap : Measure.map (coordinatePermutation e) μ = μ :=
    map_coordinatePermutation_of_mem_sphericalUniform hμ e
  have hφ : AEMeasurable (coordinatePermutation e) μ :=
    (LinearIsometryEquiv.piLpCongrLeft (2 : ENNReal) ℝ ℝ e).continuous.aemeasurable
  have hf : AEStronglyMeasurable
      (fun x : EuclideanSpace ℝ (Fin n) => (x j) ^ 2)
      (Measure.map (coordinatePermutation e) μ) := by
    exact (((PiLp.continuous_apply (p := (2 : ENNReal))
      (β := fun _ : Fin n => ℝ) j).pow 2).aestronglyMeasurable)
  symm
  calc
    ∫ x, (x j) ^ 2 ∂μ =
        ∫ x, (x j) ^ 2 ∂Measure.map (coordinatePermutation e) μ := by
          rw [hmap]
    _ = ∫ x, ((coordinatePermutation e x) j) ^ 2 ∂μ := by
          rw [integral_map hφ hf]
    _ = ∫ x, (x i) ^ 2 ∂μ := by
          refine integral_congr_ae ?_
          filter_upwards with x
          simp [coordinatePermutation_apply, e]

/-- The trace identity plus permutation invariance gives unit coordinate
second moments on `sqrt n S^{n-1}`. -/
theorem integral_coordinate_sq_eq_one_of_sphericalUniform {n : ℕ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hn : 0 < n)
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface)
    (i : Fin n) :
    ∫ x, (x i) ^ 2 ∂μ = 1 := by
  have hsum_integral :
      ∫ x, (∑ j : Fin n, (x j) ^ 2) ∂μ =
        ∑ j : Fin n, ∫ x, (x j) ^ 2 ∂μ := by
    rw [integral_finset_sum]
    intro j _hj
    exact integrable_coordinate_sq_of_sphericalUniform j hμ
  have htrace :
      ∫ x, (∑ j : Fin n, (x j) ^ 2) ∂μ = (n : ℝ) := by
    rw [integral_congr_ae (ae_sum_coordinate_sq_eq_of_sphericalUniform hμ)]
    simp [integral_const, Measure.real, hμ.2.1]
  have hsum :
      ∑ j : Fin n, ∫ x, (x j) ^ 2 ∂μ = (n : ℝ) := by
    rw [← hsum_integral, htrace]
  have hsame :
      (∑ j : Fin n, ∫ x, (x j) ^ 2 ∂μ) =
        ∑ _j : Fin n, ∫ x, (x i) ^ 2 ∂μ := by
    refine Finset.sum_congr rfl ?_
    intro j _hj
    exact integral_coordinate_sq_eq_of_sphericalUniform hμ j i
  have hcard :
      (∑ _j : Fin n, ∫ x, (x i) ^ 2 ∂μ) =
        (n : ℝ) * ∫ x, (x i) ^ 2 ∂μ := by
    simp
  have hmul : (n : ℝ) * ∫ x, (x i) ^ 2 ∂μ = (n : ℝ) := by
    rw [← hcard, ← hsame, hsum]
  have hmul' : (n : ℝ) * ∫ x, (x i) ^ 2 ∂μ = (n : ℝ) * 1 := by
    simpa using hmul
  have hnreal : (n : ℝ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt hn
  exact (mul_eq_mul_left_iff.mp hmul').resolve_right hnreal

/-- The coordinate sign-flip linear isometry. -/
noncomputable def coordinateSignFlip {n : ℕ} (i : Fin n) :
    EuclideanSpace ℝ (Fin n) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin n) :=
  LinearIsometryEquiv.piLpCongrRight (2 : ENNReal)
    (fun k : Fin n =>
      if k = i then LinearIsometryEquiv.neg ℝ else LinearIsometryEquiv.refl ℝ ℝ)

/-- Coordinate formula for `coordinateSignFlip`. -/
theorem coordinateSignFlip_apply {n : ℕ} (i : Fin n)
    (x : EuclideanSpace ℝ (Fin n)) (k : Fin n) :
    coordinateSignFlip i x k = if k = i then -x k else x k := by
  by_cases h : k = i
  · simp [coordinateSignFlip, h]
  · simp [coordinateSignFlip, h]

/-- Coordinate sign flips preserve the Euclidean norm. -/
theorem coordinateSignFlip_normPreserving {n : ℕ} (i : Fin n) :
    Distributions.normPreserving (coordinateSignFlip i) := by
  intro x
  exact (coordinateSignFlip i).norm_map x

/-- The spherical-uniform interface is invariant under coordinate sign flips. -/
theorem map_coordinateSignFlip_of_mem_sphericalUniform {n : ℕ} {r : ℝ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n r surface)
    (i : Fin n) :
    Measure.map (coordinateSignFlip i) μ = μ :=
  hμ.2.2.2.2.1 (coordinateSignFlip i)
    (coordinateSignFlip_normPreserving i)

/-- Products of two coordinate projections are integrable under the normalized
`sqrt n` spherical law. -/
theorem integrable_coordinate_mul_of_sphericalUniform {n : ℕ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface)
    (i j : Fin n) :
    Integrable (fun x : EuclideanSpace ℝ (Fin n) => x i * x j) μ := by
  have hi := coordinate_memLp_two_of_sphericalUniform i hμ
  have hj := coordinate_memLp_two_of_sphericalUniform j hμ
  simpa [Pi.mul_apply] using (hi.integrable_mul hj)

/-- Sign-flip invariance forces off-diagonal coordinate second moments to
vanish. -/
theorem integral_coordinate_mul_eq_zero_of_sphericalUniform {n : ℕ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface)
    {i j : Fin n} (hij : i ≠ j) :
    ∫ x, x i * x j ∂μ = 0 := by
  let T := coordinateSignFlip i
  have hmap : Measure.map T μ = μ :=
    map_coordinateSignFlip_of_mem_sphericalUniform hμ i
  have hφ : AEMeasurable T μ := T.continuous.aemeasurable
  have hf : AEStronglyMeasurable
      (fun x : EuclideanSpace ℝ (Fin n) => x i * x j)
      (Measure.map T μ) := by
    exact (((PiLp.continuous_apply (p := (2 : ENNReal))
      (β := fun _ : Fin n => ℝ) i).mul
      (PiLp.continuous_apply (p := (2 : ENNReal))
        (β := fun _ : Fin n => ℝ) j)).aestronglyMeasurable)
  have hsame :
      ∫ x, x i * x j ∂μ =
        ∫ x, (T x) i * (T x) j ∂μ := by
    calc
      ∫ x, x i * x j ∂μ =
          ∫ x, x i * x j ∂Measure.map T μ := by rw [hmap]
      _ = ∫ x, (T x) i * (T x) j ∂μ := by rw [integral_map hφ hf]
  have hneg :
      ∫ x, (T x) i * (T x) j ∂μ = - ∫ x, x i * x j ∂μ := by
    rw [← integral_neg]
    refine integral_congr_ae ?_
    filter_upwards with x
    simp [T, coordinateSignFlip_apply, hij.symm]
  linarith

/-- Rotation/sign/permutation invariance plus the trace identity proves that
the normalized spherical law is isotropic. -/
theorem isotropicMeasure_of_sphericalUniform {n : ℕ}
    {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hn : 0 < n)
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface) :
    Distributions.isotropicMeasure μ := by
  intro x
  have hdiag := integral_coordinate_sq_eq_one_of_sphericalUniform hn hμ
  have hcross : ∀ i j : Fin n, i ≠ j → ∫ y, y i * y j ∂μ = 0 := by
    intro i j hij
    exact integral_coordinate_mul_eq_zero_of_sphericalUniform hμ hij
  have hinner_point : ∀ y : EuclideanSpace ℝ (Fin n),
      (inner ℝ y x) ^ 2 =
        ∑ i : Fin n, ∑ j : Fin n, (x i * x j) * (y i * y j) := by
    intro y
    simp [PiLp.inner_apply, Finset.sum_mul_sum, pow_two, real_inner_eq_re_inner]
    refine Finset.sum_congr rfl ?_
    intro i _hi
    refine Finset.sum_congr rfl ?_
    intro j _hj
    ring
  calc
    ∫ y, (inner ℝ y x) ^ 2 ∂μ =
        ∫ y, ∑ i : Fin n, ∑ j : Fin n, (x i * x j) * (y i * y j) ∂μ := by
          refine integral_congr_ae ?_
          filter_upwards with y
          exact hinner_point y
    _ = ∑ i : Fin n, ∑ j : Fin n,
          ∫ y, (x i * x j) * (y i * y j) ∂μ := by
          rw [integral_finset_sum Finset.univ]
          · apply Finset.sum_congr rfl
            intro i _hi
            rw [integral_finset_sum Finset.univ]
            intro j _hj
            exact (integrable_coordinate_mul_of_sphericalUniform hμ i j).const_mul _
          · intro i _hi
            exact integrable_finset_sum Finset.univ fun j _hj =>
              (integrable_coordinate_mul_of_sphericalUniform hμ i j).const_mul _
    _ = ∑ i : Fin n, ∑ j : Fin n,
          (x i * x j) * ∫ y, y i * y j ∂μ := by
          simp_rw [integral_const_mul]
    _ = ∑ i : Fin n, (x i) ^ 2 := by
          refine Finset.sum_congr rfl ?_
          intro i _hi
          calc
            ∑ j : Fin n, (x i * x j) * ∫ y, y i * y j ∂μ =
                (x i * x i) * ∫ y, y i * y i ∂μ := by
              rw [Finset.sum_eq_single i]
              · intro j _hj hji
                rw [hcross i j hji.symm]
                ring
              · intro hi
                exact absurd (Finset.mem_univ i) hi
            _ = (x i) ^ 2 := by
              have hsqi : ∫ y, y i * y i ∂μ = 1 := by
                simpa [pow_two] using hdiag i
              rw [hsqi]
              ring
    _ = ‖x‖ ^ 2 := by
          rw [EuclideanSpace.norm_sq_eq]
          simp [Real.norm_eq_abs, sq_abs]

/-- The coordinate laws of a measure are pairwise non-independent.  This is the
dependency half of Exercise 3.3.1, separated from the analytic proof that
surface measure on the sphere has non-atomic coordinate marginals. -/
def coordinateLawsNotIndependent {n : ℕ}
    (μ : Measure (EuclideanSpace ℝ (Fin n))) : Prop :=
  ∀ i j : Fin n, i ≠ j →
    ¬ ProbabilityTheory.IndepFun
      (fun x : EuclideanSpace ℝ (Fin n) => x i)
      (fun x : EuclideanSpace ℝ (Fin n) => x j) μ

/-- Remaining analytic substrate needed for the non-independence half of
Exercise 3.3.1.  Isotropy is proved above from the current spherical-uniform
interface; non-independence still needs continuous coordinate marginals or an
equivalent surface-measure API. -/
def coordinateNonIndependencePrerequisite : Prop :=
  ∀ {n : ℕ} {μ surface : Measure (EuclideanSpace ℝ (Fin n))},
    2 ≤ n →
    μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface →
      coordinateLawsNotIndependent μ

/-- Exercise 3.3.1 reduced to the canonical spherical-uniform analytic
substrate.  The remaining work is only the non-independence proof from the
chosen surface/Hausdorff-measure construction. -/
theorem isotropic_and_dependent
    (hDep : coordinateNonIndependencePrerequisite)
    {n : ℕ} {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hn : 2 ≤ n)
    (hμ : μ ∈ Distributions.sphericalUniform n (Real.sqrt n) surface) :
    Distributions.isotropicMeasure μ ∧ coordinateLawsNotIndependent μ :=
  ⟨isotropicMeasure_of_sphericalUniform (by omega) hμ, hDep hn hμ⟩

end NumStability.HDP.RandomVector.SphericalUniform

namespace NumStability.HDP.Contract

open MeasureTheory

/-- Vershynin HDP Exercise 3.3.1, proved up to the remaining coordinate
non-independence substrate.  The isotropy half is executable and follows from
the checked spherical-uniform invariance interface. -/
theorem hdp_03_hex_h3_d3_d1
    (hDep : RandomVector.SphericalUniform.coordinateNonIndependencePrerequisite)
    {n : ℕ} {μ surface : Measure (EuclideanSpace ℝ (Fin n))}
    (hn : 2 ≤ n)
    (hμ : μ ∈ RandomVector.Distributions.sphericalUniform n (Real.sqrt n) surface) :
    RandomVector.Distributions.isotropicMeasure μ ∧
      RandomVector.SphericalUniform.coordinateLawsNotIndependent μ :=
  RandomVector.SphericalUniform.isotropic_and_dependent hDep hn hμ

end NumStability.HDP.Contract
