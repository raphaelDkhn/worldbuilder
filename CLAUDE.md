# Instructions for Claude when editing this repo

You are working on `worldbuilder` — a collection of Claude Code skills for the -1 to 0
(pre-founder / worldbuilding) phase.

## Rules

1. **Read `WORLDBUILDER.md` first.** Every skill must follow the seven principles and seven
   anti-sycophancy rules. If a skill contradicts one, the skill is wrong.

2. **Every `SKILL.md` must contain:**
   - YAML frontmatter with `name`, `description`, `version`, `allowed-tools`
   - A `description` containing both a `Use when asked to "X", "Y", "Z"` line AND a
     `Proactively invoke this skill` line
   - A `HARD GATE:` declaration near the top of the body
   - An "Important Rules" section referencing the WORLDBUILDER.md anti-sycophancy rules
   - A completion-status taxonomy line: `DONE / DONE_WITH_CONCERNS / NEEDS_CONTEXT / BLOCKED`
   - A trailing `(worldbuilder)` marker inside the description block

3. **Do not soften HARD GATEs.** They are the skill's contract. If you think a HARD GATE is
   wrong, redesign the skill; do not weaken the gate.

4. **Do not import gstack code or conventions at runtime.** Worldbuilder is inspired by
   gstack structurally but has no runtime dependency on it. Do not reference `~/.gstack`,
   do not call `gstack-*` binaries, do not import `ETHOS.md`. The two collections run
   side-by-side.

5. **State lives in `~/.worldbuilder/`.** Never write state outside that directory or the
   user's current project directory. Per-project state is at
   `~/.worldbuilder/projects/<slug>/` where the slug is computed by `bin/wb-slug`.

6. **The seven anti-sycophancy rules are stricter than gstack's.** Never say "great idea",
   never supply conviction, name traps by name, refuse to rank ideas absent evidence,
   surface avoidance, no premature synthesis, never validate attachment.

7. **Do not create speculative files.** No scaffolding for features not in the plan. No
   new top-level docs beyond README / WORLDBUILDER / ARCHITECTURE / CONTRIBUTING / CLAUDE /
   VERSION. No emojis unless explicitly requested by the user.

## Workflow — adding a new skill

1. Create `<skill-name>/SKILL.md` with full frontmatter and body.
2. Add a row to `README.md`'s skill table in the correct phase section.
3. If the new skill should auto-invoke from plain English, update the root `SKILL.md`
   routing rules and append to the project `CLAUDE.md` routing section.
4. Run `bash docs/lint-frontmatter.sh` (if present) to verify.

## Workflow — editing an existing skill

1. Preserve the HARD GATE.
2. Preserve the anti-sycophancy rules reference.
3. Update `VERSION` if the schema changes in a way that affects install.

## Voice

Direct, opinionated, founder-mode. Anti-sycophancy is mandatory. If a sentence could have
come from a generic chatbot ("That's a great approach!" / "There are many ways to think
about this..."), rewrite it.

## What not to add

- Skills for 0-to-1 work (shipping, PR reviews, deploys). That's gstack's scope.
- Skills for journaling without external action. Worldbuilder biases toward external signal.
- Skills that validate the user. Pressure and structure only.
- Telemetry, analytics, or remote state. Everything is local.
