# AGENTS.md — MUST-READ INSTRUCTIONS FOR ALL AGENTS

These rules are non-negotiable. If you violate them, your change is wrong even if it “works.”

This repo values **hard invariants**, **loud failures**, and **fixing upstream causes**.
We do not accept “best-effort” behavior that hides missing or invalid data.

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

## 2) DO NOT LITTER THE CODE WITH TRY/EXCEPT. (highest priority)
Default policy: crash loudly. If something goes wrong, the code should crash.

### Forbidden
- `try/except Exception:` / broad catches
- catching errors and continuing
- swallowing errors, returning empty values, or logging-and-moving-on
- “defensive” wrappers “just in case”

### Required
- Let exceptions propagate.
- Prefer invariant fixes + boundary validation over local exception handling.

### If you think an exception must be handled
**STOP and ask Larry first.**
(Yes, even if you only want to “add context.”)

---

## 3) Fix root causes, not symptoms
If you find a bug, do not bandaid it in the nearest function that notices it.

Trace it to where the bad input / invalid state is created (API boundary, parsing, DB read/write,
config load, upstream caller) and fix it there.

Heuristic: **producers enforce invariants; consumers assume them**.

---

## 4) Less is more
Write the least amount of code that achieves the goal (while prioritizing readability).
Avoid verbose comments that restate obvious code.

---

## 5) Assume the current code is wrong
Do not optimize for preserving legacy behavior unless explicitly required.
Breaking old behavior can be fine if the new behavior is correct.

---

## 6) Always simplify
Refactor to reduce complexity and delete bloat.
Prefer reusable, obvious pieces.
Zero tolerance for unnecessary abstractions.

---

## 7) Don’t tell Larry to run code
That is your job. Validate the change by executing the relevant paths.

Before you submit:
- run the relevant tests
- run linters/formatters if the repo uses them
- exercise the changed code path at least once

Include what you ran + the outcome in your summary/PR description.

## 8) Pushing and Pulling Changes

To push / pull from github, prefer remote `github` if configured, otherwise fall back to `origin`.

---

## 9) Clarifying Questions: high-value only, 1-5 max
Do not ask questions just to ask questions.

Default behavior: read the code and instructions, then figure things out and execute.

Ask questions only when they materially reduce the risk of implementing the wrong thing.
If questions are needed, ask **1 to 5** high-value questions in a single batch.

Once those answers are provided, continue to completion autonomously without pausing for
additional clarifications, permissions, or confirmations.

---

## 10) `engineeringlog.md` is opt-in only
Do **not** create or update `engineeringlog.md` by default.

Only write to `engineeringlog.md` when Larry explicitly asks for it (for example:
"keep a journal" or "maintain engineeringlog.md").

When logging is explicitly requested, every entry must include:
- local timestamp (with timezone)
- what you just did
- what your next step is
- blockers (or `None`)

---

## 11) Use full relative file paths in all file mentions
When you mention a file, use the full path relative to the repository root.

### Required
- Good: `nvim/lua/user/options.lua`
- Good: `vim/after/ftplugin/python.vim`

### Forbidden
- Bare filename only: `options.lua`
- Link text that only shows a bare filename

---

# READ THIS AGAIN: RULES (1) AND (2) OVERRULE EVERYTHING
If you think you need a fallback or a try/except to succeed, STOP and ask Larry first.
He will almost certainly say no, but you must ask before doing it anyway.
