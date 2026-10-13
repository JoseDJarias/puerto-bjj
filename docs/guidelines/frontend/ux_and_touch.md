# UX & Touch Standards

## Human-Centered Design (Non-Technical Users)
- Clarity, large tap targets, generous spacing, high legibility, reassuring guidance.
- **Full reversibility:** every created record can be edited/cancelled/purged if made by mistake.
- **Proactive warnings:** detect duplicates and overlaps in real time with non-blocking banners before submit.
- **Zero disorientation:** cancelling a modal or sub-action keeps the viewport and tab context. No parent reloads.

## Touch & Device Awareness
- Never say "use the mouse" / "pasa el ratón" on mobile.
- Dual microcopy: `hidden sm:inline` (hover text) and `sm:hidden` (touch text).
- Mouse-interactive components (carousels) MUST also handle `touchstart`/`touchend` swipes.
