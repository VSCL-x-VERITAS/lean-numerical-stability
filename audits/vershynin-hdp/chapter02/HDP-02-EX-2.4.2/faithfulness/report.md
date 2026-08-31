# Faithfulness audit: HDP-02-EX-2.4.2

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `52b1a9ee479e525072cda203e88f168459e9c305db350d21eaad012b96a98e85`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The proposition faithfully formalizes the exercise's model and asymptotic structure: p may vary with n, (n−1)p is eventually O(log n), and with eventual probability at least 0.9 all vertex degrees simultaneously are O(log n). The local model uses the standard binomial random simple-graph law and ordinary graph degree. The exact affine output constant 2C+5 is not recoverable from the source's bare Big-O wording, so Lean implies the source while the source does not imply this explicit formulation.

## Implications

- **Lean implies source:** `yes`. Given any p_n with an eventual expected-degree witness C, the target gives eventual probability at least 0.9 for one event where every degree is below (2C+5)log n. This is an O(log n) simultaneous degree bound in exactly G(n,p_n), so it entails the source claim.
- **Source implies lean:** `no`. The source only asserts existence of an unspecified O(log n) degree constant. It does not supply, for every particular hypothesis witness C, the exact coefficient 2C+5 and strict inequality asserted by Lean. Thus the informal Big-O conclusion alone does not entail the target's explicit quantitative dependence.

## Findings

- **note / explicit quantitative strengthening:** This is genuine additional quantitative information on a satisfiable domain; it preserves the source meaning and supports faithful-stronger.
- **note / quantitative strengthening:** This is genuine nonvacuous added strength while retaining the source's model, applicability, and qualitative conclusion; it supports classification as faithful-stronger.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
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

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/agent_outputs/agent_runs.json` (`59034e6cd98e4fe7f6202855e3245015d9e21d8f0dc7bf77c9625315c59df0e9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/agent_outputs/blind_translation.json` (`cb415bb376531060958c043e0ceb63a607af95a11b87755233b81eca1146de39`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/agent_outputs/direct_judge.json` (`67b37ef9c9393bcec021019fe6d5da9581bc90fe3cecafdbe3869f530512b90f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/agent_outputs/roundtrip_judge.json` (`404b7c8635e775bb36b6f385834defdf95e5bb4aa83d362ab6100a5c72a8c705`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/agent_outputs/source_contract.json` (`a343cfb9a3c77b04afcb4d6768f7cd27b5eaade76afd6df8e8fc0bb46c63e4c9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/decision.json` (`6035a570c123a1a9296f9160d336a5345a3ceb62572617d3d7bb545bddb48557`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/agent_outputs/agent_runs.json` (`59034e6cd98e4fe7f6202855e3245015d9e21d8f0dc7bf77c9625315c59df0e9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/agent_outputs/blind_translation.json` (`cb415bb376531060958c043e0ceb63a607af95a11b87755233b81eca1146de39`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/agent_outputs/direct_judge.json` (`67b37ef9c9393bcec021019fe6d5da9581bc90fe3cecafdbe3869f530512b90f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/agent_outputs/roundtrip_judge.json` (`404b7c8635e775bb36b6f385834defdf95e5bb4aa83d362ab6100a5c72a8c705`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/agent_outputs/source_contract.json` (`a343cfb9a3c77b04afcb4d6768f7cd27b5eaade76afd6df8e8fc0bb46c63e4c9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/decision.json` (`27e66927daf61d6e0556f30dda6e83864c5acf9a16d1c0d8850091e3fcee3032`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/inputs/blind_dependency_inventory.json` (`3222aa8c9f6ff78f33a5aa8c0883364d9f727653ecad68a0768f897d37dc3bda`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/inputs/blind_dossier.md` (`46820f5fa3e1a325bf7e02dcbc3bff54a6bc566aff6842921fe60566f6b9b481`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/inputs/blind_review_packet.md` (`46820f5fa3e1a325bf7e02dcbc3bff54a6bc566aff6842921fe60566f6b9b481`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/inputs/declaration_dossier.md` (`bce5dd2e5df874401288db1e66c2770a0a2ad42a3decd91b6b9b8dc082a3cdfb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/inputs/dependency_inventory.json` (`26505c27b23aa499bf76b96b54532fab6487ce7a1afdb678f74d497050aa30df`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/inputs/direct_review_packet.md` (`553b92b1983e783a38bbfe5a98ca135ea78c3a40d9a2082c70598f0078a86523`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/history/20260831T101416Z/inputs/source_locator.json` (`ab1806b7056613732f2c95cff59f71de595c8d4674eeabf9abf2afb62d9dd61a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/inputs/blind_dependency_inventory.json` (`3222aa8c9f6ff78f33a5aa8c0883364d9f727653ecad68a0768f897d37dc3bda`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/inputs/blind_dossier.md` (`46820f5fa3e1a325bf7e02dcbc3bff54a6bc566aff6842921fe60566f6b9b481`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/inputs/blind_review_packet.md` (`46820f5fa3e1a325bf7e02dcbc3bff54a6bc566aff6842921fe60566f6b9b481`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/inputs/declaration_dossier.md` (`525445f082579a23bdcee0c1c56cdcc13fd6c7d381a4a79f090cc821164d48c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/inputs/dependency_inventory.json` (`26505c27b23aa499bf76b96b54532fab6487ce7a1afdb678f74d497050aa30df`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/inputs/direct_review_packet.md` (`553b92b1983e783a38bbfe5a98ca135ea78c3a40d9a2082c70598f0078a86523`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.4.2/faithfulness/inputs/source_locator.json` (`ab1806b7056613732f2c95cff59f71de595c8d4674eeabf9abf2afb62d9dd61a`)
