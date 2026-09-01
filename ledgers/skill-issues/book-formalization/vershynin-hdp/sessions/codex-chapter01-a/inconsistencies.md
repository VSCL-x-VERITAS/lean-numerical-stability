# Inconsistencies — session codex-chapter01-a

Record skill, harness, prompt, gate, tool, or agent-process inconsistencies encountered in this scope. Use stable IDs; never delete history—mark superseded or closed entries.

| ID | Observed at | Surfaces compared | Inconsistency | Evidence | Risk | Status | Owner/next action |
|---|---|---|---|---|---|---|---|
| BF-VHDP-C01-A-C001 | 2026-08-27 | prepared faithfulness manifest vs live `.faithfulness-audit/audit.config.json` | The first Markov audit pinned config SHA-256 `387206436b17dcb56a8c91be52435b888d962076c6c4a45738c30f478aef8396`, but finalization observed live SHA-256 `a823e940b14610c3080ee23abdbc7c9589d429284bb38707774e253576751d95`; the task glob had broadened from the Chapter 1 task subtree to the book audit subtree. | `validate_audit.py HDP-01-PROP-1.2.4 --phase prepared` and `finalize_audit.py ... --check-adjudication` both reported `manifest: audit setup paths or hashes changed`; the manifest and current `sha256sum` outputs contain the two hashes above. | The first audit's otherwise schema-valid role outputs cannot produce a hash-bound final decision. | mitigated | Preserve the invalidated run as diagnostic evidence; do not rewrite its manifest. A corrected declaration is being audited under fresh task `HDP-01-PROP-1.2.4-EXTENDED` against the currently validated config. |
