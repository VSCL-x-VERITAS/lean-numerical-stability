# Faithfulness audit: HDP-01-DEF-MOMENTS-CORRECTED

## Decision

- Classification: `not-faithful-different`
- Accepted: `false`
- Adjudicated: `true`
- Target SHA-256: `6d0fbbff91afca3059288b0716655402c180543da59f120f823a62c170426063`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

Both disputed integral dependencies are fully resolvable and leave no uncertainty: D012 is the total ENNReal lower Lebesgue integral, and D027 is the Real-valued Bochner integral totalized to 0 for nonintegrable inputs. Their target effects confirm that the two conjuncts are nonvacuous-in-context but definitional self-equalities with asymmetric integral semantics. Against the literal printed definitions, the decisive mismatch remains the source's single shared positive real p versus Lean's independent natural n for the ordinary moment and positive real p for the absolute moment. Lean also omits the probability/random-variable conditions, removes the negative-input/noninteger ordinary-power obstruction, and selects Real-versus-ENNReal totalization conventions the source does not state. Therefore neither implication holds, the fixed classification is not-faithful-different, and the audit is not accepted.

## Implications

- **Lean implies source:** `no`. The literal source uses one shared positive real p in both E(X^p) and E(|X|^p). Lean instead uses an independent n : Nat for the ordinary moment and uses p only for the absolute moment. Thus, for a positive noninteger order such as p = 1/2, the Lean raw conjunct supplies no ordinary-moment definition at that p and removes the source's negative-input/noninteger-power obstruction rather than representing it. The definitional self-equalities, arbitrary-measure/function domain, and resolved integral semantics cannot recover the missing shared positive-real ordinary moment.
- **Source implies lean:** `no`. The printed definitions concern a real random variable on a probability space at one positive real order. They do not entail a universally quantified claim for every measure, every possibly nonmeasurable function, and every independent n : Nat including zero, nor do they select Lean's asymmetric conventions: a total Real Bochner integral that is 0 when nonintegrable for the raw moment versus an ENNReal lower integral that may be +infinity for the absolute moment. These are additional and different semantic commitments, not consequences of the literal passage.

## Findings

- **critical / shared-exponent-domain-and-identity:** Lean omits ordinary moments at positive noninteger real orders and breaks the source's identity between the two p-th moment parameters; this alone prevents Lean from implying the complete printed pair.
- **major / negative-input-obstruction:** The target silently avoids a literal source ambiguity by changing the ordinary exponent domain; it is a corrected alternative, not an equivalent rendering of the printed definition.
- **major / probability-and-random-variable-context:** The Lean claim ranges over settings outside the source context, and the printed source does not imply that broader arbitrary-measure/function claim.
- **major / integral-codomain-and-totalization:** The target imposes asymmetric nonintegrability, finiteness, and codomain conventions absent from the literal paired definitions.
- **note / nonvacuity-and-definitional-form:** The target is not inconsistent, but its reflexive truth does not certify the source's shared exponent, probability/random-variable context, or expectation conventions.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `fail` |
| `C02` | `fail` | `fail` |
| `C03` | `fail` | `fail` |
| `C04` | `fail` | `fail` |
| `C05` | `fail` | `fail` |
| `C06` | `fail` | `fail` |
| `C07` | `pass` | `fail` |
| `C08` | `fail` | `pass` |
| `C09` | `fail` | `pass` |
| `C10` | `fail` | `fail` |
| `C11` | `fail` | `fail` |
| `C12` | `fail` | `pass` |

## Dependency coverage

