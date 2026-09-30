---
name: pr
description: Interactively draft and create a pull request with a guided multi-step flow, supporting both minimal and full descriptions
compatibility: opencode
---

## What I do

- Guide the user through writing a PR title and description interactively
- Support a **Minimal** path (auto-generated from diff, no questions) and a **Default** path (full description with Context, Changes, Test Plan sections)
- Ask targeted questions about the change purpose, highlights, callouts, references, and test plan
- Draft a polished PR description using a consistent template
- Create the PR via `gh pr create` once the user approves the draft

## When to use me

Use this skill whenever you are preparing to open a pull request. It works best when you have commits on a branch diverged from the base branch.

---

## Instructions

### Setup: gather context

Before asking any questions, collect:

- Current branch: run `git branch --show-current`
- Base branch: detect dynamically — run `gh pr view --json baseRefName --jq '.baseRefName' 2>/dev/null || git remote show origin 2>/dev/null | grep 'HEAD branch' | awk '{print $NF}' || echo "main"`.
  Use the result as `BASE_BRANCH` for all subsequent git commands. If detection fails, fall back to `main`.
- Git status: run `git status --short`
- Recent commits on this branch (vs base): run `git log BASE_BRANCH..HEAD --oneline`
- Diff summary (files changed): run `git diff BASE_BRANCH --stat`
- Full diff: run `git diff BASE_BRANCH`

**Guard: empty commit range**

If `git log BASE_BRANCH..HEAD --oneline` returns no output, warn the user:

> There are no commits on this branch ahead of `BASE_BRANCH`. Make sure you have committed your changes and are on the correct branch before creating a PR.

Stop and do not proceed until the user confirms they want to continue anyway.

---

### Step 0: Choose PR style

Use AskUserQuestion:

- header: "PR style"
- question: "What kind of PR description do you want?"
- options:
  - Minimal (auto-generated from the diff, no questions asked)
  - Default (full description with Context, Changes, Test Plan sections)

**If the user chooses Minimal**, skip directly to the Minimal path below and do NOT run Steps 1–4.

---

#### Conventional commits title format

All PR titles — in both the Minimal and Default paths — **must** follow the Conventional Commits format:

```
<type>[optional scope]: <short description>
```

- Total length: ≤72 characters (including the type prefix)
- `<short description>`: lowercase, imperative mood, no trailing period
- `[optional scope]`: a noun in parentheses describing the section of the codebase, e.g. `feat(auth):` or `fix(api):`

**Type reference — pick the most specific match:**

| Type       | When to use                                                                         |
| ---------- | ----------------------------------------------------------------------------------- |
| `feat`     | A new feature or capability visible to users or consumers                           |
| `fix`      | A bug fix                                                                           |
| `refactor` | Code restructuring with no behaviour change and no bug fix                          |
| `perf`     | A change that improves performance                                                  |
| `test`     | Adding or updating tests only                                                       |
| `build`    | Changes to build system, scripts, CI config, or dependencies                        |
| `chore`    | Maintenance tasks that don't fit other types (e.g. version bumps, lockfile updates) |
| `docs`     | Documentation only                                                                  |
| `style`    | Formatting, whitespace — no logic change                                            |
| `revert`   | Reverts a previous commit                                                           |

Append `!` after the type/scope (e.g. `feat!:` or `feat(api)!:`) for breaking changes.

**Type auto-detection heuristics (apply before asking the user):**

Infer the type silently when one of these conditions is unambiguously true:

- All changed files are `*.test.ts`, `*.spec.ts`, `__tests__/**`, or similar test-only paths → `test`
- All changed files are `*.md`, `*.mdx`, or documentation-only directories → `docs`
- All changed files are formatting/whitespace only (no logic diff) → `style`
- Diff only touches version fields or lock files → `chore`
- Diff only modifies build config, CI YAML, or dependency manifests → `build`

Only ask the user when none of the above heuristics apply and the correct type is genuinely ambiguous. When asking, use AskUserQuestion:

- header: "Commit type"
- question: "Which conventional commit type best describes this change?"
- options: the most plausible 2–4 types from the table above, based on the diff (do not list all types every time)

---

#### Minimal path

Analyse the diff and commits. Then, using your own judgement:

- Write a concise imperative PR title (≤72 chars) following the Conventional Commits format described above, derived from the diff and branch name
- Optionally write a short plain-text body (one or two sentences, no headings, no bullet points, no markdown sections) — only if the title alone is not self-explanatory. If the title is sufficient, omit the body entirely.

Show the draft to the user:

```
Title: <title>

<body, or "(no body)" if omitted>
```

Then use AskUserQuestion:

- header: "Next step"
- question: "How does the draft look? Select an action or type a correction directly."
- options:
  - Create PR (looks good)
  - Create as draft PR
  - Cancel

If the user types a correction instead of selecting an option: apply the correction, show the full updated draft, and repeat this confirmation step.

If the user selects "Cancel": stop.

If the user selects "Create PR" or "Create as draft PR":

1. Push the branch if it has no upstream: run `git push -u origin HEAD`
2. Run `gh pr create --title "<title>" --base BASE_BRANCH` (add `--body "<body>"` if there is a body; add `--draft` if draft was selected)
3. Report the PR URL.

