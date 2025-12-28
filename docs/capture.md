# Capture

**Stage:** Capture
**Date:** 2025-12-27

---

## Raw Inputs

### Intent

Build a simple Python CLI that prints "Hello, World!" to demonstrate the Praxis lifecycle. This project serves as:

1. A minimal example for learning Praxis governance
2. A test case for `praxis validate` CLI
3. Source material for the user guide documentation

### Constraints

- Python 3.10+
- Use Typer for CLI (consistent with Praxis patterns)
- Single command: `hello` with optional `--name` argument
- Must pass `praxis validate` at each stage transition

### Initial Ideas

```bash
# Expected usage
hello-world
# Output: Hello, World!

hello-world --name Praxis
# Output: Hello, Praxis!
```

Structure follows template-python-cli:
```
src/hello_world/
├── __init__.py
├── __main__.py
└── cli.py
```

---

## Next Steps

Move to **Sense** to organize these inputs into a coherent understanding.
