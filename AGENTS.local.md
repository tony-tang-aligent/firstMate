# Captain Local Overrides & Fleet Enrichment

## 1. Shared Engineering Taste (Mandatory for Captain & All Crews)
- Before proposing architectures, dispatching crews, or writing code, read `~/.config/ai/OPINIONS.md`.
- Every crewmate dispatch brief (`ship` and `scout`) MUST explicitly instruct the worker to read and obey `~/.config/ai/OPINIONS.md` alongside the target repository's `AGENTS.md`.

## 2. Visual Plan Sign-Off Gate (`/lavish`)
- For any `ship` task touching more than 3 files, introducing a new dependency, or altering database/API schemas:
  1. Generate an interactive architectural plan and Mermaid diagram using `/lavish` (`npx -y lavish-axi`).
  2. Wait for Captain approval on the Lavish review before spawning write-enabled crewmates.
- Single-file fixes and read-only `scout` tasks bypass the `/lavish` gate.

## 3. Tiered Model Routing (Captain vs. Crews)
- **Captain & Ship Crews:** Default to the primary frontier model (Sonnet 4.6 / Opus) for architectural reasoning and production code changes.
- **Scouts & Supervision Polling:** Use a fast, low-cost model (Haiku / Flash) for read-only codebase scouting, log inspection, and routine fleet status checks (`/supervision-model` when running in Pi).

## 4. Pre-PR Quality Gate (`/no-mistakes`)
- No `ship` crewmate branch may be presented to the Captain as ready for PR until it has passed local lint, typecheck, and test verification (or `/no-mistakes` in an isolated worktree).

## 5. Corporate Mac Guardrails
- Never use `sudo` or global system directories; keep local binaries in `~/.local/bin`.
- Never enable `/afk` autonomous push loops on shared corporate repositories without explicit Captain confirmation.

## 7. Self-Hosted Repo Maintenance Rules
- This repository (`origin`: `tony-tang-aligent/firstMate`) is privately maintained by the Captain.
- NEVER run `/updatefirstmate` or overwrite `origin/main` with `upstream/main` automatically.
- To sync selective upstream improvements, fetch `upstream` and merge or cherry-pick on a review branch first.

## 6. Worktree Environment & Port Bootstrap
- Whenever spawning a crewmate in a new Git worktree, run `bin/fm-local-env.sh <parent_repo> <worktree_path> <slot_index>` before starting the worker so `.env`/`.npmrc` are linked and isolated ports are assigned.

## 7. Self-Hosted Repo Maintenance Rules
- This repository (`origin`: `tony-tang-aligent/firstMate`) is privately maintained by the Captain.
- NEVER run `/updatefirstmate` or overwrite `origin/main` with `upstream/main` automatically.
- To sync selective upstream improvements, fetch `upstream` and merge or cherry-pick on a review branch first.

## 8. Corporate Network & Daemon Hardening
- **No External Relays:** Never configure or invoke `FMX_PAIRING_TOKEN`, `myfirstmate.io`, or `bin/fm-x-*.sh`. All fleet state stays strictly local.
- **No Background LaunchAgents:** Never run `bin/fm-remote-doctor.sh` or register `~/Library/LaunchAgents/dev.firstmate.*` services.
- **No Unapproved Binary Downloads:** Never run `bin/fm-bootstrap.sh` or `bin/fm-install-*.sh` to download third-party binaries without explicit Captain approval.
