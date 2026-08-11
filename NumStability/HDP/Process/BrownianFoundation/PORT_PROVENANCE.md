# Brownian foundation port

This directory is a selective source port used to prove the local
`EXT-BROWNIAN-MOTION-EXISTENCE` foundation helper for Vershynin HDP Split 3.

- Brownian source: `RemyDegenne/brownian-motion`
- Brownian commit: `4fa8fc01e59d6ee3fb0cce4897b48005d7d00f18`
- Kolmogorov source: `RemyDegenne/kolmogorov_extension4`
- Kolmogorov commit: `cd3544a79f4b1fde1c2d0db2d38fa3895eb14b3b`
- Source license: Apache-2.0; original headers are preserved.

Only the transitive source closure of
`BrownianMotion.Gaussian.BrownianMotion` was copied. Import paths were
mechanically relocated beneath
`NumStability.HDP.Process.BrownianFoundation`; theorem bodies and namespaces
were otherwise preserved before pinned-baseline compatibility repairs.
