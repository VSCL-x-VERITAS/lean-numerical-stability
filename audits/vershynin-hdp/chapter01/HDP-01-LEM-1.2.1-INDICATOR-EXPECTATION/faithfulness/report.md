# Faithfulness audit: HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `a164238975259335f376de4faa65aeb9ebed5918505748892ce6ce445bfbe692`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The primary PDF hash, direct dossier hash, and supporting source-contract hash 1f9158bf319dc68b17f0b4a4c1f3abe88f8e295f261b5d28b7949e9bfcb5b576 were verified. Every dependency preserves the intended expectation, 0–1 indicator, strict event, and real probability semantics. The only consequential difference is that the source occurrence inherits X ≥ 0 and t ≥ 0, whereas Lean covers every measurable real X and every real t. Thus Lean implies the selected source claim, the selected source claim does not state Lean's additional cases, and the target is a faithful, nonvacuously stronger generalization with no unresolved evidence requiring adjudication.

## Implications

- **Lean implies source:** `yes`. Specializing Lean's arbitrary measurable real X and arbitrary real t to the source's non-negative random variable and non-negative integration parameter gives exactly E[1_{t<X}] = P{t<X}; D001, D002, and D009 match the source operators.
- **Source implies lean:** `no`. The cited source occurrence asserts the equality only under inherited non-negativity of X and in the t ∈ [0,∞) integration context. It does not assert the cases of negative-valued X or negative t universally quantified by Lean, even though the same identity is mathematically valid there.

## Findings

- **note / genuine-domain-generalization:** Lean proves the same exact indicator-probability identity on a strictly larger, satisfiable domain. This is genuine nonvacuous strength, not reduced applicability.
- **major / larger-domain-generalization:** The translation is a genuine nonvacuous strengthening: it implies the selected source instance, while the selected source statement does not supply all of the additional sign-changing-X and negative-threshold cases.
- **note / core-identity-preserved:** The event identity, strict comparison, exact equality, and expectation-probability relationship are faithfully preserved throughout the enlarged domain.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `fail` | `fail` |
| `C03` | `fail` | `fail` |
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

- Blind translator covered `25` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `25` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/agent_outputs/agent_runs.json` (`03902469ebed11c189adf74522927efe29f4cfa7b157212f61cce1224cd17161`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/agent_outputs/batch_source_contract.json` (`f78f795913a1a975aeaa39e69fb325bee52653cb2512d692e64c27a538fa18d9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/agent_outputs/blind_translation.json` (`2475d497e01bc851820ea6cd04a9bb8f0810731dc25d54b55da9451a9c66ebd6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/agent_outputs/direct_judge.json` (`e4de6b0dbf9bb0fd65cbb3061efc649a897311bc351fc1f94a7c92c496e50760`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/agent_outputs/roundtrip_judge.json` (`5e21014f8d4bf79389d257aa9a928305fe2c40dfd4dcba61552767f141610016`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/agent_outputs/source_contract.json` (`1f9158bf319dc68b17f0b4a4c1f3abe88f8e295f261b5d28b7949e9bfcb5b576`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/decision.json` (`24c8a9cf0539e5648688bc7620ffe2fdd3733f88caa36c0cb4e65f3a018a4206`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/inputs/batch_source_locator.json` (`6b68799ac5aa540dcd4c8133bb1a9b308fda76686fb0525b1e00e2d6dc0c6640`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/inputs/blind_dependency_inventory.json` (`576f080eb38546ad6fe87a2eb582e7db6e42be4339136dd9834835a7cd9ee2e6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/inputs/blind_dossier.md` (`ca07bb33dfd1a19e9157a6135c4a53ebf5224b2a0bf211b5d240904d5945a232`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/inputs/blind_review_packet.md` (`ca07bb33dfd1a19e9157a6135c4a53ebf5224b2a0bf211b5d240904d5945a232`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/inputs/declaration_dossier.md` (`0b3a69f7fe92d4c54d9c9fa1f4056c1256437a1debe77c2d7f7cb4c1f521d657`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/inputs/dependency_inventory.json` (`d3ffdf8df859cfcaa3b1e999555831d58547499ecfcbbe255086c7d08eac022e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/inputs/direct_review_packet.md` (`0eaf500a4a4e4b5674350982f027c8ed8afe04b0f302074247d50d9e142ab0b5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-INDICATOR-EXPECTATION/faithfulness/inputs/source_locator.json` (`97c910d34bcd2b4fff4230668d969878689377f75b17c0f6dd6e22594b00b197`)
