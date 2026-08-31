# Faithfulness audit: HDP-01-DEF-CDF

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `2167bb722ce28a622899dbe98a23bbf1995743b571dcb8cb4e20d79ccee38420`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target exactly captures the inclusive CDF formula and differs only by a genuine AE-measurability generalization, so it is faithful-stronger.

## Implications

- **Lean implies source:** `yes`. Every measurable source random variable is AEMeasurable, so Lean specializes to the source formula.
- **Source implies lean:** `no`. The source does not assert the identity for additional merely AE-measurable, nonmeasurable representatives.

## Findings

- **minor / measurability-generalization:** Lean has broader nonvacuous applicability while covering every source instance.
- **note / probability-value-codomain:** This compatible representation causes no semantic loss.
- **major / measurability-domain-generalization:** The target covers additional nonvacuous cases, so reverse implication fails.
- **note / probability-value-codomain:** Probability normalization keeps values finite, so representation is faithful.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `fail` |
| `C03` | `pass` | `pass` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `not-applicable` | `not-applicable` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `fail` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `17` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `17` dependencies (`0` hash-reused); failing or unclear: `D003`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/agent_outputs/agent_runs.json` (`22ec8002dddb4ab0392b794ece9ae896ffd7d2235a6b61a98264664f9b301d01`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/agent_outputs/blind_translation.json` (`237d48b6221558f2b82ba6d154b12138c9b93ab1c56c3b1761dd5448739e8689`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/agent_outputs/direct_judge.json` (`221b3becb26edb016b70beadc0ef61c513840150b9c57a5dcb21c67655973ce8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/agent_outputs/roundtrip_judge.json` (`29b66eb3b0ab2aef9cc300e86a9c7a21bec82d95a17b6568b5531271eff68bdf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/agent_outputs/source_contract.json` (`838a4ecf5dcaa6388d1c27981973b8874db44158388a80f675721a7fcf8cef65`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/decision.json` (`84a9d573127867fff196373092544df475e8a8da36fee307c6501776bfbb07fa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/inputs/blind_dependency_inventory.json` (`b16688b18670b3f35063f7827753e6c2ad51e43ec3cbf0147d723c11e7973f1a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/inputs/blind_dossier.md` (`f00cd2627045076fc5c767de2aefee4b027ec4c92a1d9bc03dcf145ba3227795`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/inputs/blind_review_packet.md` (`f00cd2627045076fc5c767de2aefee4b027ec4c92a1d9bc03dcf145ba3227795`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/inputs/declaration_dossier.md` (`e6846a510bb9e3d48b2ba215cdbb988fe4cc5501285e0492619a49e560e6f754`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/inputs/dependency_inventory.json` (`4a6711e4c9ee0042de7f2c8a1b7eab00dbea1e2c769fd79994b0d4d184da57e4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/inputs/direct_review_packet.md` (`d721879d78e4824ea2658fc4519e8ee4d91d697288b408bae517f8aaacade073`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CDF/faithfulness/inputs/source_locator.json` (`55911ceefd091df8e6526b280ba65e788b4c189bcb1f6ff10be9d13da0413362`)
