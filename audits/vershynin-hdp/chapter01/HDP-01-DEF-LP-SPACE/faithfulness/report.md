# Faithfulness audit: HDP-01-DEF-LP-SPACE

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `a114d56aef0904715f5ed8828e33036e14a508a86a29ea479aa920436872614d`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target faithfully states the narrowed Lp-space membership definition. Its exponent binder p : ENNReal with p ≠ 0 is exactly (0, ∞], including the essential-supremum endpoint; μ is explicitly a probability measure; X is real-valued; and the inherited random-variable measurability is represented by hX : AEStronglyMeasurable X μ. The projected representativeMember is definitionally MemLp, whose body is that same measurability condition conjoined with eLpNorm X p μ < ⊤. Consequently hX reduces membership to finite norm in both directions. The model's quotient field and its supporting dependencies are present in the dependency closure but absent from the theorem conclusion, so the earlier quotient issue no longer affects this audit.

## Implications

- **Lean implies source:** `yes`. For every source-admissible real random variable on the fixed probability space and every p in (0, ∞], the inherited measurability supplies hX. The projected representativeMember is MemLp, hence hX reduces it to exactly eLpNorm X p μ < ⊤, which is the source membership criterion.
- **Source implies lean:** `yes`. Under the source's random-variable context, membership is exactly finite Lp quantity. Lean's representative predicate is MemLp = AEStronglyMeasurable ∧ finite eLpNorm, and the explicit hX supplies the first conjunct. The source contract leaves the representative-versus-a.e.-class convention unresolved, so the standard a.e.-strong representative encoding introduces no contrary required conjunct.

## Findings

- **note / measurability-encoding:** The Lean target states the definition for measurable Lp representatives and is stable under null-set modification. This is compatible with the selected Lp-space claim; it should not be misreported as a separate quotient theorem.
- **note / quotient-data-out-of-scope:** Quotient-related dependencies D007, D038, D041, and D043-D046 do not strengthen or weaken the audited proposition.
- **note / equality-model scope:** No implication mismatch for the narrowed target: both sides are judged only on the representative membership iff finite-eLpNorm criterion.

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

- Blind translator covered `46` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `46` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/agent_outputs/agent_runs.json` (`2f4f448a89df84ee3871097dad6513f5d34cb2472baa1dda1c19ab82b95607ff`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/agent_outputs/blind_translation.json` (`80d7b927bdb699260ea7aae5732bd8f77ac0e5160ee7a6b0d05193b5dbc66a64`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/agent_outputs/direct_judge.json` (`e8fe57df5ad5fc2c22e7b304f0d414975c2fcb30f751971a4fdbca02d0f5ed2b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/agent_outputs/roundtrip_judge.json` (`28d741c714ae2983336450cee2a1252222b25d6f5a30c00ba963568c28f66092`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/agent_outputs/source_contract.json` (`e058cbc83c249a4990c35603287db9202f343551e9cfefb18be88991f3bee2cf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/decision.json` (`205925fedc51f90e3184bb3d73fc814879ec0fc7acf38e0ed7dec6577fcd8163`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/agent_outputs/agent_runs.json` (`20d9f9b47cac35e680721bad9a18da2b78995a48b24d8314559e8743b5a30900`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/agent_outputs/blind_translation.json` (`9252480e954df396d5ae5adfe4d5448cda5e6f088bce6b2de6d1760d6ace28b8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/agent_outputs/direct_judge.json` (`9f4b2d98d12286b364bed3059890bb3cea5c3ac59b7995c30bf74400f43680bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/agent_outputs/roundtrip_judge.json` (`50bc1fb417d827e52630bb26991ec39583a38e2da3f24dd2e4ecd87e64341076`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/agent_outputs/source_contract.json` (`6f3890269e387456e0695f1464083496315be7cc8e94a879a2e10755c2c3c887`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/inputs/blind_dependency_inventory.json` (`0be081e782210125f412811aa51766c9e356d853e0f3e5614c11e2f48de7a874`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/inputs/blind_dossier.md` (`3d10a8c38b9c7f2d4d3dad6a9a9af2c53a76f7ced95d6b41f8b00a6de86fb5d7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/inputs/blind_review_packet.md` (`3d10a8c38b9c7f2d4d3dad6a9a9af2c53a76f7ced95d6b41f8b00a6de86fb5d7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/inputs/declaration_dossier.md` (`90fa85e60a98cd92d6f2bca3b34e2c86df99ad7c62764823a246eb4a8891e8c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/inputs/dependency_inventory.json` (`1cf189c0b900bf9589b6c45a5e7932a68db9835c7ffcc45a025fcf3c2fa72085`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/inputs/direct_review_packet.md` (`ac0b76b7c5f9192e749725361d7fe700df3a26e92b7acc8e1831fde24c8f1579`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/history/20260828T064700Z/inputs/source_locator.json` (`5d46336f9a94ae8fe06cdaed23625947233578f1239ff214f4b6f0292e390728`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/inputs/blind_dependency_inventory.json` (`85ad6779c30dc91b86e3773c164b8253dfc7bb5accdb523cc40268bd691268dc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/inputs/blind_dossier.md` (`d1b2346c6ea821ac7c8b6ccd54bca0caa7ce63dc1789d3512d0f5c6a4cd03284`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/inputs/blind_review_packet.md` (`d1b2346c6ea821ac7c8b6ccd54bca0caa7ce63dc1789d3512d0f5c6a4cd03284`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/inputs/declaration_dossier.md` (`c2fe70af7657c1a23bb1db16f4e0cb9fdc17b131ace85b3dd1b9274c1458fccb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/inputs/dependency_inventory.json` (`166dde55b4a32b259e5a1356562496e324d6ba9ad410ce56d2c259aefcad5a03`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/inputs/direct_review_packet.md` (`4daba1022d6aea741d4a9355966dcd9a8d272781291cc2a9f7230a12167bea67`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-SPACE/faithfulness/inputs/source_locator.json` (`5d46336f9a94ae8fe06cdaed23625947233578f1239ff214f4b6f0292e390728`)
