# Typography & Iconography

## Typography (Minimalist Sans-Serif)
- Single family `font-sans`. ZERO `font-serif`, ZERO `font-mono` (not even for amounts/dates/IDs).
- Geometric sans with a tall x-height, generous spacing, and low stroke contrast.
- Max 2–3 size/weight combos per view.

> Note: the levels below were tuned for an admin dashboard. For the marketing landing, hero titles may scale larger. Decide during the redesign.

| Level | Classes |
|---|---|
| `h1` section title | `text-lg sm:text-xl lg:text-2xl font-bold text-slate-900 tracking-tight` |
| Subtitle/metadata | `text-xs sm:text-sm font-medium text-slate-500 flex items-center gap-1.5 mt-0.5` |
| Key data | `text-sm sm:text-base font-semibold text-slate-900` |

## Iconography
- NO emojis in UI.
- Lucide SVG icons only for actionable controls (chevrons, steppers, `+`, `✕`, modal triggers). No decorative icons on self-explanatory titles or labels.
