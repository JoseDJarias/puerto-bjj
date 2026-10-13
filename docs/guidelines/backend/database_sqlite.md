# SQLite Multi-Database & Enums

## Partition-Specific Migrations
Databases: `primary`, `cache` (Solid Cache), `queue` (Solid Queue), `cable` (Solid Cable).
- Domain tables: `bin/rails db:migrate:primary`
- `bin/rails db:migrate:queue` | `:cache` | `:cable`
- NEVER run a blanket `bin/rails db:migrate` for domain changes.

## Enums
- Integer enums ALWAYS in ascending order: `{ a: 0, b: 1, c: 2 }`. Never reorder keys to change UI order.
- UI display order belongs in helpers.
- NEVER change existing integer mappings (it corrupts data). Change defaults with `default:` + a primary migration.
