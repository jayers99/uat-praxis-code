"""Step definitions for greeting.feature."""

from __future__ import annotations

from typing import Any

import pytest
from pytest_bdd import parsers, scenarios, then, when
from typer.testing import CliRunner

from hello_world.cli import app

scenarios("../features/greeting.feature")


@pytest.fixture
def cli_runner() -> CliRunner:
    """Provide a Typer CLI test runner."""
    return CliRunner()


@pytest.fixture
def context() -> dict[str, Any]:
    """Provide a context dict for BDD step communication."""
    return {}


@when("I run hello-world")
def run_hello_world(cli_runner: CliRunner, context: dict[str, Any]) -> None:
    """Run the hello-world command."""
    result = cli_runner.invoke(app)
    context["result"] = result


@then(parsers.parse('the output should contain "{text}"'))
def check_output_contains(context: dict[str, Any], text: str) -> None:
    """Verify the output contains expected text."""
    result = context["result"]
    assert text in result.output, f"Expected '{text}' in output. Got: {result.output}"


@then(parsers.parse("the exit code should be {code:d}"))
def check_exit_code(context: dict[str, Any], code: int) -> None:
    """Verify the exit code."""
    result = context["result"]
    assert result.exit_code == code, (
        f"Expected exit code {code}, got {result.exit_code}. Output: {result.output}"
    )
