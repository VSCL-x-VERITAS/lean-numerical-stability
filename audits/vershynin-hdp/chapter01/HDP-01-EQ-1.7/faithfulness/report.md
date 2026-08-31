# Faithfulness audit: HDP-01-EQ-1.7

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `304abd8185d14ad125a39b4a94d96c18e9820703269077c0d77a2db4076811ac`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The disputed missing Bernoulli premise is not a weakening or an unrelated change: it removes a domain restriction while preserving all source instances and the exact asymptotic conclusion. Nondegenerate Bernoulli(p) sequences witness applicability, so the strengthening is nonvacuous. The converse implication fails because the Bernoulli special case alone does not yield the general iid finite-variance result. Accordingly, the implication pair is yes/no, the methodology's consistent classification is faithful-stronger, and acceptance does not depend on adding a source-exact wrapper.

## Implications

- **Lean implies source:** `yes`. For 0 < p < 1, iid Bernoulli(p) summands satisfy the Lean theorem's iid, L2, mean-p, and variance-p(1-p) premises. After the harmless zero-based N+1 reparameterization, its conclusion is exactly the source's normalized convergence in distribution to N(0,1).
- **Source implies lean:** `no`. The source establishes only the Bernoulli(p) case and does not establish the corresponding central limit theorem for every iid L2 real-valued law having the same first two moments.

## Findings

- **minor / domain-generalization:** This changes the source-specific presentation and may reduce discoverability as the de Moivre-Laplace special case, but it neither excludes source instances nor changes their normalization, convergence mode, or limiting law; no source-exact wrapper is required for faithfulness.
- **note / index-reparameterization:** The cofinal reparameterization preserves the limiting assertion.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `fail` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `fail` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `fail` |

## Dependency coverage

- Blind translator covered `93` dependencies (`76` hash-reused); unclear: `none`.
- Direct judge covered `93` dependencies (`76` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/agent_outputs/adjudicator.json` (`4588fff6076b32bc0130813816a3650802f61493182cc1332d96dc8e4ec2e539`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/agent_outputs/agent_runs.json` (`b0c05d480170ba350f2038432d91fa6a1c96f4f160d20c86b25d101e04568d14`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/agent_outputs/blind_translation.json` (`c5ed1ff32c0fbb73edcbe6625ab109d0e24ab801c6939a8fe9d79f0e196fd643`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/agent_outputs/direct_judge.json` (`ff67bff9287f532abf449618b0fad4ed242edb35b4cbeb14a920b6b7cd2ba85e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/agent_outputs/roundtrip_judge.json` (`ff5f7148573a290d635d2c8c0b79080846e7ade416f1d82bf52a830c74b090f1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/agent_outputs/source_contract.json` (`44def9a5bd7a904fe91304eb90790128b9aae07090cccd878cc1811ea701e2cb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/decision.json` (`b83b2da35a5bdd71fd9aac294acd2f870a3aee664b0a0e011d98a0bb6c2e073a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/blind_dependency_inventory.json` (`dbc94c5d2bd961fd71e81f5b89ed33acd41b2489006d3fe0cd409e1ab20747da`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/blind_dossier.md` (`6b623f54052ce5facb3fd6ac949684e062a300c6fb68e20ccd1cdb0e0a7800f3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/blind_review_packet.md` (`00e56179bad7744972938e6ff96403a01bb921e18e71ed0b2663d13797ccbe57`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/declaration_dossier.md` (`43b680b6103a9f2cb50e0f92af31628f9c089ff4202fb278e9de3681b828573f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/dependency_inventory.json` (`fc774afb31f968ae8e00742d07370426b867b5a40f022f17d691f5ed015224ea`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/dependency_reuse_blind.json` (`fdee6d24bbcea7820d6d5010ace2ae0effe1e92316f71dd184031d6e9ac8c29b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/dependency_reuse_direct.json` (`989913c5a8bb4b99c69f9567105609c86ad2f1f3e487734b11b30a1c36c6b4f1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/direct_review_packet.md` (`8fc0a6e6c0ab95e692355437a8e1aab28e1657b6d109428dbb229d5e531f773e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-EQ-1.7/faithfulness/inputs/source_locator.json` (`f88819de08f04c4c730f1a4e652ec4515c23bc0595872d269dcf778fcb8ffea3`)
