# Faithfulness audit: HDP-02-PROP-2.5.2

## Decision

- Classification: `not-faithful-weaker`
- Accepted: `false`
- Adjudicated: `false`
- Target SHA-256: `623886ad478a36db1836aa848fdf8e115e158f0218f81e841cc002c2061edea3`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The local definitions faithfully encode all five analytic properties and the witness inequality Kj <= C Ki. Nevertheless, the target is not equivalent to Proposition 2.5.2 as a whole. It assumes centering for every pairwise conversion, thereby dropping the source's uncentered equivalence of items (i)-(iv), and it chooses C after X, so C need not be absolute across random variables. The source theorem implies this centered per-X specialization, but the Lean target does not imply the full source. The correct classification is therefore not-faithful-weaker, not accepted, with no unresolved item requiring adjudication.

## Implications

- **Lean implies source:** `no`. The Lean theorem cannot recover the source's uncentered equivalence of (i)-(iv), because hCenter scopes every conversion. It also supplies C only after Omega, mu, and X are fixed, so it does not imply existence of one absolute comparison constant uniform across random variables.
- **Source implies lean:** `yes`. The full source proposition gives all quantitative conversions in the centered case, with a universal absolute C; specializing that C to any fixed Lean probability space and centered X yields the target conversion statement, and C may be enlarged to at least 1 without loss. The expanded five predicates match items (i)-(v).

## Findings

- **critical / quantifier-scope / absolute constant:** The formal statement loses the source's uniform quantitative content; per-variable comparison is strictly weaker than an absolute comparison theorem.
- **major / missing uncentered base assertion:** The theorem omits the entire noncentered applicability of the four base characterizations and is a proper specialization of the source.
- **note / constant normalization:** This is harmless because any valid positive comparison factor can be enlarged to max(C,1); it does not affect the classification.
- **critical / lost-uncentered-base-result:** The reconstruction omits the proposition's full uncentered four-property theorem and proves only its centered specialization.
- **critical / nonuniform-comparison-constant:** The quantitative uniformity central to the source is weakened to a pointwise-in-X existence claim.
- **major / unintended-vacuous-domain:** Additional outer instances satisfy the reconstruction solely because every transfer antecedent is false.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `fail` | `fail` |
| `C04` | `fail` | `fail` |
| `C05` | `fail` | `fail` |
| `C06` | `pass` | `pass` |
| `C07` | `fail` | `fail` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `fail` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `fail` |

## Dependency coverage

- Blind translator covered `87` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `87` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/agent_outputs/agent_runs.json` (`f81dd0c4da07ba734d2833a69949359ecd62a0fb15cfd56e45005cfb809d407e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/agent_outputs/blind_translation.json` (`c87d7906cb14a72a32409c1f21fc8efaba97d2aaac6af112560227461559a007`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/agent_outputs/direct_judge.json` (`146fae3fa4664218e1ddade6a1c2b6a52d8e2b306200f3edd5f10deb26bbe04b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/agent_outputs/roundtrip_judge.json` (`abcde8eb40475ffef15eb0ce1b049c699d8a9a6fe354f939dfcfe9b6ff40d0c0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/agent_outputs/source_contract.json` (`a4e22e56a7ee7dd1c92b5e3737c325eef6aba4dcad84e2ed18f73ca2405183d1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/decision.json` (`1fd16f95791268a66d12ddbbcb8d9e06211cd173df619daca0bf938f937cc700`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/inputs/blind_dependency_inventory.json` (`5eef277e559a35e2c620cfbdb1bcfe57de0471a46eac9d334859aae33fd84d95`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/inputs/blind_dossier.md` (`00db76560bc28285e8c35b7f70011ed7a9ed32e90719fbcd7d193dd6bf61183b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/inputs/blind_review_packet.md` (`00db76560bc28285e8c35b7f70011ed7a9ed32e90719fbcd7d193dd6bf61183b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/inputs/declaration_dossier.md` (`f1cb695325499d0f431137bf3ca19a062b9ce2e443cc600136d7165385efeb77`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/inputs/dependency_inventory.json` (`0adc74bf9298fae5e1d2faa5f501827a763d47a7c59289bc4f760c37ce18a2be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/inputs/direct_review_packet.md` (`ca4d35f7801a25fe1a2d7a104f256c486fab6d7ac14d73526ba2e476ff9bcd40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.5.2/faithfulness/inputs/source_locator.json` (`0611587a636fad5db51a1225401a19f67a86d9ac2009ada37899e8062d3fc051`)
