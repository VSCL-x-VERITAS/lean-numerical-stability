import NumStability.Analysis.Problem2_10

/-!
# Problem2_10 old-import test

Imports only the historical path. The declarations below moved to canonical
modules during wave W12, so this compiles only if the compatibility module
still re-exports them at their original names.
-/

#check @NumStability.FloatingPointFormat.problem2_10_allowableDenominator
#check @NumStability.FloatingPointFormat.problem2_10_six_allowableDenominator
#check @NumStability.FloatingPointFormat.problem2_10_ten_allowableDenominator
#check @NumStability.FloatingPointFormat.problem2_10_ieeeDouble_midpoint_below_two_pow_rounds_to_two_pow
#check @NumStability.FloatingPointFormat.problem2_10_ieeeDouble_signed_thirtytwo_thirds_times_three
