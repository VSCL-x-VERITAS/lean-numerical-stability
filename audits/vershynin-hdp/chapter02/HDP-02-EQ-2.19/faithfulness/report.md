# Faithfulness audit: HDP-02-EQ-2.19

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `72fbf0fc50afd471fd41253eb18c3ee28ee5ae36bdbec70e0bad2848bbe8fb33`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Independent adjudication against the immutable PDF and primary Lean definitions resolves every trigger. Equation (2.19) asserts the sharp constant-1 inequality ||X - E X||_L2 <= ||X||_L2. The formal proposition universally quantifies the underlying measurable probability space, assumes exactly that the real random variable is in L2, subtracts its own expectation under the same measure, uses exponent 2 on both standard eLpNorms, and preserves the non-strict inequality and object roles. The previously missing declarations show that probability normalization is mu(univ)=1, the sample type cannot be empty, MemLp 2 implies integrability, the integral's exceptional fallback cannot occur, and eLpNorm 2 is the standard square-root-of-second-moment seminorm. Finite two-point probability spaces with nonconstant functions witness substantive satisfiability. Thus both implication directions hold, the statement is nonvacuous, there is no genuine stronger/weaker or reduced-applicability difference, and the consistent classification is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. For any instantiation of the Lean hypotheses, mu is a probability measure, MemLp X 2 mu makes X a measurable finite-L2 and hence integrable real random variable, integral mu X is its expectation, and eLpNorm at 2 is the standard L2 seminorm. The Lean conclusion is therefore exactly Equation (2.19) under the source's implicit well-definedness context.
- **Source implies lean:** `yes`. Given the Lean binders, X lies in the precise real probability-space L2 domain presupposed by the source notation. Instantiating the source's generic centering inequality for that X and mu, then interpreting expectation as the integrable Bochner integral and each L2 norm as eLpNorm at 2, yields the Lean conclusion verbatim.

## Findings

- **note / implicit-context-explicitized:** These are the standard well-definedness conditions implicit in the source's expectation and L2 notation, so they do not change either implication or reduce intended applicability.
- **note / extended-valued-representation:** The ENNReal codomain is a faithful representation of the same finite L2 quantities in this theorem and introduces no exceptional case or strength difference.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `unclear` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `unclear` |

## Dependency coverage

- Blind translator covered `41` dependencies (`0` hash-reused); unclear: `D009, D010, D011, D013, D014, D015, D027`.
- Direct judge covered `41` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/agent_outputs/adjudicator.json` (`a4c84b61558eaad576f2f14697927e80e9797fb245b6d2eefd8c50f3c63d9f9c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/agent_outputs/agent_runs.json` (`059013856da74c8053fb352a28e77654801b78a76fc3481a1acbee1504fd8f1e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/agent_outputs/batch_source_contract.json` (`28f35a98c5911f13735b479aba62c3ef0a2506f7264d821c029b277c2b620dcb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/agent_outputs/blind_translation.json` (`bfe59986e9ed8a010ed78123e2bbd1aa1f14c8d7968514776c9057c6309fe6a3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/agent_outputs/direct_judge.json` (`4d8f7c2c8cb495a16bcbef43b254f04a1d86761fa02a8e71af54b7bd286121c3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/agent_outputs/roundtrip_judge.json` (`06b6a7ecb2c87cd614498a0823fbfa52840708a64d01a328f38aa1639a9a7f78`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/agent_outputs/source_contract.json` (`fc2bf23eec7e6f0f2e171f379c0af9e4646f8d2afa73fa8816aca79a0e9e7ced`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/decision.json` (`6d1c51522dc598ec03cbb1c9038f69b2bf386d89446d32afdabea35cbc4b2aa6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/inputs/batch_source_locator.json` (`fb78af3d9d05aaf3bac5d9223ae611337a47ebc8cac51e8d79386b69cb189a6f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/inputs/blind_dependency_inventory.json` (`9740f6a03bf043dc23037c9b12f919f11ffd23bebd5a9539ec0956c580d80da0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/inputs/blind_dossier.md` (`5eb4173c4b953f786a6f91e28d1bce8f297504a143a358281d179400bb02c586`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/inputs/blind_review_packet.md` (`5eb4173c4b953f786a6f91e28d1bce8f297504a143a358281d179400bb02c586`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/inputs/declaration_dossier.md` (`05a2009ce9a2ee0220505bd1bf1e0d52288345dffbe869d227b2be46fc408028`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/inputs/dependency_inventory.json` (`9740f6a03bf043dc23037c9b12f919f11ffd23bebd5a9539ec0956c580d80da0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/inputs/direct_review_packet.md` (`6ea4c9aad221ef3b1d159a040d333c38b18d0168d2669392d7dbfa6a0deb0b64`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.19/faithfulness/inputs/source_locator.json` (`69f7bab05c42b18124561d9da3d2e4a9a06eec29c63b82d5aa604198b0a9658f`)
