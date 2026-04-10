#!/usr/bin/env bash
# lint-frontmatter.sh — verify every SKILL.md has the required frontmatter structure.
#
# Checks, for each SKILL.md in the worldbuilder repo:
#   • Has YAML frontmatter block (---...---)
#   • Frontmatter contains `name:`
#   • Frontmatter contains `description:`
#   • Frontmatter contains `version:`
#   • Frontmatter contains `allowed-tools:`
#   • Description contains "Use when asked to"
#   • Description contains "Proactively invoke"
#   • Description ends with "(worldbuilder)"
#   • Body contains a HARD GATE declaration
#   • Body contains the completion-status taxonomy line
#
# Usage: bash docs/lint-frontmatter.sh
# Exit 0 if all pass, non-zero if any fail.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SKILLS=(
    SKILL.md
    north-star/SKILL.md
    founder-fit/SKILL.md
    squiggle/SKILL.md
    idea-shotgun/SKILL.md
    adjacent-possible/SKILL.md
    kill-darlings/SKILL.md
    hypothesis/SKILL.md
    demo/SKILL.md
    memo/SKILL.md
    mom-test/SKILL.md
    conviction/SKILL.md
    talent-density/SKILL.md
    planting/SKILL.md
)

FAIL=0
TOTAL=0

check() {
    local file="$1"
    local rel="${file#$REPO_DIR/}"
    local ok=1

    if [ ! -f "$file" ]; then
        printf '  MISSING  %s\n' "$rel"
        return 1
    fi

    # Frontmatter block starts with --- on line 1
    if ! head -1 "$file" | grep -q '^---$'; then
        printf '  NO_FM    %s — file does not start with ---\n' "$rel"
        return 1
    fi

    # Extract frontmatter (lines between first --- and second ---)
    local fm
    fm="$(awk '/^---$/{c++; next} c==1' "$file")"

    for field in name description version allowed-tools; do
        if ! printf '%s\n' "$fm" | grep -qE "^${field}:"; then
            printf '  NO_%s  %s — missing %s field\n' "$(printf '%s' "$field" | tr '[:lower:]' '[:upper:]' | tr - _)" "$rel" "$field"
            ok=0
        fi
    done

    if ! printf '%s\n' "$fm" | grep -q 'Use when asked to'; then
        printf '  NO_TRIG  %s — description missing "Use when asked to"\n' "$rel"
        ok=0
    fi

    if ! printf '%s\n' "$fm" | grep -q 'Proactively invoke'; then
        printf '  NO_PROA  %s — description missing "Proactively invoke"\n' "$rel"
        ok=0
    fi

    if ! printf '%s\n' "$fm" | grep -q '(worldbuilder)'; then
        printf '  NO_MARK  %s — description missing "(worldbuilder)" marker\n' "$rel"
        ok=0
    fi

    # Body checks
    if ! grep -q 'HARD GATE' "$file"; then
        printf '  NO_GATE  %s — no HARD GATE declaration in body\n' "$rel"
        ok=0
    fi

    if ! grep -q 'DONE | DONE_WITH_CONCERNS' "$file"; then
        printf '  NO_STAT  %s — missing completion-status taxonomy\n' "$rel"
        ok=0
    fi

    if [ "$ok" -eq 1 ]; then
        printf '  OK       %s\n' "$rel"
        return 0
    else
        return 1
    fi
}

printf 'worldbuilder frontmatter lint\n'
printf '==============================\n\n'

for skill in "${SKILLS[@]}"; do
    TOTAL=$((TOTAL + 1))
    if ! check "$REPO_DIR/$skill"; then
        FAIL=$((FAIL + 1))
    fi
done

printf '\n'
printf 'summary: %d/%d skills passed\n' "$((TOTAL - FAIL))" "$TOTAL"

if [ "$FAIL" -gt 0 ]; then
    exit 1
fi
