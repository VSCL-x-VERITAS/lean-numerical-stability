# Faithfulness audit: HDP-01-CLAIM-VARIANCE-SUM

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `36ccc3c00ca35bd0763fba001c85eaca86b5389fca2d4689f3af08384349f73e`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target preserves the source's real-valued finite-sum variance equality, includes all positive finite jointly independent L2 families on probability spaces, and adds no i.i.d. restriction or normalization. It is genuinely stronger because it needs only pairwise independence and also covers an empty finite family and a broader finite-measure context. The explicit L2 hypothesis resolves the source's unstated moment condition; that source ambiguity is recorded but does not defeat the implication on the intended finite-variance reading. Therefore Lean implies the source, the source does not imply the full Lean statement, and the appropriate accepted classification is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Restrict the Lean statement to a positive finite index type and a probability measure. Source joint independence gives the required pairwise IndepFun hypotheses, and the source's meaningful finite real variances are represented by the L2 conditions; the resulting conclusion is exactly the source equality.
- **Source implies lean:** `no`. The source asserts the identity only for positive jointly independent families on probability spaces. It does not establish the Lean statement's pairwise-independent but not jointly independent cases, its empty-family case, or its formulation over arbitrary finite measures.

## Findings

- **note / dependence-strengthening:** This is genuine nonvacuous added strength because pairwise independence is sufficient for variance additivity but does not imply joint independence.
- **note / measure-domain-extension:** The Lean theorem includes every source probability-space instance and additionally quantifies over finite measures; the extra scope is not supplied by the source.
- **note / empty-index-extension:** Lean adds the valid trivial empty-sum case without excluding any source case.
- **note / moment-assumption-ambiguity:** L2 is a natural precise reading of finite meaningful variances, but the source's omission leaves a residual interpretive ambiguity about extended-valued or non-L2 variables.
- **note / index-scope-generalization:** The translation adds the valid vacuous empty-family case without losing any source instance.
- **note / independence-generalization:** This is a genuine strengthening because pairwise independence suffices for variance additivity; every source family still satisfies the hypothesis.
- **note / measure-scope-generalization:** The formal statement has broader measure-space scope, while every source probability-space instance remains included.
- **note / integrability-clarification:** The translation resolves the source's integrability ambiguity in the standard way needed for finite real variance.

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

- Blind translator covered `37` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `37` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/agent_outputs/agent_runs.json` (`f898dbe650f550a8019b5fcebd7856cdebb2e787388403f41ebac834e0701e07`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/agent_outputs/batch_source_contract.json` (`411b1a2eabf406e54959810552609dcd353cd391f1acc5fe8260489f4c4b7f49`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/agent_outputs/blind_translation.json` (`012571cd6bb6618b5284a24c022d7fc7e299be5653577e01d2ddc2cd800f3d4a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/agent_outputs/direct_judge.json` (`4181e3511bc0372d44abb4d1b2a4ddb739ced20e24cbab79059bcec414909643`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/agent_outputs/roundtrip_judge.json` (`451d3c6185ee49b01405adcf7771f66cf3bba6430455e5ad63b2652caa500529`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/agent_outputs/source_contract.json` (`950f58419430cb53ec28c8320b025e0d53475d0776c2c7fabbebc895f7e29bf2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/decision.json` (`4142e2c8e9bd746e4cbe4b2ec9bb628fd240a608a17f6d000c4f4c6e0f8d2990`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/inputs/batch_source_locator.json` (`8af4dd8a560766600bf26dfe42cd90ec6e6a587195df82808dc65bf0eb7eb2c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/inputs/blind_dependency_inventory.json` (`840e2bd284a488bfca1df32b429d2b7fc31e78c42aa70f6b6e4bfed982412fd8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/inputs/blind_dossier.md` (`45105465ef62c2c782a82c53a419112c987e9148bad77b21d63003cf9b63f278`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/inputs/blind_review_packet.md` (`45105465ef62c2c782a82c53a419112c987e9148bad77b21d63003cf9b63f278`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/inputs/declaration_dossier.md` (`9c122996efca2e51600010789e123361caca99dc93e4954fc46d41706bae6557`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/inputs/dependency_inventory.json` (`840e2bd284a488bfca1df32b429d2b7fc31e78c42aa70f6b6e4bfed982412fd8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/inputs/direct_review_packet.md` (`0e70b428cb2aed9f68e74b700833eaf23976378c6e55cefa840fb1ccbeac6383`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-VARIANCE-SUM/faithfulness/inputs/source_locator.json` (`4b6a2b24c13a369fb018ebabffe8a183f3e12d69d38f9aa6f5df614ce9d9e6a0`)
