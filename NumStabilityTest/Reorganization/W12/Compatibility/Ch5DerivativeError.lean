import NumStability.Algorithms.Ch5DerivativeError

/-!
# Ch5DerivativeError old-import test

Imports only the historical path. The declarations below moved to canonical
modules during wave W12, so this compiles only if the compatibility module
still re-exports them at their original names.
-/

#check @NumStability.ch5deriv_derivative_forward_error_bound
#check @NumStability.ch5deriv_derivative_backward_error_coefficients
#check @NumStability.ch5deriv_pair_forward_error_bound
#check @NumStability.ch5deriv_derivative_first_order_error_bound
