import Mathlib.Analysis.Convex.Combination
import Mathlib.Analysis.Convex.Jensen
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Normed.Module.Convex
import Mathlib.Tactic

namespace NumStability.HDP.Quadratic.Contraction

open scoped BigOperators

/-- The coefficient cube used in the deterministic contraction argument. -/
def coefficientCube (N : ℕ) : Set (Fin N → ℝ) :=
  Set.pi Set.univ (fun _ => Set.Icc (-1) 1)

/-- Convexity of the deterministic signed linear norm appearing in the
contraction proof. -/
theorem signedLinearNormConvex {N : ℕ} {E : Type*}
    [SeminormedAddCommGroup E] [NormedSpace ℝ E]
    (ε : Fin N → ℝ) (x : Fin N → E) :
    ConvexOn ℝ Set.univ
      (fun a : Fin N → ℝ => ‖∑ i, a i • (ε i • x i)‖) := by
  refine ⟨convex_univ, ?_⟩
  intro a ha b hb α β hα hβ hab
  have hsum : (∑ i, (α • a + β • b) i • (ε i • x i)) =
      α • (∑ i, a i • (ε i • x i)) +
        β • (∑ i, b i • (ε i • x i)) := by
    calc
      (∑ i, (α • a + β • b) i • (ε i • x i)) =
          ∑ i, ((α * a i * ε i) • x i + (β * b i * ε i) • x i) := by
        apply Finset.sum_congr rfl
        intro i hi
        simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, add_smul,
          smul_smul]
        module
      _ = (∑ i, (α * a i * ε i) • x i) +
          ∑ i, (β * b i * ε i) • x i := Finset.sum_add_distrib
      _ = α • (∑ i, a i • (ε i • x i)) +
          β • (∑ i, b i • (ε i • x i)) := by
        rw [Finset.smul_sum, Finset.smul_sum]
        simp only [smul_smul]
        congr 1 <;> apply Finset.sum_congr rfl <;> intro i hi <;> ring
  change ‖∑ i, (α • a + β • b) i • (ε i • x i)‖ ≤
    α • ‖∑ i, a i • (ε i • x i)‖ +
      β • ‖∑ i, b i • (ε i • x i)‖
  calc
    ‖∑ i, (α • a + β • b) i • (ε i • x i)‖ =
        ‖α • (∑ i, a i • (ε i • x i)) +
          β • (∑ i, b i • (ε i • x i))‖ := by rw [hsum]
    _ ≤ ‖α • (∑ i, a i • (ε i • x i))‖ +
        ‖β • (∑ i, b i • (ε i • x i))‖ := norm_add_le _ _
    _ = α • ‖∑ i, a i • (ε i • x i)‖ +
        β • ‖∑ i, b i • (ε i • x i)‖ := by
      rw [norm_smul_of_nonneg hα, norm_smul_of_nonneg hβ]
      simp only [smul_eq_mul]

/-- The finite set of cube vertices, represented coordinatewise by `-1` and `1`. -/
noncomputable def coefficientCubeVertices (N : ℕ) : Finset (Fin N → ℝ) := by
  classical
  exact (Finset.univ : Finset (Fin N → Bool)).image
    (fun signs i => if signs i then (1 : ℝ) else -1)

private theorem coefficientCubeVertices_set (N : ℕ) :
    (coefficientCubeVertices N : Set (Fin N → ℝ)) =
      Set.pi Set.univ (fun _ => ({(-1 : ℝ), 1} : Set ℝ)) := by
  ext a
  constructor
  · intro ha
    rcases Finset.mem_image.mp ha with ⟨signs, _, rfl⟩
    intro i _
    by_cases h : signs i
    · exact Or.inr (by simp [h])
    · exact Or.inl (by simp [h])
  · intro ha
    classical
    let signs : Fin N → Bool := fun i => if a i = 1 then true else false
    refine Finset.mem_image.mpr ⟨signs, Finset.mem_univ _, ?_⟩
    funext i
    rcases ha i (Set.mem_univ i) with h | h
    · have hne : a i ≠ 1 := by
        intro hEq
        have : (-1 : ℝ) = 1 := h.symm.trans hEq
        norm_num at this
      have hs : signs i = false := by simp [signs, hne]
      rw [hs]
      simp [h]
    · have hEq : a i = 1 := by simpa using h
      have hs : signs i = true := by simp [signs, hEq]
      rw [hs]
      simp [hEq]

