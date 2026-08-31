# Faithfulness audit: HDP-01-DEF-ZN

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `40dec7374b5a3a8aa1956cd0ec32ddd60891de1ae49c91b396d46e2d895cf449`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target preserves the centered numerator, square-root variance denominator, σ sqrt(N) scale, and N-term sum. Zero-based Finset.range N is a faithful reindexing of the source's one-based sum. Explicit positivity of N and σ records implicit source conditions. The i.i.d. assumptions are replaced by their exact aggregate mean and variance consequences, and the conclusion is pointwise function equality. Quantification over arbitrary measures and non-i.i.d. sequences makes the declaration strictly stronger, but does not create a semantic mismatch for the requested algebraic normalized-sum equivalence.

## Implications

- **Lean implies source:** `yes`. Instantiate the arbitrary measure with the source probability measure, reindex X 0 through X (N-1) as source variables X_1 through X_N, and use the aggregate mean and variance identities inherited from the source i.i.d. assumptions. The Lean conclusion is then exactly the source's displayed normalization equality.
- **Source implies lean:** `no`. The source states the equality in an i.i.d. probability setting. It does not assert the declaration's broader universal claim for arbitrary measures and arbitrary sequences satisfying only the two aggregate moment identities.

## Findings

- **note / premise-generalization:** The Lean theorem is stronger than the source statement, but the strengthening is mathematically justified for the isolated algebraic equality because those aggregate identities are the only probabilistic facts the equality needs.
- **note / assumptions:** This broadens the lemma while retaining the consequences needed to recover the source equality.
- **note / indexing:** The two formulations agree under a harmless bijective reindexing.
- **note / nondegeneracy:** The explicit premises resolve implicit source domain conventions without changing the intended nondegenerate case.
- **note / analytic-context:** This broadens the conditional algebraic lemma and does not prevent specialization to the source probabilistic context.
- **note / scope:** Those surrounding claims remain outside this DEF-ZN audit target and are not contradicted.

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
| `C12` | `not-applicable` | `pass` |

## Dependency coverage

- Blind translator covered `43` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `43` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/agent_outputs/agent_runs.json` (`97c09cb65c767185c44287ea69bef950fbadc5442e645ddc697ff225439e6e1f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/agent_outputs/blind_translation.json` (`a85632b7684bc59fe50b5ab67e8223925653e6c612b0a6d972afb8e63e3d1151`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/agent_outputs/direct_judge.json` (`fc2990d4bfc449bd806b38f9806476c32fa78e75132cfcebb07f3202ffadbba5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/agent_outputs/roundtrip_judge.json` (`cbb456ead0d1567f36da75ece86f077795460be31defc33acd12d7433c518a58`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/agent_outputs/source_contract.json` (`19928dfa9e55eb230678bb6fe4882deb0bcf3ce147e1286899a4cd2113c67b19`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/decision.json` (`f7bc5eff71c3702f953d94cb20ea37dd661acbb990580525b72e2b0a516087f7`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/inputs/blind_dependency_inventory.json` (`50290f7f73de5fb69af4a3007bd4ebd9c05af43813a7b2b2b87302065921ed4b`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/inputs/blind_dossier.md` (`30e26d37fbd011ae9b3ad35862567a1d9382f822aa396203aa8b2ecca67f3c59`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/inputs/blind_review_packet.md` (`30e26d37fbd011ae9b3ad35862567a1d9382f822aa396203aa8b2ecca67f3c59`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/inputs/declaration_dossier.md` (`dacbffcc05a44c2255c43bc96c68dd68bf0d63ac6efabef94d8bbbc36e562c33`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/inputs/dependency_inventory.json` (`deaaec829cf8741b153663c6b869712f5727a77c94fc0226495ca8588c4845fb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/inputs/direct_review_packet.md` (`7cdba415aa0fcfe953d233d5c495a22f4c511017c83baa3f7c60494cb37e01f6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-ZN/faithfulness/inputs/source_locator.json` (`443c435c6e073560e0419fb5cd0a4be6ee87839a599ac0465eb470accef703ee`)
