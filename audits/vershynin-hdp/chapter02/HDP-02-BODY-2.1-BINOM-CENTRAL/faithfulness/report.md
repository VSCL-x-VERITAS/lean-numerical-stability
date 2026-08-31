# Faithfulness audit: HDP-02-BODY-2.1-BINOM-CENTRAL

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `194d0b7a12da805e718988ebae002b9eb30dffd8dbf4409d0b15f25581210384`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

Primary evidence resolves every round-trip uncertainty. The preceding source page explicitly defines Z_N=(S_N-N/2)/sqrt(N/4); substituting N=2n gives exactly the declaration's pushforward map k↦(k-n)/sqrt(n/2). Thus the normalized PMF is the law of Z_{2n}, and for n>0 its zero event is precisely the central count k=n. The exact central probability becomes (1/2)^(2n) choose(2n,n), and the comparison scale becomes 1/sqrt(2n). Footnote 1 expressly permits the eventual interpretation implemented by IsTheta atTop. The zero-trial case is handled consistently: the exact combinatorial identity is valid at n=0, the degenerate normalization is excluded by n>0, and the asymptotic relation ignores finite initial behavior. The statement is nonvacuous, both implications hold, and the correct classification is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. For N=2n, the first target conjunct is exactly P{S_N=N/2}=2^(-N) choose(N,N/2). The supplied local definition is the law of the inherited source variable Z_N because (S_{2n}-n)/sqrt(n/2) is the source normalization after substitution. For n>0, its zero event is exactly the central event. The IsTheta-atTop conjunct gives the explicitly permitted sufficiently-large meaning of ≍ with comparison scale 1/sqrt(N), hence also the source's Z_N zero-mass estimate.
- **Source implies lean:** `yes`. Writing each positive even N as 2n converts the source exact mass, normalization, and square-root scale verbatim into the target's three expressions. The source's sufficiently-large fixed-factor estimate is precisely mutual big-O at Filter.atTop for these nonnegative real sequences. At n=0 the normalized claim is correctly excluded, while the universally stated exact binomial identity remains valid because both sides equal one.

## Findings

No findings were recorded.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `unclear` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `unclear` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `125` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `125` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/agent_outputs/adjudicator.json` (`7154fe9fc987bd6303a3e2ef1c2fab8a89c3a76a2f6e7d4ff451af7fd7a2834c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/agent_outputs/agent_runs.json` (`09572c526f73f46622b6d312a2160c5f7f77013d95229a3b2f81567ce5935477`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/agent_outputs/blind_translation.json` (`c8888d4e85c02d1e301568ea1434713b0b80c093a529ac9af3969925cad34872`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/agent_outputs/direct_judge.json` (`df0d19daa0027b5846d0194ce81beb607d1fef6d08b9cf4b7e89f5ba4e2f9767`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/agent_outputs/roundtrip_judge.json` (`b8750378f68d50fff12d9f0d599bc502be96d4f340248dfe29403669f1478b42`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/agent_outputs/source_contract.json` (`23641de2a92ae31aba6f0211f1ec1fd81fcf657186310a4f0ac70019d724e5cd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/decision.json` (`80f7b8db2089e70ebc39b4097036832cdf1e34f07b1582237aaabf98581c3d8e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/inputs/blind_dependency_inventory.json` (`989e2b19a09f5b747f6b1f7004beab05b91036a11eaa83165b64685f31ab62c4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/inputs/blind_dossier.md` (`25c728639de7f93fae4f71a2d7d3350a04e4d8dedaa655ac1cc7ad40433b3da3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/inputs/blind_review_packet.md` (`25c728639de7f93fae4f71a2d7d3350a04e4d8dedaa655ac1cc7ad40433b3da3`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/inputs/declaration_dossier.md` (`e062009363c1f3b5005db8ac3dc07392c9faf85e4bb28bfc7f4908939276a9ed`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/inputs/dependency_inventory.json` (`104cfd60e72bcf2d6b885a3d6baa86d7854a4dfc5fdd57e3aac2811a543752a5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/inputs/direct_review_packet.md` (`c8aa85633e1fd384aa70c0d09a348325d33923d6aeef21e2188d4d8070dcc42e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-BODY-2.1-BINOM-CENTRAL/faithfulness/inputs/source_locator.json` (`f824954b50e0b985d7dd4a190972c24e69a0ed9dbfe3c521c28b1ed6987dafc3`)
