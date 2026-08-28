# Faithfulness audit: HDP-01-EXERCISE-1.2.3

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `89033ac2bb1bb739c007b7558519e3462f25f46fc55d02429de06c528aedf460`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target has the same arbitrary probability-space generality, measurable real random variable, positive real exponent, absolute moment, strict tail, factor p, exponent p - 1, and Lebesgue integration domain as the source. Its Ioi 0 domain is faithful to an integral from 0 to infinity because the endpoint is null and, importantly for 0 < p < 1, Real.rpow is then evaluated only at positive t. The sole consequential difference is logical scope: the source states the equality under finite RHS, while Lean first proves the equality unconditionally in ENNReal and then supplies a redundant finite toReal shadow under either-side finiteness. Thus Lean implies the source, the literal source does not imply Lean's infinite-case conjunct, and the appropriate accepted classification is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. If the source right-hand side is finite, Lean's unconditional ENNReal equality identifies it with the absolute moment, and the RHS-finite disjunct instantiates the second conjunct to give equality after toReal. The supplied definitions show that these are exactly E|X|^p and the strict-tail integral; moving the positive constant p outside and commuting nonnegative factors preserve the source expression.
- **Source implies lean:** `no`. The literal source claim assumes that the right-hand side is finite and therefore gives no assertion for an infinite tail integral. Lean additionally requires an unconditional equality in ENNReal for those cases. Infinite-moment random variables make that extra domain nonempty, so the source's conditional equality alone does not imply the first Lean conjunct.

## Findings

- **major / unconditional-extended-strengthening:** Lean covers the source finite case and additionally asserts the meaningful infinite case. This is genuine nonvacuous strength, yielding faithful-stronger rather than faithful-equivalent.
- **note / conditional-toReal-conjunct:** Because the first conjunct already equates the ENNReal sides, either-side finiteness makes both finite; this conjunct recovers the source finite equality and is logically redundant with the first conjunct.
- **note / endpoint-and-factor-conventions:** The excluded singleton resolves the endpoint convention without changing a Lebesgue integral; for t > 0 and p > 0 the power and embeddings are exact, the factor placement/order is equivalent, and the strict tail is preserved.
- **major / finite-scope-versus-unconditional-extended-equality:** The translation covers infinite-valued cases excluded from the literal source obligation, so it implies the source but is not implied by it.
- **minor / additional-redundant-toReal-conjunct:** This conjunct is extra surface content but adds no independent strength once the unconditional ENNReal equality is assumed, since applying toReal to equal values preserves equality.
- **note / positive-domain-endpoint:** The presentations are equivalent for the Lebesgue integral because the omitted endpoint is null, and the open interval safely resolves the stated source ambiguity.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `fail` | `fail` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `fail` |
| `C06` | `pass` | `pass` |
| `C07` | `fail` | `fail` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `54` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `54` dependencies (`0` hash-reused); failing or unclear: `D002`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/agent_outputs/agent_runs.json` (`8d6a76c3d469ca10ada4fec658344975e47cbe6151af5fec46d220de4971dca1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/agent_outputs/blind_translation.json` (`633620591b48c3cb364ffe2262f6b51e338f7f771e7fc9ab4b3d076c96b91fc8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/agent_outputs/direct_judge.json` (`43ca0f6055090790c59fb3e17ee2516117f6d652f3d8ad3b6f6ef1271a4c3e3a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/agent_outputs/roundtrip_judge.json` (`9beef1788df414d1b69efe67156dbe2c127693fcfde8724d7be93610bd636933`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/agent_outputs/source_contract.json` (`47fc6aa3c848746b67aa5f0e6bd2fac628ed36273b8748245939eb9e8c811ff3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/decision.json` (`322604674ab7497a93aea5593c1ea88e211ce47ef5954bd0af945dbae70c4c2d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/history/20260828T124351Z/inputs/blind_dependency_inventory.json` (`b18094bc2a6d56ec368a6126f2cc54da75f7ed8451d117101652bf78af0f8c07`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/history/20260828T124351Z/inputs/blind_dossier.md` (`85d2005ee3feb8f6c357cecf00c4a0d37a9e43a3f4f8a68ddf82714d52546898`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/history/20260828T124351Z/inputs/blind_review_packet.md` (`85d2005ee3feb8f6c357cecf00c4a0d37a9e43a3f4f8a68ddf82714d52546898`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/history/20260828T124351Z/inputs/declaration_dossier.md` (`886efd8d21deb5d4e461dc547bc0c22dff7d0a7a48af42b9aec50a4e7ca52a63`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/history/20260828T124351Z/inputs/dependency_inventory.json` (`b6d60e95584eda7244dcb543687c50c5d68320d405cf663b6dd60af1d1ac0b56`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/history/20260828T124351Z/inputs/direct_review_packet.md` (`9952cfd22c5a9e46f50c044917f44f057ab3dd2eb5a32166710cb7201be1e143`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/history/20260828T124351Z/inputs/source_locator.json` (`f1e33d1263546a2d69dd97de62dbdd59738aba8bc296833f453355166d8d5cbe`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/inputs/blind_dependency_inventory.json` (`b18094bc2a6d56ec368a6126f2cc54da75f7ed8451d117101652bf78af0f8c07`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/inputs/blind_dossier.md` (`85d2005ee3feb8f6c357cecf00c4a0d37a9e43a3f4f8a68ddf82714d52546898`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/inputs/blind_review_packet.md` (`85d2005ee3feb8f6c357cecf00c4a0d37a9e43a3f4f8a68ddf82714d52546898`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/inputs/declaration_dossier.md` (`886efd8d21deb5d4e461dc547bc0c22dff7d0a7a48af42b9aec50a4e7ca52a63`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/inputs/dependency_inventory.json` (`b6d60e95584eda7244dcb543687c50c5d68320d405cf663b6dd60af1d1ac0b56`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/inputs/direct_review_packet.md` (`9952cfd22c5a9e46f50c044917f44f057ab3dd2eb5a32166710cb7201be1e143`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EXERCISE-1.2.3/faithfulness/inputs/source_locator.json` (`141158a494c2b78fd0f47b836db9bb03fc0fdc3630ec36ca7fb869ed8ec24da9`)
