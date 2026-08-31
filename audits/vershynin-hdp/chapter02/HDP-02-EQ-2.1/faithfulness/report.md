# Faithfulness audit: HDP-02-EQ-2.1

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `1cbf552ee48dae41d9170810a9a5bf73e8471454516bf24cdefe0939072e6ab1`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Both required hashes verify. The declaration exactly formalizes Equation (2.1): positive N, an arbitrary common probability-space realization of N mutually independent fair tosses, the uncentered 0/1 head count S_N, the event inclusion at 3N/4 via the centered deviation event at N/4, and the exact Chebyshev bound 4/N. The arbitrary finite index type and explicit measurability and marginal-law assumptions merely expose source conventions. Both implication directions hold, the hypotheses are satisfiable, and the statement is nonvacuous.

## Implications

- **Lean implies source:** `yes`. Every Lean instance is a positive finite family of mutually independent fair Bernoulli outcomes on a common probability space. Its summed 0/1 indicator is exactly S_N, and the two Lean inequalities are precisely the two parts of Equation (2.1).
- **Source implies lean:** `yes`. Any source experiment of N independent fair tosses can be represented by a nonempty finite index type, its common probability space, and Bool-valued head outcomes with the specified marginal laws and independence. Equation (2.1) then supplies exactly the target conjunction.

## Findings

- **note / finite-index-relabeling:** The change is semantically harmless because the claim is invariant under finite reindexing.
- **note / display-chain-as-conjunction:** The conjunction is logically equivalent to the chained display and entails the same endpoint bound by transitivity.

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

