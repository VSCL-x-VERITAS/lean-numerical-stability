# Faithfulness audit: HDP-01-COR-1.2.5

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `da633a895971c346355d9ae4b5c721b8bec88cfce7002ceb8d16dee6f8079f3e`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

D046 is the standard Bochner integral under the target hypotheses. Probability specialization is exact, while arbitrary finite non-probability measures add genuine nonvacuous cases; hence faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Specialize μ to the source probability measure; all operators, hypotheses, event boundaries, and constants then coincide.
- **Source implies lean:** `no`. The source covers only probability measures, not the target's genuine non-normalized-measure cases.

## Findings

- **note / genuine-domain-generalization:** Lean strictly and nonvacuously extends the source.
- **note / operator-terminology:** Naming changes interpretation only outside the exact source specialization; definitions remain clear.
- **note / finite-measure-conversion:** The extension is not an artifact of toReal.

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

- Blind translator covered `50` dependencies (`0` hash-reused); unclear: `D046`.
- Direct judge covered `50` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/agent_outputs/adjudicator.json` (`ab49398dd46220a6d982392e2770bb978daa289e9dc5a3d7de8139ea15d5da3b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/agent_outputs/agent_runs.json` (`ae0566f8bb44588a07b53bd120ccf497e66f3a4be410041c3c69cd70feed47af`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/agent_outputs/batch_source_contract.json` (`991d8dd5566aa7fd79b89f85262604e106e939971f9027ad462979889999027b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/agent_outputs/blind_translation.json` (`ba3d028ebef34ac107ea903f54de2007612c8e60289ef78e30d9913bdbf05eb5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/agent_outputs/direct_judge.json` (`0ca36e7c01ef3dcb25a0deb013ab2cef3a4d1f7aa68d134adbc48e31735b4514`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/agent_outputs/roundtrip_judge.json` (`ce8ecefa14c996ac1321ab2560ddbe16f73c2dfbb3731ec7d2facc9543a1c30f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/agent_outputs/source_contract.json` (`c06d06127a7807754d9190023606de0a5925c7d87570ab9d2943206775e4cc67`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/decision.json` (`fe682d13f238788e29a2c688492f604dedaf6c79803137f8625d7f6e21b8d0f1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T140610Z/inputs/blind_dependency_inventory.json` (`8e5acdce1dbb6b5bcdca8211305e80f632a477cbf9dee85979b921f526bf69de`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T140610Z/inputs/blind_dossier.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T140610Z/inputs/blind_review_packet.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T140610Z/inputs/declaration_dossier.md` (`3c48ac5d5b7d249e22862bef132345ff20fcf9e73cd6a59aaf9035a48f792c47`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T140610Z/inputs/dependency_inventory.json` (`26f1b0606abd268afd2ed89a64e143b653cdecf9794b2ce45d60b240405325c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T140610Z/inputs/direct_review_packet.md` (`07d2cf3d40e480aa3cb743e4375b64c5eeab7c4ed90b9f20b96e7efb29b22da9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T140610Z/inputs/source_locator.json` (`66f8bf24406f768fa7b70854367ae8a314f207fb384352814cc41e07f7417ad1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/agent_outputs/batch_source_contract.json` (`991d8dd5566aa7fd79b89f85262604e106e939971f9027ad462979889999027b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/agent_outputs/blind_translation.json` (`6246f63d437764c0b531f382f82dedafaf07c5ec08829f026d4529401390b18f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/inputs/batch_source_locator.json` (`98eabe4ccda91cf73306c9d05a6e9187e692d366aef4e8a953bb55a74bb88910`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/inputs/blind_dependency_inventory.json` (`8e5acdce1dbb6b5bcdca8211305e80f632a477cbf9dee85979b921f526bf69de`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/inputs/blind_dossier.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/inputs/blind_review_packet.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/inputs/declaration_dossier.md` (`3c48ac5d5b7d249e22862bef132345ff20fcf9e73cd6a59aaf9035a48f792c47`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/inputs/dependency_inventory.json` (`26f1b0606abd268afd2ed89a64e143b653cdecf9794b2ce45d60b240405325c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/inputs/direct_review_packet.md` (`07d2cf3d40e480aa3cb743e4375b64c5eeab7c4ed90b9f20b96e7efb29b22da9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/history/20260828T141404Z/inputs/source_locator.json` (`66f8bf24406f768fa7b70854367ae8a314f207fb384352814cc41e07f7417ad1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/inputs/batch_source_locator.json` (`98eabe4ccda91cf73306c9d05a6e9187e692d366aef4e8a953bb55a74bb88910`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/inputs/blind_dependency_inventory.json` (`8e5acdce1dbb6b5bcdca8211305e80f632a477cbf9dee85979b921f526bf69de`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/inputs/blind_dossier.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/inputs/blind_review_packet.md` (`5d2d0ba05fcb3f2e413fbf968162f6bd40e2c44fb481166318d59430142de305`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/inputs/declaration_dossier.md` (`3c48ac5d5b7d249e22862bef132345ff20fcf9e73cd6a59aaf9035a48f792c47`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/inputs/dependency_inventory.json` (`26f1b0606abd268afd2ed89a64e143b653cdecf9794b2ce45d60b240405325c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/inputs/direct_review_packet.md` (`07d2cf3d40e480aa3cb743e4375b64c5eeab7c4ed90b9f20b96e7efb29b22da9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-COR-1.2.5/faithfulness/inputs/source_locator.json` (`66f8bf24406f768fa7b70854367ae8a314f207fb384352814cc41e07f7417ad1`)
