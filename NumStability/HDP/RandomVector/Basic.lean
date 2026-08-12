import Mathlib.Data.Fintype.Card
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Analysis.InnerProductSpace.Positive
import Mathlib.Tactic

namespace NumStability.HDP.RandomVector.Basic

/-- Proof-facing API for the opening norm-square calculation: the squared
norm expectation is represented by the finite sum of coordinate second
moments, so unit coordinate moments yield `n`. -/
theorem normSquareExpectationIdentity (n : ℕ)
    (secondMoment : Fin n → ℝ) (h : ∀ i, secondMoment i = 1) :
    (∑ i, secondMoment i) = n := by
  classical
  simp [h]

/-- Squared-deviation lower bound used to pass from (3.1) to (3.3). -/
theorem sqrtDeviationBound {z δ : ℝ} (hz : 0 ≤ z) (hδ : 0 ≤ δ)
    (hdev : δ ≤ |z - 1|) :
    max δ (δ ^ 2) ≤ |z ^ 2 - 1| := by
  by_cases h : z ≤ 1
  · have hleft : |z - 1| = 1 - z := by
      rw [abs_of_nonpos (sub_nonpos.mpr h)]
      ring
    have hright : |z ^ 2 - 1| = 1 - z ^ 2 := by
      have hsq : z ^ 2 - 1 ≤ 0 := by
        nlinarith [mul_nonneg hz (sub_nonneg.mpr h)]
      rw [abs_of_nonpos hsq]
      ring
    have hdev' : δ ≤ 1 - z := by simpa [hleft] using hdev
    have hsq : δ ^ 2 ≤ (1 - z) ^ 2 :=
      (sq_le_sq₀ hδ (sub_nonneg.mpr h)).2 hdev'
    rw [hright]
    refine max_le ?_ ?_
    · nlinarith [mul_nonneg hz (sub_nonneg.mpr h)]
    · nlinarith [hsq, mul_nonneg hz (sub_nonneg.mpr h)]
  · have hz1 : 1 ≤ z := le_of_not_ge h
    have hleft : |z - 1| = z - 1 :=
      abs_of_nonneg (sub_nonneg.mpr hz1)
    have hright : |z ^ 2 - 1| = z ^ 2 - 1 := by
      have hsq : 0 ≤ z ^ 2 - 1 := by
        nlinarith [mul_nonneg (sub_nonneg.mpr hz1)
          (add_nonneg hz (by norm_num : (0 : ℝ) ≤ 1))]
      exact abs_of_nonneg hsq
    have hdev' : δ ≤ z - 1 := by simpa [hleft] using hdev
    have hsq : δ ^ 2 ≤ (z - 1) ^ 2 :=
      (sq_le_sq₀ hδ (sub_nonneg.mpr hz1)).2 hdev'
    rw [hright]
    refine max_le ?_ ?_
    · nlinarith [mul_nonneg (sub_nonneg.mpr hz1)
        (add_nonneg hz (by norm_num : (0 : ℝ) ≤ 1))]
    · nlinarith

/-- Symmetric bilinear forms are determined by their quadratic evaluations. -/
theorem symmetricQuadraticExtensionality {V : Type*}
    [AddCommGroup V] [Module ℝ V]
    (B C : V →ₗ[ℝ] V →ₗ[ℝ] ℝ)
    (hB : ∀ x y, B x y = B y x)
    (hC : ∀ x y, C x y = C y x)
    (hquad : ∀ x, B x x = C x x) : B = C := by
  ext x y
  have hplus := hquad (x + y)
  have hminus := hquad (x - y)
  simp only [map_add, map_sub, LinearMap.add_apply, LinearMap.sub_apply] at hplus hminus
  rw [hB y x, hC y x] at hplus
  rw [hB y x, hC y x] at hminus
  linarith

/-- The exact finite-dimensional Hermitian spectral bridge used by the PSD
decomposition below.  Keeping this as a named local helper records the
Mathlib foundation without introducing a second abstract contract. -/
def finiteDimensionalSpectralStatement : Prop :=
  ∀ {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) (hA : A.IsHermitian),
    A =
      (Unitary.conjStarAlgAut ℝ (Matrix (Fin n) (Fin n) ℝ))
        hA.eigenvectorUnitary (Matrix.diagonal hA.eigenvalues)

theorem finiteDimensionalSpectralBridge : finiteDimensionalSpectralStatement := by
  intro n A hA
  exact hA.spectral_theorem

