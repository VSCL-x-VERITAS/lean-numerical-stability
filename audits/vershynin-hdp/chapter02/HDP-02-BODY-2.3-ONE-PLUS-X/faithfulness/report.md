# Faithfulness audit: HDP-02-BODY-2.3-ONE-PLUS-X

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `b6a22ca5249fa2344e2a19b95390590c85bd9fd813e27d04201ad11b885f8e9c`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The source passage invokes the standard real inequality 1 + x <= e^x. The Lean target states exactly this inequality for every real x. Its fully explicit type confirms that 1, addition, order, and exponential are the standard real operations, and every listed dependency matches that interpretation. The source's omitted quantifier and domain are conventional mathematical ellipsis; making them explicit as forall x : Real preserves the standalone claim and covers the immediate Bernoulli-MGF substitution. Both implications therefore hold, with no unresolved dependency or semantic check.

## Implications

- **Lean implies source:** `yes`. For every real x, the Lean proposition asserts precisely 1 + x <= exp(x), so it directly supplies the conventionally understood source inequality and its Bernoulli-MGF substitution.
- **Source implies lean:** `yes`. Reading the source's elementary numeric inequality in its standard mathematical sense as universal over real x yields exactly the Lean proposition, with identical real operations and comparison.

## Findings

- **note / implicit source quantification:** This is a harmless explicit formalization of the conventional meaning, not a semantic restriction or extension; the immediate nonnegative MGF application is included.
- **note / implicit source quantification:** This is an explicitization of standard source convention, not a semantic difference. The immediate source application only needs a nonnegative argument, but the cited elementary inequality itself is conventionally universal over the reals.

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

- Blind translator covered `10` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `10` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/agent_outputs/agent_runs.json` (`66a580860ae26097991e33e45febf661df2d29cb55628f6eb53c33d8b57e1a9b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/agent_outputs/blind_translation.json` (`cf3f7bf344f48a7178b1efc125e3ccd71dc67bf9077f1219b5b5851e0842bd91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/agent_outputs/direct_judge.json` (`818583066afceac8a55c856da51cc1394ffd1f53e14de6b405fff32bfddba4b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/agent_outputs/roundtrip_judge.json` (`213026da83b284bf0562fa72daa26389e10c14644c8a8b4fd930974dc011f268`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/agent_outputs/source_contract.json` (`18325786badd6853863667b7df1df8ec5ee16bedd7506ccb04139b793f522010`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/decision.json` (`fac15880121ba64395ce9ba2a8eb3be3762a905aee468a625a51c21660758710`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/inputs/blind_dependency_inventory.json` (`96bbde2ebbc1d330d0ab2f03ae068195d4481e8a5ba3e4cfac59fd0326721aea`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/inputs/blind_dossier.md` (`baf25648013c7856c7d07428263a3efb230926cdb1fe51269ab7052848acee01`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/inputs/blind_review_packet.md` (`baf25648013c7856c7d07428263a3efb230926cdb1fe51269ab7052848acee01`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/inputs/declaration_dossier.md` (`df22ae48ae436b1ec2f1fb1964457e01ac48ef43b5d982f10f8d22951d24c03f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/inputs/dependency_inventory.json` (`96bbde2ebbc1d330d0ab2f03ae068195d4481e8a5ba3e4cfac59fd0326721aea`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/inputs/direct_review_packet.md` (`f2bf9afef8d09bfa76844df48c9dd68e083a1038c04bf59cc63cfdc2f30badbd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.3-ONE-PLUS-X/faithfulness/inputs/source_locator.json` (`8dd8f9cc084def6c158d424c05228dffe0019e1aeb24a5f5ec40f2bb010dd5e2`)
