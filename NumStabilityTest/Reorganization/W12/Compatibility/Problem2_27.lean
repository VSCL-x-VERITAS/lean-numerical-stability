import NumStability.Analysis.Problem2_27

/-!
# Problem2_27 old-import test

Imports only the historical path. The declarations below moved to canonical
modules during wave W12, so this compiles only if the compatibility module
still re-exports them at their original names.
-/

#check @NumStability.problem2_27_residual
#check @NumStability.problem2_27_fullAccuracy
#check @NumStability.problem2_27_fullAccuracy_iff_eq_div
#check @NumStability.FloatingPointFormat.problem2_27_convergenceTest_iff_eq_div_of_additive_model_normal_branch
