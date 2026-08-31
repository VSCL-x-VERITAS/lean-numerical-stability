# Faithfulness audit: HDP-02-BODY-2.2-COIN-BOUND

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `2050a665e4e90a7ab0907ee109a3b9f7d524c257bda1cb46ed4154303b48c709`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The formal proposition exactly captures the selected fair-coin application of Hoeffding's inequality. Each Boolean coordinate is measurable, mutually independent, and has the exact Bernoulli(1/2) pushforward law; true is counted as one and false as zero; the finite sum is therefore the number of heads. The arbitrary nonempty finite index type is equivalent by reindexing to N positive tosses with N = card ι. The event uses the correct inclusive real threshold 3N/4, including ceiling semantics when N is not divisible by four, and the right side is exactly exp(-N/8). The explicit measure-theoretic hypotheses are inherent in the source's probability/random-variable model. Both implication directions hold, the assumptions are nonvacuous, and no unresolved dependency or semantic check requires adjudication.

## Implications

- **Lean implies source:** `yes`. Instantiate the arbitrary finite index type as Fin N (or reindex it with {1,…,N}) and interpret true as heads. D001 makes the sum S_N, hLaw gives exact fair marginals, hIndep gives the inherited independence, hN gives positive N, and the Lean conclusion is literally P{S_N ≥ 3N/4} ≤ exp(-N/8).
- **Source implies lean:** `yes`. Given any Lean family, let N = card ι. Since hN makes N positive, choose a bijection ι ≃ Fin N and reindex the mutually independent exactly fair Boolean tosses. The source N-toss bound applies, and reindexing preserves the 0/1 sum, its event, its probability, and the cardinality-based right side. The explicit measurability/probability-space hypotheses are automatic components of the source random-variable model.

## Findings

- **note / indexing-generalization:** This is equivalence-preserving finite reindexing, not a change of domain or strength.
- **note / explicit-model-hypotheses:** These conditions unpack the intended source probability model and do not reduce its applicability.
- **note / integer-threshold:** For nonmultiples of four this is exactly the conventional ceiling interpretation, so no rounding mismatch occurs.

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

- Blind translator covered `69` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `69` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/agent_outputs/agent_runs.json` (`de2a36225b1ed8c10ca3f3fb05c52317a60e25cd0e76b26fe7ef0f73fb2fed5a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/agent_outputs/blind_translation.json` (`41058e10a8a48869574c18f1c9d09170eb1ed341bf17d7808ddf5a20711a6999`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/agent_outputs/direct_judge.json` (`ddea23a7fb3d91257fbdb8228becfd9f9cbfe385eb86af420bcd3d7320c21aff`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/agent_outputs/roundtrip_judge.json` (`880496100c7fc33ae0805f24d3c55359db741575bbd4c27ca74cd4425faf9865`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/agent_outputs/source_contract.json` (`8300c20e232a3f3b6555d5b0dbce64a17dac610b96b62a5f1689d738c5d50df4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/decision.json` (`9f492ed1ae4ee715b150caef0f79e08e1e6c582e63b118a2dd6360d4d5304bdc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/agent_outputs/agent_runs.json` (`de2a36225b1ed8c10ca3f3fb05c52317a60e25cd0e76b26fe7ef0f73fb2fed5a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/agent_outputs/blind_translation.json` (`41058e10a8a48869574c18f1c9d09170eb1ed341bf17d7808ddf5a20711a6999`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/agent_outputs/direct_judge.json` (`ddea23a7fb3d91257fbdb8228becfd9f9cbfe385eb86af420bcd3d7320c21aff`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/agent_outputs/roundtrip_judge.json` (`880496100c7fc33ae0805f24d3c55359db741575bbd4c27ca74cd4425faf9865`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/agent_outputs/source_contract.json` (`8300c20e232a3f3b6555d5b0dbce64a17dac610b96b62a5f1689d738c5d50df4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/decision.json` (`29d5587e9344184413b3770e3f746a9a8c03a044bc900db15fb1813134dcc48a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/inputs/blind_dependency_inventory.json` (`5f1227172f21eaa53e8e86bad0cbcf0fad206790c4bf99708e36c7b9139b5bfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/inputs/blind_dossier.md` (`aaee6a3260b32c3b686950d901a8817777a2c72e63c59c619d1d94a9e93b6bfb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/inputs/blind_review_packet.md` (`aaee6a3260b32c3b686950d901a8817777a2c72e63c59c619d1d94a9e93b6bfb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/inputs/declaration_dossier.md` (`00a86ffe1a0c42b3169c76d0e1369660cedacdd84dd933c57a1b6ceac36c3823`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/inputs/dependency_inventory.json` (`e25e5151542226b286cad860647e048db4685d0ad76e8d5e2c16cf0c43319ef5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/inputs/direct_review_packet.md` (`2639992d2bcdb6e1c7f120df1af067209b8aff86013ca5f448a6a6c147a6b766`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/history/20260831T100727Z/inputs/source_locator.json` (`cf43cd2234e8822230f310db4ce1e8a153d693c108518b82abc49877a5013229`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/inputs/blind_dependency_inventory.json` (`5f1227172f21eaa53e8e86bad0cbcf0fad206790c4bf99708e36c7b9139b5bfa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/inputs/blind_dossier.md` (`aaee6a3260b32c3b686950d901a8817777a2c72e63c59c619d1d94a9e93b6bfb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/inputs/blind_review_packet.md` (`aaee6a3260b32c3b686950d901a8817777a2c72e63c59c619d1d94a9e93b6bfb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/inputs/declaration_dossier.md` (`63d6fc70667c90e3a715092fced3639d1f46d96071f51b10664ea7b8c085c8ec`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/inputs/dependency_inventory.json` (`e25e5151542226b286cad860647e048db4685d0ad76e8d5e2c16cf0c43319ef5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/inputs/direct_review_packet.md` (`2639992d2bcdb6e1c7f120df1af067209b8aff86013ca5f448a6a6c147a6b766`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.2-COIN-BOUND/faithfulness/inputs/source_locator.json` (`cf43cd2234e8822230f310db4ce1e8a153d693c108518b82abc49877a5013229`)
