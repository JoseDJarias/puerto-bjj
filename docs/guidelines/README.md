# Project Guidelines (Index)

Modular rules for humans and AI agents. Read only the folders relevant to the task.

| Folder | Scope | Read when |
|---|---|---|
| [`00_principles/`](00_principles) | Architectural rigor, phased workflow | Always |
| [`backend/`](backend) | MVC, N+1, SQLite multi-DB, enums, auth, i18n, time | Models, controllers, migrations |
| [`frontend/`](frontend) | Typography, layout, icons, views, Hotwire, UX/touch | Views, CSS, Stimulus |
| [`testing/`](testing) | Minitest standards, query assertions | Any new code |
| [`domain_reference/`](domain_reference) | Patterns from other apps (finance, audit) | Only if the feature exists here |

## Stack Baseline (Rails 8 Way)
- Rails 8, Propshaft, importmap (no Node build), Stimulus/Turbo.
- SQLite in all environments, Solid Cache/Queue/Cable.
- Deploy with Kamal to Hetzner. Simple bash over cloud complexity.
- Styling: Tailwind (redesign target). CSS-Zero only for very specific pieces.