- Blind translator covered `73` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `73` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/agent_outputs/agent_runs.json` (`dea41dd94a51fe8fea4b047e0f8ea035b31bebea418b8d90c523cc3428b4f9f6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/agent_outputs/batch_source_contract.json` (`f561eb428f112665c979380c09281de5ab34d0665bc8ef3bd4f619a1c3fd8c29`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/agent_outputs/blind_translation.json` (`870754cd49891937fd9ed4ef7b000c1026fa478ef42eb52a93ce2bbf26c566ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/agent_outputs/direct_judge.json` (`1e59cc95c1434b0d27a7836e4e770ce7b9f6e40bd347de1c43b1e8dc98f066d4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/agent_outputs/roundtrip_judge.json` (`3b60a6fa477bb1bef1953e551b5eed7078b5f1692c7bd9d3e395546266743c39`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/agent_outputs/source_contract.json` (`3a83daa4ee4465081d587a17ba2ad244a1314f29c5309cb0ab3f9f255d9cbac6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/decision.json` (`3fe20834866d964af01449efa81689ad7a2f52aeeaa14999450ca4fa43d6d9a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/agent_outputs/agent_runs.json` (`01c7d7971d308a4b87420d739dd185a9f64cd93b0cf865519d579d0ed75198cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/agent_outputs/batch_source_contract.json` (`f561eb428f112665c979380c09281de5ab34d0665bc8ef3bd4f619a1c3fd8c29`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/agent_outputs/blind_translation.json` (`870754cd49891937fd9ed4ef7b000c1026fa478ef42eb52a93ce2bbf26c566ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/agent_outputs/direct_judge.json` (`1e59cc95c1434b0d27a7836e4e770ce7b9f6e40bd347de1c43b1e8dc98f066d4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/agent_outputs/roundtrip_judge.json` (`3b60a6fa477bb1bef1953e551b5eed7078b5f1692c7bd9d3e395546266743c39`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/agent_outputs/source_contract.json` (`3a83daa4ee4465081d587a17ba2ad244a1314f29c5309cb0ab3f9f255d9cbac6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/decision.json` (`4b1d0090f61bf349235058602bfcf4bdba44326e36ac78dbed3c321737b1f9af`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/inputs/batch_source_locator.json` (`9c9cf43a4f3c5fd7ff134fc25a386ac709c17e358a69a077a2dbe41335d05c63`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/inputs/blind_dependency_inventory.json` (`2a7be554fb3ad4ba888bca1bcc8b6c1bbdf2c42b75cfba38675ee1f6fc7855e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/inputs/blind_dossier.md` (`492600d0e1a2cd0e4d1da6438046abdb5a61e092463dbe6a632afd4c09ba07be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/inputs/blind_review_packet.md` (`492600d0e1a2cd0e4d1da6438046abdb5a61e092463dbe6a632afd4c09ba07be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/inputs/declaration_dossier.md` (`cd6d4fd6aaa6f45c6410384862c0bba638468322bcb299c3712a8ea0f8a911ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/inputs/dependency_inventory.json` (`9d0e84395d219f134c951ecf4213ec6ea2e087f49ea8c0f570cb9b4dbd393ba4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/inputs/direct_review_packet.md` (`e3bcdc03ee1657e561354933fa323d5d62bad18c5b7c01df2a31cc0b4aaa3669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T083245Z/inputs/source_locator.json` (`163a29ee272a4968827832ea0094469f8e4d908e9bc047c6be3609f8ab0be0a7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/agent_outputs/agent_runs.json` (`dea41dd94a51fe8fea4b047e0f8ea035b31bebea418b8d90c523cc3428b4f9f6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/agent_outputs/batch_source_contract.json` (`f561eb428f112665c979380c09281de5ab34d0665bc8ef3bd4f619a1c3fd8c29`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/agent_outputs/blind_translation.json` (`870754cd49891937fd9ed4ef7b000c1026fa478ef42eb52a93ce2bbf26c566ae`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/agent_outputs/direct_judge.json` (`1e59cc95c1434b0d27a7836e4e770ce7b9f6e40bd347de1c43b1e8dc98f066d4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/agent_outputs/roundtrip_judge.json` (`3b60a6fa477bb1bef1953e551b5eed7078b5f1692c7bd9d3e395546266743c39`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/agent_outputs/source_contract.json` (`3a83daa4ee4465081d587a17ba2ad244a1314f29c5309cb0ab3f9f255d9cbac6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/decision.json` (`ded35a0a7df20012ed1fb8c932c7986e998b6949611c2c71ffdae98cb90cb7a6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/inputs/blind_dependency_inventory.json` (`2a7be554fb3ad4ba888bca1bcc8b6c1bbdf2c42b75cfba38675ee1f6fc7855e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/inputs/blind_dossier.md` (`492600d0e1a2cd0e4d1da6438046abdb5a61e092463dbe6a632afd4c09ba07be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/inputs/blind_review_packet.md` (`492600d0e1a2cd0e4d1da6438046abdb5a61e092463dbe6a632afd4c09ba07be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/inputs/declaration_dossier.md` (`cb4764f3cfaea750f9dc1dce2d92fa9d5862ab517c5f380573aaa08df8b39c1f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/inputs/dependency_inventory.json` (`9d0e84395d219f134c951ecf4213ec6ea2e087f49ea8c0f570cb9b4dbd393ba4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/inputs/direct_review_packet.md` (`e3bcdc03ee1657e561354933fa323d5d62bad18c5b7c01df2a31cc0b4aaa3669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/history/20260831T100942Z/inputs/source_locator.json` (`163a29ee272a4968827832ea0094469f8e4d908e9bc047c6be3609f8ab0be0a7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/inputs/blind_dependency_inventory.json` (`2a7be554fb3ad4ba888bca1bcc8b6c1bbdf2c42b75cfba38675ee1f6fc7855e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/inputs/blind_dossier.md` (`492600d0e1a2cd0e4d1da6438046abdb5a61e092463dbe6a632afd4c09ba07be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/inputs/blind_review_packet.md` (`492600d0e1a2cd0e4d1da6438046abdb5a61e092463dbe6a632afd4c09ba07be`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/inputs/declaration_dossier.md` (`1e25645f878ec9c0a87e435bbda1db3054067a9ed7246ef1bd117343e7d1ed70`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/inputs/dependency_inventory.json` (`9d0e84395d219f134c951ecf4213ec6ea2e087f49ea8c0f570cb9b4dbd393ba4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/inputs/direct_review_packet.md` (`e3bcdc03ee1657e561354933fa323d5d62bad18c5b7c01df2a31cc0b4aaa3669`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.1/faithfulness/inputs/source_locator.json` (`163a29ee272a4968827832ea0094469f8e4d908e9bc047c6be3609f8ab0be0a7`)
