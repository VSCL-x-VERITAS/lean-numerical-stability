# Faithfulness audit: HDP-01-EQ-1.8

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `f8adbd0e4134f499cd3e484f164abe0ee2ef92424ae7579b83132b5b1ded4b27`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The theorem is a source-faithful distribution-level rendering of Equation (1.8). Nat captures both the support and the full k range; NNReal captures the implicit finite nonnegative parameter domain without excluding zero; singleton measure evaluation corresponds to P{Z = k}; and the formula has the exact negative sign, kth power, and factorial denominator. ENNReal.ofReal is harmless because the expression is nonnegative, including at λ = 0 under the standard zeroth-power convention.

## Implications

- **Lean implies source:** `yes`. The target supplies the required singleton mass for every Nat index of the canonical Poisson law at every finite nonnegative rate. Interpreting a Poisson random variable through this law gives P{Z = k} = e^{-λ} λ^k/k!, and the Nat outcome space supplies the stated support.
- **Source implies lean:** `yes`. Under the source-compatible interpretation of λ as a finite nonnegative real and Z ∼ Pois(λ) as having the canonical Poisson law, the source singleton-probability formula translates directly to the target's measure evaluation. The real expression is nonnegative, so its ENNReal embedding is exact.

## Findings

No findings were recorded.

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

- Blind translator covered `34` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `34` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/agent_outputs/agent_runs.json` (`bdd667d28b0498102a5e262d5958c03221d7675d228fa20c50a4e72164726cf7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/agent_outputs/blind_translation.json` (`93c7ad360d681829170136b5a3a12008760950c3f6aea9cb4876273f61f4a318`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/agent_outputs/direct_judge.json` (`569a64bf9e200dd7ebdc6446066637fe38753a4b05e4f1bda425478f54ed3fd2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/agent_outputs/roundtrip_judge.json` (`59e6afb919df87994c359262786b761094feda41e57518f1f5604305698bac31`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/agent_outputs/source_contract.json` (`e8c5220c774d3fb565bef6384658ed5e08012fce88b81d5623d380185b2d4646`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/decision.json` (`f8615684677f6e56f3ff0d23639d37933cd3604ad60e1f0c16709c1ed0034144`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/inputs/blind_dependency_inventory.json` (`818e18f94017b76cb3974b1a22c385dbb4596233d3e0e119dad9309af97cd101`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/inputs/blind_dossier.md` (`bde344c8a6f6c35deb47d8bc6e6d9968acf39a6cfc5abf447a39c755cbb21852`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/inputs/blind_review_packet.md` (`bde344c8a6f6c35deb47d8bc6e6d9968acf39a6cfc5abf447a39c755cbb21852`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/inputs/declaration_dossier.md` (`1e4f07dbe21ad714fe3daa7d054870e292e5c6679df03b400b16704dad08e507`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/inputs/dependency_inventory.json` (`f46000826207a8ae620ad7cb660098ff907b6e1044f1b7f2aaed43b184dc8db7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/inputs/direct_review_packet.md` (`ddb8bc42bb7a77d506ae67790b972d5a30deb9057af65bd4451bdb298c90fce3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.8/faithfulness/inputs/source_locator.json` (`a74ccaf40313929e2b61f2f994fba758c5f514e990088f288174398847da8996`)
