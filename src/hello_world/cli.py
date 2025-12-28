"""Hello World CLI."""

import typer

app = typer.Typer(
    name="hello-world",
    help="A minimal greeting CLI.",
    add_completion=False,
)


@app.command()
def hello(
    name: str = typer.Option("World", "--name", "-n", help="Name to greet"),
) -> None:
    """Print a greeting."""
    typer.echo(f"Hello, {name}!")


if __name__ == "__main__":
    app()
