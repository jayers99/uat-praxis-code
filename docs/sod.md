# Solution Overview Document (SOD)

**Project:** hello-world
**Version:** 1.0
**Stage:** Formalize
**Date:** 2025-12-27

---

## 1. Purpose

A minimal Python CLI that prints a greeting, serving as:
- A learning example for Praxis governance
- A test case for `praxis validate` CLI
- Source material for user guide documentation

## 2. Scope

### In Scope

- Single CLI command: `hello-world`
- Optional `--name` argument (default: "World")
- Output: `Hello, {name}!`

### Out of Scope

- Multiple commands
- Configuration files
- Logging
- Error handling beyond Typer defaults

## 3. Technical Design

### 3.1 Project Structure

```
src/hello_world/
├── __init__.py      # Version only
├── __main__.py      # python -m entry point
└── cli.py           # Typer app with hello command
```

### 3.2 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| python | >=3.10 | Runtime |
| typer | >=0.9.0 | CLI framework |

### 3.3 CLI Interface

```bash
hello-world [OPTIONS]

Options:
  --name TEXT  Name to greet [default: World]
  --help       Show this message and exit.
```

### 3.4 Implementation

```python
# cli.py
import typer

app = typer.Typer()

@app.command()
def hello(name: str = typer.Option("World", help="Name to greet")) -> None:
    """Print a greeting."""
    typer.echo(f"Hello, {name}!")

if __name__ == "__main__":
    app()
```

## 4. Testing

### 4.1 Test Cases

| Test | Input | Expected Output |
|------|-------|-----------------|
| Default greeting | (none) | "Hello, World!" |
| Custom greeting | --name Praxis | "Hello, Praxis!" |
| Help text | --help | Shows usage |

### 4.2 Test Implementation

```python
# tests/test_cli.py
from typer.testing import CliRunner
from hello_world.cli import app

def test_default_greeting():
    result = CliRunner().invoke(app, [])
    assert result.exit_code == 0
    assert "Hello, World!" in result.output

def test_custom_greeting():
    result = CliRunner().invoke(app, ["--name", "Praxis"])
    assert result.exit_code == 0
    assert "Hello, Praxis!" in result.output
```

## 5. Acceptance Criteria

- [ ] `hello-world` prints "Hello, World!"
- [ ] `hello-world --name X` prints "Hello, X!"
- [ ] `hello-world --help` shows usage
- [ ] All tests pass
- [ ] `praxis validate` passes at Execute stage

## 6. Constraints

- Must use Typer (consistency with Praxis)
- Must follow src/ layout
- Must include tests

---

**Formalize Gate:** This SOD locks scope. Changes require regression to Formalize.
