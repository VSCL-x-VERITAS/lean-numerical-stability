import Mathlib.Analysis.Convex.Function
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Tactic

/-!
# Orlicz functions

This module records the source-level Orlicz-function interface from Chapter 2,
Section 2.7.1.  The domain is represented by `ℝ`, with the defining
properties restricted to the nonnegative half-line.
-/

noncomputable section

open Filter Set TopologicalSpace
open scoped Topology

namespace NumStability.HDP.Scalar.SubExponential

/-- A convex, nondecreasing function with the defining Orlicz properties. -/
structure OrliczFunction where
  toFun : ℝ → ℝ
  nonnegative : ∀ x, 0 ≤ x → 0 ≤ toFun x
  convexOn_nonneg : ConvexOn ℝ (Set.Ici 0) toFun
  monotoneOn_nonneg : MonotoneOn toFun (Set.Ici 0)
  map_zero : toFun 0 = 0
  tendsto_atTop : Tendsto toFun atTop atTop

instance : CoeFun OrliczFunction (fun _ => ℝ → ℝ) :=
  ⟨OrliczFunction.toFun⟩

/-- The Orlicz function separates every positive scale from zero. -/
theorem OrliczFunction.tendsto_scale_separation
    (ψ : OrliczFunction) {δ : ℝ} (hδ : 0 < δ) :
    Tendsto (fun t : ℝ => ψ (δ / t)) (𝓝[>] 0) atTop := by
  have hinv : Tendsto (fun t : ℝ => t⁻¹) (𝓝[>] (0 : ℝ)) atTop :=
    tendsto_inv_nhdsGT_zero
  have hscale : Tendsto (fun t : ℝ => δ / t) (𝓝[>] (0 : ℝ)) atTop := by
    have hmul := hinv.atTop_mul_pos hδ (tendsto_const_nhds :
      Tendsto (fun _ : ℝ => δ) (𝓝[>] (0 : ℝ)) (𝓝 δ))
    simpa [div_eq_mul_inv, mul_comm] using hmul
  exact ψ.tendsto_atTop.comp hscale

namespace NumStability.HDP.Contract

/-- Stable source-facing alias for the local Orlicz-function interface. -/
def hdp_02_hdef_horlicz_hfunction : Type :=
  NumStability.HDP.Scalar.SubExponential.OrliczFunction

end NumStability.HDP.Contract

end NumStability.HDP.Scalar.SubExponential
