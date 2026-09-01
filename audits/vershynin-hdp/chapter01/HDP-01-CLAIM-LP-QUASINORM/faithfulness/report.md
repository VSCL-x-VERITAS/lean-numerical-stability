# Faithfulness audit: HDP-01-CLAIM-LP-QUASINORM

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `cd97f166c4002ff7879e4cdc3e847d1eed9586bf371537f1c6f97b2b5154f00a`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The source's terse prose cannot coherently assert triangle failure on every fixed probability space: the singleton case is an immediate counterexample to that reading. Read in the standard mathematically viable sense, it says that for each positive subunit exponent the Lp formula is not a norm in general, witnessed by failure of the triangle axiom. Lean preserves the exponent range, real operands, Lp operator, addition, inequality, and non-norm consequence, and gives a nonvacuous uniform two-point countermodel. Because Fin 2 lies inside the existential conclusion, fixing it is genuine witness strength rather than reduced applicability. Thus Lean implies the source, the source does not imply the exact Fin 2 refinement, the classification is faithful-stronger, and the audit is accepted.

## Implications

- **Lean implies source:** `yes`. The coherent reading of the printed statement is non-validity of the Lp triangle inequality in general, since universal failure on every fixed probability space is contradicted by the singleton case. Lean gives a genuine countermodel for each 0 < p < 1, and failure of a required norm axiom entails the stated non-norm conclusion.
- **Source implies lean:** `no`. The printed general failure claim does not specify that a counterexample exists on exactly the discrete carrier Fin 2. Restricting an existential witness to Fin 2 is extra nonvacuous conclusion strength, not a restriction on the applicability of an externally supplied space.

## Findings

- **major / exact-witness-strengthening:** Lean implies the source's general non-validity claim, but the source does not imply this exact witness refinement; the result is faithfully stronger rather than equivalent.
- **note / probability-space-scope:** The printed sentence must be read as failure in general, not as the impossible assertion that every fixed probability space exhibits failure.
- **note / non-norm-consequence:** Because every norm satisfies the triangle inequality, the explicit Lean counterexample entails the source's non-norm clause on the witnessed Lp setting.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `unclear` | `fail` |
| `C03` | `unclear` | `fail` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `unclear` | `fail` |
| `C09` | `unclear` | `fail` |
| `C10` | `unclear` | `fail` |
| `C11` | `unclear` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `46` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `46` dependencies (`0` hash-reused); failing or unclear: `D010, D011, D012, D017, D019, D045`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/agent_outputs/adjudicator.json` (`3963c857a4f77a0d5dc7d583d6c869035091acc077915fafc5910d796245d6fb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/agent_outputs/agent_runs.json` (`5c55f96382c9f1d89a4cda2b8f2d9fbb31c174915e8780b9893e9002599a58c1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/agent_outputs/blind_translation.json` (`d4e77205a833b6dc8b1ed0f46c8163dda3d45def6638d4f98d4eeebe0b7221b9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/agent_outputs/direct_judge.json` (`de17fe3f50816ed85205f4cdcb6c124c606fbd9bfaf02f6d1e8af30c9828b745`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/agent_outputs/roundtrip_judge.json` (`36632cc14686a945222287450042e5c0461ecc38bc80d3a1dea987d5fe5ccc92`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/agent_outputs/source_contract.json` (`4c154040cd9eefaad4965fbce96bee7ae263d3f19008e5467dfcf3c343b8c72a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/decision.json` (`5ff029fe210407ceced5908568fadc0663e820acf204466791e655dfa32ad3e3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/inputs/blind_dependency_inventory.json` (`930705ecbde40d7c60122e59145f21e7105848faedd7e10ffe18bebc11763676`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/inputs/blind_dossier.md` (`fb3b2642d2d3f161bca7f2e851f17b8ab5a58b2d8d994bf6cb3949dcd0badb5e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/inputs/blind_review_packet.md` (`fb3b2642d2d3f161bca7f2e851f17b8ab5a58b2d8d994bf6cb3949dcd0badb5e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/inputs/declaration_dossier.md` (`30db8169b5ab090abcefcf7508520f4f953b3e2f1259f02c3bf3969e9872d056`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/inputs/dependency_inventory.json` (`930705ecbde40d7c60122e59145f21e7105848faedd7e10ffe18bebc11763676`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/inputs/direct_review_packet.md` (`3db662e081e33ea7b98e7b4cd162f1194380907b099aa226af3229669b6c6397`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-CLAIM-LP-QUASINORM/faithfulness/inputs/source_locator.json` (`a08b292c4d27ef266cf90515843ce3d23bc641d5c1522dad03588e3be0b93ae2`)
