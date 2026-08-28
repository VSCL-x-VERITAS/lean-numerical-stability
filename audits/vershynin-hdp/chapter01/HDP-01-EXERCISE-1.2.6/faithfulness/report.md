# Faithfulness audit: HDP-01-EXERCISE-1.2.6

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `71e54adcda94234dbd3693fe62c3ed864b178dfa8da4533408811a86374a2285`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

D052 has the required μ-integral semantics; the target exactly recovers the source and adds valid arbitrary-measure cases.

## Implications

- **Lean implies source:** `yes`. Specializing μ to the source probability measure yields the exact squared-event, Markov, variance, and Chebyshev derivation.
- **Source implies lean:** `no`. The source covers probability measures only; Lean nonvacuously quantifies over arbitrary measures.

## Findings

- **note / arbitrary-measure-generalization:** A genuine strengthening that specializes exactly to the source.
- **note / finite-real-measure-semantics:** The bound is not a toReal-of-infinity artifact.

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

- Blind translator covered `56` dependencies (`0` hash-reused); unclear: `D052`.
- Direct judge covered `56` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/agent_outputs/adjudicator.json` (`0f683e88836143a3e1ce5f3a983fb3d0e04c36d5cfb4b7b59b8f0993b8d8d6e4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/agent_outputs/agent_runs.json` (`b32d04572ee22a8f7e778d21a4c0eb6b5ba1108391a614a9653d1efb8479ce77`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/agent_outputs/batch_source_contract.json` (`991d8dd5566aa7fd79b89f85262604e106e939971f9027ad462979889999027b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/agent_outputs/blind_translation.json` (`110558ad82547257347c0fa3f61895606117786573e9a64df7638437a1d7f129`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/agent_outputs/direct_judge.json` (`cd54707ccce890fe2d651819eca1a654d6754faf751578766352603c8806b37d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/agent_outputs/roundtrip_judge.json` (`2d1900e0d273ac85fa9f6bd8c789d1eed78ebf1e657729b1714c663dd46f4500`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/agent_outputs/source_contract.json` (`ce8dfd1a52b783be0459198710cabfcc811aea25a4c5d3985ecc753bdd8e71a0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/decision.json` (`37e64b8e84315818b5045f15082682ef11ef4ad784b03deff2dab76c66a2ebeb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140610Z/inputs/blind_dependency_inventory.json` (`8e5acdce1dbb6b5bcdca8211305e80f632a477cbf9dee85979b921f526bf69de`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140610Z/inputs/blind_dossier.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140610Z/inputs/blind_review_packet.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140610Z/inputs/declaration_dossier.md` (`2a166d456078284d7f6809154f5e30809e02e1769a86c193d8fbc20d5917c2c0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140610Z/inputs/dependency_inventory.json` (`26f1b0606abd268afd2ed89a64e143b653cdecf9794b2ce45d60b240405325c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140610Z/inputs/direct_review_packet.md` (`d01fe36b3a1305dee5f067780c9c113e422c698839811c76d46e77dd4265674f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140610Z/inputs/source_locator.json` (`44a614b3110bcd20e16ee0b903f53aa3d6ce66645df1be4f025f973e4ce219fd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140756Z/inputs/batch_source_locator.json` (`98eabe4ccda91cf73306c9d05a6e9187e692d366aef4e8a953bb55a74bb88910`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140756Z/inputs/blind_dependency_inventory.json` (`8e5acdce1dbb6b5bcdca8211305e80f632a477cbf9dee85979b921f526bf69de`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140756Z/inputs/blind_dossier.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140756Z/inputs/blind_review_packet.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140756Z/inputs/declaration_dossier.md` (`2a166d456078284d7f6809154f5e30809e02e1769a86c193d8fbc20d5917c2c0`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140756Z/inputs/dependency_inventory.json` (`26f1b0606abd268afd2ed89a64e143b653cdecf9794b2ce45d60b240405325c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140756Z/inputs/direct_review_packet.md` (`d01fe36b3a1305dee5f067780c9c113e422c698839811c76d46e77dd4265674f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T140756Z/inputs/source_locator.json` (`44a614b3110bcd20e16ee0b903f53aa3d6ce66645df1be4f025f973e4ce219fd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T141404Z/inputs/batch_source_locator.json` (`98eabe4ccda91cf73306c9d05a6e9187e692d366aef4e8a953bb55a74bb88910`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T141404Z/inputs/blind_dependency_inventory.json` (`3c6710db4158355039358ea246ffe190b373c94c0b776b645a5e4860edf80ac9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T141404Z/inputs/blind_dossier.md` (`91a33e1d3db1784a519263f278b70d17fa080faa978a3e4bd90dbc9762e286d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T141404Z/inputs/blind_review_packet.md` (`91a33e1d3db1784a519263f278b70d17fa080faa978a3e4bd90dbc9762e286d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T141404Z/inputs/declaration_dossier.md` (`5e50381c9bef329499423e9fdb5d17b4df627c8db4f6213565e79eeeb3ff9ecd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T141404Z/inputs/dependency_inventory.json` (`c3b11b80725751f2e59a41db07b47c80e1b671cb93a558dd7e378752b4b2ae5b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T141404Z/inputs/direct_review_packet.md` (`1e7756d72ab183f821a43cdffd7f094e7faf1ef7200ebc80f18ed95a70f06002`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/history/20260828T141404Z/inputs/source_locator.json` (`44a614b3110bcd20e16ee0b903f53aa3d6ce66645df1be4f025f973e4ce219fd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/inputs/batch_source_locator.json` (`98eabe4ccda91cf73306c9d05a6e9187e692d366aef4e8a953bb55a74bb88910`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/inputs/blind_dependency_inventory.json` (`3c6710db4158355039358ea246ffe190b373c94c0b776b645a5e4860edf80ac9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/inputs/blind_dossier.md` (`91a33e1d3db1784a519263f278b70d17fa080faa978a3e4bd90dbc9762e286d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/inputs/blind_review_packet.md` (`91a33e1d3db1784a519263f278b70d17fa080faa978a3e4bd90dbc9762e286d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/inputs/declaration_dossier.md` (`5e50381c9bef329499423e9fdb5d17b4df627c8db4f6213565e79eeeb3ff9ecd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/inputs/dependency_inventory.json` (`c3b11b80725751f2e59a41db07b47c80e1b671cb93a558dd7e378752b4b2ae5b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/inputs/direct_review_packet.md` (`1e7756d72ab183f821a43cdffd7f094e7faf1ef7200ebc80f18ed95a70f06002`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.6/faithfulness/inputs/source_locator.json` (`44a614b3110bcd20e16ee0b903f53aa3d6ce66645df1be4f025f973e4ce219fd`)
