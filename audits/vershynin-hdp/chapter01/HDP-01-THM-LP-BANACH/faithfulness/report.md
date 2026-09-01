# Faithfulness audit: HDP-01-THM-LP-BANACH

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `fdc5c834b834fc090bbb26621bf94362341235a14e42e8ecde5fac236e0b23db`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The current primary definitions close both gaps that caused the round-trip judge's uncertainty. IsProbabilityMeasure is exactly total mass one. For finite p >= 1, eLpNorm is the extended-valued integral of the absolute p-th power raised to 1/p; at p = infinity it is essential supremum; Lp membership makes the value finite and Lp.norm_def converts it to the canonical real norm. The explicit target fixes the canonical Lp normed-group instance in the real NormedSpace and completeness clauses, and IsComplete univ is completeness of the whole norm-induced uniform space. Consequently the NormedAddCommGroup, real NormedSpace, exact norm formula, and completeness conjuncts are jointly equivalent to the printed assertions that the displayed Lp quantity is a norm and that Lp is Banach for every p in [1,infinity]. They are a more explicit decomposition, not genuine stronger content. The standard almost-sure quotient is made explicit by AEEqFun and resolves the source's conventional omission without narrowing its intended domain.

## Implications

- **Lean implies source:** `yes`. For any measurable Omega, probability measure mu, and ENNReal p with 1 <= p, the target uses real-valued almost-everywhere equivalence classes of finite eLpNorm. Its canonical NormedAddCommGroup and real NormedSpace encode normed real-vector structure; Lp.norm_def identifies the canonical norm pointwise with eLpNorm; finite p reduces to the source's expectation-of-absolute-pth-power raised to 1/p, top reduces to essential supremum; and IsComplete univ is completeness of the entire canonical normed space. Thus both printed claims follow at p = 1, every finite p > 1, and p = infinity.
- **Source implies lean:** `yes`. Read in the source's standard classical-Lp sense, random variables are identified almost surely so that the displayed quantity is genuinely a norm. The source's real vector space, exact finite/top norm definitions, normhood, and Banach completeness then provide the canonical normed additive and real normed-space structures, the pointwise Lp.norm_def equality, and whole-space IsComplete univ for the same arbitrary fixed probability space and every p in [1,infinity].

## Findings

- **note / probability predicate resolved:** The target's measure domain exactly matches the source probability-space domain; D018 and C04 are resolved.
- **note / finite and infinity formulas resolved:** The exact source norm is represented at every p in [1,infinity], resolving C06 rather than relying on the name eLpNorm.
- **note / Banach structure decomposition:** The extra conjuncts are an explicit decomposition of normhood and Banach completeness, not genuine additional strength or reduced applicability.
- **note / almost-everywhere quotient convention:** The target makes explicit the standard convention necessary for the printed norm claim to be literally true and does not change its intended mathematical content.

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

- Blind translator covered `56` dependencies (`0` hash-reused); unclear: `D018`.
- Direct judge covered `56` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/agent_outputs/adjudicator.json` (`ff8fe27cb11c0ee123ff2f3374640fccc55aa65638ceb1e3560939b87a23b2db`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/agent_outputs/agent_runs.json` (`97d4b7227c46eb3ced66cd544163462a6b172fe292c3df8ea35075de7502603e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/agent_outputs/blind_translation.json` (`6207fdb0584d61fad392af897f14932a3707c25f8510455604f98dcbbd028bc7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/agent_outputs/direct_judge.json` (`734633374692cb17aa6910d1eb75547765b699cc745afbe4e7ac6ae4c52fb593`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/agent_outputs/roundtrip_judge.json` (`e592f0efda1216810d29844e7cd362d68e9b988a62861440a6facb91ded9adf5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/agent_outputs/source_contract.json` (`c7abae16437468482c029d542bd7c45371181c85240ecb7b6df85194c1bea8da`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/decision.json` (`7d5708ad79f3f4dc14da8871551f4a940a94e7f3e30a552c2ac4d54b3070a9fc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/agent_outputs/agent_runs.json` (`3e120d3ec2f87082587bd4e4405528000c26f529b543efeb6a47831fffd6cafb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/agent_outputs/blind_translation.json` (`3310fd7eb4f77e1efacf3cb631f92cbbff1f1aca6e2b9f067b8b3f12ca1474fd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/agent_outputs/direct_judge.json` (`066c78c3df1f4df0a4546abaeca593d37f66ca407e7daa68d205f07d98a23393`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/agent_outputs/roundtrip_judge.json` (`32f06c25f7cb973b17dc070d75e9b28e8d8e5d07dc85ccc241d394dfde972f44`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/agent_outputs/source_contract.json` (`489105ab4e0ace8cf67a8c567609b3f1bdd06fa66f11cc52473e4673ed22b86a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/inputs/blind_dependency_inventory.json` (`703ba3fd116476f836d411b3f58f546279d66a203607f6add1eed2bde682b7be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/inputs/blind_dossier.md` (`6489e081d575e8c207d65651a60d5eb77bc1b0cce06b2ba1a8a0fe260940372f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/inputs/blind_review_packet.md` (`6489e081d575e8c207d65651a60d5eb77bc1b0cce06b2ba1a8a0fe260940372f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/inputs/declaration_dossier.md` (`2730ea667689bf40b9fbaeddc7cdbd7899984dc1327f2f7d55e8796034b4e060`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/inputs/dependency_inventory.json` (`703ba3fd116476f836d411b3f58f546279d66a203607f6add1eed2bde682b7be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/inputs/direct_review_packet.md` (`488315f2cda76d91c5f913dad33228853987c5462f2f07c61aad5088ed145d33`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/history/20260828T071332Z/inputs/source_locator.json` (`2405d8afe6de3571d268afb9f80cd60d9e3ec3ea0dc0b269f20ee1343d8fa814`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/inputs/blind_dependency_inventory.json` (`336dc5d94af44737c32477f2866eb2f320693c022631e7cbdf65ce17e565e69e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/inputs/blind_dossier.md` (`7a2ab8b64c3dd7803bd65a01ee9db85fdb66cf57403c69b16f3790ff5f412d27`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/inputs/blind_review_packet.md` (`7a2ab8b64c3dd7803bd65a01ee9db85fdb66cf57403c69b16f3790ff5f412d27`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/inputs/declaration_dossier.md` (`fe2d9374268a43f7910a95ecaf6e0083edc098f60318263249b7e16ffdec0280`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/inputs/dependency_inventory.json` (`336dc5d94af44737c32477f2866eb2f320693c022631e7cbdf65ce17e565e69e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/inputs/direct_review_packet.md` (`4af398b1a872560027e806dde0da536f198331fd663c004f3d0c65de794c082c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-THM-LP-BANACH/faithfulness/inputs/source_locator.json` (`2405d8afe6de3571d268afb9f80cd60d9e3ec3ea0dc0b269f20ee1343d8fa814`)
