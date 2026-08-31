# Faithfulness audit: HDP-02-EX-2.2.3

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `374e1393ee79a49ac90546f7e2c10e2c5c49ffaa7f784ff37e6e44966ab39622`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The pinned source passage and the elaborated Lean proposition have the same sole real binder, universal scope, absence of hypotheses, functions, non-strict inequality direction, and exact argument x²/2. All twenty semantic dependencies implement the expected Real order, functions, natural square, real numeral, and real division without changing applicability or content. Both implication directions hold, every configured check is resolved, and no adjudication trigger remains.

## Implications

- **Lean implies source:** `yes`. For every real x, the Lean proposition asserts the same non-strict inequality between the standard real cosh of x and the standard real exponential of x squared divided by the real constant 2; therefore it directly yields the source result.
- **Source implies lean:** `yes`. The source result applies to every real x with no premises and states exactly cosh(x) ≤ exp(x²/2); under the resolved standard real operations in D001–D020, this is precisely the Lean proposition.

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

- Blind translator covered `20` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `20` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/agent_outputs/agent_runs.json` (`1f0000137cc73989b6dcf6ccc0810d289a0415d2fef90b6fd2e1064ab02325c2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/agent_outputs/blind_translation.json` (`759ec6c62666639e0bbb92ac7fb495043a5a4528412c73b7cb3b8f1d4c79a064`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/agent_outputs/direct_judge.json` (`a06355e711b0962d7629ef4ed4df89673a655c0195c1824a5c8875aff3985f96`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/agent_outputs/roundtrip_judge.json` (`a7148a102d8133c567cd40598f4fec75ea3d9a8819c94a9e4c7238539cc922d7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/agent_outputs/source_contract.json` (`de1d98e06758fe38892054afc2dfe7eacfd9c212079a0ed52b6b3b22747afe3f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/decision.json` (`75f4de9a18926331e6e7b83c07b1122269135cc86531eb94fba14dbd08b08300`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/agent_outputs/agent_runs.json` (`1f0000137cc73989b6dcf6ccc0810d289a0415d2fef90b6fd2e1064ab02325c2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/agent_outputs/blind_translation.json` (`759ec6c62666639e0bbb92ac7fb495043a5a4528412c73b7cb3b8f1d4c79a064`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/agent_outputs/direct_judge.json` (`a06355e711b0962d7629ef4ed4df89673a655c0195c1824a5c8875aff3985f96`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/agent_outputs/roundtrip_judge.json` (`a7148a102d8133c567cd40598f4fec75ea3d9a8819c94a9e4c7238539cc922d7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/agent_outputs/source_contract.json` (`de1d98e06758fe38892054afc2dfe7eacfd9c212079a0ed52b6b3b22747afe3f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/decision.json` (`6b8e975c6d316fc1d35cd1959b843c3b67c760c1ea5d2c3aa6fb9f28d34f933c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/inputs/blind_dependency_inventory.json` (`d8b53492a82194910b6e9eb875d7bb67c1a44b3a981b0ce456fe9b51430dbd2a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/inputs/blind_dossier.md` (`c2bf9fc9bbb97a9a7d219cff651ba74abde556f03b596b7020ec625d7dd979a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/inputs/blind_review_packet.md` (`c2bf9fc9bbb97a9a7d219cff651ba74abde556f03b596b7020ec625d7dd979a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/inputs/declaration_dossier.md` (`0f4c5c263cba17d5305a860d3d005b0fb774f92a05d0f9acba8a62131df81d4f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/inputs/dependency_inventory.json` (`d8b53492a82194910b6e9eb875d7bb67c1a44b3a981b0ce456fe9b51430dbd2a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/inputs/direct_review_packet.md` (`a199f3899af4533cc188c553d2808d874c029f8532a6d20e6c4501f6748beb63`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/history/20260831T101229Z/inputs/source_locator.json` (`e3f1fb9cc48ca341caabf3136d3015d14faf2be88b7c05252f6705c374bc0cf7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/inputs/blind_dependency_inventory.json` (`d8b53492a82194910b6e9eb875d7bb67c1a44b3a981b0ce456fe9b51430dbd2a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/inputs/blind_dossier.md` (`c2bf9fc9bbb97a9a7d219cff651ba74abde556f03b596b7020ec625d7dd979a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/inputs/blind_review_packet.md` (`c2bf9fc9bbb97a9a7d219cff651ba74abde556f03b596b7020ec625d7dd979a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/inputs/declaration_dossier.md` (`0b8da169db2b6b6e457c40d39df0f05a86f7de0aa930b7f217119b455e2d2462`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/inputs/dependency_inventory.json` (`d8b53492a82194910b6e9eb875d7bb67c1a44b3a981b0ce456fe9b51430dbd2a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/inputs/direct_review_packet.md` (`a199f3899af4533cc188c553d2808d874c029f8532a6d20e6c4501f6748beb63`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.2.3/faithfulness/inputs/source_locator.json` (`e3f1fb9cc48ca341caabf3136d3015d14faf2be88b7c05252f6705c374bc0cf7`)
