# Layout & Viewport

## Modular Layout
- `app/views/layouts/application.html.erb` stays declarative. Navigation/alerts live in `app/views/layouts/partials/` (e.g. `_header`, `_footer`, `_mobile_drawer`, `_flash_messages`).

## Single Root Container (One for the Whole App)
- ONE container, defined ONCE on `<main>` in the layout: `w-full max-w-7xl mx-auto px-3.5 py-3 sm:px-6 sm:py-5 lg:px-8 lg:py-6`.
- Every page and section (home, programs, about, contact, admin) shares the exact same width, padding, and margins.
- Views and partials NEVER add their own outer padding/margin/max-width wrappers, and never use negative-margin break-outs.
- Header and footer inner content align to the same `max-w-7xl` + horizontal padding values, so edges line up everywhere.
- Vertical rhythm between sections uses one shared spacing token (e.g. `space-y-16 lg:space-y-24` on `<main>`), not per-section margins.
- Mobile feels spacious. Desktop spans gracefully without CSS hacks.

## Overscroll Prevention
- Horizontal scroll containers: `overflow-x-auto overscroll-x-none`.
- Root shell: `overflow-x-hidden overscroll-none`.
- Modals/drawers: `overflow-y-auto overscroll-none` (no scroll leak to the page).
