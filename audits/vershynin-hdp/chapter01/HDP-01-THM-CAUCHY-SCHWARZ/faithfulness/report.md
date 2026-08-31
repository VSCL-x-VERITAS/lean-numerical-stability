# Faithfulness audit: HDP-01-THM-CAUCHY-SCHWARZ

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `66b6cf08011c2d22c8b8f773fe1fe3e31ab0d6e02fe217fa81861241ce3a70e4`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

On probability spaces, Lean exactly matches real L2 Cauchy-Schwarz: expectation is integration, outer norm is absolute value, MemLp supplies finite second moments, eLpNorm at 2 gives the L2 norm, and product integrability follows. Raw representatives are harmless by AE invariance. The sole difference is genuine extension from probability to arbitrary measures, so the target is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Instantiate mu as the source probability measure; all quantities then coincide.
- **Source implies lean:** `no`. The source does not assert the theorem for arbitrary nonprobability measures.

## Findings

- **note / measure-space generalization:** This nonvacuous broader domain yields Lean-implies-source but not source-implies-Lean.
- **note / representatives and finiteness:** AE invariance removes any carrier gap, and MemLp prevents toReal from collapsing top.
- **major / measure-domain generalization:** The translation strictly extends applicability, so only translation-implies-source holds.
- **minor / AE representative semantics:** Raw carrier semantics are broader, without changing the numerical inequality.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `pass` | `pass` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `42` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `42` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/agent_outputs/agent_runs.json` (`74e52c14c297f83bfabf65ddb95d9c861ca1e1396822110ff727540dad465c04`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/agent_outputs/blind_translation.json` (`d3ce3dbef55f12a3cc1a5c4e3a7b49186be458a43fd5639c7401a637be47d82c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/agent_outputs/direct_judge.json` (`99696827d8777cf41d257265aaa7bed14b9b0d8e3921a8d9237d6c9780e557d5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/agent_outputs/roundtrip_judge.json` (`c20def3d1c8e8ba02691e2ce555e1751e157bfac52ddb782367e9b69dc99be1e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/agent_outputs/source_contract.json` (`40de136bdd0a303a6adf560b11aef94c73fcefeca075bef2e6ffba6943e5d7d2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/decision.json` (`21cc86dd2955c8cf8bd35773cc4dbaecd2a82d38b753c0f0f8ac77e6750ce3b5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/inputs/blind_dependency_inventory.json` (`b3622a6a5ef67e5584d0cc72d582cb98f23ca050046496c81ce51213343c2e4f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/inputs/blind_dossier.md` (`a031e13abb6bfc16ec6ced9680228206e22b37f94d68c8a383571d5374b12ff7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/inputs/blind_review_packet.md` (`a031e13abb6bfc16ec6ced9680228206e22b37f94d68c8a383571d5374b12ff7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/inputs/declaration_dossier.md` (`ee4da332b2f885aa3bcc3864c88e601916d4b2a0115e3e2c24ff53c383e07e33`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/inputs/dependency_inventory.json` (`f35b32f70b3f2b307d89c5c1b9097b9ca7986743863adefb43fbb362d6ed5237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/inputs/direct_review_packet.md` (`532f44a456dd97c2aeaee33442d11cc85d352172622f8b2d8cc5651087d5943b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-CAUCHY-SCHWARZ/faithfulness/inputs/source_locator.json` (`edf3fe717b8dd9c9fa3031f2fe91a0791f5b4b30710fb387c6f161d48620d518`)
