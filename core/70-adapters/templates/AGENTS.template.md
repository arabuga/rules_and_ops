# AGENTS.md — {{PROJECT_NAME}} (entry point)

> **Before any action, execute `FEDERATION-HOOK.md` (repo root) — fail-closed.**

{{PROJECT_SUMMARY}}

## Hard rules (read before acting)

1. **Authority is human.** Agents draft; the operator accepts. Merges to main
   are human-gated pull requests.
2. **Surface, don't fix.** A divergence between fact and rule is an
   observation for the operator, not a defect to silently repair.
3. **Session protocol is mandatory:** register the session in `SESSIONS.md`
   on main BEFORE work, work in `session/<date>-<topic>`, commit artifacts
   immediately after creation, close with a session note (verification
   matrix).
4. **Truth is the filesystem and git**, not "I did it".
5. **Codification is machine-checked** (`githooks/`): LF, UTF-8, no BOM,
   no NUL, no pictograms outside the allowlist, no absolute disk paths in
   content.
6. **Stay in scope:** the session starter defines the volume; nothing beyond
   it without a recorded human decision.

## Map

| Need | Go to |
|---|---|
| What this repo is, read-first order | `FEDERATION-HOOK.md` |
| Session journal | `SESSIONS.md` |
| Decisions, active context, session notes | `memory/` |
| {{MAP_EXTRA_ROWS}} | |

## Language policy

Human layer (memory, handover documents): {{HUMAN_LAYER_LANG}}.
Machine layer (rules, commit messages, file and branch names): English.
