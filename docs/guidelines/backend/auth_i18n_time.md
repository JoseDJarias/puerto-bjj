# Authentication, I18n & Time

## Authentication (Rails 8 native)
- Uses the generated `Authentication` concern, NOT Devise.
- Public routes: `allow_unauthenticated_access`. Never `skip_before_action :authenticate_user!`.

## I18n (Zero Hardcoded Strings)
- ALL user-facing text (titles, buttons, labels, placeholders, tooltips, flashes, statuses) uses `t(...)` / `I18n.t(...)`. Applies to views, controllers, models, mailers, JS.
- Keys live in `config/locales/es.yml`. Default locale `es`.

## Timezone (`America/Costa_Rica`)
- NEVER use `Date.parse`, `Date.today`, `Time.now`, `Time.parse`.
- ALWAYS use `Time.zone.parse`, `Time.zone.today`, `Time.zone.now`, `.in_time_zone`.
