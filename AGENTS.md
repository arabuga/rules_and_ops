# AGENTS.md — rules_and_ops (entry point)

> **Before any action, execute `FEDERATION-HOOK.md` (repo root) — fail-closed.**

Home of a **reusable governance frame** (layer `core/`, project-agnostic) and its
**binding to the familycode project** (layer `project-familycode/`). Not the target
project itself; the target project is never edited from here.

## Hard rules (read before acting)

1. **Two layers, one direction.** `core/` must stay free of project names, paths,
   and facts. Project specifics live only in `project-familycode/`. Moving content
   between layers is a recorded decision, not a silent edit.
2. **Surface, don't fix.** A divergence between fact and rule is an observation
   for the operator, not a defect to silently repair.
3. **Authority is human.** Agents draft; the operator accepts. Merges to `main`
   are human-gated pull requests.
4. **Session protocol is mandatory** (see `core/40-sessions/SESSION-PROTOCOL.md`):
   register the session in `SESSIONS.md` on `main`, work in `session/<date>-<topic>`,
   commit artifacts immediately after creation, close with a session note.
5. **Truth is the filesystem and git**, not "I did it". A session that changed
   artifacts closes with a verification matrix.
6. **Codification is machine-checked** (`githooks/`): LF, UTF-8, no BOM, no NUL,
   no pictograms outside the allowlist, no absolute disk paths in content.

## Map

| Need | Go to |
|---|---|
| The frame: principles, roles, flows | `core/00-frame/FRAME.md` |
| Documentation and codification rules | `core/10-codification/CODIFICATION.md` |
| Operational and agent-conduct rules | `core/20-operational/` |
| Repository memory structure | `core/30-memory/MEMORY-SPEC.md` |
| Session protocol (branches, registration) | `core/40-sessions/SESSION-PROTOCOL.md` |
| Gates map and gate mechanics | `core/50-gates/` |
| CI control (GitHub Actions) | `core/60-ci/` |
| Tool/AI adapters and templates | `core/70-adapters/` |
| Binding to the target project | `project-familycode/` (start: `ONBOARDING.md`) |
| Session journal (this repo) | `SESSIONS.md` |
| Memory of this repo | `memory/README.md` |

## Language policy of this repo

Machine-facing rules, templates, gates, adapters: **English** (maximum
compatibility across AI models and tools). Operator-facing handover documents
(`README.md`, `project-familycode/ONBOARDING.md`) and this repo's working memory:
**Russian**. The policy itself is part of the frame: see `CODIFICATION.md`.
