# Faithfulness audit: HDP-01-DEF-CONVERGENCE-DISTRIBUTION

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `6735eb22badc853a504a85ab161f5565a40dda6653e1bcbf2cda1e3946933d11`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The repaired declaration faithfully specifies convergence in distribution for the source's normalized sums. It preserves the i.i.d. assumptions, common mean and variance, σ√N normalization, N-to-infinity regime, all-real-threshold CDF formulation, and standard-normal target. The N+1 shift and explicit positivity and L² assumptions formalize indexing and implicit source conditions without changing the claim; this is a definition/specification, not a proof of the central limit theorem.

## Implications

- **Lean implies source:** `yes`. The Lean predicate asserts all-real-threshold CDF convergence of the source-specific i.i.d. normalized sums to the standard normal, with only explicit versions of the source's implicit moment and positivity conditions.
- **Source implies lean:** `yes`. Under the source's implicit nondegeneracy convention, its normalized-sum pointwise CDF formulation gives the Lean predicate after the cofinal reindexing N to N + 1.

## Findings

- **note / indexing:** This faithfully enumerates positive sample sizes and avoids normalization at zero; it does not change the limit.
- **note / implicit-nondegeneracy:** The added hypothesis makes the intended well-defined, nondegenerate normalization explicit and is not a substantive strengthening relative to the source's intended semantics.
- **note / definitional-scope:** This is appropriate for the definition/specification being audited and must not be mistaken for a missing central-limit-theorem proof.

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

- Blind translator covered `100` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `100` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/agent_outputs/agent_runs.json` (`5cb6a762c3ccdcaedfe3b4fa7a987c3d208bd54c3579c1618fa6ea79ef5c4d3e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/agent_outputs/blind_translation.json` (`fbbb5e55ef09a3c0a3cee91bc78aa1c3af21aaca182374aab93e9138c62038e0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/agent_outputs/direct_judge.json` (`48a8d231a5ecae024b949a9dfb4c8d37211c8767ab5bc8987b37b20b26e2b47a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/agent_outputs/roundtrip_judge.json` (`989fdf3addd90258bc7c27cf46c163408834de8047ed1e751497b7878c5f8462`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/agent_outputs/source_contract.json` (`3cf98be443d0f6603478a2897571856f259c8561ebf8e27a963d9a4366a8170c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/decision.json` (`7af81f245fe80985e971e3712a831f36c58a85432d88fc2885def0f9a762905c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/agent_outputs/agent_runs.json` (`607c659ac830815d826785bd88aa71e208fbb4613ecc3e866a5118b63b2fab63`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/agent_outputs/blind_translation.json` (`4fbba9aae0a2bbdc9e892aa022ff3a5ea41f9845cdc2df1357434d9db9550789`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/agent_outputs/direct_judge.json` (`89771505540306e9cf8117c65ad9ea138abcf09f1298c987431b5111d0fcdd69`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/agent_outputs/roundtrip_judge.json` (`8d6a92fe79ba86a3846333fe96b347c705396b989d201ac1d96d76d05e71a993`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/agent_outputs/source_contract.json` (`d81902bceffa939b5879ebb16b186424a2991335b1548506d525c52d42e4b3b6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/inputs/blind_dependency_inventory.json` (`e7e4d02c55b0fd372b71f131d95d10eafb79dad5a1d225453feed386b9c5f4b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/inputs/blind_dossier.md` (`fc5c1c531d53516b7d85ad551c83d72d082bcd4ba977b8675c460f32167cf0dd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/inputs/blind_review_packet.md` (`fc5c1c531d53516b7d85ad551c83d72d082bcd4ba977b8675c460f32167cf0dd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/inputs/declaration_dossier.md` (`88f90b33108e928053902bf9c368ebe73781caccd50dba58315fd19ace3098d7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/inputs/dependency_inventory.json` (`787815842d4a358171f29e390bd19b2e87a1a568e657c3aff21ea14b36ea9f38`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/inputs/direct_review_packet.md` (`7c229ff35ebbf6909d8fccece20174da1dc32846740c0a6b3fe948a014c6564c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T160815Z/inputs/source_locator.json` (`7086327c305f6e5f93d4fcbaae355703c3ac1246f9dc9c22ec7aa2b6413fd753`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/agent_outputs/agent_runs.json` (`5cb6a762c3ccdcaedfe3b4fa7a987c3d208bd54c3579c1618fa6ea79ef5c4d3e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/agent_outputs/blind_translation.json` (`fbbb5e55ef09a3c0a3cee91bc78aa1c3af21aaca182374aab93e9138c62038e0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/agent_outputs/direct_judge.json` (`48a8d231a5ecae024b949a9dfb4c8d37211c8767ab5bc8987b37b20b26e2b47a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/agent_outputs/roundtrip_judge.json` (`989fdf3addd90258bc7c27cf46c163408834de8047ed1e751497b7878c5f8462`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/agent_outputs/source_contract.json` (`3cf98be443d0f6603478a2897571856f259c8561ebf8e27a963d9a4366a8170c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/inputs/blind_dependency_inventory.json` (`acaf0acc12699827e0711943a5ede26202ed22d4def645207b6edb605999e842`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/inputs/blind_dossier.md` (`2200b4d52e6437b7d4e195df19ab96f992391689ec2481f1ebcfd18d81cd4ecf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/inputs/blind_review_packet.md` (`2200b4d52e6437b7d4e195df19ab96f992391689ec2481f1ebcfd18d81cd4ecf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/inputs/declaration_dossier.md` (`3ca5311b6ccd21ef7333b89c233c0d429c89d62602dc58bf200bb8a9c8b220a4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/inputs/dependency_inventory.json` (`58ab4029d1eb18d5ce560d7d373943187bde3298a794a4eca45ff32a9be4106e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/inputs/direct_review_packet.md` (`e1755db315895e2d4bbaae95a005b9a9a47fbe0bad0534235352e115b7423dca`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/history/20260828T164657Z/inputs/source_locator.json` (`7086327c305f6e5f93d4fcbaae355703c3ac1246f9dc9c22ec7aa2b6413fd753`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/inputs/blind_dependency_inventory.json` (`acaf0acc12699827e0711943a5ede26202ed22d4def645207b6edb605999e842`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/inputs/blind_dossier.md` (`2200b4d52e6437b7d4e195df19ab96f992391689ec2481f1ebcfd18d81cd4ecf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/inputs/blind_review_packet.md` (`2200b4d52e6437b7d4e195df19ab96f992391689ec2481f1ebcfd18d81cd4ecf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/inputs/declaration_dossier.md` (`544c08a1742827388ac10ed2f215df6d840a60aeb1627e30b55ac7e219e79599`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/inputs/dependency_inventory.json` (`58ab4029d1eb18d5ce560d7d373943187bde3298a794a4eca45ff32a9be4106e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/inputs/direct_review_packet.md` (`e1755db315895e2d4bbaae95a005b9a9a47fbe0bad0534235352e115b7423dca`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVERGENCE-DISTRIBUTION/faithfulness/inputs/source_locator.json` (`7086327c305f6e5f93d4fcbaae355703c3ac1246f9dc9c22ec7aa2b6413fd753`)
