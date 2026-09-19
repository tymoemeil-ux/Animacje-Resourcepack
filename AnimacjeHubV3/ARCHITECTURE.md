# V3 architecture

- `commands/` — command executor and tab completion
- `listeners/` — Paper events only
- `gui/` — inventories and interaction routing
- `services/` — nick, ranks, announcements, trolls and text rendering
- `catalog/` — immutable FX catalog and JSON parser
- `config/` — configuration loading and validation

The entrypoint only wires dependencies; feature logic belongs in its module.
