# Faithfulness audit: HDP-01-EQ-1.4

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `bf4cb7381abda6a4f50150ab3f46c7ef0daba4af6a2571ec76424d161890a6eb`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

Pinned source and Lean match in probability context, real objects, exponent range including 1/infinity, finite-Lp premises, pointwise addition, norm meanings, and direction. Primary definitions resolve uncertainty; AE representatives are harmless by invariance. Both implications hold, so faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. Every source measurable finite-Lp variable satisfies the Lean premises, and eLpNorm has the source finite/top meanings.
- **Source implies lean:** `yes`. Lean MemLp functions have measurable AE representatives; apply the source and transfer by eLpNorm congruence.

## Findings

- **note / probability-context:** No domain mismatch.
- **note / norm-encoding-and-endpoints:** ENNReal faithfully encodes both source branches.
- **note / almost-everywhere-representatives:** Raw representatives versus quotient elements does not change inequality.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `38` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `38` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/agent_outputs/adjudicator.json` (`4e3be579a21d90464f41921a1c0c61a9aa64c17189c387dac7e5da2e2bf3510b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/agent_outputs/agent_runs.json` (`e69f57204842993245ec9cd2ecd4ccb1adc5d9660852a2d4f97f5f25ed1e57a8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/agent_outputs/blind_translation.json` (`6beb661ad2bfb453571e5ff23553ee13b39ad7a0344af7b649c37079d071c6e9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/agent_outputs/direct_judge.json` (`becf4e34c9ff0f0fb72d64b46d9ed7b8beec46ae997305322ecbe36aab1694ea`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/agent_outputs/roundtrip_judge.json` (`e913aa2a9f5f908ead5df007df2eb947298c4967c77d8f594ca60bf285c958bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/agent_outputs/source_contract.json` (`f07e8dce7d8fcdfcc50786dbc98a1403b1ec7a500772ce4c84e44f1f94cd1c7b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/decision.json` (`f1eee6e0a7b081beb276b93594bab15ed33e14fe7741018c5bb0a1e0e563dbdc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/inputs/blind_dependency_inventory.json` (`315dde011db3c8f90dda73b944a9e67def258bbbc99dc2adc9c123dd4b1bc9a6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/inputs/blind_dossier.md` (`3d5f28de961fc604e80910558e034c0e4ec3cc7c5ccb75651c3c592ca858b3c8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/inputs/blind_review_packet.md` (`3d5f28de961fc604e80910558e034c0e4ec3cc7c5ccb75651c3c592ca858b3c8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/inputs/declaration_dossier.md` (`66dd1a6ece31167f16fd9d14055635c0588580027cf61189c5f17e0dc81d0aa2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/inputs/dependency_inventory.json` (`315dde011db3c8f90dda73b944a9e67def258bbbc99dc2adc9c123dd4b1bc9a6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/inputs/direct_review_packet.md` (`3975838e85b029f43527e0f2b75dcc22bcbcf107be8e1268f3973a3253494028`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.4/faithfulness/inputs/source_locator.json` (`0e91fbf0bdb80f820559fe532c3a76b6679fdf59f5fda3ac209f088f5843572b`)
