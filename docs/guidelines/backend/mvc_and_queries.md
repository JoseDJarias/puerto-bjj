# Strict MVC & N+1 Prevention

## No Queries in Views
- Views/partials NEVER run queries, `.order`, `.where`, `.includes`, or `Model`/`Setting` lookups.
- Controllers resolve all collections into instance variables. Auth/config checks go into semantic helpers (e.g. `can_view_notes?`).
- Views only use in-memory methods (`.each`, `.size`, `.any?`).

## Eager Loading
- Any view iterating a collection: ALL accessed associations must be preloaded in the controller (`Model.includes(:a, b: [:c])`).
- Verify with `record.association(:name).loaded?` in `rails c`.

## In-Memory Methods on Loaded Associations
| Need | Use | Never |
|---|---|---|
| Existence | `any?` / `present?` | `exists?` |
| Count | `size` / `length` | `count` |
| Sum | `sum(&:col)` | `sum(:col)` |
| First/max | `first`, `max_by(&:x)` | `order(...).first` |
| Filter | `select(&:x?)` | `where(...)` |

## `.size` Has 3 States
1. **Counter cache column exists:** reads the attribute, 0 queries.
2. **Association loaded:** `Array#size`, 0 queries.
3. **Not loaded, no cache:** `SELECT COUNT(*)`, so N+1 inside loops.

## Space vs Time
- `.to_a.size` ONLY when the records will be rendered right after (1 query).
- `counter_cache` when you need only the count (never load thousands of rows for a number).

## In-Memory Multi-Level Sorting
- For eager-loaded operational collections (20–100 items), sort in Ruby: `scope.to_a.sort_by { |i| [i.ts, priority, i.id] }`.
- Avoid heavy SQL `CASE WHEN`/JOIN sorting. It slows SQLite, complicates query assertions, and breaks pagination.

## Tooling
- `Bullet` runs in test and fails on N+1.
- `ruby script/eager_loading_audit.rb` audits views (if present).
