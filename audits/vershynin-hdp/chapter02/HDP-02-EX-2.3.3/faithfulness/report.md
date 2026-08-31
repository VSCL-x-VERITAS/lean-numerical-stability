# Faithfulness audit: HDP-02-EX-2.3.3

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `9c46ddb55a3e379592d7c2f7543124f0460a54c863baae70ab5e6e8db0253ce3`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The local Chapter 2 wording is silent about whether Pois(lambda) admits zero, but its explicit reference to Theorem 1.3.4 supplies the inherited convention. In the first edition, lambda is a finite limit of sums of nonnegative Bernoulli parameters, zero is not excluded, and the preceding Poisson mass formula gives the degenerate law at zero. Lean's NNReal rate and poissonMeasure therefore have exactly the source domain. At rate zero, t > lambda forces t > 0 and both sides of the bound are zero. All other event, order, constant, exponent, and law semantics already agree, so both implications hold and the formalization is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. For every source-admissible nonnegative lambda and real t > lambda, the Lean proposition states the identical inclusive Poisson-tail event and exact bound. Replacing an arbitrary random variable having the law by its canonical Poisson measure preserves this law-invariant probability.
- **Source implies lean:** `yes`. The exercise's explicit Theorem 1.3.4 hint imports the first-edition Poisson convention whose parameter is a finite limit of nonnegative Bernoulli means and may equal zero. Thus the source covers every rate : NNReal, including the degenerate zero law, and yields the canonical-measure formulation with the same real threshold and bound.

## Findings

