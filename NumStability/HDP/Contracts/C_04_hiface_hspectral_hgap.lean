import NumStability.HDP.RandomMatrix.Basic

/-!
# Contract alias for `HDP-C-04-IFACE-SPECTRAL-GAP`
-/

namespace NumStability
namespace HDP
namespace Contract

/-- Stable contract alias for the Chapter 4 spectral-gap interface. -/
noncomputable def hdp_04_hiface_hspectral_hgap (n : ℕ) :
    RandomMatrix.Basic.SpectralGapInterface n :=
  RandomMatrix.Basic.spectralGapInterface n

end Contract
end HDP
end NumStability
