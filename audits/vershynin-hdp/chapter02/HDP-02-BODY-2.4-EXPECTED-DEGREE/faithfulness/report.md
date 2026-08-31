# Faithfulness audit: HDP-02-BODY-2.4-EXPECTED-DEGREE

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `287c03332c57c91b93ae13bd3e06b7aeb3ca26ce7688f6702e8b4ea7bf001ee4`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The Lean declaration is a direct measure-theoretic rendering of the selected expected-degree sentence. Its model uses independent inclusion of every unordered non-loop edge with probability p, its degree is neighbor-set cardinality, and the integral is expectation. Both implication directions hold, including boundary cases.

## Implications

- **Lean implies source:** `yes`. Unfolding the audited model and projections, the Lean equality states that the expected ordinary degree of each vertex in the independent-edge G(n,p) graph is exactly (n-1)p, which is the selected source sentence.
- **Source implies lean:** `yes`. The source equality for every vertex of G(n,p), represented on the labeled vertex set Fin n with its binomial-random-graph measure, is exactly the real integral equality in Lean; the n=0 binder is empty and all probability endpoints are valid.

## Findings

- **note / notation:** This drops only a local abbreviation and does not change the mathematical proposition or either implication direction.

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

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/agent_outputs/agent_runs.json` (`3d293ecc5931d49dc1e86a982064cbd0d074f6f75d47b0f9cbcca258844855af`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/agent_outputs/blind_translation.json` (`0f89c4ce369aa11804ccb73011237654c34ef0b979abf504a3e4009aefa2c39d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/agent_outputs/direct_judge.json` (`2d4520fec696a367ca8b25a7ecd1ddadbf07927535d5e4eab6e0c45304349c87`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/agent_outputs/roundtrip_judge.json` (`e7a053d98f78298b4355c346898dc5b117e8d8a3a082b345fb4438001a18c8ef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/agent_outputs/source_contract.json` (`c83e23ac481360730df3e60bbcaf11b7cd4ff93099d29ba70f065ca0f240efce`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/decision.json` (`f7dc620aebdca7a13bc42c482dc63b27919a89a34464428cea1fab5e3a89b071`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/agent_outputs/agent_runs.json` (`3534e683c8438bffce21806fdfeb406f5243f72d5f3f9409ee9a208d7981c9fb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/agent_outputs/blind_translation.json` (`0f89c4ce369aa11804ccb73011237654c34ef0b979abf504a3e4009aefa2c39d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/agent_outputs/direct_judge.json` (`2d4520fec696a367ca8b25a7ecd1ddadbf07927535d5e4eab6e0c45304349c87`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/agent_outputs/roundtrip_judge.json` (`e7a053d98f78298b4355c346898dc5b117e8d8a3a082b345fb4438001a18c8ef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/agent_outputs/source_contract.json` (`c83e23ac481360730df3e60bbcaf11b7cd4ff93099d29ba70f065ca0f240efce`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/decision.json` (`099c99d6f7d7d60df7e38add9a1936d4c89cec1f87ae89ad0b3c6ca23f1faf81`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/inputs/blind_dependency_inventory.json` (`2ed1169828f5a071df98bdb0efaf7de7b3e6681f7e04d2fbfa2ef9cf93a97a8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/inputs/blind_dossier.md` (`2a786d6fa1bda1dcaaa3a9132bb98e3e8228b9cf2e931956b008b419d35c03bb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/inputs/blind_review_packet.md` (`2a786d6fa1bda1dcaaa3a9132bb98e3e8228b9cf2e931956b008b419d35c03bb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/inputs/declaration_dossier.md` (`7a3aa1b65f9f0690c735fc80645be732667b33a57bf32af0f46222b22e7e0bed`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/inputs/dependency_inventory.json` (`e4cd17b9b7530a8c8c4cb24f651b9ca85d8feaeff204057d47e0d570a84bd995`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/inputs/direct_review_packet.md` (`21e2ec3e5b62055f130dd8e40050efc150a9a43bdd9a525df971e0d38942c2e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T083032Z/inputs/source_locator.json` (`f0fd368d19229c91e69a22aa742ec3d7a56db71547988a9e49e7a9f4d1894a8a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/agent_outputs/agent_runs.json` (`3d293ecc5931d49dc1e86a982064cbd0d074f6f75d47b0f9cbcca258844855af`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/agent_outputs/blind_translation.json` (`0f89c4ce369aa11804ccb73011237654c34ef0b979abf504a3e4009aefa2c39d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/agent_outputs/direct_judge.json` (`2d4520fec696a367ca8b25a7ecd1ddadbf07927535d5e4eab6e0c45304349c87`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/agent_outputs/roundtrip_judge.json` (`e7a053d98f78298b4355c346898dc5b117e8d8a3a082b345fb4438001a18c8ef`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/agent_outputs/source_contract.json` (`c83e23ac481360730df3e60bbcaf11b7cd4ff93099d29ba70f065ca0f240efce`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/decision.json` (`ac20efb77688b5cfe53135db62647ce0d1952c96bb34e9080214bf35a22b00bf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/inputs/blind_dependency_inventory.json` (`2ed1169828f5a071df98bdb0efaf7de7b3e6681f7e04d2fbfa2ef9cf93a97a8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/inputs/blind_dossier.md` (`2a786d6fa1bda1dcaaa3a9132bb98e3e8228b9cf2e931956b008b419d35c03bb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/inputs/blind_review_packet.md` (`2a786d6fa1bda1dcaaa3a9132bb98e3e8228b9cf2e931956b008b419d35c03bb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/inputs/declaration_dossier.md` (`a60599a3b31384ccca48c3f39a141831bc35a0d0b889887a698dd2eb0c34b552`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/inputs/dependency_inventory.json` (`e4cd17b9b7530a8c8c4cb24f651b9ca85d8feaeff204057d47e0d570a84bd995`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/inputs/direct_review_packet.md` (`21e2ec3e5b62055f130dd8e40050efc150a9a43bdd9a525df971e0d38942c2e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/history/20260831T100907Z/inputs/source_locator.json` (`f0fd368d19229c91e69a22aa742ec3d7a56db71547988a9e49e7a9f4d1894a8a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/inputs/blind_dependency_inventory.json` (`2ed1169828f5a071df98bdb0efaf7de7b3e6681f7e04d2fbfa2ef9cf93a97a8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/inputs/blind_dossier.md` (`2a786d6fa1bda1dcaaa3a9132bb98e3e8228b9cf2e931956b008b419d35c03bb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/inputs/blind_review_packet.md` (`2a786d6fa1bda1dcaaa3a9132bb98e3e8228b9cf2e931956b008b419d35c03bb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/inputs/declaration_dossier.md` (`cd7e0f13e85c8f997722247251fba6d16313e02c4becc3472a09c5fd0d47f82b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/inputs/dependency_inventory.json` (`e4cd17b9b7530a8c8c4cb24f651b9ca85d8feaeff204057d47e0d570a84bd995`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/inputs/direct_review_packet.md` (`21e2ec3e5b62055f130dd8e40050efc150a9a43bdd9a525df971e0d38942c2e7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.4-EXPECTED-DEGREE/faithfulness/inputs/source_locator.json` (`f0fd368d19229c91e69a22aa742ec3d7a56db71547988a9e49e7a9f4d1894a8a`)
