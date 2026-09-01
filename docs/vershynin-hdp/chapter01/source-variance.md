# Chapter 1 source variance ledger

The pinned first edition is authoritative for this unit. These are source
issues, not skill/process issues; process findings for this invocation are
recorded separately under session `codex-continue-1`.

| Row | First-edition source issue | Current formal evidence | Closure state |
|---|---|---|---|
| `HDP-01-DEF-MOMENTS` | `E X^p` is declared for arbitrary real `p>0`, although a negative real `X` does not have a real-valued nonintegral power in general. | `hdp_01_hdef_hmoments_source_obstruction`; separately named `hdp_01_hdef_hmoments_corrected`. | Closed as `DISCREPANCY`; both artifacts have complete fresh audits. |
| `HDP-01-EQ-1.3` | The equation includes `p=0`, but the preceding norm is defined only for `p>0`, and the printed proof uses `q/p`. | `hdp_01_heq_h1_d3_source_obstruction`; corrected `hdp_01_heq_h1_d3_corrected`; explicitly non-source Mathlib model `hdp_01_heq_h1_d3_zero_model`. | Closed as `DISCREPANCY`; both obstruction and correction have complete adjudicated audits. |
| `HDP-01-EXERCISE-1.2.2` | The signed tail formula is claimed for any real random variable; without integrability both tail integrals can be infinite, producing undefined `∞-∞`. | `exercise122CauchyObstruction` and `exercise122CorrectedSignedTailFormula`. | Blocked pending independent witness/correction audits required for `DISCREPANCY`. |

The corresponding stable issue records are
`B-VHDP-C01-I001`–`B-VHDP-C01-I003` in the Chapter 1 issue tracker.