- **note / poisson-zero-rate-convention-resolved:** The zero-rate endpoint introduces neither reduced applicability nor extra strength, so the statement is equivalent rather than merely stronger.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `unclear` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `unclear` | `unclear` |
| `C11` | `unclear` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `30` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `30` dependencies (`0` hash-reused); failing or unclear: `D008`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/agent_outputs/adjudicator.json` (`e99d3d42dcb391de8f10d2843fad2cde7f5608c03f6568901b70e4eaf1a8a9cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/agent_outputs/agent_runs.json` (`3fee70925e8e75ec72772a73cfb1ad366cbbff17aa2a7e5fb6b04d3b293bb05c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/agent_outputs/blind_translation.json` (`cde7f83d7be959fc0c20a0ce50db460a8e9d179cc7e91dfccba020f184abd703`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/agent_outputs/direct_judge.json` (`78dda2d358da086b14b8cc253658108cf35b6b15caa46eb19bfdd72a73e7edcd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/agent_outputs/roundtrip_judge.json` (`a80014fe9db94f49b271758c7b836a5dd5de46942a97af89cc59c9d4e2bcf375`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/agent_outputs/source_contract.json` (`3cf8d56ad6e4229c8d37ade64590c7814bfa5e40de35321bd68de71fda144d57`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/decision.json` (`71fc63dce6d9a386db84c1e0a18f09d7baaded87a769185c629cce6414a2d730`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T094130Z/agent_outputs/source_contract.json` (`3cf8d56ad6e4229c8d37ade64590c7814bfa5e40de35321bd68de71fda144d57`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T094130Z/inputs/blind_dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T094130Z/inputs/blind_dossier.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T094130Z/inputs/blind_review_packet.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T094130Z/inputs/declaration_dossier.md` (`82a235a5fae4694289dd4aa3a8606e3392439cda2aab2bee00ad53bacf07d2c1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T094130Z/inputs/dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T094130Z/inputs/direct_review_packet.md` (`a3c2004e87a68a27dddc437a70d9f3b922f3a0f26e94d27bf584f3b296dc2eab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T094130Z/inputs/source_locator.json` (`0425c182a6ce2b1016da0e44da0d33699c7063859d19531919313246c082192f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/agent_outputs/adjudicator.json` (`e99d3d42dcb391de8f10d2843fad2cde7f5608c03f6568901b70e4eaf1a8a9cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/agent_outputs/agent_runs.json` (`43e1c95d2b62a3ef9b86ce4b69290cbb1b6a20c2130932c1c1abc98564518088`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/agent_outputs/blind_translation.json` (`cde7f83d7be959fc0c20a0ce50db460a8e9d179cc7e91dfccba020f184abd703`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/agent_outputs/direct_judge.json` (`78dda2d358da086b14b8cc253658108cf35b6b15caa46eb19bfdd72a73e7edcd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/agent_outputs/roundtrip_judge.json` (`a80014fe9db94f49b271758c7b836a5dd5de46942a97af89cc59c9d4e2bcf375`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/agent_outputs/source_contract.json` (`3cf8d56ad6e4229c8d37ade64590c7814bfa5e40de35321bd68de71fda144d57`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/decision.json` (`3c65f7c1f7dfce3b3512f4e1b1a6ca60a431a51ff7a046472ab4d167029d3743`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/inputs/blind_dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/inputs/blind_dossier.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/inputs/blind_review_packet.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/inputs/declaration_dossier.md` (`b3ec573327dccc82a650b30c7504edc6f7923e862c875d73731c567af2dd48b8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/inputs/dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/inputs/direct_review_packet.md` (`a3c2004e87a68a27dddc437a70d9f3b922f3a0f26e94d27bf584f3b296dc2eab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260830T102446Z/inputs/source_locator.json` (`0425c182a6ce2b1016da0e44da0d33699c7063859d19531919313246c082192f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/agent_outputs/adjudicator.json` (`e99d3d42dcb391de8f10d2843fad2cde7f5608c03f6568901b70e4eaf1a8a9cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/agent_outputs/agent_runs.json` (`43e1c95d2b62a3ef9b86ce4b69290cbb1b6a20c2130932c1c1abc98564518088`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/agent_outputs/blind_translation.json` (`cde7f83d7be959fc0c20a0ce50db460a8e9d179cc7e91dfccba020f184abd703`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/agent_outputs/direct_judge.json` (`78dda2d358da086b14b8cc253658108cf35b6b15caa46eb19bfdd72a73e7edcd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/agent_outputs/roundtrip_judge.json` (`a80014fe9db94f49b271758c7b836a5dd5de46942a97af89cc59c9d4e2bcf375`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/agent_outputs/source_contract.json` (`3cf8d56ad6e4229c8d37ade64590c7814bfa5e40de35321bd68de71fda144d57`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/decision.json` (`2a6f1fa024dd672dd7f92652c044bf2802d0b8b466fa2f86172b8f23c1ac299f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/inputs/blind_dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/inputs/blind_dossier.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/inputs/blind_review_packet.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/inputs/declaration_dossier.md` (`6aba4b35eb1107f775d8ef649c5726e2c7c1059e84d33975b562e06c21abb5d3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/inputs/dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/inputs/direct_review_packet.md` (`a3c2004e87a68a27dddc437a70d9f3b922f3a0f26e94d27bf584f3b296dc2eab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T084139Z/inputs/source_locator.json` (`0425c182a6ce2b1016da0e44da0d33699c7063859d19531919313246c082192f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/agent_outputs/adjudicator.json` (`e99d3d42dcb391de8f10d2843fad2cde7f5608c03f6568901b70e4eaf1a8a9cc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/agent_outputs/agent_runs.json` (`3fee70925e8e75ec72772a73cfb1ad366cbbff17aa2a7e5fb6b04d3b293bb05c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/agent_outputs/blind_translation.json` (`cde7f83d7be959fc0c20a0ce50db460a8e9d179cc7e91dfccba020f184abd703`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/agent_outputs/direct_judge.json` (`78dda2d358da086b14b8cc253658108cf35b6b15caa46eb19bfdd72a73e7edcd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/agent_outputs/roundtrip_judge.json` (`a80014fe9db94f49b271758c7b836a5dd5de46942a97af89cc59c9d4e2bcf375`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/agent_outputs/source_contract.json` (`3cf8d56ad6e4229c8d37ade64590c7814bfa5e40de35321bd68de71fda144d57`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/decision.json` (`390bbd5d0c9d8294144155a26ceb17a35cd1e875b361c1327f1d3e51b8bc71b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/inputs/blind_dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/inputs/blind_dossier.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/inputs/blind_review_packet.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/inputs/declaration_dossier.md` (`f1d8ad59be8961abe1c558da24eee4a45c6c8b566e2a4d824a4d61dc9f8d5516`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/inputs/dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/inputs/direct_review_packet.md` (`a3c2004e87a68a27dddc437a70d9f3b922f3a0f26e94d27bf584f3b296dc2eab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/history/20260831T101411Z/inputs/source_locator.json` (`0425c182a6ce2b1016da0e44da0d33699c7063859d19531919313246c082192f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/inputs/blind_dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/inputs/blind_dossier.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/inputs/blind_review_packet.md` (`d50735be5cd3cc03a63629f5d2b42070c8584dda806d07253f00ab467915d237`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/inputs/declaration_dossier.md` (`d8411c25c54ee57e8eb0c804deafc334042442cbeb7949b7dadb675b06e0f3d0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/inputs/dependency_inventory.json` (`5e77287d50d12417319819ae8cd08d829d085fe6dcda4963e49c242c0446bed9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/inputs/direct_review_packet.md` (`a3c2004e87a68a27dddc437a70d9f3b922f3a0f26e94d27bf584f3b296dc2eab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.3.3/faithfulness/inputs/source_locator.json` (`0425c182a6ce2b1016da0e44da0d33699c7063859d19531919313246c082192f`)
