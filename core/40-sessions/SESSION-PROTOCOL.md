# SESSION PROTOCOL — registration, branch, closure

> Layer: `core/` (project-agnostic, English). The session journal
> (`SESSIONS.md`) lives in the repository root, on the main branch.

## 1. Unit of work

A session is one unit of agent work: one id, one branch, one registration
line, one handover note. Ids are S-NNN, numbered per repository, append-only.

## 2. Before work: registration (fail-closed)

BEFORE any work in the branch, a registration line is appended to
`SESSIONS.md` on main:

| id | date | branch | goal | agent/tool | operator | status |

with `status=active`. An unregistered session does not start. Who pushes the
registration line — the operator, or an agent if the repo's commit-rights
decision grants main-branch rights for this single line — is recorded in the
repo's decision log.

## 3. Branch

- Name: `session/<YYYY-MM-DD>-<topic>` (ASCII, no spaces).
- All session work happens in this branch. Main is never edited directly;
  the registration line is the single exception.

## 4. During work: commit immediately

- Every artifact is committed to the session branch immediately after
  creation. An uncommitted artifact is at risk and invisible to review.
- Commit messages: English, imperative, one summary line.
- Commit rights: by default the operator commits. A repository may grant
  agents the right to `git add` and `git commit` in their own session branch
  (recorded decision). `push`, `checkout`, `merge`, `rebase` by agents are
  forbidden unless the decision explicitly says otherwise.
- Before every commit the agent verifies the current branch is its session
  branch; a mismatch stops work and goes into the handover.

## 5. Closure

1. Session note in `memory/session-notes/` (verification matrix mandatory,
   see the handover contract in `core/20-operational/OPERATIONAL-RULES.md`).
2. Pull request from the session branch to main.
3. CI gate runs on the pull request (same codification check as local).
4. The human reviews and merges. Merge by agents is forbidden.
5. Status in `SESSIONS.md`: active -> merged, or abandoned (+ reason).

## 6. Abandoned sessions

Abandoned sessions are not erased. The operator may delete the branch, but
the registration line stays, with `status=abandoned` and the reason. The
journal is append-only history.
