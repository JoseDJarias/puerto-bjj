# Testing Standards (Native Minitest)

## Coverage
- Every model, controller, service, and job has tests in `test/models`, `test/controllers`, `test/services`, etc.

## Priority 1: Validate Structure First
- **Models:** attributes, coercions, defaults, DB constraints, associations.
- **Controllers:** status codes, content type, rendered template, HTML/JSON structure.
- **Services:** result object, success/failure, payload keys, error structure.

## Happy & Failure Paths
- Validation errors and messages, invalid params, edge/boundary values, enum transition errors.

## Tests as Architectural Contracts
- If associations, helpers, or eager-load structure change, tests MUST break.
- Every controller test that loads records wraps the request in `assert_queries(N) { get ... }` with the exact constant.
- `Bullet` in `test_helper.rb` raises `Bullet::Notification::UnoptimizedQueryError` on N+1, overriding counts.
