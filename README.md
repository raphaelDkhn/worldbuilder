# worldbuilder

**Skills for finding your founder-market fit**

You are in the Squiggle. You've left (or want to leave) your job. You don't know what to build yet. You're reading, journaling, talking to friends, getting nowhere fast. The question isn't *"how do I ship this"* — it's *"what do I want to spend the next five to ten years of my life on?"*

`worldbuilder` is a collection of Skills that operationalize South Park Commons' [-1 to 0 thesis](https://blog.southparkcommons.com/p/what-is-negative-1-to-0).
Inspired structurally by Garry Tan's [gstack](https://github.com/garrytan/gstack), but oriented around the pre-founder phase instead of the shipping phase.

Every skill pushes you toward the things -1 to 0 founders avoid: **shipping artifacts into the world, talking to external humans, and killing your favorite ideas.**

> *Disclaimer: I'm not part of South Park Commons — just a random builder who found the -1 to 0 thesis compelling enough to apply it to my own squiggle.*


## Install

```bash
git clone https://github.com/raphaelDkhn/worldbuilder.git ~/worldbuilder
cd ~/worldbuilder && ./setup
```

`./setup` symlinks each skill into `~/.claude/skills/` and bootstraps your state directory
at `~/.worldbuilder/`. Open Claude Code in any project and type `/worldbuilder` to get
started. Or describe your situation in plain English — worldbuilder routes automatically.

## The Skills

### Foundation — where do you start?

| Slash command | What it does |
|---|---|
| `/worldbuilder` | Diagnosis-first entry point. *"Where are you stuck?"* Routes to the right skill. |
| `/north-star` | Find your guiding domain. Expertise × passion. Runs napkin $1B math as a **HARD GATE** — you cannot proceed to ideation until you pass it. |
| `/founder-fit` | *"Why YOU."* Interviews you on lived experience, obsessions, unfair advantages. Produces a Three Proof Points document. Rejects credentials-only positioning. |
| `/squiggle` | The state backbone. Append-only JSONL journal of your messy path. Every other skill reads and writes here. |

### Ideation — generate wide, kill hard

| Slash command | What it does |
|---|---|
| `/idea-shotgun` | Force-generate 50+ ideas in one sitting. Volume over quality. Refuses to cluster or rank during generation. |
| `/adjacent-possible` | Explore nearby spaces. Raman's magnetic-field metaphor — ideas a curious peer would surface. |
| `/kill-darlings` | Structured destruction. Prosecutes each surviving idea: *"why is this NOT a $1B company?"* No defense allowed. |

### Worldbuilding loop — bottom-up AND top-down

| Slash command | What it does |
|---|---|
| `/hypothesis` | Articulate one testable core hypothesis. The gatekeeper. `/demo`, `/memo`, and `/mom-test` refuse to proceed without a live `hypothesis.md`. |
| `/demo` | Plan bottom-up artifacts: landing pages, painted-door tests, prototypes, copy. Not code — for code, use [gstack](https://github.com/garrytan/gstack). |
| `/memo` | Draft top-down artifacts: memo to your future self, TAM analysis, failed-founder research, market-share math. |
| `/mom-test` | Customer interviews using Rob Fitzpatrick's Mom Test method. Generates and bias-checks your questions. The only skill that pushes you out the door. |

### Conviction & community

| Slash command | What it does |
|---|---|
| `/conviction` | Track your emotional trajectory. The *"5-year proud"* checkpoint. Never answers *"is this a good bet?"* — reflects it back. |
| `/talent-density` | Who to talk to. Curious peers beat credentialed experts. Every outreach ask is concrete enough to send same-day. |
| `/planting` | Weekly retrospective. Minus-one mindset check. Are you planting or harvesting? Is your learning curve geometric? |

## Philosophy

Read [`WORLDBUILDER.md`](./WORLDBUILDER.md) — the seven principles and seven anti-sycophancy
rules injected into every skill. The short version:

1. Founder-market fit before product-market fit
2. Worldbuilding = bottom-up + top-down, simultaneously
3. Volume in ideation, rigor in validation
4. Conviction is built, not discovered — Claude never supplies it
5. External signal beats internal clarity — interviews > papers, demos > decks
6. Novice is a feature — beginner's mind is the default posture
7. Kill local maxima — plant, don't harvest

## State

All state lives in `~/.worldbuilder/projects/<slug>/`. Append-only JSONL + dated markdown.
Nothing remote. Nothing proprietary. Human-readable.

```
~/.worldbuilder/projects/<slug>/
├── squiggle.jsonl           # THE backbone — every entry across every skill
├── north-star.md
├── founder-fit.md
├── hypothesis.md
├── ideas.jsonl
├── killed-ideas.jsonl
├── memos/<datetime>.md
├── demos/<name>/
├── interviews.jsonl
├── people.jsonl
├── conviction.jsonl
└── plantings/<date>.md
```

## Credit

- South Park Commons' [-1 to 0 writings](https://blog.southparkcommons.com/) for the thesis.
- Garry Tan's [gstack](https://github.com/garrytan/gstack) for the skill collection architecture.
- Rob Fitzpatrick's [The Mom Test](http://momtestbook.com/) for the interview method.
- Peter Thiel's *Zero to One* for the counter-framing that made *-1 to 0* legible as a phase.

## License

MIT.
