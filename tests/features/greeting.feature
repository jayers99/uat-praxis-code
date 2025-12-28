Feature: Hello World CLI
  As a user
  I want to greet the world
  So that I can test the CLI

  Scenario: Default greeting
    When I run hello-world
    Then the output should contain "Hello, World!"
    And the exit code should be 0
