# ADAPTERS — one rulebook, many tools

> Layer: `core/` (project-agnostic, English). Adapters make every AI tool
> read the repo hook first. Adapters contain pointers, never rules.

## 1. Matrix

| File | Read natively by | Role |
|---|---|---|
| `AGENTS.md` (root) | Codex, GitHub Copilot / VS Code, Cursor, Claude-family tools and other agents.md-aware agents | primary entry point: hard-rules digest plus map; points to the hook first |
| `CLAUDE.md` (root) | Claude-family tools (legacy file discovery) | duplicate safety net; pointer only |
| `.cursor/rules` (optional) | Cursor project rules | pointer to the hook and `AGENTS.md`; no rules inside |
| `.github/copilot-instructions.md` (optional) | GitHub Copilot | pointer to the hook and `AGENTS.md`; no rules inside |

## 2. Rules of the adapter layer

1. **No rules in adapters.** An adapter that states a rule is a defect:
   duplicated rules fork and rot.
2. Every adapter begins with: execute `FEDERATION-HOOK.md` (repo root) first,
   fail-closed.
3. `AGENTS.md` may carry a short digest of hard rules and a map — a
   convenience copy whose truth stays in the hook and the home rulebook.
4. Optional adapters are added only when the tool is actually used in the
   project; a dead adapter is removed (recorded decision).

## 3. Templates

Ready-to-fill templates live in `templates/` (this directory):

| Template | Target file in a member repo |
|---|---|
| `FEDERATION-HOOK.template.md` | `FEDERATION-HOOK.md` |
| `AGENTS.template.md` | `AGENTS.md` |
| `CLAUDE.template.md` | `CLAUDE.md` |
| `SESSIONS.template.md` | `SESSIONS.md` |
| `memory-README.template.md` | `memory/README.md` |
| `memory-activeContext.template.md` | `memory/activeContext.md` |
| `memory-decisionLog.template.md` | `memory/decisionLog.md` |
| `session-starter.template.md` | `memory/session-starters/<name>.md` |

Core placeholders: `{{PROJECT_NAME}}` (display name), `{{PROJECT_SUMMARY}}`
(one or two sentences), `{{HUMAN_LAYER_LANG}}` (language of the human layer),
`{{STATUS}}` (project status line), `{{DATE}}`, `{{OPERATOR}}`. Individual
templates mark additional local placeholders in the same double-brace form.
Replace every placeholder; a leftover "{{" in a delivered file is a defect.
