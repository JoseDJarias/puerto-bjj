# Hotwire (Turbo & Stimulus)

## Stimulus
- Check `app/javascript/controllers/` for an existing controller first. Otherwise create one.
- NEVER Alpine.js or inline JS.
- NEVER run `bin/rails stimulus:manifest:update`. It breaks importmap. Controllers load via `eagerLoadControllersFrom("controllers", application)`.

## Real-Time Broadcasting (Solid Cable), when applicable
- State changes on core entities broadcast updates, so operators never reload.
- **Dual target:** replace both `dom_id(record, :row)` (desktop) and `dom_id(record, :card)` (mobile).
- **Structural changes** (order, filters, grouping): `Turbo::StreamsChannel.broadcast_refresh_later_to` (morph).
- **In-place changes:** `record.broadcast_replace_later_to`. Keeps scroll and open modals.
- **Role visibility in broadcasts:** `Current.user` is nil in jobs. Never omit DOM via Ruby auth conditionals in broadcast partials. Render the full DOM, mark restricted elements `.role-protected-ui`, and hide them with a layout `<style>` only for unauthorized users.
