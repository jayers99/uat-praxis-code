# Shape

**Stage:** Shape
**Date:** 2025-12-27

---

## Architecture

### Project Structure

```
hello-world/
├── pyproject.toml
├── praxis.yaml
├── docs/
│   ├── capture.md
│   ├── sense.md
│   ├── explore.md
│   ├── shape.md
│   └── sod.md          # Created at Formalize
├── src/
│   └── hello_world/
│       ├── __init__.py
│       ├── __main__.py
│       └── cli.py
└── tests/
    └── test_cli.py
```

### Component Design

```
┌─────────────────────────────────────────┐
│                 cli.py                   │
│  ┌─────────────────────────────────┐    │
│  │  @app.command()                 │    │
│  │  def hello(name: str = "World") │    │
│  │      → print greeting           │    │
│  └─────────────────────────────────┘    │
└─────────────────────────────────────────┘
```

No layers needed — this is intentionally flat.

### Decisions Made

| Decision | Rationale |
|----------|-----------|
| No domain/application/infrastructure layers | Overkill for single-function CLI |
| Single test file | Only one command to test |
| No BDD | Simple enough for unit tests |

---

## Next Steps

Move to **Formalize** to create the SOD and lock scope.
