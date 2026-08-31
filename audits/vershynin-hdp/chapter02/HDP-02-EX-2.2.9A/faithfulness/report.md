# Faithfulness audit: HDP-02-EX-2.2.9A

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `a38f993eadaad546e09fa8c31556a056cc73ea02ff818754218f831445d1fe60`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The proposition faithfully formalizes the sample-mean Chebyshev guarantee and strengthens it in controlled ways. Its iid real L2 setup gives the source mean and variance, its empirical average is exactly the hinted estimator, and its quarter bound on the >=epsilon failure event yields at least 3/4 strict epsilon-accuracy. The fixed constant 4 witnesses, but is not entailed by, the source's existential absolute constant; pairwise independence also broadens applicability. The open-versus-closed source inconsistency is fully resolved directionally because Lean matches the opening convention and implies the footnote convention. Thus Lean implies the source, the source does not imply the exact Lean proposition, and no evidence remains unresolved enough to require adjudication.

## Implications

- **Lean implies source:** `yes`. Restricting the Lean theorem to the source's iid sample setting, the fixed universal value C=4 witnesses the source's existential absolute constant. The bound P(|mu-hat-mu|>=epsilon)<=1/4 gives P(|mu-hat-mu|<epsilon)>=3/4, matching the exercise's opening definition, and also gives P(|mu-hat-mu|<=epsilon)>=3/4 as in footnote 2.
- **Source implies lean:** `no`. The printed result asserts only existence of some absolute C; that statement alone does not entail that the particular value C=4 works. Moreover, if footnote 2's closed success event is taken literally, it does not control probability mass at exact error epsilon and therefore does not imply Lean's bound on the >=epsilon failure event. The opening strict convention removes the latter issue but not the explicit-constant strengthening.

## Findings

- **note / explicit-absolute-constant:** This is genuine nonvacuous strength: Lean supplies the uniform witness C=4, so Lean implies the source but the existential source wording does not logically force this numerical witness.
- **note / accuracy-boundary-convention:** Lean exactly complements the opening strict-accuracy convention and is stronger than the footnote's closed-event formulation when there is boundary mass; either reading is implied by Lean, so the source inconsistency does not leave the classification unclear.
- **note / independence-generality:** The Lean theorem applies under a weaker hypothesis that is sufficient for sample-mean variance control, another genuine generalization rather than reduced applicability.
- **note / explicit-constant-strengthening:** The reconstruction is a valid witness for the source claim but is not logically implied by the source's existential big-O wording.
- **minor / accuracy-boundary:** This exactly complements the body formulation and is stronger than the footnote formulation when the boundary has positive probability mass.
- **note / independence-strength:** The reconstruction covers pairwise-independent families beyond the usual joint-independence source domain, providing another genuine strengthening rather than a restriction.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `fail` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `fail` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `80` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `80` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/agent_outputs/agent_runs.json` (`5eefa2513d979991a61094de62cda0c7257263712a3022af8f004d66b8127737`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/agent_outputs/blind_translation.json` (`2ef1d13318c312fd1541a9031fee73454cf3b3d161b2199b2edc60fa8d646b84`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/agent_outputs/direct_judge.json` (`f4c6c4a8696ee2b63eb2b645cedddb4c3ed8425d395f2651c40531d5a3464b06`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/agent_outputs/roundtrip_judge.json` (`549ea25735b3035c97399135f73e7f870f9249ab4bd5a9f4b4585a31ecd8dc9f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/agent_outputs/source_contract.json` (`8025fca8c65d202c337480b04a930b4b8c205a1b07dfec0faf566d1b52362b9a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/decision.json` (`4a9c6b7ab13d504b764a536144a99171072f1f12be30de5d235026d0a82e1005`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/agent_outputs/agent_runs.json` (`5eefa2513d979991a61094de62cda0c7257263712a3022af8f004d66b8127737`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/agent_outputs/blind_translation.json` (`2ef1d13318c312fd1541a9031fee73454cf3b3d161b2199b2edc60fa8d646b84`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/agent_outputs/direct_judge.json` (`f4c6c4a8696ee2b63eb2b645cedddb4c3ed8425d395f2651c40531d5a3464b06`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/agent_outputs/roundtrip_judge.json` (`549ea25735b3035c97399135f73e7f870f9249ab4bd5a9f4b4585a31ecd8dc9f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/agent_outputs/source_contract.json` (`8025fca8c65d202c337480b04a930b4b8c205a1b07dfec0faf566d1b52362b9a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/decision.json` (`767e09a6e8ae0feca7d5519f1af6f9fa8105bdd2a51fc05bf4a4e30b9052f022`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/inputs/blind_dependency_inventory.json` (`8e706a45eb9ae3f6aa7ffa61db9a1a90d170037c433af794f0bc1258ac0c0f95`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/inputs/blind_dossier.md` (`e8dee48e6fc4d4218e0024353f68237181e0a323ed29d76c2c23c73c3fc73059`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/inputs/blind_review_packet.md` (`e8dee48e6fc4d4218e0024353f68237181e0a323ed29d76c2c23c73c3fc73059`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/inputs/declaration_dossier.md` (`f266ddd941ec55a07692875cda05a3dc8ff7cb2b545f2d662c5abac055868651`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/inputs/dependency_inventory.json` (`8e706a45eb9ae3f6aa7ffa61db9a1a90d170037c433af794f0bc1258ac0c0f95`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/inputs/direct_review_packet.md` (`290ddf311a6e695dbb1777293548be2baa0ee10ff774e57e31783a1d01ca6d65`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/history/20260831T101258Z/inputs/source_locator.json` (`c31a2bfe27d412d304200a4f2128f964a6f6a5007d506a8e5498d957e25cb2c3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/inputs/blind_dependency_inventory.json` (`8e706a45eb9ae3f6aa7ffa61db9a1a90d170037c433af794f0bc1258ac0c0f95`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/inputs/blind_dossier.md` (`e8dee48e6fc4d4218e0024353f68237181e0a323ed29d76c2c23c73c3fc73059`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/inputs/blind_review_packet.md` (`e8dee48e6fc4d4218e0024353f68237181e0a323ed29d76c2c23c73c3fc73059`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/inputs/declaration_dossier.md` (`9ca60b11e4eb0669905789ebd8fdbcc2a499befa2d08e59918fe9d5ca2ca223f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/inputs/dependency_inventory.json` (`8e706a45eb9ae3f6aa7ffa61db9a1a90d170037c433af794f0bc1258ac0c0f95`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/inputs/direct_review_packet.md` (`290ddf311a6e695dbb1777293548be2baa0ee10ff774e57e31783a1d01ca6d65`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.9A/faithfulness/inputs/source_locator.json` (`c31a2bfe27d412d304200a4f2128f964a6f6a5007d506a8e5498d957e25cb2c3`)
