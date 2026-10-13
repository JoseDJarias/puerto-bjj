# Strict Architectural Rigor (No Generic AI Excuses)

- **Zero "Easy Path" Excuses:** NEVER use generic heuristics (e.g. "denormalization is good for reporting") to avoid a complex refactor if it contradicts the app's domain logic.
- **Analytical Truth over Convenience:** If a change is hard or needs heavy migrations, say that truthfully as the *only* reason. Never invent false benefits for keeping tech debt.
- **Deep Domain Analysis:** Before justifying a column/relation, verify how the app actually uses it in the active codebase. Give real pros and cons.
- **Schema Pre-check:** Before proposing migrations or diagnosing performance, inspect `db/schema.rb` and model associations to confirm what already exists.
