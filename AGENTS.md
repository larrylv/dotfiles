# AGENTS.md — MUST-READ INSTRUCTIONS FOR ALL AGENTS

These rules are non-negotiable. If you violate them, your change is wrong even if it “works.”

---

## 1) NO DEFAULT FALLBACKS. EVER.
Any silent “best-effort” behavior that hides missing or invalid data is forbidden.

Forbidden examples:

- `value = d.get("key", "default")`
- `value = d.get("key") or "default"`
- any pattern that substitutes a value when data is missing

Do this instead:

- `value = d["key"]`

If the key can be missing, fix the source so it is never missing. Do not hide the bug downstream.

---

## 2) DO NOT LITTER THE CODE WITH TRY/EXCEPT.
Default policy: crash loudly. If something goes wrong, the code should crash.

Forbidden patterns:

- `try/except Exception:` “just in case”
- catching errors and continuing
- swallowing errors, returning empty values, or logging-and-moving-on

If you truly believe an exception must be handled, you MUST ask me first.

---

## 3) Fix root causes, not symptoms
If something is crashing in a function, do not bandaid it in that function. Trace it to the origin and fix it where the invariant is created.

---

## 4) Less is more
Write the least amount of code that achieves the goal (while prioritizing readability). Avoid verbose comments that restate obvious code.

---

## 5) Assume the current code is wrong
Do not optimize for preserving legacy behavior unless explicitly required. Breaking old behavior can be fine if the new behavior is correct.

---

## 6) Always simplify
Refactor to reduce complexity and delete bloat. Prefer reusable, obvious pieces. Zero tolerance for unnecessary abstractions.

---

## 7) Don’t tell me to run code
That is your job. Run tests/linters/builds yourself. Validate the change by executing the relevant paths.

---

# READ THIS AGAIN: RULES (1) AND (2) OVERRULE EVERYTHING
They are more important than completing the task.

If you think you need a fallback or a try/except to succeed, STOP and ask me first.
I will almost certainly say no, but you must ask before doing it anyway.
