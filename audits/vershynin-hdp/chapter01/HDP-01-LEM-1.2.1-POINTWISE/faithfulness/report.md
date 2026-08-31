# Faithfulness audit: HDP-01-LEM-1.2.1-POINTWISE

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `19f4801257ff5d63e2764e5439d445de15380c1b4198104902e63cbacd265915`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The conjunction exactly represents the two source equalities. Its Real/ENNReal split and interval endpoint choices are faithful API representations; every dependency and C01-C12 passes.

## Implications

- **Lean implies source:** `yes`. The first conjunct is the first source equality up to null endpoints; the finite ENNReal indicator equality recovers the second ordinary integral equality.
- **Source implies lean:** `yes`. The source chain yields the restricted Real equality and, after canonical nonnegative embedding, the ENNReal lintegral equality.

## Findings

- **note / codomain-representation:** No loss for x≥0 and a finite indicator integral.
- **note / interval-endpoints:** Strictness is exact and other endpoint differences are null.
- **note / typed-equality-chain:** Nonnegativity makes ofReal exact, so no loss.
- **note / null-endpoint-conventions:** Differences are null singleton endpoints.

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

- Blind translator covered `32` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `32` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/agent_outputs/agent_runs.json` (`7cab3f819e0cde83f603a337dcc7699ebf0414685c0c1069d3e193a278c4a76e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/agent_outputs/blind_translation.json` (`ad954b098b914750255d0a4c0320f0df360b009cbc1bb112ad5ef2e5bad910a2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/agent_outputs/direct_judge.json` (`e80e62a76dd3c3c06828d63e50b364dcfc5972004f1582b0262d283914709efa`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/agent_outputs/roundtrip_judge.json` (`296b3d40dbc3837cb41b38bbc57d53dbf506441044e86ad006633b685c094c43`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/agent_outputs/source_contract.json` (`ffae47fbdd85ce262af350982b0ba1a51a99a91295e472d55df2ae0a94c9e972`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/decision.json` (`7a6e900d3535800b3cadad872e934f34432766a23646a2a32aee658521ab984c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/inputs/blind_dependency_inventory.json` (`2e2f23055f078f0019299f09d2e178a83dedd98edaed8be3eab58d991ba3bf8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/inputs/blind_dossier.md` (`1de665347a2219eae89128355eab2edc1fc933be67da8a57adda71ac5bd76c29`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/inputs/blind_review_packet.md` (`1de665347a2219eae89128355eab2edc1fc933be67da8a57adda71ac5bd76c29`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/inputs/declaration_dossier.md` (`c353b1d5bde91e02e2467b52a202c4ecd66b7200842c81ff83dec4449cf37f6c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/inputs/dependency_inventory.json` (`2e2f23055f078f0019299f09d2e178a83dedd98edaed8be3eab58d991ba3bf8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/inputs/direct_review_packet.md` (`8810284f6476587762df66f943203e743ab735de8f44dabe1489512b11d92b69`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-LEM-1.2.1-POINTWISE/faithfulness/inputs/source_locator.json` (`508a3d233095f9fbe0693efa23b4cf640676972a9f3c25df097a7cf2d8a57fdb`)
