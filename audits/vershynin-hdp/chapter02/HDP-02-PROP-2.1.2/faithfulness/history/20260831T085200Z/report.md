# Faithfulness audit: HDP-02-PROP-2.1.2

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `3f193464383c0e43c41a46f1d3a1cd787a3e8d5175963a773bdee91b1da07d42`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target is a faithful equivalent of the task-bounded main display of Proposition 2.1.2. It preserves the full t>0 domain, the non-strict one-sided event g≥t, both exact prefactors, the normalization 1/√(2π), and exp(−t²/2). Its canonical-law formulation is equivalent to the source's arbitrary standard-normal realization, and it correctly excludes the separate Equation (2.3).

## Implications

- **Lean implies source:** `yes`. For any standard-normal random variable g and t>0, its law is standardNormalLaw, so the Lean measure inequalities give exactly the source lower and upper bounds for P{g≥t}.
- **Source implies lean:** `yes`. Applying the source proposition to the canonical N(0,1) law yields the target inequalities; the target expressions differ only by harmless multiplication grouping and use Ici t for the same non-strict upper-tail event.

## Findings

- **note / distribution-level-presentation:** This is an equivalent distribution-level presentation because the statement depends only on the law of g.

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

- Blind translator covered `47` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `47` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/agent_outputs/agent_runs.json` (`b15c1c7abbdff424e3da4d5039bd147861ba0fea916d82ead1f82f7f859f35f1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/agent_outputs/batch_source_contract.json` (`78ff77329542408b78ac1306be4ea1465bdbb08100b189b1cbd7d7997bef0d85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/agent_outputs/blind_translation.json` (`684e6dc7547e2d6fd1cd48a92342edcb58bac0d9c5ad5eee24ec395ff5261d8b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/agent_outputs/direct_judge.json` (`21f8d26619eee31764e2e3ed908efbb68621d8ea8af3f7cd383e22d7a6006bde`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/agent_outputs/roundtrip_judge.json` (`dfee015683c81b0c9739196afc8dbdb89988314aa6d322bfcff12dc0d243689d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/agent_outputs/source_contract.json` (`612c99e1a0c8f5fd22513756422eaa0c9fbe748a0b79ab047aec03c7ba5528e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/decision.json` (`57473627dddc83ea09711e71197e40f699aa792b91e937dfba56508a0f40f395`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/agent_outputs/agent_runs.json` (`75fd9cd28eda877b249ce0342c8c87db594efa60470f7f07cd20a0b8d39fdc35`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/agent_outputs/batch_source_contract.json` (`78ff77329542408b78ac1306be4ea1465bdbb08100b189b1cbd7d7997bef0d85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/agent_outputs/source_contract.json` (`612c99e1a0c8f5fd22513756422eaa0c9fbe748a0b79ab047aec03c7ba5528e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/inputs/batch_source_locator.json` (`e8bee2f1fe6c72518ac6b08c9934fba167fb8de1f0dbb5030ee8af8d5f1e1a7a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/inputs/blind_dependency_inventory.json` (`44395f28af0778320537d5df088f39c16da0c043175ca8375c52bdc8c00d1c78`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/inputs/blind_dossier.md` (`bac29dd5ab50e4d823580b599210157d23ba2a655d6c35677956696f1f147389`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/inputs/blind_review_packet.md` (`bac29dd5ab50e4d823580b599210157d23ba2a655d6c35677956696f1f147389`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/inputs/declaration_dossier.md` (`7cedd6a71e278766090ea93c15fecfcfeae33726746a02f51225a2d98fcc535a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/inputs/dependency_inventory.json` (`5cba890908b86096a5d42d000799aba454a9fff05c6f535415c7a59c45b6466a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/inputs/direct_review_packet.md` (`b2ebedbc766c35b07d789ec6e07301d7bdb1110d7e30307a8de54f98b4d3ca7a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/history/20260829T043314Z/inputs/source_locator.json` (`b690fd1fdb384e37785fa047757ea405760f3e2bafc812ba0d032031de7df80c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/inputs/batch_source_locator.json` (`e8bee2f1fe6c72518ac6b08c9934fba167fb8de1f0dbb5030ee8af8d5f1e1a7a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/inputs/blind_dependency_inventory.json` (`44395f28af0778320537d5df088f39c16da0c043175ca8375c52bdc8c00d1c78`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/inputs/blind_dossier.md` (`bac29dd5ab50e4d823580b599210157d23ba2a655d6c35677956696f1f147389`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/inputs/blind_review_packet.md` (`bac29dd5ab50e4d823580b599210157d23ba2a655d6c35677956696f1f147389`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/inputs/declaration_dossier.md` (`dbe912ad45b4e43ee7f06eea1536655cb7eadd0de06b549d9400fd1f4a05942a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/inputs/dependency_inventory.json` (`5cba890908b86096a5d42d000799aba454a9fff05c6f535415c7a59c45b6466a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/inputs/direct_review_packet.md` (`b2ebedbc766c35b07d789ec6e07301d7bdb1110d7e30307a8de54f98b4d3ca7a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-PROP-2.1.2/faithfulness/inputs/source_locator.json` (`b690fd1fdb384e37785fa047757ea405760f3e2bafc812ba0d032031de7df80c`)
