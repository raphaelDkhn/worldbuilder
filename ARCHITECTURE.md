# Architecture

Why `worldbuilder` is built this way.

## Structural inheritance from gstack

`worldbuilder` copies [gstack](https://github.com/garrytan/gstack)'s architectural DNA:

- Flat skill directories at the repo root — no `skills/` subfolder
- Each skill has one `SKILL.md` file with YAML frontmatter + phase-structured body
- A single ethos file (`WORLDBUILDER.md`) referenced by every skill's preamble
- Per-project state at `~/.worldbuilder/projects/<slug>/` as JSONL + dated markdown
- Anti-sycophancy rules enforced per-skill with explicit replacement patterns
- `HARD GATE:` declarations at the top of every workflow skill
- Per-project slugs computed from working directory via `bin/wb-slug`

## Thesis alignment

Every skill maps to a specific element of South Park Commons' -1 to 0 methodology:

| Skill | Thesis element |
|---|---|
| `/north-star` | Sanghvi's "Foundation" phase + napkin $1B market sizing |
| `/founder-fit` | The Three Proof Points framework — founder positioning dimension |
| `/squiggle` | The Squiggle itself — the messy, non-linear journey logged over time |
| `/idea-shotgun` | "Generate volume over quality" from the ideation methodology |
| `/adjacent-possible` | Raman's magnetic-field metaphor — adjacent possibilities from talent density |
| `/kill-darlings` | "Idea elimination" — deliberately discarding promising-but-not-great concepts |
| `/hypothesis` | Sanghvi's "Core Hypothesis" — the validation dividing line |
| `/demo` | Bottom-up artifacts — landing pages, painted doors, prototypes |
| `/memo` | Top-down memo — written argument to future self, externalizes muddled thinking |
| `/mom-test` | External signal collection via Rob Fitzpatrick's interview method |
| `/conviction` | "Conviction is not certainty" — the 5-year proud test |
| `/talent-density` | Raman's core claim: "no one builds something generational alone" |
| `/planting` | Minus-one mindset: planting vs harvesting, geometric learning curve |

## State layout

```
~/.worldbuilder/
├── config.yaml                  # global config (proactive, session count, skill_prefix)
├── builder-profile.jsonl        # global builder profile (tier, north star hash)
└── projects/<slug>/
    ├── squiggle.jsonl           # THE backbone — every entry from every skill
    ├── north-star.md            # current North Star (versioned via Supersedes: chain)
    ├── founder-fit.md           # why-you document
    ├── hypothesis.md            # current core hypothesis (versioned)
    ├── ideas.jsonl              # idea shotgun output
    ├── killed-ideas.jsonl       # darlings with documented kill reasons
    ├── napkin/<datetime>.md     # every $1B calculation ever run (auditable sizing history)
    ├── memos/<datetime>.md      # versioned memos (chained via Supersedes:)
    ├── demos/<name>/            # demo artifacts + engagement metrics
    ├── interviews.jsonl         # customer interview notes
    ├── people.jsonl             # talent-density graph with conversation dates
    ├── conviction.jsonl         # emotional trajectory log
    └── plantings/<date>.md      # weekly /planting retros
```

All files are append-only where possible. No database. Everything is human-readable markdown
or JSONL. The user can `cat` any file and understand what's in it.

## Project slug

A worldbuilder project lives in `~/.worldbuilder/projects/<slug>/`. The slug is computed
from the user's current working directory by `bin/wb-slug`, which means a single user can
run multiple concurrent worldbuilder projects from different directories without collisions.

If the user is not in a git repo, the slug is derived from the absolute path hash.

## Preamble injection

Every `SKILL.md` body opens with a `## Ethos` section that inlines a compressed version of
`WORLDBUILDER.md`'s seven principles + seven anti-sycophancy rules. At v0.1 this duplication
is accepted — skills are short enough that the preamble isn't painful. At v0.2+, if duplication
becomes a burden, a codegen step can resolve a `{{ETHOS}}` placeholder from `WORLDBUILDER.md`.

## Research-trap check

Rather than a standalone `/research-trap` skill, worldbuilder runs `bin/wb-last-action` at
the top of every skill's preamble. If the last external action (demo shipped, memo sent,
interview done) was more than three days ago, the preamble prints a hard warning:

> **You have not taken an external action in N days. You may be in the research trap.**
> **Before this skill proceeds, consider whether `/mom-test`, `/demo`, or `/memo` would
> serve you better right now.**

The warning does not block the skill at v0.1 — it surfaces avoidance. If the user ignores
it repeatedly, `/planting` will surface the pattern at the next retrospective.

## The squiggle as single source of truth

Every skill writes one JSONL entry to `squiggle.jsonl` via `bin/wb-squiggle-append` at the
end of its run. The entry captures:

```json
{"ts":"2026-04-10T14:30:00Z","skill":"north-star","type":"decision","key":"domain","value":"climate-fintech","insight":"expertise × passion intersects here","confidence":0.6}
```

`/planting`, `/conviction`, `/worldbuilder-retro`, and `/squiggle` itself all read this file.
Every other skill feeds it. This is the load-bearing design decision of the collection.

## Directory conventions

- Skill directories at the repo root are lowercase, hyphen-separated: `north-star/`, not
  `NorthStar/` or `north_star/`.
- Every skill directory contains exactly one file at v0.1: `SKILL.md`.
- Shell utilities live in `bin/` and are prefixed `wb-` (for worldbuilder) to avoid name
  collisions with gstack's `gstack-*` binaries. Both collections can live on PATH together.
- Docs live in `docs/`. Long-form skill deep-dives go there at v0.2+.