/-- Spectral decomposition of a finite real positive-semidefinite matrix. -/
theorem spectralPSDDecomposition {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (hP : A.PosSemidef) :
    ∃ (s : Fin n → ℝ)
      (b : OrthonormalBasis (Fin n) ℝ (EuclideanSpace ℝ (Fin n))),
      Antitone s ∧ (∀ i, 0 ≤ s i) ∧
        A = ∑ i, s i • Matrix.vecMulVec (b i).ofLp (b i).ofLp := by
  have realInnerMul : ∀ a b : ℝ, inner ℝ a b = a * b := by
    intro a b
    have h := RCLike.inner_apply a b
    exact h.trans (by simp [mul_comm])
  let T := Matrix.toLpLin 2 2 A
  let hA := hP.isHermitian
  let hT : T.IsSymmetric := (Matrix.isHermitian_iff_isSymmetric).mp hA
  let hn : Module.finrank ℝ (EuclideanSpace ℝ (Fin n)) = n := by
    simpa using (finrank_euclideanSpace (𝕜 := ℝ) (ι := Fin n))
  let s := hT.eigenvalues hn
  let b := hT.eigenvectorBasis hn
  refine ⟨s, b, hT.eigenvalues_antitone hn, ?_, ?_⟩
  · intro i
    have hp := hP.dotProduct_mulVec_nonneg (b i).ofLp
    have heig : A.mulVec (b i).ofLp = s i • (b i).ofLp := by
      have he := congrArg (WithLp.ofLp (p := 2)) (hT.apply_eigenvectorBasis hn i)
      dsimp [T, s, b] at he
      simpa only [Matrix.toLpLin_apply, WithLp.ofLp_toLp, WithLp.ofLp_smul] using he
    rw [heig] at hp
    have hnorm : (b i).ofLp ⬝ᵥ (b i).ofLp = 1 := by
      have hinner : inner ℝ (b i) (b i) = 1 := by
        rw [real_inner_self_eq_norm_sq]
        simp [b.norm_eq_one]
      calc
        (b i).ofLp ⬝ᵥ (b i).ofLp = inner ℝ (b i) (b i) := by
          rw [PiLp.inner_apply]
          simp [dotProduct, pow_two]
        _ = 1 := hinner
    simpa [hnorm] using hp
  · apply (Matrix.toLpLin 2 2).injective
    ext x
    have hx : x = ∑ i, (b.repr x).ofLp i • b i := by
      calc
        x = b.repr.symm (b.repr x) := (b.repr.symm_apply_apply x).symm
        _ = ∑ i, (b.repr x).ofLp i • b i := (b.sum_repr_symm _).symm
    have hTx : T x = ∑ i, (s i * (b.repr x).ofLp i) • b i := by
      conv_lhs => rw [hx]
      rw [map_sum]
      apply Finset.sum_congr rfl
      intro i hi
      rw [map_smul, hT.apply_eigenvectorBasis]
      rw [smul_smul]
      dsimp [b, s]
      rw [mul_comm]
    have hMx : ((Matrix.toLpLin 2 2)
        (∑ i, s i • Matrix.vecMulVec (b i).ofLp (b i).ofLp)) x =
        WithLp.toLp 2 (∑ i, s i •
          ((b i).ofLp ⬝ᵥ x.ofLp) • (b i).ofLp) := by
      simp only [Matrix.toLpLin_apply]
      rw [Matrix.sum_mulVec]
      simp only [Matrix.smul_mulVec, Matrix.vecMulVec_mulVec]
      congr 1
      apply Finset.sum_congr rfl
      intro i hi
      simpa [smul_smul, mul_comm]
    rw [hTx, hMx]
    simp only [WithLp.ofLp_toLp, WithLp.ofLp_sum, WithLp.ofLp_smul,
      Finset.sum_apply, Pi.smul_apply, smul_eq_mul]
    apply Finset.sum_congr rfl
    intro i hi
    rw [b.repr_apply_apply]
    rw [PiLp.inner_apply]
    simp only [realInnerMul]
    simp only [dotProduct]
    ring

end NumStability.HDP.RandomVector.Basic

namespace NumStability.HDP.Contract

theorem hdp_03_hlem_hnorm_hsquare_hexpectation (n : ℕ)
    (secondMoment : Fin n → ℝ) (h : ∀ i, secondMoment i = 1) :
    (∑ i, secondMoment i) = n :=
  RandomVector.Basic.normSquareExpectationIdentity n secondMoment h

theorem hdp_03_hlem_hsqrt_hdeviation {z δ : ℝ} (hz : 0 ≤ z) (hδ : 0 ≤ δ)
    (hdev : δ ≤ |z - 1|) :
    max δ (δ ^ 2) ≤ |z ^ 2 - 1| :=
  RandomVector.Basic.sqrtDeviationBound hz hδ hdev

theorem hdp_03_hlem_hsymmetric_hquadratic_hext {V : Type*}
    [AddCommGroup V] [Module ℝ V]
    (B C : V →ₗ[ℝ] V →ₗ[ℝ] ℝ)
    (hB : ∀ x y, B x y = B y x)
    (hC : ∀ x y, C x y = C y x)
    (hquad : ∀ x, B x x = C x x) : B = C :=
  RandomVector.Basic.symmetricQuadraticExtensionality B C hB hC hquad

theorem hdp_03_hthm_hspectral_hpsd {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (hP : A.PosSemidef) :
    ∃ (s : Fin n → ℝ)
      (b : OrthonormalBasis (Fin n) ℝ (EuclideanSpace ℝ (Fin n))),
      Antitone s ∧ (∀ i, 0 ≤ s i) ∧
        A = ∑ i, s i • Matrix.vecMulVec (b i).ofLp (b i).ofLp :=
  RandomVector.Basic.spectralPSDDecomposition A hP

end NumStability.HDP.Contract