---

### Step 1: Ideate together

Analyse the diff and commits to form an initial understanding of the change.

**Question 1 - Change summary (conditional):**

- If the diff is small and the purpose is obvious from the code and commit messages alone, skip this question and infer the change summary yourself. Note your inference clearly before proceeding.
- Otherwise use AskUserQuestion:
  - header: "Change"
  - question: "In your own words, what is the main purpose of this PR? (Helps me write an accurate description rather than just inferring from the diff)"
  - options: [] (free-text — user types their answer)

**Question 2 - Optional sections (batched):**

Use a single AskUserQuestion with `multiple: true` to ask what the user wants to include:

- header: "Optional sections"
- question: "Which of these would you like to include in the PR description? (Select all that apply, or none)"
- multiple: true
- options:
  - TL;DR one-liner (generate one for me)
  - Highlights (I'll describe key implementation details)
  - Callout (I'll flag a gotcha, limitation, or risky area)
  - References (I'll share links to docs or discussions)

**Question 3 - Test plan:**

- header: "Test plan"
- question: "How was this change tested?"
- options:
  - Unit tests only
  - Unit + integration tests
  - Manual testing
  - No tests needed (explain why)
  - Other (I'll describe)

Ask these questions (Q1 if applicable, Q2, Q3). Wait for all answers before proceeding.

### Step 2: Follow-up questions (if needed)

If the user selected any combination of Highlights, Callout, and/or References in Q2, batch all the follow-up questions into a **single** AskUserQuestion call rather than asking them one at a time:

- header: "Details"
- question: list each required detail on its own line, e.g.:
  - "**Highlights:** Describe the key implementation details."
  - "**Callout:** What should reviewers not miss?"
  - "**References:** Share the links."
  Only include lines for the options the user actually selected.
- options: [] (free-text — user types all answers together)

Additional notes:
- TL;DR: if selected, generate a concise one-liner yourself based on the diff and the user's change summary — no follow-up question needed.
- References: render them as a bolded **References:** subsection with bullet markdown links inside the Context section. Infer the app name from the URL (e.g. notion.so → Notion, slack.com → Slack, github.com → GitHub) and append it in parentheses to the label, e.g. `[RFC: Some Title (Notion)](url)`.
- If the test plan answer was vague: use AskUserQuestion to ask for more detail with options: [] (free-text, empty options array)

### Step 3: Draft the PR description

Using all the context gathered, write a PR description using this exact template.

**Prose formatting rule:** Write all prose as flowing, unbroken text. Never insert a hard line break (`\n`) in the middle of a sentence or paragraph — each paragraph should be a single continuous line. Hard line breaks are only appropriate between distinct paragraphs, list items, or structural elements.

---

**[PR title — must follow Conventional Commits format: `<type>[optional scope]: <short description>`. Infer type from the diff using the heuristics and type reference above; ask the user only if genuinely ambiguous. Lowercase imperative description, no trailing period, ≤72 characters total. This becomes the squash commit message.]**

---

**TL;DR:** [1-liner if selected, otherwise omit this line entirely]


## Context

[Why this change is being made. What problem does it solve, what need does it address, or what decision drove it. 2-4 sentences.]

<!-- REFERENCES — include the block below only if the user provided references; omit entirely otherwise -->
**References:**

- [label 1 (AppName)](url)

- [label 2 (AppName)](url) — add or remove as needed
<!-- END REFERENCES -->


## Changes

[Key decisions made and notable code details a reviewer should be aware of while reading the diff. Focus on the non-obvious: trade-offs chosen, patterns used, and anything that warrants explanation beyond what the code itself shows.]

- [Highlight 1]

- [Highlight 2]

- [Highlight 3 — add or remove bullets as needed, minimum 1]


[CALLOUTS — apply zero or more GitHub callouts here, based on two sources:

1. If the user described a noteworthy callout in Step 2, include it.
2. Independently, if you spotted anything in the diff that warrants a callout (a gotcha, a known limitation, a non-obvious risk, a cast or workaround that needs explanation), add one. Use the right type for the tone: > [!NOTE] for added context, > [!IMPORTANT] for something reviewers must not miss, > [!WARNING] for a risk or gotcha. Do not add callouts to the TL;DR or Test Plan sections. Omit entirely if nothing warrants one.]


## Test Plan

[Describe the testing approach. Detail proportional to risk level.]

---

Present the full draft to the user clearly.

### Step 4: Iterate or proceed

Use AskUserQuestion:

- header: "Next step"
- question: "How does the draft look? Select an action or type specific changes you want made."
- options:
  - Create PR (looks good)
  - Create as draft PR
  - Cancel

If the user types specific changes instead of selecting an option: apply them precisely, show the full updated draft, then repeat Step 4. When asking for refinements, prompt with: "What would you like to change? For example: the title wording, a specific section, the tone, or anything else."

If the user selects "Cancel": stop here.

### Step 5: Create the PR

If the user approved the draft:

1. Push the branch if it has no upstream: run `git push -u origin HEAD`
2. Run:

```
gh pr create --title "[title from draft]" --body "[full body from draft]" --base BASE_BRANCH
```

Add `--draft` if the user selected "Create as draft PR".

Report the PR URL once created.
