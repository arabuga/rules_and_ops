# CODIFICATION — machine-checkable form rules

> Layer: `core/` (project-agnostic, English). These rules are enforced by the
> codification gate (`core/50-gates/githooks/`) locally and by the CI gate
> (`core/60-ci/`) on pull requests. What the gate cannot check is still
> binding.

## 1. Encoding and line endings

- Text files: UTF-8, no BOM, no NUL bytes.
- Line endings: LF only. CR/CRLF is a violation (allowlist-able per file).
- Binary formats (office documents, images, archives, fonts) are exempt from
  text checks; keep them out of rule and memory paths.

## 2. Pictograms

- Pictograms (emoji and pictographic symbols) are forbidden in repository
  content outside the per-repo allowlist.
- Documentation ABOUT pictograms uses codepoint notation (for example
  "U+1F600") or plain words, never the glyph itself.
- Arrow characters in the U+2190..U+21FF range are tolerated by the gate;
  ASCII "->" is preferred in prose.

## 3. Absolute paths

- Absolute disk paths are forbidden in file content outside the allowlist.
  Both forms are violations: the drive-letter form (a letter, then a colon,
  then a backslash) and the container mount form (slash, then "mnt", then
  slash).
- Use repository-relative paths in all content. Locations outside the
  repository (donor repos, clones, hosts) are passed in launch or runtime
  text, never written into files.

## 4. Languages by layer

- Code, identifiers, file names, branch names: English.
- Machine-facing rules, templates, gates, CI, adapters: English (maximum
  compatibility across AI models and tools).
- Human layer (handover documents, repository working memory): the project
  chooses one language and records the choice in its hook. Mixing languages
  within one layer is a violation of intent even where the gate cannot
  detect it.

## 5. Commit messages

- English, imperative mood, one summary line; details go into the body only
  when truly needed.
- No secrets, no tokens, no personal data, no absolute disk paths.

## 6. File and branch names

- ASCII letters, digits, "-", "_", "." only; no spaces.
- Branch names follow the session protocol: `session/<YYYY-MM-DD>-<topic>`.

## 7. Allowlist discipline

The gate reads `githooks/codification.allow` (per repository). Every entry
cites a recorded decision in the repo's decision log. Adding an entry is a
recorded decision, not a silent exemption. Classes `bom` and `nul` accept no
entries at all.
