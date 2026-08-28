# Faithfulness audit: HDP-01-DEF-LP-NORM

## Decision

- Classification: `faithful-stronger`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `bf6d80d6ffdece69f1ad4af46429bef79025728bbc9b9769c6356b7ef0fa57a2`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The finite clause is semantically exact: ENNReal minus zero and top parameterizes precisely positive finite exponents, `toReal` recovers that p, the standard real extended norm is pointwise absolute value, the nonnegative Lebesgue integral is the possibly infinite expectation, and ENNReal.rpow applies p and then 1/p in the correct places. The endpoint clause unfolds through eLpNorm and eLpNormEssSup to the mu-essential supremum of the same pointwise magnitude. Probability-measure context, a single governing mu, real-valuedness, extended values, and both cases are preserved. Lean's only consequential strengthening is omission of a measurability/random-variable restriction on X; because this broadens rather than narrows a satisfiable domain, Lean implies the source but not conversely, yielding accepted `faithful-stronger` without unresolved evidence.

## Implications

- **Lean implies source:** `yes`. Specialize the Lean proposition to a real-valued random variable on the source probability space. A nonzero, non-top ENNReal p is exactly a positive finite real p; `p.toReal` is that real p, `‖X omega‖ₑ` is the extended form of `|X(omega)|`, the lintegral is the possibly infinite expectation of its p-th power, and ENNReal.rpow by `1/p` is the printed p-th root. At top, D014 reduces eLpNorm to D015, the mu-essential supremum of the same pointwise absolute value. Thus both printed clauses follow.
- **Source implies lean:** `no`. The printed definition is stated for random variables, whereas Lean universally quantifies over every function `X : Omega -> Real` without measurability. The source claim alone therefore does not establish the Lean equality for nonmeasurable functions, even though Mathlib's extended eLpNorm and lintegral definitions make the broader Lean statement true. The difference is broader, satisfiable applicability rather than an extra hypothesis or a restricted domain.

## Findings

- **note / scope-generalization:** Lean strictly generalizes the source domain. This blocks source-implies-Lean but is genuine nonvacuous strength, so the fixed classification is accepted `faithful-stronger`.
- **note / extended-value-explication:** Lean makes the source's structurally indicated extended-valued convention explicit; this does not change either selected formula.
- **major / broader-function-domain:** The reconstructed proposition covers the source cases and additionally asserts the formulas for nonmeasurable functions. This is nonvacuous broader-domain strength, so the round trip is accepted as faithful-stronger rather than faithful-equivalent.
- **note / extended-value-codomain:** This makes explicit the extended-value reading already structurally indicated by the source and does not impose an unintended finiteness hypothesis.

## Semantic checklist

| Check | Direct | Round-trip |
|---|---|---|
| `C01` | `pass` | `pass` |
| `C02` | `fail` | `fail` |
| `C03` | `pass` | `pass` |
| `C04` | `fail` | `fail` |
| `C05` | `pass` | `pass` |
| `C06` | `pass` | `pass` |
| `C07` | `pass` | `pass` |
| `C08` | `pass` | `pass` |
| `C09` | `pass` | `pass` |
| `C10` | `pass` | `fail` |
| `C11` | `pass` | `pass` |
| `C12` | `pass` | `pass` |

## Dependency coverage

- Blind translator covered `38` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `38` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/agent_outputs/agent_runs.json` (`010aee7f85297f7b52ab160ed29622b293c94653d3526b9237675b2333c01988`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/agent_outputs/blind_translation.json` (`229eaeef7431377c43617551e88d790b0b0a38db741c7ebbf0c390d5c487c4c5`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/agent_outputs/direct_judge.json` (`4c9d2da9e67d9f8c78d7590787e896509b01e22a37505d74882f57525d839998`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/agent_outputs/roundtrip_judge.json` (`74cf16f5fc2cd82af261aca97741a26d13b5c42b0b26d8dd101fd3ad6afed1df`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/agent_outputs/source_contract.json` (`0e3dd657b14881b9de8a6bb68b69a3d2ed92a49af605150094f23c8205bdf33c`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/decision.json` (`00794ea9cdaa796f44267499a4e526e08f8da3617752a127ca9348357a10c60a`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/inputs/blind_dependency_inventory.json` (`1d7ac9d6705fd0661f5616c8c20df1a0ffa40442ff4c0443e896b3b62e96ff21`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/inputs/blind_dossier.md` (`65f847b02b02060dc35f162c29caa3cef5b6da08ba8c951fa7bd277b6f35c449`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/inputs/blind_review_packet.md` (`65f847b02b02060dc35f162c29caa3cef5b6da08ba8c951fa7bd277b6f35c449`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/inputs/declaration_dossier.md` (`81dcab64d3a5777c5524236756e0b068fe787720cc08b125db1cb3f610d96d79`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/inputs/dependency_inventory.json` (`1d7ac9d6705fd0661f5616c8c20df1a0ffa40442ff4c0443e896b3b62e96ff21`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/inputs/direct_review_packet.md` (`b11a7125698aa0b99f8307af666350ef7489357610c14da78ee298c364ae82f4`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-LP-NORM/faithfulness/inputs/source_locator.json` (`dbb1aae58ba06efb9ff1a3be0a8bccd7ab267cc004aa0c00851952f52875a17d`)
