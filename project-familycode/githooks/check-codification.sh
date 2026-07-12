#!/bin/sh
# check-codification.sh -- repository codification gate.
# Fail-closed: any violation on a staged text file blocks the commit.
#
# Classes checked:
#   bom    -- UTF-8 BOM at file start          (no allowlist)
#   nul    -- NUL byte inside a text file      (no allowlist)
#   crlf   -- CR/CRLF line endings             (allowlist: crlf)
#   emoji  -- pictographs / emoji              (allowlist: emoji)
#   path   -- absolute disk paths              (allowlist: path)
#
# Per-class allowlist: githooks/codification.allow
#   line format: "<class> <repo-relative-path>"   ('#' = comment)
# Binary files (by extension) are skipped entirely.
#
# Requires grep -P (PCRE); Git for Windows provides it. Absent -> fail-closed.
# Language of comments: EN (machine-facing file).

set -u

# Force a UTF-8 locale: under a non-UTF-8 caller locale grep -P errors out on
# \x{...} Unicode ranges / non-ASCII input, and those checks would be skipped.
# Exported here so the gate works from any environment (bare PowerShell, GUI
# git clients) without an external export.
export LC_ALL=C.UTF-8

root=$(git rev-parse --show-toplevel) || exit 1
allow="$root/githooks/codification.allow"

# PCRE capability probe (fail-closed).
if ! printf 'a' | grep -qP 'a' 2>/dev/null; then
  echo "check-codification: grep -P (PCRE) required but unavailable" >&2
  exit 2
fi

# Files to scan: staged Added/Copied/Modified, or explicit args (CI, self-test).
if [ "$#" -gt 0 ]; then
  files=$*
else
  files=$(git diff --cached --name-only --diff-filter=ACM)
fi

status=0

# is_allowed <class> <repo-relative-path>  -> 0 if allowlisted
is_allowed() {
  cls=$1
  target=$2
  [ -f "$allow" ] || return 1
  grep -E "^${cls}[[:space:]]+" "$allow" 2>/dev/null | while IFS= read -r line; do
    pat=$(printf '%s' "$line" | sed -E "s/^${cls}[[:space:]]+//")
    [ -n "$pat" ] || continue
    # unquoted $pat: allowlist entries may be globs (e.g. legacy/*)
    case "$target" in
      $pat) echo MATCH; break ;;
    esac
  done | grep -q MATCH
}

is_binary_ext() {
  case "$1" in
    *.docx|*.pptx|*.xlsx|*.xlsm|*.pdf|*.png|*.jpg|*.jpeg|*.gif|*.ico|*.zip|*.woff|*.woff2|*.eot|*.ttf)
      return 0 ;;
    *) return 1 ;;
  esac
}

# Emoji / pictograph classes (arrows 2190-21FF deliberately excluded:
# "->" separators are legitimate in prose and tables).
emoji_re='[\x{1F000}-\x{1FAFF}\x{2600}-\x{27BF}\x{2B00}-\x{2BFF}\x{2300}-\x{23FF}\x{25A0}-\x{25FF}\x{FE00}-\x{FE0F}\x{200D}]'
# Absolute disk paths: drive-letter form or /mnt/.
path_re='([A-Za-z]:\\|/mnt/)'

for f in $files; do
  [ -f "$f" ] || continue
  is_binary_ext "$f" && continue

  # bom (no allowlist)
  if [ "$(dd if="$f" bs=1 count=3 2>/dev/null | od -An -tx1 | tr -d ' \n')" = "efbbbf" ]; then
    echo "FAIL bom: $f"
    status=1
  fi

  # nul (no allowlist) -- a text file must not contain NUL
  if [ -n "$(tr -dc '\0' < "$f" | tr '\0' 'X')" ]; then
    echo "FAIL nul: $f"
    status=1
  fi

  # crlf (allowlist)
  if [ -n "$(tr -dc '\r' < "$f" | tr '\r' 'X')" ]; then
    if ! is_allowed crlf "$f"; then
      echo "FAIL crlf: $f"
      status=1
    fi
  fi

  # emoji (allowlist); grep rc>1 = gate error -> FAIL (no silent skips)
  grep -qP "$emoji_re" "$f"
  rc=$?
  if [ "$rc" -gt 1 ]; then
    echo "gate error class emoji: grep failed on $f"
    status=1
  elif [ "$rc" -eq 0 ]; then
    if ! is_allowed emoji "$f"; then
      echo "FAIL emoji: $f"
      status=1
    fi
  fi

  # path (allowlist); grep rc>1 = gate error -> FAIL (no silent skips)
  grep -qP "$path_re" "$f"
  rc=$?
  if [ "$rc" -gt 1 ]; then
    echo "gate error class path: grep failed on $f"
    status=1
  elif [ "$rc" -eq 0 ]; then
    if ! is_allowed path "$f"; then
      echo "FAIL path: $f"
      status=1
    fi
  fi
done

if [ "$status" -ne 0 ]; then
  echo "check-codification: commit blocked (see FAIL lines above)." >&2
  echo "  Fix the file, or add a justified entry to githooks/codification.allow." >&2
fi

exit "$status"
