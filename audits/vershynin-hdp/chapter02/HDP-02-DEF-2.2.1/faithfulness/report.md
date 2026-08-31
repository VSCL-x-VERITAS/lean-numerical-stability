# Faithfulness audit: HDP-02-DEF-2.2.1

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `56e039a03adb33355bb1e49322c08a8a643c04e4d18cbbc643f8337c95dbe29d`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target is a faithful distribution-level formalization of Definition 2.2.1 and its immediately following affine-equivalence paragraph. It constructs a canonical real PMF with exactly half its mass at -1 and half at 1, and it identifies that law as the pushforward of the usual Bernoulli(p) PMF under the 0↦-1, 1↦1 recoding exactly for p=1/2. The use of PMFs and Bool removes an irrelevant ambient probability-space realization without changing the law-level content. Extra moment fields present in the underlying model structure are not projected into the target proposition and therefore do not strengthen it.

## Implications

- **Lean implies source:** `yes`. The fixed PMF has mass 1/2 at each of -1 and 1; PMF normalization exhausts all probability at those atoms, and the defining pushforward confirms the two-point support. The universal iff says precisely that the affine recoding of Bernoulli(p) has this symmetric law exactly when p=1/2, yielding the source definition and following affine equivalence at distribution level.
- **Source implies lean:** `yes`. The source's two equiprobable atoms determine the canonical symmetric Bernoulli PMF. Applying Z=2X-1 to the usual Boolean Bernoulli(p) law sends 0 to -1 and 1 to 1, so the resulting law is symmetric exactly when p=1/2, which gives every target conjunct.

## Findings

No findings were recorded.

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

