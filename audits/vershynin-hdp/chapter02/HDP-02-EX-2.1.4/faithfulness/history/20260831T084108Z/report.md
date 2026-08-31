# Faithfulness audit: HDP-02-EX-2.1.4

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `true`
- Target SHA-256: `4f494c385eee3b24892e0c1647ea880105ebc4df7271016a70007733f6338b14`
- Source SHA-256: `ecc53be86c091b5df118c4464b6d81672e0261df960a3f32ceea4900107d090a`

The target is a distribution-level formulation of Exercise 2.1.4 for the fixed standard-normal law. Its restricted Ioi integral exactly represents E[g²1_{g>t}], and its constants are exactly t, 1/sqrt(2π), exp(-t²/2), and t+1/t. The only textual discrepancy is that the added target mass uses Ici t while the source writes the strict event g>t. This is semantically inert: gaussianReal 0 1 is nondegenerate and therefore uses the volume.withDensity branch, which is absolutely continuous with respect to real volume and assigns singleton {t} zero mass. Moreover, as a probability law its tail masses are finite, so Measure.real is the ordinary real-valued probability rather than an artifact of ENNReal.toReal totalization. The endpoint t=1 is valid, the hypothesis is satisfiable, both implications hold, and the correct classification is faithful-equivalent.

## Implications

- **Lean implies source:** `yes`. The restricted Ioi integral is the source quantity E[g²1_{g>t}] for any g with law gaussianReal 0 1. Because the variance parameter is one rather than zero, gaussianReal uses a density with respect to real volume and thus assigns zero mass to {t}. Consequently its finite closed-tail mass equals its strict-tail mass, so the target's exact equality and upper bound are exactly the source claims for every t≥1.
- **Source implies lean:** `yes`. Apply the source exercise to a random variable with standard-normal law gaussianReal 0 1 and rewrite the truncated expectation as the integral of x² against the law restricted to Ioi t. Absolute continuity gives zero singleton mass, so P{g>t}=μ(Ioi t)=μ(Ici t). Since μ is a probability measure, this set mass is finite and Measure.real returns the ordinary real probability. The source identity and bound therefore yield both target conjuncts with identical constants.

## Findings

No findings were recorded.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `pass` | `pass` |
| `C03` | `pass` | `pass` |
| `C04` | `pass` | `pass` |
| `C05` | `pass` | `unclear` |
| `C06` | `pass` | `unclear` |
| `C07` | `pass` | `unclear` |
| `C08` | `pass` | `unclear` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `pass` |
| `C11` | `pass` | `unclear` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `54` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `54` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/agent_outputs/adjudicator.json` (`176e5a9037f3af3cd7774eed8ef3bff427ad21937e431790d063866529a3ea01`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/agent_outputs/agent_runs.json` (`10b3d929d67de0a3809761b8ac47c8e70ca9853edd87e12547b78a2faf130960`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/agent_outputs/blind_translation.json` (`87a24e8f4cf186c7d6d83ad44ed22411a3df07d9d8c121b7ac3f70e3a0457089`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/agent_outputs/direct_judge.json` (`35be4488bc47432c7fb8520e9494648be158b72a483d23bdb262d8e51fbf89ab`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/agent_outputs/roundtrip_judge.json` (`60edcced2b40811dde651b890bede586b388f41aec1bb9ef7db8ceec132dcb70`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/agent_outputs/source_contract.json` (`536e390214170a351d40249602a9d9cb89a59ea95da285af23c49b634ec02fbf`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/decision.json` (`f3bb312ee2d0de1f2a44ab528bc4eef9e15569d3ee7a1729658bcf650ddfb5b1`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/inputs/blind_dependency_inventory.json` (`400c563a88063a9be15b0f2acfb0cf77f675a4ed49ce4fae03d74b6967602d6e`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/inputs/blind_dossier.md` (`e88b0a4d5c97376ff28b6eaba9bfbe6e1d8e73d26f9f8bf2f21c4050dc88a428`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/inputs/blind_review_packet.md` (`e88b0a4d5c97376ff28b6eaba9bfbe6e1d8e73d26f9f8bf2f21c4050dc88a428`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/inputs/declaration_dossier.md` (`ff5bd55c5c3e9048e3895532d2bb7f4c95d829f316f2702af6dad11aa4593f00`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/inputs/dependency_inventory.json` (`030bac92a7c0391c239b466349ec9dae544c67524f36015d46f8ba2c373512d9`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/inputs/direct_review_packet.md` (`cc9bf6031dbc1262c222f00c3f054871f4a8214e845fd75c24507c0e93a5f605`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter02/HDP-02-EX-2.1.4/faithfulness/inputs/source_locator.json` (`3b9fab520eab9890cb7f35634b50ef6aa75bea73c73b250dfa6e73d80b5453d4`)
