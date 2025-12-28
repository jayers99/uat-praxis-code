# Explore

**Stage:** Explore
**Date:** 2025-12-27

---

## Design Space

### Option A: Minimal Typer CLI

```python
import typer
app = typer.Typer()

@app.command()
def hello(name: str = "World"):
    typer.echo(f"Hello, {name}!")
```

**Pros:** Simple, familiar pattern, matches Praxis CLI
**Cons:** None for this scope

### Option B: Click-based CLI

```python
import click

@click.command()
@click.option('--name', default='World')
def hello(name):
    click.echo(f'Hello, {name}!')
```

**Pros:** More explicit
**Cons:** Not consistent with Praxis patterns

### Decision

**Option A: Typer** — Consistency with existing Praxis tooling outweighs any marginal benefits of Click.

---

## Unknowns Resolved

| Question | Answer |
|----------|--------|
| Package name? | `hello_world` (snake_case) |
| CLI command name? | `hello-world` (kebab-case) |
| Test framework? | pytest (consistent with Praxis) |
| Need BDD? | No — too simple for Gherkin |

---

## Next Steps

Move to **Shape** to define the architecture and structure.
