# Faithfulness audit: HDP-02-EX-2.2.10A

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `374e1393ee79a49ac90546f7e2c10e2c5c49ffaa7f784ff37e6e44966ab39622`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target formalizes the analytic core of Exercise 2.2.10(a). Its local density package exactly expresses, modulo the standard almost-everywhere convention for density representatives, a nonnegative probability density supported on [0,infinity) and bounded by 1. The target integrand is the density formula for the source exponential moment, with the same minus sign, positive-t condition, constant, and inequality. Dropping the family and independence from the binder is harmless because the conclusion is individual, and every admissible density can conversely be realized as an absolutely continuous nonnegative probability law. Both implications therefore hold without unresolved semantic evidence.

## Implications

- **Lean implies source:** `yes`. For each source Xi, choose a Lebesgue density f. Nonnegativity of Xi makes f vanish almost everywhere below zero; a density is nonnegative, integrable, and normalized; and the source cap gives f <= 1 almost everywhere. Applying the Lean proposition yields the density integral bound, and the standard expectation-under-density identity turns its left side into E[exp(-t Xi)]. Independence is unnecessary for this one-variable step.
- **Source implies lean:** `yes`. Given any f satisfying the Lean package, the measure with density f relative to Lebesgue volume is a probability measure supported on [0,infinity), absolutely continuous (hence with continuous distribution), and density-bounded by 1. The identity random variable on that law, or a singleton family, satisfies the source assumptions; the source conclusion is exactly the target integral inequality. Thus the density-level universal statement introduces no counterexample outside the mathematical source class.

## Findings

- **note / representation:** This is an exact density-level reformulation for part (a): expectation is integration against the density, and independence is irrelevant. It does not change either implication direction.
- **note / law-level abstraction:** There is no loss or gain in the selected conclusion: independence is unused for the individual estimate, every source member has an admissible density, and every admissible density can be realized in an independent family.
- **note / density representatives:** Null-set changes do not affect the probability law or the integral, so the representative-level wording does not change either implication.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `48` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `48` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/agent_outputs/agent_runs.json` (`aa4c59980afd2272ab24fa4386ec6eb7d0bf0ad7796974ec67c6831df08b4e1c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/agent_outputs/blind_translation.json` (`437160e62d8f117d481128ca89088e5e1d1313de1f13028767bbe3a15c297fb3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/agent_outputs/direct_judge.json` (`32a667976e3886baed920a27d51768031f9720b7b6df0d9d57e9dfb55a478470`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/agent_outputs/roundtrip_judge.json` (`dd10d0946a82c884ec1cf96e0cacea3a40aa6c2151bc07f02de4f2a877f43129`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/agent_outputs/source_contract.json` (`74c5900de9d1955d00f699333a30c21a62f2bc7e0f68b5b371e21f81d02d848d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/decision.json` (`ba2601b406304c05ebbf9ed7be401c755029f5140f1225a3b9aeafc59ed6bbf6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/inputs/blind_dependency_inventory.json` (`c72089c5856e9bbbec92dd298afa88f41a48dc452ee8adb39ff940ae2e780025`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/inputs/blind_dossier.md` (`7ea5486169a3829ede7b2ad41b3b289e0642e9bc96dcd2031957f939225ef900`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/inputs/blind_review_packet.md` (`7ea5486169a3829ede7b2ad41b3b289e0642e9bc96dcd2031957f939225ef900`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/inputs/declaration_dossier.md` (`ad2f310b3298d9fabd92de6ebf4c87005ea28ae0ffb8fb103b980e36795b2804`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/inputs/dependency_inventory.json` (`e18f9ae8a6e5709be9b378ce91851d3c9ceab7d19d3bab12a9ac2e1657e6d4db`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/inputs/direct_review_packet.md` (`5eca632d21c078b5da4f35055b6a3334686aeba5f2e1ae0e0734a32c928527f5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.10A/faithfulness/inputs/source_locator.json` (`ee6bd02b5d4a57134618ee7fde7d4027c48ab8dc60331463922cebf2510e93b8`)