- Blind translator covered `31` dependencies (`0` hash-reused); unclear: `D012, D027`.
- Direct judge covered `31` dependencies (`0` hash-reused); failing or unclear: `D001, D002, D003, D005, D008, D009, D010, D011, D012, D013, D014, D019, D025, D027`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/agent_outputs/adjudicator.json` (`1c89fa39ece49e07891e802db8668386442c5e77f96d96c27350921f0120f81e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/agent_outputs/agent_runs.json` (`4323b9845af9270ab67f8d667f00656081c97e5a366986034442bf1c51bb8242`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/agent_outputs/blind_translation.json` (`220d4408a61b5bc184095e3718c8af6a66a6df51a7e5e21900acc9f9a993f37a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/agent_outputs/direct_judge.json` (`e685ea18be4b3375168d043f10478a6d6fd2a077f1574be09247af319f76ae67`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/agent_outputs/roundtrip_judge.json` (`13d0c9fc36ed6faf0a2018ef113c233b6fe49260c2b58dec661d8b9991bc2d2f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/agent_outputs/source_contract.json` (`8ed1875beac5b189e2633bcd29f05d142d97d537a394cd75a629fe72bf1e4fa4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/decision.json` (`8871673bc9095b4119c114243622600092d69a78150cb44363536e1f1e847c3b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/agent_outputs/agent_runs.json` (`f60c62078d83da960426342b67e544eb041813b49ec231e728296851c47788f7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/agent_outputs/blind_translation.json` (`7f77832fe45040d88a44f224168dad2a652e6f6f26c2a2f2476d6325520edf06`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/agent_outputs/direct_judge.json` (`4c7e60399d3440874e8b810051a317307a7214a70f2bbdeec6288499c0e81149`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/agent_outputs/roundtrip_judge.json` (`ee04e97c4b7b2935f475ee5de02844885b2e47295a339e663bbbc202f3a6b815`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/agent_outputs/source_contract.json` (`cc3532aaa65c3ad211af8f8ac446e7c19cd9bdb0eb67df9558a6e402f1b4b61e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/inputs/blind_dependency_inventory.json` (`5b0416df2c5314d38afed30988614da999d40d4c2cec1e2833506b06c19e62b1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/inputs/blind_dossier.md` (`73da93bdc0ff57e794a39af9a39c3ababfd7f6ff4272898891fc34fa5411bbd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/inputs/blind_review_packet.md` (`73da93bdc0ff57e794a39af9a39c3ababfd7f6ff4272898891fc34fa5411bbd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/inputs/declaration_dossier.md` (`e464c7fa7777cb1985b3ab4aae7cc0f3c5a4503ab0d76f8be6e5b662673369ad`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/inputs/dependency_inventory.json` (`1ede323ce22be0bf3ad0ac72da4c9cb8b9d21df22e95cf22a901fa47cb3e117c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/inputs/direct_review_packet.md` (`97cd60287330219d0dfe6aa489a9d9e0485715e49ffbed12d842e7dbe3338788`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/history/20260828T060829Z/inputs/source_locator.json` (`d1e8b4cb3fe8601386c5a42f671b4463e3247a038c2eda6ea02da6f8745ccecf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/inputs/blind_dependency_inventory.json` (`5b0416df2c5314d38afed30988614da999d40d4c2cec1e2833506b06c19e62b1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/inputs/blind_dossier.md` (`73da93bdc0ff57e794a39af9a39c3ababfd7f6ff4272898891fc34fa5411bbd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/inputs/blind_review_packet.md` (`73da93bdc0ff57e794a39af9a39c3ababfd7f6ff4272898891fc34fa5411bbd9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/inputs/declaration_dossier.md` (`1b7c8923cef47cf050ad980d667d5127d7e0305678eb99a41a114379077b8ecb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/inputs/dependency_inventory.json` (`1ede323ce22be0bf3ad0ac72da4c9cb8b9d21df22e95cf22a901fa47cb3e117c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/inputs/direct_review_packet.md` (`97cd60287330219d0dfe6aa489a9d9e0485715e49ffbed12d842e7dbe3338788`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-MOMENTS-CORRECTED/faithfulness/inputs/source_locator.json` (`d1e8b4cb3fe8601386c5a42f671b4463e3247a038c2eda6ea02da6f8745ccecf`)
