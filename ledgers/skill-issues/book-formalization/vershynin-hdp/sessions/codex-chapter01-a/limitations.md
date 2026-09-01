# Limitations — session codex-chapter01-a

Record skill, harness, prompt, gate, tool, or agent-process limitations encountered in this scope. Use stable IDs; never delete history—mark superseded or closed entries.

| ID | Observed at | Component | Limitation | Consequence | Workaround | Status | Owner/next action |
|---|---|---|---|---|---|---|---|
| BF-VHDP-C01-A-L001 | 2026-08-28 | local Codex CLI 0.140.0 provider launcher | The configured default `gpt-5.6-sol` rejected startup because it requires a newer Codex CLI; the provider never entered the forward-test task. | The first Codex behavioral-test attempt exited before reading or mutating the pristine fixture. | Restart a fresh untouched fixture with explicitly supported model `gpt-5.4`; that run completed proof, wrapper, discrepancy, audit, and organization work to `PASS` at 3/0/3 (100.00%). | mitigated | Upgrade the local Codex CLI before relying on `gpt-5.6-sol`; retain the successful `gpt-5.4` transcript as workflow 2.0.0 release evidence. |
