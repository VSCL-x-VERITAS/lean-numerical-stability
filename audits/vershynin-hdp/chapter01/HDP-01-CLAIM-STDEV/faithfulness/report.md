# Faithfulness audit: HDP-01-CLAIM-STDEV

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `9c4a2e87a95f421223bfe8ed8160b0b222cb895b3aecb7b483915fc66e45a338`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The Lean proposition faithfully formalizes the exact three-term source chain as two adjacent equalities. Its probability-measure and MemLp hypotheses make explicit the source's inherited real L² setting; they are not extra restrictions. The inspected definitions give the intended expectation, centered variance, L² quantity, nonnegative square root, and standard deviation. Mathlib's totalized integral is harmless under MemLp, and the raw-function representation is compatible with a source passage that does not mandate quotienting. Both implication directions therefore hold.

## Implications

- **Lean implies source:** `yes`. For every Lean instance satisfying the probability-measure and MemLp hypotheses, expectation is the ordinary finite Lebesgue integral, variance is the centered second moment, l2Norm of the centered function is its square-rooted second moment, and standardDeviation is sqrt variance. The two conjuncts therefore give exactly every link of the source's three-term identity in its inherited L² context.
- **Source implies lean:** `yes`. A source real-valued random variable in L² on a probability space translates to X:Ω→Real with MemLp X 2 μ. The source definitions identify the centered L² norm, sqrt variance, and σ(X); under the inspected Lean definitions these yield precisely the two conjuncts. The raw-function encoding is permitted because the source does not require a quotient convention.

## Findings

- **note / definitional-encoding:** The definitional nature of the Lean equalities is faithful to the source identity and is not vacuity or loss of content.
- **note / totalized-integral:** Within the theorem's domain the relevant functions are integrable, so totalization creates no exceptional-case mismatch.
- **note / representative-convention:** The representative choice is source-compatible and does not reduce applicability or alter the almost-sure-invariant quantities.
- **note / representative-versus-quotient encoding:** There is no implication change because every quantity in the identity is almost-everywhere invariant and the encoding is compatible with either conventional reading of the source passage.
- **note / totalized operations:** The fallback behavior is unreachable for the relevant integrals under the translated MemLp probability hypotheses, so it causes no semantic difference.
- **note / definitional presentation:** The definitional character does not omit any source term or analytic condition; it is a transparent formal presentation of the same identity.

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

- Blind translator covered `47` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `47` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/agent_outputs/agent_runs.json` (`c416fae29a7ed49c8d32c4fb7273bf9d03b7625fca0e87a10e379608431146fe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/agent_outputs/blind_translation.json` (`29babc148dc5d1cb1aa00c49869722a1848531a3cf88d6a98a9b1b3fcea0a31f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/agent_outputs/direct_judge.json` (`6d64f9f40c79b278dfc41810018a328f3a015515d375439e7a5058e9d2e36f7e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/agent_outputs/roundtrip_judge.json` (`a49e78e4f76e415e6fa29c66be0dfdb3b3134c54f1a76eabfc9bea6b0d41bbff`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/agent_outputs/source_contract.json` (`0a61c3222b6aa227e5477848165765cb884ab10f116ae24e1cb84bdf04e944fa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/decision.json` (`8695df6bf03cbe07bd52e5f60d4dc8fcb5fefe028f93786d50ab9d4b19aa6eb7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/inputs/blind_dependency_inventory.json` (`49d6fbf1edabaf98b42c1c1a11fad1cf3aaf0d6f43fcf72b7fcbe88a65696bca`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/inputs/blind_dossier.md` (`290fa4147dbf9e0bcf9b8e3c983ab3c91795c46994cab7c5d1a441c2abfccfc9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/inputs/blind_review_packet.md` (`290fa4147dbf9e0bcf9b8e3c983ab3c91795c46994cab7c5d1a441c2abfccfc9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/inputs/declaration_dossier.md` (`a1f43f9ccae823038431bafdc86d2691a49d59dc26b290a90ccffcc6756ad86b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/inputs/dependency_inventory.json` (`91fc49f22f126bab33f8a228452835396873f255bf41d682f9b4ab47679004f0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/inputs/direct_review_packet.md` (`227670c2d043e7ba2d58bb89151d79ccc4a5f9ef151ec826e9b0417db7543e5b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-STDEV/faithfulness/inputs/source_locator.json` (`72d176ab38125b7733734b1be56ab414f240f0474f48ca021dedabb033d059a0`)
