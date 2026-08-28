import NumStability.HDP.Concentration
import NumStability.HDP.Contracts
import NumStability.HDP.ContractSignatures
import NumStability.HDP.Scalar

/-!
# Vershynin, *High-Dimensional Probability*

Complete entry point for the HDP lane: reusable scalar and metric-measure
probability, the frozen contract signatures, and the source-facing contracts
for numbered rows of the 2018 first edition.

Dependencies flow from reusable mathematics (`Scalar`, `Concentration`) into the
source correspondence surfaces (`ContractSignatures`, `Contracts`), never the
other way.
-/
