# Faithfulness audit: HDP-01-EQ-1.2

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `6ddc70c6fbea109fd545df3fd68ce048bb2040ea5cdaa5623a27d50e64061c49`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target faithfully represents Equation (1.2) as two conjunctive equalities forming the exact three-term chain. It preserves the fixed-probability-space semantics, real-valued X and Y, inherited X,Y∈L² domain, separate centering by each variable's own expectation, ordered centered factors, expectation scope, equality strength, and exponent 2. The local covariance and l2InnerProduct definitions unfold to the same centered-product integral, so the equalities are definitional; this is faithful because those definitions themselves match Equations (1.1)–(1.2). Although Mathlib's integral is totalized, MemLp on a probability measure ensures that the means and centered product lie in the intended integrable regime. The source's unstated representative/quotient convention creates no mathematical difference in the asserted scalar equality, since the relevant integrals are invariant almost everywhere. Both implication directions therefore hold.

## Implications

- **Lean implies source:** `yes`. For every target instance, μ is a probability measure and X,Y satisfy representative-level L² membership. D001–D003 unfold the conjunction to the exact ordered three-term source chain. MemLp makes the globally totalized integral agree with ordinary expectation for X, Y, and their centered product. Interpreting raw functions as L² representatives gives the source inner-product value, independent of almost-everywhere representative choice.
- **Source implies lean:** `yes`. Real square-integrable random variables on the source probability space admit function representatives satisfying the two MemLp hypotheses. Instantiating the target with those representatives yields both links of Equation (1.2). If the source's Hilbert space is understood as an almost-everywhere quotient, the integral expressions are representative-independent, so the quotient convention does not obstruct this direction.

## Findings

- **note / representatives-versus-quotient:** There is no implication failure: on the L² domain the value is invariant under almost-everywhere replacement and equals the standard quotient inner product, but the formal representation choice should not be attributed as explicit source text.
- **note / definitional-equalities-and-totalization:** The theorem is computationally trivial after unfolding, but not semantically vacuous or weaker: its imported definitions encode the exact source terms, and totalization has no out-of-domain effect under the stated hypotheses.
- **note / representatives-and-totalized-integration:** Neither choice changes this scalar identity: its terms are invariant under almost-everywhere representative changes, and all displayed integrands are integrable under the probability and L² hypotheses.

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

- Blind translator covered `44` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `44` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/agent_outputs/agent_runs.json` (`9b139e33c498006cb4a72864655e9d7d868d6ba93102a1d0b427e6ec8fe4ae0a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/agent_outputs/blind_translation.json` (`f062528818de37aba795c9c218c4281edf4fbaa509a76ccb2a609a0a3808667d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/agent_outputs/direct_judge.json` (`59191fc6f254a4f5a6bcb55a280678c95c47ccc08b69be4e209545aee6d3c05b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/agent_outputs/roundtrip_judge.json` (`f9327437faae8a9ae42aa12f49b5a8ae8a610005b238e155e84e70b824db44a3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/agent_outputs/source_contract.json` (`674d614a0cc0900bfcc78fcc8a6e7dd4d583a2219e2039cba5d147cc9dd69cda`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/decision.json` (`dc2bf3acdf0ba242f1f75405bde9fae3b8441ddea48cc6c4f78fe927cb0d5bef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/inputs/blind_dependency_inventory.json` (`536a55662ac8a25fcc647410101882795caebf1530f7fbe7e6c94c1bc07988d0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/inputs/blind_dossier.md` (`d70f3863dbe6f181c9993634e3244760e8998c312c9ed7b84a0291da480de94c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/inputs/blind_review_packet.md` (`d70f3863dbe6f181c9993634e3244760e8998c312c9ed7b84a0291da480de94c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/inputs/declaration_dossier.md` (`9fea1ae16881ed6194aeca0875e62be21ad5d6f0921b7f1b5cd9f450f5e9ed58`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/inputs/dependency_inventory.json` (`5c84473e0e2e6fb4d016e90c1cb9ee93d58eabbe9407531bb42676a4667a2131`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/inputs/direct_review_packet.md` (`0df5ec93fad4b81e9d72ea4ee442cc9c56e200a39411d93e2d4faadcc95f1b11`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.2/faithfulness/inputs/source_locator.json` (`549e98a3b224eaaadbd9375bae4e9bf730b5bac48fbb47aa4fa72545f2e81fa0`)
