"""Tests for hello-world CLI."""

from typer.testing import CliRunner

from hello_world.cli import app

runner = CliRunner()


def test_default_greeting() -> None:
    """Test default greeting prints Hello, World!"""
    result = runner.invoke(app, [])
    assert result.exit_code == 0
    assert "Hello, World!" in result.output


def test_custom_greeting() -> None:
    """Test custom name greeting."""
    result = runner.invoke(app, ["--name", "Praxis"])
    assert result.exit_code == 0
    assert "Hello, Praxis!" in result.output


def test_short_flag() -> None:
    """Test short flag -n works."""
    result = runner.invoke(app, ["-n", "User"])
    assert result.exit_code == 0
    assert "Hello, User!" in result.output


def test_help() -> None:
    """Test help is shown."""
    result = runner.invoke(app, ["--help"])
    assert result.exit_code == 0
    assert "Name to greet" in result.output
