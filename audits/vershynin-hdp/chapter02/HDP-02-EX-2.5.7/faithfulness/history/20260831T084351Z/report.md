# Faithfulness audit: HDP-02-EX-2.5.7

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `c041567574ac0d383d0915f93e2dd8189f9a0831b483fc069a9a2197dcfe9099`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Primary evidence resolves both disputed issues. The source's genuine-norm assertion, combined with the expectation-only definition, entails the standard identification of random variables up to almost-sure equality; otherwise definiteness is false on general probability spaces. The Lean quotient implements exactly that identity. Separately, D008's declaration body takes the infimum over D016, whose admissibility conditions reproduce positive finite scales, integrability, the exponential-square integrand, and threshold 2. The stray LocalDef002 reference occurs only in blind reuse wording and is contradicted by the supplied typed declaration bodies. The domain, operators, constants, boundary cases, scalar field, absence of centering and independence, and all norm laws therefore match in both directions.

## Implications

- **Lean implies source:** `yes`. The Lean target proves the complete norm assertion for the exact equation-(2.13) gauge on measurable real random variables with finite gauge, modulo almost-sure equality. This is the coherent meaning of the source claim because an expectation-defined functional cannot be definite on literal pointwise functions in general probability spaces.
- **Source implies lean:** `yes`. The source's assertion that the exact gauge is a norm supplies the five stated laws on its full sub-gaussian space. Its generic probability-space context, real scalars, and necessary almost-sure identity convention are made explicit by the Lean binders and quotient without reducing applicability or adding centering or independence.

## Findings

- **note / identity convention:** Almost-sure quotienting is the appropriate formal identity convention and is not a consequential source mismatch.
- **note / blind dependency naming:** The wording is only a blind-dossier naming ambiguity and does not alter the target functional.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `unclear` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `unclear` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `154` dependencies (`76` hash-reused); unclear: `none`.
- Direct judge covered `154` dependencies (`76` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/agent_outputs/adjudicator.json` (`f6c1553e44a2ed12131ee21a5ae74fe5c3fa1a6f1648dd0af8337026d45c7875`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/agent_outputs/agent_runs.json` (`067a230dfb16649e694a570b36379ed903245d75b259c78bafdc874ec1e8ac50`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/agent_outputs/batch_source_contract.json` (`3cd675eedbead941ac098d13a2c6ba1f819f571ca161fd3b5017762c466ce507`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/agent_outputs/blind_translation.json` (`f5792a029102e3808596c161ec25ea5343e802d41277ad4cec2179f70c688618`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/agent_outputs/direct_judge.json` (`5395feebd009ed89c23c8b1f16ad646150bd217d79ab613b67c4344d6bb4098b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/agent_outputs/roundtrip_judge.json` (`20f64b180499d61b4267256af7a07b1b4b3e17b4e97b55947c685961ebb725ee`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/agent_outputs/source_contract.json` (`b6e038ce8117c2d7faff8dd198f5ec25f36f450351c8bb285869c3ce17c81c21`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/decision.json` (`4cd11e7923f422304aa31924dccd2738780db87d7dbe02dc0ec836d4f7766877`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/batch_source_locator.json` (`1dfe65f82a215f65b6cb1f6f851d4b67c260dca271ca0ba5f89b053addc7b137`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/blind_dependency_inventory.json` (`518b2bbaeaa4a602d868415b9e02832845fa352e4977f0be443830308606394b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/blind_dossier.md` (`4f9956966df6c02b5729a77e9a58822b83810db49aa839fd570ca0c85aeaee5f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/blind_review_packet.md` (`830c70cd1322b8939a4d8cbb478f2b1b82aea37338e2d2f12ccd0bb12e01e010`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/declaration_dossier.md` (`18e5227678c0270cd36dc5fc517c8aca1fa2e082bc2f28d289b0a78b5e84fb75`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/dependency_inventory.json` (`21d5da20278b120c252e7fdd9f71262344ea3ff477fe1216e0f27c86abb3e0fe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/dependency_reuse_blind.json` (`e6f60560a3a0d3078d8d58aabcc890055fae00b732aeee89c3c2a9912460a9da`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/dependency_reuse_direct.json` (`2afc7d69db3dde2d8c9d1dcd4e8e82a25f055607c0686a8e7bf24692fcee6d0d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/direct_review_packet.md` (`f7c3e21913f5b1847898dc403425d88ae96d36c19148cd83e07307b2122fba06`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.5.7/faithfulness/inputs/source_locator.json` (`8eb0b6b66680847591a821eac0b7e74816cbeebdc97bfea830e0a8467c96a504`)
