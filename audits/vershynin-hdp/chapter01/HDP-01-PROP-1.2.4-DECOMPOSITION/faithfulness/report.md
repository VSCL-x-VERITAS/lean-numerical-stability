# Faithfulness audit: HDP-01-PROP-1.2.4-DECOMPOSITION

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `3bb864031248e1595d5c5403438b8e14c511b9bf358e02d689133ad6e6a8288a`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The Lean proposition preserves the source's real scalar x, equality, arithmetic, complementary threshold predicates, boundary convention, and 0-or-1 indicator semantics, while correctly excluding the subsequent random-variable and expectation steps. Its sole semantic difference is omission of the inherited assumption t > 0, which extends the exact identity to all real thresholds. Thus Lean implies the source, the source does not cover the additional Lean cases, and the fixed policy classifies the target as faithful-stronger. All dependencies and semantic checks are resolved, so adjudication is unnecessary.

## Implications

- **Lean implies source:** `yes`. Specializing Lean's universal threshold t to any t satisfying the source's inherited condition t > 0 yields exactly the source scalar identity, with matching real operations and indicator predicates.
- **Source implies lean:** `no`. The source claim is made only in the inherited context t > 0 and therefore supplies no instances for t = 0 or t < 0, whereas Lean universally asserts the decomposition for those additional nonvacuous thresholds.

## Findings

- **minor / broader-domain-strengthening:** Lean includes additional nonvacuous cases t ≤ 0. This is a genuine broader-domain strengthening, not reduced applicability, so the target remains accepted as faithful-stronger.
- **minor / broader-threshold-domain:** The translation is a nonvacuous strengthening to t ≤ 0, not an equivalent restatement of the source’s inherited domain; all remaining mathematical content agrees.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `fail` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `fail` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `20` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `20` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/agent_outputs/agent_runs.json` (`b03942da70a95ce27323b4e3a25ddfe60092c6f6a1cd1d0f025a6a6f4e46a87c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/agent_outputs/blind_translation.json` (`936be5b1d9d854369f19a3ee0981e710cba262fbbee7cd28b2d4faca1410337e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/agent_outputs/direct_judge.json` (`d1dc50fe1ebd54d943246817b835e962d28a7be57e8779ec8ff6ef33dc0e60f5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/agent_outputs/roundtrip_judge.json` (`9deffcfa292bd720bdc9cba234346eb4c4eb5ae4c81f7c290ff985f5b011729e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/agent_outputs/source_contract.json` (`158b84d510ea10a8f89a49ce5ee0b3b76b4067cca32a11897578dd845b19c643`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/decision.json` (`fa41e4f83ae31e11abbf9cf68493623a1201df508e058c463b93b579f81c3fdd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/inputs/blind_dependency_inventory.json` (`b1c85742b71dbfc1deb6fee190a1761e1da58cc750e74cfae14caffda95b642b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/inputs/blind_dossier.md` (`467c7ff74aeb6fb4bd450bb03705ca1c899706751746073742d7ed3f4f6f2b53`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/inputs/blind_review_packet.md` (`467c7ff74aeb6fb4bd450bb03705ca1c899706751746073742d7ed3f4f6f2b53`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/inputs/declaration_dossier.md` (`d31ca676bb419f7510482939d124841862a15b23e500b32ad38e477e98600bda`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/inputs/dependency_inventory.json` (`b1c85742b71dbfc1deb6fee190a1761e1da58cc750e74cfae14caffda95b642b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/inputs/direct_review_packet.md` (`a35135089058f87283bef5789de25237742bffb640cbd56ce11af7eb2bd9e4e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-PROP-1.2.4-DECOMPOSITION/faithfulness/inputs/source_locator.json` (`76ec3629b7f00092cbc38cc1c339900d46862d238f26596a19dd44f80f5f5779`)
