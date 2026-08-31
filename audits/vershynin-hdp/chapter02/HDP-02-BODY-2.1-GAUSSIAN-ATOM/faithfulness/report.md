# Faithfulness audit: HDP-02-BODY-2.1-GAUSSIAN-ATOM

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `dd9f8b7e84358691c79771372626075f7b6e326f84b0e563d067a35b0a08400d`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The revised target is a direct law-level formalization of the selected source statement. It fixes the real Gaussian law at mean zero and variance one, measures exactly the singleton {0}, and asserts its literal ENNReal mass is zero. This eliminates the prior real-valued measure conversion while retaining the same mathematical probability-zero claim. The source's appeal to continuity is justification for the conclusion rather than separate propositional content, and no neighboring claim is included.

## Implications

- **Lean implies source:** `yes`. If standardNormalLaw {0}=0, any random variable g with that law has probability zero of the event g=0, yielding the selected source statement.
- **Source implies lean:** `yes`. The source assertion says that the standard normal distribution assigns zero probability to zero. Since standardNormalLaw is gaussianReal 0 1, this is exactly its ENNReal singleton-mass equality.

## Findings

No findings were recorded.

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

- Blind translator covered `19` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `19` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/agent_outputs/agent_runs.json` (`4e19d499cf8cd0a5eaf0661d0a017e24856ccc8926494244310861cd79622dab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/agent_outputs/blind_translation.json` (`a96a49494f7ec5fd1c94b363be597e9e2aa67ad72c7bf540e4804e5b9c426118`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/agent_outputs/direct_judge.json` (`81625273481132c78a573bf3f4e4d4a6a7e78ca54266fcb8e008bc87f6e3b6f4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/agent_outputs/roundtrip_judge.json` (`76f1d2ef3d698c2ce23f37d1a4d282c83c2d206449fdd219ce3af8f5f0716104`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/agent_outputs/source_contract.json` (`396b7b5ce4fcc3281b4f09575f57f040e7922ef9397c9fffd44bd7b873c6f45f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/decision.json` (`8a4b063e9031c2195852ed8d857b42d0bdb30c51c474a2ca57baa9a8b44bd241`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/agent_outputs/agent_runs.json` (`eb9189ab4be60b86b20d9270c95f57a1f07de52e05633f41381aaf5e5d68533d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/agent_outputs/blind_translation.json` (`1c778d7ec66927a162ec75b5848b731bd39ac7a448a189881a078c9c266ddd74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/agent_outputs/source_contract.json` (`396b7b5ce4fcc3281b4f09575f57f040e7922ef9397c9fffd44bd7b873c6f45f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/inputs/blind_dependency_inventory.json` (`f64af41b7f99898e7a62fbd97541c115c1fcb953195f77a51beb2a7d7c35881e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/inputs/blind_dossier.md` (`3a048943dd0b739d338a90596c5010b4ed7e990b4d7b6b937bcfdb6e5fb59073`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/inputs/blind_review_packet.md` (`3a048943dd0b739d338a90596c5010b4ed7e990b4d7b6b937bcfdb6e5fb59073`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/inputs/declaration_dossier.md` (`644e1b738e622fb4f38c40f41e28db7f2fc18c91f34528cfdd4851ea7ccb071f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/inputs/dependency_inventory.json` (`7f15de050a73d1f06cf3371eb38bde7b1ded616ba353fe13eb046dfdf1530676`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/inputs/direct_review_packet.md` (`6979c4ce087e166306bcb4352ea73e3da252795b895601f5862f07c51cb535f7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/history/20260829T051558Z/inputs/source_locator.json` (`789175dbb162ddc601e27a9eb068c9beaae1f2e06e41f974e5cd63acd30755b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/inputs/blind_dependency_inventory.json` (`65150501c605d3596b7386e025b156064ab5dafbf408e1f1e1575ba45bf772bd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/inputs/blind_dossier.md` (`ecd162dde0966424c56c174700d03ac96a838d4c066bb826b77978e41377e383`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/inputs/blind_review_packet.md` (`ecd162dde0966424c56c174700d03ac96a838d4c066bb826b77978e41377e383`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/inputs/declaration_dossier.md` (`2bca7c776591a2f0264d76c1e1d5c5d2b2289e7fdfe8a14aec70a769ec266e74`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/inputs/dependency_inventory.json` (`09957dc88b473e49e2f925698161715cde93fdbe193b29c79f2d379a6cc66e95`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/inputs/direct_review_packet.md` (`83a743a1f4e5cdabd50f7e566ab29b23b5fd3204f2425d694d2190b21d3b677f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-GAUSSIAN-ATOM/faithfulness/inputs/source_locator.json` (`789175dbb162ddc601e27a9eb068c9beaae1f2e06e41f974e5cd63acd30755b9`)
