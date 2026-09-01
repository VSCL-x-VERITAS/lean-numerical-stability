import NumStability.Algorithms.Ch5SourceClosure

/-!
# Ch5SourceClosure old-import test

Imports only the historical path. The declarations below moved to canonical
modules during wave W12, so this compiles only if the compatibility module
still re-exports them at their original names.
-/

#check @NumStability.highamBidiagonalUInv_rightInverse
#check @NumStability.highamBidiagonalUInv_leftInverse
#check @NumStability.highamBidiagonalAbsInv_mul_absU_entry
#check @NumStability.highamBidiagonalAbsInv_mul_absInv_mul_absU_entry
#check @NumStability.highamBidiagonalExactSolve_system
#check @NumStability.flHighamBidiagonalSolve_succ
#check @NumStability.flHighamBidiagonalSolve_backward_perturbation
#check @NumStability.flHighamBidiagonalSolve_forward_majorant_first_order_quadratic
#check @NumStability.flHighamBidiagonalSolve_forward_error
#check @NumStability.flHighamBidiagonalSolve_forward_error_first_order_quadratic
#check @NumStability.flHighamBidiagonalSolve_two_sweeps_backward_perturbation
#check @NumStability.flHighamBidiagonalSolve_two_sweeps_forward_error
#check @NumStability.flHighamBidiagonalSolve_two_sweeps_forward_error_first_order_quadratic
