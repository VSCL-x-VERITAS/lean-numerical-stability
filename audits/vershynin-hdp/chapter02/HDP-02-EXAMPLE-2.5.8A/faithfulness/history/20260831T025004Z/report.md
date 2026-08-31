# Faithfulness audit: HDP-02-EXAMPLE-2.5.8A

## Decision

- Classification: `not-faithful-weaker`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `c041567574ac0d383d0915f93e2dd8189f9a0831b483fc069a9a2197dcfe9099`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The full Lean environment resolves the only round-trip semantic uncertainty: gaussianReal 0 (sigma^2) is the centered Gaussian law of variance sigma^2, and PsiTwoGauge matches the source's threshold-2 psi_2 infimum. Therefore the quantitative source result implies the target's finiteness assertions. The converse fails as a statement-faithfulness implication because the target contains neither a shared absolute constant nor the bound linear in sigma; ambient homogeneity facts and the excluded proof cannot be substituted for omitted theorem content. The authoritative result is Lean-implies-source no, source-implies-Lean yes, hence not-faithful-weaker and not accepted.

## Implications

- **Lean implies source:** `no`. The Lean proposition asserts only qualitative finiteness of each displayed psi_2 gauge. It has no universal constant C and no inequality relating the general gauge to C sigma. Pointwise finiteness alone does not preserve the source's uniform quantitative conclusion; an unstated scaling theorem or the excluded proof cannot supply missing proposition content in this statement-faithfulness audit.
- **Source implies lean:** `yes`. The source's bounds by a finite absolute constant C and by C sigma imply that the corresponding psi_2 gauges are finite. The full Lean definitions establish that gaussianReal 0 1 and gaussianReal 0 (sigma^2) are exactly the source Gaussian laws and that PsiTwoGauge is the same threshold-2 exponential-square infimum.

## Findings

- **critical / omitted-universal-linear-bound:** The formal target retains qualitative sub-gaussianity but omits the example's quantitative and uniform scale dependence, so it is strictly weaker and not accepted.
- **note / gaussian-parameter-semantics-resolved:** The round-trip C06 and source-to-translation uncertainties are eliminated.
- **note / canonical-law-representation:** This representation is not an additional faithfulness defect and does not change the no/yes implication pair.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `fail` | `fail` |
| `C03` | `fail` | `fail` |
| `C04` | `pass` | `fail` |
| `C05` | `fail` | `fail` |
| `C06` | `pass` | `unclear` |
| `C07` | `fail` | `fail` |
| `C08` | `pass` | `fail` |
| `C09` | `fail` | `fail` |
| `C10` | `fail` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `92` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `92` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/agent_outputs/adjudicator.json` (`49dfa5fdb895d96ffe4244aa2b7533212844d00446c0a70162825b3cf737a1e5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/agent_outputs/agent_runs.json` (`7021489e448e75356d0f853619d42d98f89053a9c1045cc82828797d7252058f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/agent_outputs/batch_source_contract.json` (`494c6f312e574aa6f514d15c6f5cccfd33a38ac45eeaedf5b1a4021def672747`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/agent_outputs/blind_translation.json` (`aec9cdc059660bbeada71533220ccf020b91d675cbe114c99b11c19d0585ff1f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/agent_outputs/direct_judge.json` (`009155d586e838a9dea37750a0032ecb322bc03d78c088a1894bbe4ae1cf3cfc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/agent_outputs/roundtrip_judge.json` (`807e0f0b3853d7945b965caf37a6bb10066f2543139f1951dfdf59b08fb318c7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/agent_outputs/source_contract.json` (`de36de7142ab5beaba2636e11da54e738294b5fafde72001a51e674958d42046`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/decision.json` (`561aa482de7518732e40d11916bf1b70202b699dc5a9b9dba8f282a03d825cd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/inputs/batch_source_locator.json` (`59d0c30087c4101335676c811234504bee892a89bef1c027bac4c02006913d37`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/inputs/blind_dependency_inventory.json` (`6c76449706c23848ed0545f040dab4bd5038c5d8ffc6db23334edc9085a839eb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/inputs/blind_dossier.md` (`4c7fe5a02042c15df877f897df859d75c353746cb0679c1cf3ab86f7379cc151`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/inputs/blind_review_packet.md` (`4c7fe5a02042c15df877f897df859d75c353746cb0679c1cf3ab86f7379cc151`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/inputs/declaration_dossier.md` (`78b5650fd93d2345e2dabed97d8111a65200915cbb427626ebe245249289a53c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/inputs/dependency_inventory.json` (`12a7022e1e789d89aceeb01036be86ff87ab75183387dd4d6f7b640b3bde0b52`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/inputs/direct_review_packet.md` (`5b79dd4d634c540473a940b095b7584649d10a2e5de2f2d1e78c966c934fbc67`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EXAMPLE-2.5.8A/faithfulness/inputs/source_locator.json` (`1c3c6686d45c0da656ab946f10f2b508a6d3606a34cf5b74a050010d330e5305`)
