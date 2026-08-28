# Faithfulness audit: HDP-01-EQ-1.6

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `9c264e67e1d31423962bd03cb5aa9d101aa86985dde8083be1c1448aacd621e3`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target exactly captures N(0,1)'s density identity and formula on ℝ, with matching parameters, constants, scope, and object roles; both implications hold.

## Implications

- **Lean implies source:** `yes`. The measure-level density identity plus the exact gaussianPDFReal formula entails the source claim.
- **Source implies lean:** `yes`. The source density identification and universal formula yield both Lean conjuncts under the supplied matching definitions.

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

- Blind translator covered `44` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `44` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/agent_outputs/agent_runs.json` (`0313bc56e54b16d3c0a49b80f463ac619a4900208f7d3b226d705299ecbb4534`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/agent_outputs/blind_translation.json` (`55c6ab5e3b91e30e18e69ab6a5aba0508198272eb08c0cc13c94af2210533f7a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/agent_outputs/direct_judge.json` (`2c8fb98afd7f44688c87b3e344c39a99d711b319b99d3ae4440cb2954d3e8de1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/agent_outputs/roundtrip_judge.json` (`d29c4733723cda201a70dafe966524f6d7935a1f51452813cb2ac7d51028bed2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/agent_outputs/source_contract.json` (`83b31e49ae56af77ec1710872f359c463b7e18a3f3937bf3069bb0a339cb4fcb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/decision.json` (`ebc00bdce77f8568a4d87eabc7fc223c81b853a59383f3a6c509ca26fc299cd3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/agent_outputs/agent_runs.json` (`c62998300d2f121011846650721e225365608856910feb39fe109531e2ef124a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/agent_outputs/blind_translation.json` (`d256f973ae57418ae940514424317ca53a255c941d82e0c48600bf4739847c21`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/agent_outputs/source_contract.json` (`83b31e49ae56af77ec1710872f359c463b7e18a3f3937bf3069bb0a339cb4fcb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/inputs/blind_dependency_inventory.json` (`6bf16bc660154a2c4908dc65c99b329dc69f6a056c305b1b58c6b8e8fd712183`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/inputs/blind_dossier.md` (`83783b61c2e4de9f1efbc5b667e5b06c82f8574cc607a4b3cf72fb601b97e539`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/inputs/blind_review_packet.md` (`83783b61c2e4de9f1efbc5b667e5b06c82f8574cc607a4b3cf72fb601b97e539`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/inputs/declaration_dossier.md` (`68d54a397b23e414847e1109c6eb27452d6d4312f561b54132d8e4213aac8291`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/inputs/dependency_inventory.json` (`6bf16bc660154a2c4908dc65c99b329dc69f6a056c305b1b58c6b8e8fd712183`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/inputs/direct_review_packet.md` (`d7817f1693b57d602a9dcb1acac466f163ac4c0752abcfdec710fc8ec84ef3ed`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/history/20260828T144017Z/inputs/source_locator.json` (`9eab4abc7ae0f2baae0789022183ec647f4ab0f1d8a9bc74ea2fe20833b84a86`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/inputs/blind_dependency_inventory.json` (`7c0c7961b7277ee40319f1988789bd9b23523164a331a80b9eb5abb849f01ef2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/inputs/blind_dossier.md` (`48239e136c89fcd1c5e4f74a2d83b3b918d777648afb102f29040cbe11c32823`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/inputs/blind_review_packet.md` (`48239e136c89fcd1c5e4f74a2d83b3b918d777648afb102f29040cbe11c32823`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/inputs/declaration_dossier.md` (`683e4239a8c7d9c852a42cad46bd708f76bad78164b42656523d5de9df9c9c7f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/inputs/dependency_inventory.json` (`06fb2f1ae2aa00bc0e042744ad63826bb895838657698b6cc82d5a494416260f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/inputs/direct_review_packet.md` (`b875d3dcbc7fd607c4d19efcdffa956f27c1d40921831d63072442993927988b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.6/faithfulness/inputs/source_locator.json` (`9eab4abc7ae0f2baae0789022183ec647f4ab0f1d8a9bc74ea2fe20833b84a86`)