- Blind translator covered `82` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `82` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/agent_outputs/agent_runs.json` (`69b6e3c7612b35aa4279469bc4c776fe17143d736833f06a7d30f66fdfa92fd7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/agent_outputs/batch_source_contract.json` (`3a5b6961597bd1e9de8764103b093d160c3f6438bad4f01773f2ae4676bb99d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/agent_outputs/blind_translation.json` (`5f3f28d6bc11013568e3993e9b7732d98f52af5c15230f0bb2a010657b16312a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/agent_outputs/direct_judge.json` (`862a1de4fa61959da74a5753c6feb20ecbbc5cc43c090327b7d0a1ad1b087e7f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/agent_outputs/roundtrip_judge.json` (`87016c97c48533a0056cb5c775aed17c17280d20c98b19e56f1fa8b5e09f24c7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/agent_outputs/source_contract.json` (`b28ab1f52e7f55bcd0401e2564464276fb048bdd81d00255539370cc9a636dd5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/decision.json` (`89d6f63b7120ec16b26908fa3d7734754505f1f9e6df3ea6b964dee6399d7b55`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/agent_outputs/agent_runs.json` (`02c7b4adfbbbcb93dd59ba1e4d4d96f2d98fb59242edb3084aa18d2169e2c10f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/agent_outputs/batch_source_contract.json` (`3a5b6961597bd1e9de8764103b093d160c3f6438bad4f01773f2ae4676bb99d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/agent_outputs/blind_translation.json` (`5f3f28d6bc11013568e3993e9b7732d98f52af5c15230f0bb2a010657b16312a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/agent_outputs/direct_judge.json` (`862a1de4fa61959da74a5753c6feb20ecbbc5cc43c090327b7d0a1ad1b087e7f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/agent_outputs/roundtrip_judge.json` (`87016c97c48533a0056cb5c775aed17c17280d20c98b19e56f1fa8b5e09f24c7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/agent_outputs/source_contract.json` (`b28ab1f52e7f55bcd0401e2564464276fb048bdd81d00255539370cc9a636dd5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/decision.json` (`e22209663bfe4a1ff8b8e41a376f40ebfc122625b583720337ecde00da2f8794`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/inputs/batch_source_locator.json` (`8ba21d0d93338fa231a4d6bb4ad939ce131b226a5fcd3e29e849fa8b6d3c0d5b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/inputs/blind_dependency_inventory.json` (`38aa233a324ce8030f5c25dd7fa6488054f19628b80cd229b36a628e65551a6e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/inputs/blind_dossier.md` (`863804de7b21a5b16c39701f5f6d76e0790679552950742c15e3fab52fd3116f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/inputs/blind_review_packet.md` (`863804de7b21a5b16c39701f5f6d76e0790679552950742c15e3fab52fd3116f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/inputs/declaration_dossier.md` (`387b55556514cedf3be8934e9ec53b81589568319ff220723b2ade29edb28e79`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/inputs/dependency_inventory.json` (`3099e6ece6210012fd4fb689554db657044ecd6429e9c30d68b883261f495dc6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/inputs/direct_review_packet.md` (`510c21196d71b50505fb675b1edd186fe9cd0048eab6ac31278d0514189c1490`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T083227Z/inputs/source_locator.json` (`821ccf05f65d67790abda2b65aa2f097ebb7167db6d52b98419510bd54bb4fb4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/agent_outputs/agent_runs.json` (`69b6e3c7612b35aa4279469bc4c776fe17143d736833f06a7d30f66fdfa92fd7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/agent_outputs/batch_source_contract.json` (`3a5b6961597bd1e9de8764103b093d160c3f6438bad4f01773f2ae4676bb99d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/agent_outputs/blind_translation.json` (`5f3f28d6bc11013568e3993e9b7732d98f52af5c15230f0bb2a010657b16312a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/agent_outputs/direct_judge.json` (`862a1de4fa61959da74a5753c6feb20ecbbc5cc43c090327b7d0a1ad1b087e7f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/agent_outputs/roundtrip_judge.json` (`87016c97c48533a0056cb5c775aed17c17280d20c98b19e56f1fa8b5e09f24c7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/agent_outputs/source_contract.json` (`b28ab1f52e7f55bcd0401e2564464276fb048bdd81d00255539370cc9a636dd5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/decision.json` (`44e8997445df5cb73af67ad805099a60bb0a6dc01fbf7f1e84404195cc25c992`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/inputs/blind_dependency_inventory.json` (`38aa233a324ce8030f5c25dd7fa6488054f19628b80cd229b36a628e65551a6e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/inputs/blind_dossier.md` (`863804de7b21a5b16c39701f5f6d76e0790679552950742c15e3fab52fd3116f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/inputs/blind_review_packet.md` (`863804de7b21a5b16c39701f5f6d76e0790679552950742c15e3fab52fd3116f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/inputs/declaration_dossier.md` (`a87c31ddf9b0d245cfae76af44206c25e8d4d72cb88063fa713f8fef1130b044`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/inputs/dependency_inventory.json` (`3099e6ece6210012fd4fb689554db657044ecd6429e9c30d68b883261f495dc6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/inputs/direct_review_packet.md` (`510c21196d71b50505fb675b1edd186fe9cd0048eab6ac31278d0514189c1490`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/history/20260831T100822Z/inputs/source_locator.json` (`821ccf05f65d67790abda2b65aa2f097ebb7167db6d52b98419510bd54bb4fb4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/inputs/blind_dependency_inventory.json` (`38aa233a324ce8030f5c25dd7fa6488054f19628b80cd229b36a628e65551a6e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/inputs/blind_dossier.md` (`863804de7b21a5b16c39701f5f6d76e0790679552950742c15e3fab52fd3116f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/inputs/blind_review_packet.md` (`863804de7b21a5b16c39701f5f6d76e0790679552950742c15e3fab52fd3116f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/inputs/declaration_dossier.md` (`6f04904ed99909a64fd751996f9c8e326f54fae4ce3bb8736cf6ce930813c8bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/inputs/dependency_inventory.json` (`3099e6ece6210012fd4fb689554db657044ecd6429e9c30d68b883261f495dc6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/inputs/direct_review_packet.md` (`510c21196d71b50505fb675b1edd186fe9cd0048eab6ac31278d0514189c1490`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-DEF-2.2.1/faithfulness/inputs/source_locator.json` (`821ccf05f65d67790abda2b65aa2f097ebb7167db6d52b98419510bd54bb4fb4`)
