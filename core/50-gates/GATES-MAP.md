# GATES MAP — where progress is blocked, and by what

> Layer: `core/` (project-agnostic, English). These gates are seeds: the
> minimal set every member repository starts with. A repo may add gates;
> removing one is a recorded decision.

## 1. Gate inventory (seeds)

| Gate | When | Checks | Enforced by |
|---|---|---|---|
| session-start | before work in a branch | registration line exists in `SESSIONS.md`, status=active | protocol + review |
| pre-commit | every local commit | codification classes on staged files | `githooks/pre-commit` -> `check-codification.sh` |
| PR / CI | every pull request | same codification check on the files changed by the PR, server-side | GitHub Actions workflow (`core/60-ci/`) |
| merge | merging to main | human review of the PR; handover contract present | human operator |
| release / tag | optional | repo-defined | repo decision |
| memory | any rule change | decision log updated in the same change | review + PR gate |

## 2. Codification gate mechanics

The local and CI gates run the same script: `check-codification.sh`.

- Classes: `bom`, `nul` (no allowlist); `crlf`, `emoji`, `path`
  (allowlist-able per file via `githooks/codification.allow`; every entry
  cites a recorded decision).
- Fail-closed: a gate that cannot run its checks (for example, grep without
  PCRE support) blocks instead of silently skipping.
- Explicit file arguments override the staged-files default — that is how
  CI and self-tests call the script.

## 3. Layout

- **Canonical scripts (reference copy):** `core/50-gates/githooks/` —
  `pre-commit`, `check-codification.sh`, `codification.allow` (empty
  template).
- **Working copy:** every repository that adopts the frame — including the
  frame home itself — carries the trio at `githooks/` in its root, activated
  once by the maintainer: `git config core.hooksPath githooks`.
- The allowlist is per-repo and starts empty; the canonical template contains
  only the format instruction. The frame home's own working allowlist may
  carry entries for the gate script itself (the script embeds its detection
  patterns literally), recorded in the home's decision log.

## 4. Self-test duty

After porting or changing the gate, run it explicitly (script path plus file
arguments) on:

1. a clean set — expected exit 0;
2. synthetic fixtures, one per class (bom, nul, crlf, emoji, path) —
   expected exit 1 each, with the matching FAIL line.

Record the results in the session-note verification matrix; delete fixtures
before handover (fixture pattern `*.tmp.md` is git-ignored in the frame
home).
