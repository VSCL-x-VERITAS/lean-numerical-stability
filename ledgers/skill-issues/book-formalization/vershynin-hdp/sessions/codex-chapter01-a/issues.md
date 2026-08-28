# Issues — session codex-chapter01-a

Record skill, harness, prompt, gate, tool, or agent-process issues encountered in this scope. Use stable IDs; never delete history—mark superseded or closed entries.

| ID | Observed at | Component | Symptom | Evidence | Impact | Status | Owner/next action |
|---|---|---|---|---|---|---|---|
| BF-VHDP-C01-A-I001 | 2026-08-27 | faithfulness kit `install_skill.py` | The optional repository-skill installation exited 2 because the destination is an existing symbolic link and the installer calls `shutil.rmtree` on it. | Current command output: all 42 `SHA256SUMS` entries were `OK`, followed by `skill installation error: Cannot call rmtree on a symbolic link`. | The verified `.faithfulness-audit` framework can run, but the installer is not idempotent over a symlink-backed active skill registry. | open | Continue with the already active shared skill and the single verified local kit; harden the installer in a separately authorized skill-maintenance run. |
| BF-VHDP-C01-A-I002 | 2026-08-27 | stateless judge launch prompt | The first direct/round-trip launch named a nonexistent `.faithfulness-audit/references/semantic-checklist.md` path instead of the configured `.faithfulness-audit/checks/core.json`. | The round-trip agent stopped and reported the missing authorized path; `find .faithfulness-audit` located `checks/core.json`; both agents then received the exact corrected locator and completed schema-valid outputs. | One avoidable agent pause; no evidence-boundary expansion or semantic output loss. | closed | Future launches must derive the checklist locator from `audit.config.json` rather than a remembered path. |
| BF-VHDP-C01-A-I003 | 2026-08-27 | book-formalization continuation contract and HDP gate schema 1 | The run terminated after relabeling 45 locally resolvable Chapter 1 rows as `BLOCKED`; the rows actually required proofs, foundations, wrappers, audits, discrepancy artifacts, or organization. | The schema-1 gate accepted `BLOCKED` from free-text `attempted_routes` plus a smallest missing foundation, and the provider prompt explicitly allowed stopping once every row had that record. | Premature terminal handoff with only 1 of 46 current Chapter 1 Lean obligations formalized (2.17%). | open | Release workflow 2.0.0 with schema-2 actionable/hard-blocked separation, migrate Chapter 1 to `ACTIVE`, and close this finding only after deterministic and fresh-provider continuation tests pass. |

## Resolution events

Resolution events are append-only and do not rewrite the observation rows above.

| Event ID | Recorded at | Resolves | Evidence | Result | Status |
|---|---|---|---|---|---|
| BF-VHDP-C01-A-I003-R1 | 2026-08-28 | BF-VHDP-C01-A-I003 | Workflow 2.0.0 actionability contract 5/5; HDP gate regression 309/309; Higham gate regression 219/219; fresh Codex and Claude fixtures each reached `PASS` at 3 formalized, 0 remaining, denominator 3, 100.00%; migrated Chapter 1 checker reports `ACTIVE`, 1 formalized, 45 remaining, denominator 46, 2.17%, and zero hard blockers; Vershynin module is `READY` at `hdp-module-audit-2026-08-28-actionability-v2`. | The premature-stop route is eliminated: local proof/foundation/wrapper/audit/discrepancy/organization work is actionable, and terminal blockage requires zero actionable work plus a typed nonlocal obstruction. | closed |
