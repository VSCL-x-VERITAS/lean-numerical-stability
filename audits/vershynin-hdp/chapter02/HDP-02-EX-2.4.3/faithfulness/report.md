# Faithfulness audit: HDP-02-EX-2.4.3

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `52b1a9ee479e525072cda203e88f168459e9c305db350d21eaad012b96a98e85`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The primary source, source contract, complete direct and blind dossiers, blind translation, and both judgments agree on the Erdos-Renyi model, p varying with n, expected degree d = (n - 1)p, eventual asymptotics, simultaneous quantification over all vertices, and the log n / log log n scale. The only round-trip blocker was whether the source demanded probability tending to one. The immediately preceding proposition uses the same qualified phrase and proves exactly probability 0.9, so Exercise 2.4.3's explicit 'say, 0.9' is satisfied by Lean's eventual 9/10 bound. Lean therefore implies the source. Conversely, the source's unnamed big-O coefficient does not imply Lean's exact strict C + 5 threshold for every chosen bound witness C. This is a satisfiable quantitative refinement, so the consistent accepted classification is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. For any source family with d = (n - 1)p(n) = O(1), there is a nonnegative real C that eventually bounds d. Instantiating the Lean proposition with that C gives, eventually, probability at least 9/10 that every vertex degree is strictly less than (C + 5) log n / log(log n). This is a simultaneous O(log n / log log n) upper bound. The primary-source use of 'with high probability (say, 0.9)', clarified by the immediately preceding proposition and proof, makes this fixed eventual 0.9 level sufficient for the selected source claim.
- **Source implies lean:** `no`. The printed exercise supplies only an unnamed big-O constant in the degree conclusion and does not relate it to a chosen eventual expected-degree witness C. It therefore does not entail the exact strict threshold coefficient C + 5 for every nonnegative C satisfying the eventual d <= C premise. The fixed 0.9 probability level does not repair that missing quantitative conclusion.

## Findings

- **note / probability-quantifier-resolved:** The target's eventual 9/10 probability conclusion preserves the selected source claim; probability convergence to one is not required for this audit target.
- **note / genuine-explicit-constant-strengthening:** Lean implies the source but not conversely. Since bounded-degree sparse families satisfy the premises, this is genuine nonvacuous strength rather than reduced applicability.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `unclear` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `fail` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `fail` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `60` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `60` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/agent_outputs/adjudicator.json` (`d35df848ba897da2405a19b2dfb7eb04215cf0ceb439de0821576f7594123c73`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/agent_outputs/agent_runs.json` (`406216524c0ff0d53b581f7551bddf567b42ffdff0a8679efa4287d59c7b32f2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/agent_outputs/blind_translation.json` (`720ecb9d849040c28c34abf3af13060e11239ea1679c77bc3c38da13002351bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/agent_outputs/direct_judge.json` (`185bf12cdccd11015159ee30157c887d3775f27b2e12db67d0d434c7158a0f12`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/agent_outputs/roundtrip_judge.json` (`af6f0a1b7ec24b0a902461ebc49e6d3b7a3cb2d8b14185cfbcacbbf18b81f446`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/agent_outputs/source_contract.json` (`4b8f18c6a3b1ca6f48238ec8e9fea87731021599906a5ce12a3ef0fb035c3cf1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/decision.json` (`daa7c6e9c2b923733c6284ac9fa27d489692b101fe1eec7fff7fea9e02441d1e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/agent_outputs/adjudicator.json` (`d35df848ba897da2405a19b2dfb7eb04215cf0ceb439de0821576f7594123c73`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/agent_outputs/agent_runs.json` (`406216524c0ff0d53b581f7551bddf567b42ffdff0a8679efa4287d59c7b32f2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/agent_outputs/blind_translation.json` (`720ecb9d849040c28c34abf3af13060e11239ea1679c77bc3c38da13002351bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/agent_outputs/direct_judge.json` (`185bf12cdccd11015159ee30157c887d3775f27b2e12db67d0d434c7158a0f12`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/agent_outputs/roundtrip_judge.json` (`af6f0a1b7ec24b0a902461ebc49e6d3b7a3cb2d8b14185cfbcacbbf18b81f446`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/agent_outputs/source_contract.json` (`4b8f18c6a3b1ca6f48238ec8e9fea87731021599906a5ce12a3ef0fb035c3cf1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/decision.json` (`d0b17d44d5ebfee8753d735048c6277004a57b8143699fdc7c3177dbc1eba658`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/inputs/blind_dependency_inventory.json` (`3222aa8c9f6ff78f33a5aa8c0883364d9f727653ecad68a0768f897d37dc3bda`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/inputs/blind_dossier.md` (`d30e54999bf9a0a4a6f11a6051b08b1e9259ad1321faee9b9f76968bf6c1784e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/inputs/blind_review_packet.md` (`d30e54999bf9a0a4a6f11a6051b08b1e9259ad1321faee9b9f76968bf6c1784e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/inputs/declaration_dossier.md` (`5fa519973a8ac82d8023c6ee199aac0ab95afe43537f4aa34d25fc0f3138389d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/inputs/dependency_inventory.json` (`26505c27b23aa499bf76b96b54532fab6487ce7a1afdb678f74d497050aa30df`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/inputs/direct_review_packet.md` (`a01778174b748d481a901940eb3a032b0f486c4adfad97c577300a690b99e241`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/history/20260831T101421Z/inputs/source_locator.json` (`a3c55b26431ccc91b6ec3b0299cddf4b5d3cf84502ba47e65a31f9893dae5e72`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/inputs/blind_dependency_inventory.json` (`3222aa8c9f6ff78f33a5aa8c0883364d9f727653ecad68a0768f897d37dc3bda`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/inputs/blind_dossier.md` (`d30e54999bf9a0a4a6f11a6051b08b1e9259ad1321faee9b9f76968bf6c1784e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/inputs/blind_review_packet.md` (`d30e54999bf9a0a4a6f11a6051b08b1e9259ad1321faee9b9f76968bf6c1784e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/inputs/declaration_dossier.md` (`a5b48921413bbb2da480dbfed0892f25986e8c286c201172be9301b9cafae526`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/inputs/dependency_inventory.json` (`26505c27b23aa499bf76b96b54532fab6487ce7a1afdb678f74d497050aa30df`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/inputs/direct_review_packet.md` (`a01778174b748d481a901940eb3a032b0f486c4adfad97c577300a690b99e241`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.3/faithfulness/inputs/source_locator.json` (`a3c55b26431ccc91b6ec3b0299cddf4b5d3cf84502ba47e65a31f9893dae5e72`)
