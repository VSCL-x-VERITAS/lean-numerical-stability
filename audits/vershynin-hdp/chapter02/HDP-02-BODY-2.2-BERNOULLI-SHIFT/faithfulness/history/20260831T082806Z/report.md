# Faithfulness audit: HDP-02-BODY-2.2-BERNOULLI-SHIFT

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `74626d40b01a364d68b48404dfb48d920eb201d23998542aec3302c016c6b8d6`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target exactly represents the Bernoulli(1/2) iff affine-Rademacher claim. Its arbitrary-measure binder is conservative, so both implications hold and the classification is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. Instantiate mu with the law of X; pushforward is the law of Z = 2X - 1.
- **Source implies lean:** `yes`. Probability measures are identity-variable laws; map equality forces total mass 1, while nonprobability measures make both sides false.

## Findings

- **note / conservative-domain-generalization:** No content changes: equalities force mass 1, and otherwise both sides are false.
- **note / conservative-domain-generalization:** The extra cases do not alter the source content because exact equality with either specified probability law forces the relevant measure to be a probability measure; otherwise both sides are false.

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

- Blind translator covered `57` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `57` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/agent_outputs/agent_runs.json` (`e1b223c8ae3152e67911858ad93a759ced4af3c9c8e92e60f237267659fcead1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/agent_outputs/batch_source_contract.json` (`b8f276e85aee424bca94865e8d9c68b2371e5c9fef510c956b4ad479aaf4c507`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/agent_outputs/blind_translation.json` (`f1481bf5a5a7f8bb6d1d3f95d67301f3ca4a99877b965c14b5f4957592334a30`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/agent_outputs/direct_judge.json` (`ee22b65ecf081ec45768ac0644f3b6f87641ccc416d8b00926b2f75ea8e8ffe1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/agent_outputs/roundtrip_judge.json` (`fd88afc041a6694a4f84af40f6e0a6afe34c0e97aa46471b21fb87f4991ba4dc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/agent_outputs/source_contract.json` (`a637728838a92bb89be96c8e67ae2cc7312f15d223d6e7954797f2f4f7ed6d40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/decision.json` (`03a2a5b19eed13df810567f014160769d75d012491b9e30edaee01c2324aee07`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/agent_outputs/batch_source_contract.json` (`b8f276e85aee424bca94865e8d9c68b2371e5c9fef510c956b4ad479aaf4c507`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/agent_outputs/blind_translation.json` (`50b62a84a0945a981ed483937bfc4e328c1e012113b8cb7f298eec5a0f836cc4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/agent_outputs/source_contract.json` (`a637728838a92bb89be96c8e67ae2cc7312f15d223d6e7954797f2f4f7ed6d40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/inputs/batch_source_locator.json` (`7cd37de0a3e62ea7546069d0c40a3b6f4e5a5869337e8277f12da91245ac5138`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/inputs/blind_dependency_inventory.json` (`32abef918d2f10f93434d8ec825872256a5d98ace0f1d60ae5f08e206052bd91`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/inputs/blind_dossier.md` (`8070a0f6940d8c7f033a2b309485462cce3e7e6894b97d30747a5ecb4d896dc5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/inputs/blind_review_packet.md` (`8070a0f6940d8c7f033a2b309485462cce3e7e6894b97d30747a5ecb4d896dc5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/inputs/declaration_dossier.md` (`879b59dcef49288f7748e15e21e43e7cd35ae3500151c21727d7eb1de961a0fe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/inputs/dependency_inventory.json` (`0388956aaa272695cb3b4549890cd6b591fe8596fdc22681e36ab2dd39945922`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/inputs/direct_review_packet.md` (`5979cccaf2c1d6022db540c80eb785624c6a70b96f8fcfe966c888cf8bd614cf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T053756Z/inputs/source_locator.json` (`f3d995ffe9a4c17733b71fbac3e811709314d5cd0a42be79c671db76550f194e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/agent_outputs/batch_source_contract.json` (`b8f276e85aee424bca94865e8d9c68b2371e5c9fef510c956b4ad479aaf4c507`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/agent_outputs/blind_translation.json` (`81550c87b9b4a2bb47bb5a531bf4cf83edb896e2a5efa82de9af21ae59d06d3e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/agent_outputs/direct_judge.json` (`8539956dc55219ef972d214462c389a231b46082089a094550963813a062fdd8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/agent_outputs/source_contract.json` (`a637728838a92bb89be96c8e67ae2cc7312f15d223d6e7954797f2f4f7ed6d40`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/inputs/batch_source_locator.json` (`7cd37de0a3e62ea7546069d0c40a3b6f4e5a5869337e8277f12da91245ac5138`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/inputs/blind_dependency_inventory.json` (`09acbc128f81742b298538c8a0d5c31f1f5a7cd6e01e79604fe32442ff9ae5d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/inputs/blind_dossier.md` (`5c48513108fea80369e04120278e9ab79abff9f1ef8ac06b9cdd9ccfe6cee338`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/inputs/blind_review_packet.md` (`5c48513108fea80369e04120278e9ab79abff9f1ef8ac06b9cdd9ccfe6cee338`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/inputs/declaration_dossier.md` (`c6a55ad186cac86786c089f2b8dfef078e7b4ed05f747ed52f4965669a13f819`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/inputs/dependency_inventory.json` (`b37421c2480d668a8400366a6cd9c199a924c92b4d2f0cf3113e87518f0341ee`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/inputs/direct_review_packet.md` (`2435ac52f108e646ace7465663f72b8f832eff7cbb609284036f7ce3c4c3b2c1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/history/20260830T055133Z/inputs/source_locator.json` (`f3d995ffe9a4c17733b71fbac3e811709314d5cd0a42be79c671db76550f194e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/inputs/batch_source_locator.json` (`7cd37de0a3e62ea7546069d0c40a3b6f4e5a5869337e8277f12da91245ac5138`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/inputs/blind_dependency_inventory.json` (`0d0e2be36ff9e012a708bce296cf8d8b2baa507aeaba5f960b47d477d99fe6f5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/inputs/blind_dossier.md` (`e05e37c1ba780c9272a454fb7fbc850c3b863bfb38a483a3ad9e272b88a4f893`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/inputs/blind_review_packet.md` (`e05e37c1ba780c9272a454fb7fbc850c3b863bfb38a483a3ad9e272b88a4f893`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/inputs/declaration_dossier.md` (`899d583eb44295a2fe4c90035ea16ac1cf00befd792abc842344641406dce40f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/inputs/dependency_inventory.json` (`c4fcb2ec7de2b1bf44edd030cff09b7a1b9caecbf3221a367b0d0ac783a9a8bc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/inputs/direct_review_packet.md` (`31769eebc7ed7bf7a58266e5875bb1429842904912cbd1088c967622b3d3fbf2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-BERNOULLI-SHIFT/faithfulness/inputs/source_locator.json` (`f3d995ffe9a4c17733b71fbac3e811709314d5cd0a42be79c671db76550f194e`)
