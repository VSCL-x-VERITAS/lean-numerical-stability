# Faithfulness audit: HDP-01-REM-1.1.1

## Decision

- Classification: `not-faithful-different`
- Accepted: `false`
- Adjudicated: `false`
- Target SHA-256: `bf31c4ccc4bfa157c6f850e8f3fed8b2043a24ca2bc09297c7683f4850e38d45`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The Lean declaration is a mathematically valid absolute covariance Cauchy-Schwarz bound on the same real L2 probability-space domain, and its local definitions correctly encode covariance and standard deviation. It is nevertheless not Remark 1.1.1: the remark is a qualitative signed-alignment interpretation of covariance, whereas the target uses absolute value, ≤, and a product of standard deviations. Cauchy-Schwarz is printed separately later in Section 1.2. Thus neither audited proposition expresses the other's selected content, yielding Lean⇒source: no, source⇒Lean: no, and not-faithful-different without unresolved evidence.

## Implications

- **Lean implies source:** `no`. The absolute upper bound supplies no comparison of degrees of alignment and no signed monotonic conclusion. Even though the local covariance definition unfolds to equation (1.2), the proposition's norm erases orientation: aligned X=Y and anti-aligned X=-Y can satisfy the same equality in the bound while their signed covariances have opposite signs.
- **Source implies lean:** `no`. The selected remark gives the covariance identity and a qualitative signed geometric interpretation, not a quantitative upper bound. Obtaining |cov(X,Y)| ≤ σ(X)σ(Y) requires invoking Cauchy-Schwarz and the standard-deviation/norm identity; the book prints Cauchy-Schwarz only later in Section 1.2 as a separate result, so it is not entailed by the selected printed remark as such.

## Findings

- **critical / wrong-source-result:** The formal target represents a different theorem rather than the printed remark.
- **major / signed-versus-absolute:** Orientation and covariance sign, essential to the remark's qualitative content, are erased.
- **major / source-section-boundary:** A valid later consequence has been attributed to the wrong numbered source item.
- **note / underlying-definitions:** The mathematical ingredients are sound, but correct ingredients do not make the top-level bound faithful to this remark.
- **critical / selected-conclusion-mismatch:** The formalized proposition is a different mathematical claim, so neither implication direction holds as a statement-faithfulness comparison.
- **major / sign-and-orientation-loss:** The reconstructed bound omits the qualitative signed behavior that is the substance of the selected remark.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `fail` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `pass` |
| `C05` | `fail` | `fail` |
| `C06` | `fail` | `fail` |
| `C07` | `fail` | `fail` |
| `C08` | `fail` | `fail` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `fail` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `52` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `52` dependencies (`0` hash-reused); failing or unclear: `D009, D010, D020, D025, D026, D027, D036`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/agent_outputs/agent_runs.json` (`07ff42b63dc5e967bb140a86b0258c2825694e5dcd3d899e9e54fcb0ee3cabe8`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/agent_outputs/blind_translation.json` (`a13f3c4b75e763e9cf91f1759469686137add831d0b8079565187daa1c0a2540`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/agent_outputs/direct_judge.json` (`4828861e580f2053755039d4ecacea52749527aa74eab3328d5dde9bfdc46e81`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/agent_outputs/roundtrip_judge.json` (`ca42c47f6c453975dc1c8c6519200f1d4c0951680849d130c1d4b5efb64a2704`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/agent_outputs/source_contract.json` (`40ba35554a56aae3f077b0c03f40aac87edf2e21d5991898a9f7b553ed90866f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/decision.json` (`e0dd61b2bb1c41545bef50194d69f9a2d13c38e22b3321ca4f706dd8041c7b51`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/inputs/blind_dependency_inventory.json` (`a4dca1ccfec239e7ee5ceb79c4b58699cb05bf8a7300b40b2705c5a08e9343d5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/inputs/blind_dossier.md` (`5df0fad15df06a7b90312bf727846be9c780056a2838bb6fa54e5ec6d748b9c5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/inputs/blind_review_packet.md` (`5df0fad15df06a7b90312bf727846be9c780056a2838bb6fa54e5ec6d748b9c5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/inputs/declaration_dossier.md` (`a41d74a373233868a1be71fdc88d7193d9587953b29312f500364c62ba1a46da`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/inputs/dependency_inventory.json` (`9b7e23969305908a43fbbd451b12116b763e2450b24eb4e87c2ee0b5f07871f6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/inputs/direct_review_packet.md` (`a8632c64d84e9ee503adfaa294112f6f01b5576cb6535d6671a6f70967773b0d`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-REM-1.1.1/faithfulness/inputs/source_locator.json` (`095512c4ec45186b8985657e60a8aab1599e4df17a6475f7b151cb4e2d2276cf`)
