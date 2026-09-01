# Faithfulness audit: HDP-01-DEF-CONVEX

## Decision

- Classification: `faithful-equivalent`
- Accepted: `true`
- Adjudicated: `false`
- Target SHA-256: `1abb84fd023650f8026f484433c11ab30936272c40239cae2fb1d69edc04167a`
- Source SHA-256: `855fdaf6870f664f1e470d47641b6d72758afdb9b87649a6494b027cecc02b17`

The target is a faithful scalar formalization of the selected definition. Its explicit right side reproduces the source inequality, quantifiers, interval, coefficients, and real domain exactly. The local interface unfolds to Mathlib's ConvexOn ℝ Set.univ; over the reals, that standard two-weight definition is equivalent to the source's t and 1−t parameterization. All dependencies and core checks pass, both implications hold, and no adjudication is needed.

## Implications

- **Lean implies source:** `yes`. Unfolding D001 gives ConvexOn ℝ Set.univ. Its nonnegative two-weight condition with a+b=1 specializes to a=t,b=1−t, while Set.univ is convex, yielding exactly the source formula in the immediate φ : ℝ → ℝ context.
- **Source implies lean:** `yes`. The source condition is the target's right side after correcting the printed λ/t name mismatch. For nonnegative a,b with a+b=1, take t=a; then b=1−t and a≤1, proving the ConvexOn clause, while Set.univ supplies the domain-convexity conjunct.

## Findings

- **note / source-typography:** This resolves the evident variable-name typo and causes no semantic divergence under the intended reading.
- **note / source-notation:** This is an evident dummy-variable naming typo and creates no substantive semantic difference.

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

- Blind translator covered `28` dependencies (`0` hash-reused); unclear: `none`.
- Direct judge covered `28` dependencies (`0` hash-reused); failing or unclear: `none`.

## Remaining uncertainties

No remaining uncertainties were recorded.

## Artifact provenance

- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/agent_outputs/agent_runs.json` (`43deef1ea2c16d875cd63bd981463b717ef035c3bb2e25be05221ace7329a0c6`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/agent_outputs/blind_translation.json` (`700ec2fa85aaad8c27a3d7820ed813c616159615692c8ebe100caf0484c6ed29`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/agent_outputs/direct_judge.json` (`d7bf358c3e7fb8f0be6a262a891b024a842679642b177da22d6447ca6fa5e2eb`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/agent_outputs/roundtrip_judge.json` (`a84d6116279368e54294c631ef98bc0070b685a18994b66f131e5fc16fe22e8f`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/agent_outputs/source_contract.json` (`33525a7d0cab1d333ed740f39453d8a082fc497f5ebf1020af3562213c883503`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/decision.json` (`7bde968be4fd53f216dbc771af29e12e73cdd6a8cde1fabbbd48cce4f9948fbd`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/inputs/blind_dependency_inventory.json` (`0d21d256ec173f166924b6ae220198b661955a9347c950b30d61c57a90b1b930`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/inputs/blind_dossier.md` (`b53d2af4d3846495e7139ccb2403ebffc29dc3ff4305eb73fb2c98e66c441c03`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/inputs/blind_review_packet.md` (`b53d2af4d3846495e7139ccb2403ebffc29dc3ff4305eb73fb2c98e66c441c03`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/inputs/declaration_dossier.md` (`b7b74593eeee89744b24573b6943facdb24fb59d83605c964cf5b0ac543d83b2`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/inputs/dependency_inventory.json` (`a3d11272cc838517bba79ae5a25cf7a2cbf00bbd8d727b5b9c47f2908e1c3f34`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/inputs/direct_review_packet.md` (`fe8346883fe5cc89c96de5b8688f4dcae346b1c64dcca635cc8f719729076adc`)
- `lean-numerical-stability/audits/vershynin-hdp/chapter01/HDP-01-DEF-CONVEX/faithfulness/inputs/source_locator.json` (`00bc1393df0151015d141addc509655832d47f4c88cefcaf4d33d305faa803b7`)
