# AGENTS.md — familycode (entry point)

> **Before any action, execute `FEDERATION-HOOK.md` (repo root) — fail-closed.**

FamilyCode is a documentation-first concept project (intelligent family
support system). The repository is the durable project memory. Substantive
model work is currently blocked by `DEC-001` (documentation-control stage).

## Hard rules (read before acting)

1. **Authority is human.** Agents draft; the project owner accepts. Merges to
   main are human-gated pull requests. Lifting `DEC-001` is the owner's act,
   never an agent's.
2. **Surface, don't fix.** A divergence between fact and rule is an
   observation for the owner, not a defect to silently repair. Established
   decisions are never overwritten silently.
3. **Session protocol is mandatory:** register the session in `SESSIONS.md`
   on main BEFORE work, work in `session/<date>-<topic>`, commit artifacts
   immediately after creation, close with a session note (verification
   matrix).
4. **Truth is the filesystem and git**, not "I did it". Never claim a write
   succeeded unless the tool confirmed it.
5. **Codification is machine-checked** (`githooks/`): LF, UTF-8, no BOM,
   no NUL, no pictograms outside the allowlist, no absolute disk paths in
   content.
6. **Stay in scope:** while `DEC-001` is active, only preservation,
   inventory, metadata repair and the agreed documentation-control work are
   allowed (see `DEC-001`, section 2).
7. **Status discipline:** facts, assumptions, proposals, approved decisions,
   plans, actions and results are marked separately; `validated` does not
   mean `approved`; workbench materials graduate into canonical documents,
   not into parallel specifications.

## Map

| Need | Go to |
|---|---|
| What this repo is, read-first order | `FEDERATION-HOOK.md` |
| Project context bootstrap | `PROJECT_CONTEXT.md` |
| Active blocker (mandatory stage) | `docs/workbench/decisions/DEC-001-documentation-control-gate-v1.0.md` |
| Canonical concept documents | `docs/concept/` |
| Working materials, statuses, registry | `docs/workbench/` (start: `docs/workbench/README.md`) |
| Session journal | `SESSIONS.md` |
| Decisions, active context, session notes | `memory/` |

## Language policy

Human layer (project face, docs, memory, handover documents): Russian.
Machine layer (this file, hook, gates, commit messages, file and branch
names): English. `PROJECT_CONTEXT.md` stays English as the project keeps it.
