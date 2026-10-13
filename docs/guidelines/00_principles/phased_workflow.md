# Phased Feature Development (3 Phases)

1. **Domain & Logic Core:** migrations, DB constraints, models, enums, validations, domain services. Minitest unit tests for business rules and boundaries BEFORE touching UI.
2. **Controller Integration & Presentation:** wire controllers, eager-load associations, pass resolved collections to views, move presentation logic to helpers. ERB stays free of queries and logic.
3. **Hotwire Polish & Real-Time UX:** Turbo Stream responses, inline updates with complete computed state, helpful guides and modals.
