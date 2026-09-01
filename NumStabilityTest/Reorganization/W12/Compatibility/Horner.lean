import NumStability.Algorithms.Horner

/-!
# Horner old-import test

Imports only the historical path. The declarations below moved to canonical
modules during wave W12, so this compiles only if the compatibility module
still re-exports them at their original names.
-/

#check @NumStability.fl_hornerDerivativeFold_snd_backward_error_coefficients
#check @NumStability.fl_hornerDerivativeDesc_snd_backward_error_coefficients_coupled
#check @NumStability.fl_hornerDerivativeDesc_snd_forward_error_bound_coupled
#check @NumStability.fl_hornerDerivativeDesc_first_derivative_error_bound
