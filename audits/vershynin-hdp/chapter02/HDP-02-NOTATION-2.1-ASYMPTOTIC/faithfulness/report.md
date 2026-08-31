# Faithfulness audit: HDP-02-NOTATION-2.1-ASYMPTOTIC

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `c90bc6191ca8828b442b5ceb3e969c23687c399940cc6934d476ef06ad3a9b1e`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The source's informal typing is concretized, not altered: it explicitly identifies functions of N in the motivating example, and Real provides the ordered scalar structure used by its inequalities. The proof-free declaration dossier removes the blind artifact's intentional name opacity and binds IsComparable, IsLessSim, and IsGreaterSim to the printed two-sided, upper, and lower relations through their exact definitions. Positive constants are uniform, inequality directions and strictness match, and both source-permitted scopes are represented separately. Both implications therefore hold, giving faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. The six target equivalences identify the named two-sided, upper, and lower comparison predicates with fixed positive constant-factor inequalities, both everywhere and eventually atTop. These are exactly the source convention in its explicitly mentioned functions-of-N instance. The reversed greater-sim inequality is equivalent to the source's lower-multiple form by positive reciprocal rescaling.
- **Source implies lean:** `yes`. Specializing the source's functions of N to real-valued sequences turns its all-x convention into universal quantification over Nat and its sufficiently-large convention into Eventually atTop. Its two-sided and analogous one-sided conditions then coincide with the six displayed Lean conditions and their named predicates.

## Findings

No findings were recorded.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `unclear` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `unclear` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `24` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `24` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/agent_outputs/adjudicator.json` (`0d2995f9f1546bd1ad7b0378d160fb4bd3db3f1067fd6c51d1814c2c65fefe23`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/agent_outputs/agent_runs.json` (`56639dfd70ce3dc4cace3d493ac5b3876dfe4f6d027a4646899f27bfc4ecca25`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/agent_outputs/blind_translation.json` (`22d548f053b2d7640e9bd3db3006e75d579184498b6ce7a361fc0a3500515a22`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/agent_outputs/direct_judge.json` (`4f172a397bcc4c0ef5fed3c27611761c6c65dafc5055f11df89e20d9b882e132`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/agent_outputs/roundtrip_judge.json` (`0b342cf0947abd99c6118bdf5c2e2b047e54d39d31b5242baf007a463ae60792`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/agent_outputs/source_contract.json` (`eb905ccb6c16b30c207712447ee58a469c098e3105060e6369ed7bd71a2903d6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/decision.json` (`4560a25fe1541a92eee5c58ceb434a65dc2df4c1797ba3097bee93bbeed1fd2d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/inputs/blind_dependency_inventory.json` (`a377f8ab8fb022a5cc88d8978ea3e25950925c78de13a37acb5f8b4c8b5c4c27`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/inputs/blind_dossier.md` (`091c1446082769f7a3cb7aca4bdd938a2848363529c8167c765b515fb577418f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/inputs/blind_review_packet.md` (`091c1446082769f7a3cb7aca4bdd938a2848363529c8167c765b515fb577418f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/inputs/declaration_dossier.md` (`45142893ea36f313f2ae569bb29aeed128c76b33d347127a0cd9ae641688d530`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/inputs/dependency_inventory.json` (`fd736911872a0d7d99d660888c035bcbdcec3c6adc444cefeefc21415c44e07a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/inputs/direct_review_packet.md` (`7131d3ce7bfc10bd72b3f5bee0953b24a7181503877d1e0d0385f187fa3358fa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-NOTATION-2.1-ASYMPTOTIC/faithfulness/inputs/source_locator.json` (`cbc9ea07e409d1acf8b9dd28c08b03279fa79a59c492964bf53cd24fbadd1b9b`)
