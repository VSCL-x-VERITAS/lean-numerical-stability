# Faithfulness audit: HDP-02-EQ-2.7

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `51d9f6cef8bcd02f991c051ed24b0c953ef133f770c90c4fa2e531cb4cef92fd`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The primary source, direct dossier, and blind dossier agree on all substantive content of equation (2.7): a non-strict upper-tail event for a finite independent Bernoulli family, the prefactor exp(-lambda t), the product of all coordinate MGFs, and lambda > 0. The Lean target generalizes the inherited threshold scope and permits an empty finite index, but neither change adds a nontrivial conclusion. Below or at the mean the bound is at least one by Jensen and independence; for the empty family it follows immediately from the empty sum and product. Therefore Lean implies the source by specialization and the source-domain result plus standard probability semantics implies every Lean case. Both implications are yes, the classification is faithful-equivalent, and no uncertainty remains.

## Implications

- **Lean implies source:** `yes`. For a source family X_1,...,X_N, index the coordinates by a nonempty finite type and encode each 0/1 Bernoulli variable as a measurable Boolean B_i with true mapped to 1. The Lean hypotheses provide the same mutual independence and lambda > 0, its sum is S_N, and its integrals are the coordinate MGFs. Specializing its unrestricted t to the source context t > E S_N yields display (2.7) exactly.
- **Source implies lean:** `yes`. For a nonempty finite Boolean family, reindex by 1,...,N and regard each indicator as a Bernoulli variable. If t > E S, the source equation gives the Lean conclusion directly. If t <= E S, MGF factorization and Jensen make the Lean right side at least exp(lambda(E S - t)) >= 1, so it bounds every event probability. If the index type is empty, the sum is 0 and the product is 1: t <= 0 gives 1 <= exp(-lambda t), and t > 0 gives an empty event. Hence every Lean instance follows from the source-domain result together with standard probability semantics; the added instances carry no nonvacuous strength.

## Findings

- **note / threshold-domain-extension:** The additional threshold cases are automatically true and uninformative, so they do not constitute genuine nonvacuous strength.
- **note / empty-index-boundary:** The empty-index case is a valid trivial extension: it reduces to either 1 <= exp(-lambda t) for t <= 0 or 0 <= exp(-lambda t) for t > 0. It does not alter either implication direction.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `fail` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `41` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `41` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/agent_outputs/adjudicator.json` (`271a11cf8a932915df1c34848c43856a63ce6c27830df20a669ee27d53e72b36`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/agent_outputs/agent_runs.json` (`866ed23d2b53ddb2dd46a822bd3447f94c41498ebd43575aeaf48dec1dbb2a85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/agent_outputs/blind_translation.json` (`2290c1e822b06793fdd0b4c00b0f2d50035ba91d63dfdf16369f9e8ee41c6918`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/agent_outputs/direct_judge.json` (`53fa138701903e324e63e8f631469b11f8950f5a31f2f1ac77578641b1fd5029`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/agent_outputs/roundtrip_judge.json` (`1f9157cec05dc78fe7659a3e560646a61700219317cb16248439e9f45a6d31b3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/agent_outputs/source_contract.json` (`0ac7d0adfed6276a2e79bc4e8a5bc32361770f34bdedadeacdf63c651282f0f6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/decision.json` (`3bd32f316ec7ec4929f9a1581c2c04022f2402bf040ed3a81687634d68f51b13`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/agent_outputs/adjudicator.json` (`271a11cf8a932915df1c34848c43856a63ce6c27830df20a669ee27d53e72b36`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/agent_outputs/agent_runs.json` (`866ed23d2b53ddb2dd46a822bd3447f94c41498ebd43575aeaf48dec1dbb2a85`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/agent_outputs/blind_translation.json` (`2290c1e822b06793fdd0b4c00b0f2d50035ba91d63dfdf16369f9e8ee41c6918`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/agent_outputs/direct_judge.json` (`53fa138701903e324e63e8f631469b11f8950f5a31f2f1ac77578641b1fd5029`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/agent_outputs/roundtrip_judge.json` (`1f9157cec05dc78fe7659a3e560646a61700219317cb16248439e9f45a6d31b3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/agent_outputs/source_contract.json` (`0ac7d0adfed6276a2e79bc4e8a5bc32361770f34bdedadeacdf63c651282f0f6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/decision.json` (`695ff2ef15180707a5293ed0497d97bea14275103df1a446a052ea0145d50773`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/inputs/blind_dependency_inventory.json` (`0460a677ee0968f0c030351b1cba5e8ee5fddbc158aa39e46ac38fd47cf1f5cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/inputs/blind_dossier.md` (`fe936e46adc12a1247d451fc6ae25e454b836f3193bc848821f500ea0cd0fa38`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/inputs/blind_review_packet.md` (`fe936e46adc12a1247d451fc6ae25e454b836f3193bc848821f500ea0cd0fa38`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/inputs/declaration_dossier.md` (`ce0dd86eabdb346507fc366ad6b69c10e1603c36892ca6ce5f09a9a913d48cfd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/inputs/dependency_inventory.json` (`0460a677ee0968f0c030351b1cba5e8ee5fddbc158aa39e46ac38fd47cf1f5cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/inputs/direct_review_packet.md` (`347e4bdedcd85bce20c4d72e00504822c473fabd09b07ccb0ecb181e0388b340`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/history/20260831T101148Z/inputs/source_locator.json` (`5167b006f70f4aed5d2554e9c15081ba05865cdd0d9bd024624dbd0ed93773b6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/inputs/blind_dependency_inventory.json` (`0460a677ee0968f0c030351b1cba5e8ee5fddbc158aa39e46ac38fd47cf1f5cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/inputs/blind_dossier.md` (`fe936e46adc12a1247d451fc6ae25e454b836f3193bc848821f500ea0cd0fa38`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/inputs/blind_review_packet.md` (`fe936e46adc12a1247d451fc6ae25e454b836f3193bc848821f500ea0cd0fa38`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/inputs/declaration_dossier.md` (`77926f3b5a22c7410e3aa968644ff90837db10e6f02c95dfceed4ef92966c1d9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/inputs/dependency_inventory.json` (`0460a677ee0968f0c030351b1cba5e8ee5fddbc158aa39e46ac38fd47cf1f5cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/inputs/direct_review_packet.md` (`347e4bdedcd85bce20c4d72e00504822c473fabd09b07ccb0ecb181e0388b340`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EQ-2.7/faithfulness/inputs/source_locator.json` (`5167b006f70f4aed5d2554e9c15081ba05865cdd0d9bd024624dbd0ed93773b6`)