private theorem coefficientCubeVertices_mem_cube {N : ℕ}
    {a : Fin N → ℝ} (ha : a ∈ (coefficientCubeVertices N : Set (Fin N → ℝ))) :
    a ∈ coefficientCube N := by
  rw [coefficientCubeVertices_set] at ha
  intro i hi
  rcases ha i hi with h | h
  · simp [h]
  · have hEq : a i = 1 := by simpa using h
    simp [hEq]

private theorem coefficientCube_mem_convexHull_vertices {N : ℕ}
    {a : Fin N → ℝ} (ha : a ∈ coefficientCube N) :
    a ∈ convexHull ℝ (coefficientCubeVertices N : Set (Fin N → ℝ)) := by
  rw [coefficientCubeVertices_set]
  apply mem_convexHull_pi
  intro i hi
  rw [convexHull_pair, segment_eq_Icc (by norm_num : (-1 : ℝ) ≤ 1)]
  exact ha i hi

private theorem coefficientCubeVertices_nonempty (N : ℕ) :
    (coefficientCubeVertices N).Nonempty := by
  classical
  have hmem : (fun _ : Fin N => (-1 : ℝ)) ∈ coefficientCubeVertices N := by
    apply Finset.mem_image.mpr
    refine ⟨(fun _ : Fin N => false), Finset.mem_univ _, ?_⟩
    rfl
  exact ⟨_, hmem⟩

/-- The finite vertex supremum used by the cube maximum principle. -/
noncomputable def coefficientCubeVertexMaximum (N : ℕ)
    (f : (Fin N → ℝ) → ℝ) : ℝ :=
  (coefficientCubeVertices N).sup' (coefficientCubeVertices_nonempty N) f

/-- A convex function on the coefficient cube is bounded by its vertex maximum.

This is the finite-dimensional maximum step in the proof of the contraction
principle; the expectation and Rademacher sign-invariance layers consume this
deterministic bound separately. -/
theorem convexCubeMaximum {N : ℕ} {f : (Fin N → ℝ) → ℝ}
    {s : Set (Fin N → ℝ)} (hf : ConvexOn ℝ s f)
    (hcube : coefficientCube N ⊆ s) {a : Fin N → ℝ}
    (ha : a ∈ coefficientCube N) :
    f a ≤ coefficientCubeVertexMaximum N f := by
  apply hf.le_sup_of_mem_convexHull
  · exact fun v hv => hcube (coefficientCubeVertices_mem_cube hv)
  · exact coefficientCube_mem_convexHull_vertices ha

end NumStability.HDP.Quadratic.Contraction

namespace NumStability.HDP.Contract

theorem hdp_06_hex_h6_d7_d2 {N : ℕ} {E : Type*}
    [SeminormedAddCommGroup E] [NormedSpace ℝ E]
    (ε : Fin N → ℝ) (x : Fin N → E) :
    ConvexOn ℝ Set.univ
      (fun a : Fin N → ℝ => ‖∑ i, a i • (ε i • x i)‖) :=
  NumStability.HDP.Quadratic.Contraction.signedLinearNormConvex ε x

theorem hdp_06_hproof_h6_d7_hcube_hmax {N : ℕ}
    {f : (Fin N → ℝ) → ℝ} {s : Set (Fin N → ℝ)}
    (hf : ConvexOn ℝ s f)
    (hcube : NumStability.HDP.Quadratic.Contraction.coefficientCube N ⊆ s)
    {a : Fin N → ℝ}
    (ha : a ∈ NumStability.HDP.Quadratic.Contraction.coefficientCube N) :
    f a ≤ NumStability.HDP.Quadratic.Contraction.coefficientCubeVertexMaximum N f :=
  NumStability.HDP.Quadratic.Contraction.convexCubeMaximum hf hcube ha

end NumStability.HDP.Contract
