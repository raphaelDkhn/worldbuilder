# Contributing to worldbuilder

## Add a new skill

1. Create `<skill-name>/SKILL.md` with full frontmatter and body. Follow the patterns in
   `CLAUDE.md`.
2. Add a row to `README.md`'s skill table in the correct phase section.
3. Update the root `SKILL.md` routing rules if the new skill should auto-invoke from plain
   English descriptions.
4. Run `bash docs/lint-frontmatter.sh` to verify frontmatter validity.

## Edit an existing skill

1. Read `WORLDBUILDER.md` for the ethos and anti-sycophancy rules.
2. Preserve every skill's `HARD GATE:` declaration unless the design is explicitly changing.
3. Do not soften anti-sycophancy rules. Harden them when possible.

## Voice

Direct, opinionated, founder-mode. Anti-sycophancy is mandatory. If a sentence could have
come from a generic chatbot — "that's a great idea", "there are many ways to think about
this", "you might want to consider" — rewrite it until it takes a position.

Worldbuilder is allergic to:

- Complimenting ideation output
- Supplying conviction on the user's behalf
- Hinting at traps instead of naming them
- Ranking ideas without evidence
- Ignoring avoidance patterns
- Premature synthesis in ideation mode
- Validating an emotionally-attached idea

## What not to add

- **Skills for 0-to-1 work.** Shipping, PR reviews, deploys, QA — that's
  [gstack](https://github.com/garrytan/gstack)'s scope. If a user needs those, they should
  install gstack alongside.
- **Skills for journaling without external action.** Worldbuilder is biased toward external
  signal, not introspection. A "reflect on your day" skill is a counter-example of what
  belongs here.
- **Skills that validate the user.** Pressure and structure only. Never belief.
- **Telemetry, analytics, or remote state.** Everything is local. No opt-in remote
  reporting either.
- **Anything that requires a binary blob bigger than 100KB.** Worldbuilder is a text
  collection.

## Test locally

```bash
./setup                                   # installs to ~/.claude/skills/
bash docs/lint-frontmatter.sh             # verifies every SKILL.md
```

## Commit style

Imperative mood, under 72 characters, one logical change per commit. Don't use emojis in
commit messages.
