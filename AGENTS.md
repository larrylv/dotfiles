# AGENTS.md — MUST-READ INSTRUCTIONS FOR ALL AGENTS

These rules are non-negotiable. If you violate them, your change is wrong even if it "works".

This repo values **hard invariants**, **loud failures**, and **fixing upstream causes**.
We do not accept "best-effort" behavior that hides missing or invalid data.

---

## Subagents

Proactively look for independent work to delegate, whether you are the root agent or a subagent. Delegate without waiting for a separate request when it reduces completion time or materially improves depth or quality. Respect Larry's task-specific limits. Handle small or tightly coupled work directly, and treat the concurrency limit as a ceiling, not a target.

- Give each agent a bounded assignment with an objective, relevant context, expected output, validation requirements, and clear ownership. Subagents may write code within their assigned scope. Allow only one writer per file at a time, including the root agent.
- Split research, implementation, validation, or monitoring by independent deliverable, question, or source. Delegate recursively only when there is a concrete benefit.
- Keep broad problem framing, ambiguous decisions, integration, final synthesis, and user communication with the root agent. Continue useful, non-overlapping work while subagents run. Review and validate their contributions before accepting them.
- Use a limited or isolated context fork when a self-contained assignment is sufficient; preserve full history when the work requires it.
- Inherit the parent model and reasoning effort unless Larry or applicable instructions explicitly request an override. Select only models and options exposed by the available tools.
- Subagents must send useful findings and blockers to the root agent promptly. Immediately after any write operation, use `send_message` to report what changed, including affected files or external state. Finish with the result, supporting evidence, validation performed, and unresolved issues.
- Reuse agents with useful context via `followup_task`. Close finished agents that have no useful follow-up work when the available tools support closing them.

---

## Deliberating on system, architecture, or performance related work

When working with the user on tasks that involve investigating on distributed systems, existing infrastructure, especially around correctness, performance, and migrations, structure your communication to be linear and present it to the user in a way that they can track your thought process and augment their own understanding of the systems. If you are working on a goal that requires such deliberation, actively confirm your thought process with the user and seek their input on the right way to move forward, even if it means stalling on the goal in order to do so. The priority on such problems must be correctness and alignment with the user over the singular focus on achieving the goal at all costs.

Do not stall on the goal or prevent progress on decisions that are obvious, or if your work with the user indicates that they have an understanding of the problem already and that they consider the decisions straightforward. Similarly, if the decision itself is straightforward and does not have performance, scaling, or correctness consequences, do not stall yourself just to seek confirmation. Use judgement based on memory, where available.

When writing code on initiatives in this area, do not add code for or write tests for theoretical edge cases and possible constraints that you have seen unless such constraints are already observed and are evidence-backed. This is not to say that you should not be thorough about correctness and performance considerations: this is where collaboration with the user to test things actively comes in. Defensive code and unit tests alone cannot cover al these areas, and in many cases, it can make the code harder to understand and as a result, CI more flaky and less performant. Where actual benchmarking and correctness data is needed, prefer getting that data from real world systems, and only offer alternatives to the user if they indicate such data is unavailable to them.

---

## 0) `.envrc` is manually maintained

- Larry maintains `.envrc` manually. Do not modify it.
- Delete `.envrc` only as part of an authorized deletion of its containing repository.
- Never run `monorepo_worktree_setup.sh`; it modifies `.envrc`.

---

## 1) NO DEFAULT FALLBACKS. EVER. (highest priority)
Any silent “best-effort” behavior that substitutes or fabricates values is forbidden.

### Forbidden (examples)
- `value = d.get("key", "default")`
- `value = d.get("key") or "default"`
- `d.setdefault("key", ...)`
- `getattr(x, "attr", default)`
- `os.getenv("NAME", "default")`
- treating missing as empty: `missing -> "" / [] / {} / 0`
- parsing that “skips what it can’t understand” and continues

### Do this instead
- Use strict access and let it fail:
  - `value = d["key"]`
- If the key/field can be missing, **fix the source/producer** so it is never missing.
- If input can be invalid, **validate at the boundary** and raise a real error (do not substitute).

### If you think a default is legitimate
Defaults are allowed **only** when the product/spec explicitly defines them.
If you believe that applies: **STOP and ask Larry first.**

---

## 2) Fix root causes, not symptoms
If you find a bug, do not bandaid it in the nearest function that notices it.

Trace it to where the bad input / invalid state is created (API boundary, parsing, DB read/write,
config load, upstream caller) and fix it there.

Heuristic: **producers enforce invariants; consumers assume them**.

---

## 3) Less is more
Write the least amount of code that achieves the goal (while prioritizing readability).
Avoid verbose comments that restate obvious code.

---

## 4) Assume the current code is wrong
Do not optimize for preserving legacy behavior unless explicitly required.
Breaking old behavior can be fine if the new behavior is correct.

---

## 5) Always simplify
Refactor to reduce complexity and delete bloat.
Prefer reusable, obvious pieces.
Zero tolerance for unnecessary abstractions.

---

## 6) Don’t tell Larry to run code
That is your job. Validate the change by executing the relevant paths.

---

## 7) Pushing and Pulling Changes

To push / pull from github, prefer remote `github` if configured, otherwise fall back to `origin`.

---

## 8) Clarifying Questions: high-value only, 1-5 max
Do not ask questions just to ask questions.

Default behavior: read the code and instructions, then figure things out and execute.

Ask questions only when they materially reduce the risk of implementing the wrong thing.
If questions are needed, ask **1 to 5** high-value questions in a single batch.

Once those answers are provided, continue to completion autonomously without pausing for
additional clarifications, permissions, or confirmations.

---

## 9) `engineeringlog.md` is opt-in only
Do **not** create or update `engineeringlog.md` by default.

Only write to `engineeringlog.md` when Larry explicitly asks for it (for example:
"keep a journal" or "maintain engineeringlog.md").

When logging is explicitly requested, every entry must include:
- local timestamp (with timezone)
- what you just did
- what your next step is
- blockers (or `None`)

---

## 10) Use full relative file paths in all file mentions
When you mention a file, use the full path relative to the repository root.

### Required
- Good: `nvim/lua/user/options.lua`
- Good: `vim/after/ftplugin/python.vim`

### Forbidden
- Bare filename only: `options.lua`
- Link text that only shows a bare filename

