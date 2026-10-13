# Domain Reference (Not Active in Puerto BJJ)

Patterns proven in other apps (ClinicaHolisticaBT). Apply ONLY if this app adds the feature.

## Currency (CRC base, dynamic USD)
- `_cents` columns store CRC cents (1 CRC = 100 cents). Never store USD.
- Assign through setters (`cost_crc=`, etc.), never raw cents.
- USD is computed in memory (`ExchangeRateService.current_usd_rate`), never persisted.
- Custom `Monetizable` returns `Float`. No `.format`. Use `number_to_currency(x, unit: "₡", precision: 0)` (es) or `number_to_currency(usd, precision: 0) + " USD"` (en).
- Never hard-delete records with active payments without a void/refund flow.

## Audit Logging (Slim Controllers)
- Controllers only delegate: `Audit::EventService.log_with_humanized_changes(raw_changes: @record.saved_changes, ...)`. No dictionary logic in controllers.
- Manual `raw_changes` include only changed attributes. Services skip blank→blank.
- Internal `.create_audit_record` stays `private_class_method`.
- Cascading `dependent: :destroy` children must NOT self-log destruction (FK crashes in SQLite). Log the parent deletion once, in the controller, on the parent's log.
