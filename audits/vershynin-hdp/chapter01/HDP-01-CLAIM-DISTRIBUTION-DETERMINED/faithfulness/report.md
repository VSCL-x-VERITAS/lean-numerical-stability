# Faithfulness audit: HDP-01-CLAIM-DISTRIBUTION-DETERMINED

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `dd6ae9c9717a7f6e85176d98ad75baf3a23f78bea687d3e36edcbf0965870638`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target is the exact law-level unpacking of CDF uniqueness, with inclusive lower intervals and no extra hypotheses. Both implications hold.

## Implications

- **Lean implies source:** `yes`. Apply the law-level theorem to the laws of two real variables with equal CDFs.
- **Source implies lean:** `yes`. Realize arbitrary Borel probability measures as identity laws; source uniqueness gives the forward implication and equality gives the converse.

## Findings

- **note / representation:** This removes irrelevant realizations while preserving exactly all real laws.
- **note / logical-form:** The reverse is automatic and adds no strength.
- **note / law-representation:** No mismatch: these are exactly the possible real laws.
- **note / logical-packaging:** The converse is automatic and does not alter strength.

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

- Blind translator covered `12` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `12` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/agent_outputs/agent_runs.json` (`66986496b5861d43744f5d9cad886c8ffc321a0c1e54d812ef8bf27ef3ad9c93`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/agent_outputs/blind_translation.json` (`20e3684132bed78754d68615f318f0b9f02aa0adef66dd75e1c29bbde2a5fae2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/agent_outputs/direct_judge.json` (`684d96b9446f14dd318ad1e1735fca7c7aaf55a71810d6a2bf986ae2a70ece22`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/agent_outputs/roundtrip_judge.json` (`898744de005858d3002a5afc6e713518acf315132fbb0713f505db0e72ae7824`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/agent_outputs/source_contract.json` (`84acb8f640f87412708f8975ddcdba2d7d0a82e1feabd5f0d774080dc6df8c31`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/decision.json` (`72b4543e465d408e4838a7ec882fd78eb316eea0f355981a77d4fb4dff9955d3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/inputs/blind_dependency_inventory.json` (`19598d4831aca7becb3565d854f7231d373f9d4b3d4433b7c03fd76d27a1c2c1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/inputs/blind_dossier.md` (`150b5661cd261989e852d88f243f040c7a211e6ee1d0111d80377575aabb0116`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/inputs/blind_review_packet.md` (`150b5661cd261989e852d88f243f040c7a211e6ee1d0111d80377575aabb0116`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/inputs/declaration_dossier.md` (`10d6256936bcdc89fe0c56dcedb47c015f12967ecdc3c38a42d64b7fe36bc0f2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/inputs/dependency_inventory.json` (`19598d4831aca7becb3565d854f7231d373f9d4b3d4433b7c03fd76d27a1c2c1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/inputs/direct_review_packet.md` (`d0bc8bb8477b1c1f08aff3302cba9154199879ef0a989f23aa53e01a81780974`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-DISTRIBUTION-DETERMINED/faithfulness/inputs/source_locator.json` (`f9c5d9bb8411090e96cf501592357df013980f057b72b5064269358cb8903e28`)
