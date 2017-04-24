defmodule Parslet.SyntaxErrorTest do
  use ExUnit.Case
  doctest Parslet.SyntaxError

  test "syntax error struct" do
    error = %Parslet.SyntaxError{
      line: 1,
      col: 1..5,
      message: "Syntax error occured"
    }

    assert 1 == error.line
    assert 1..5 == error.col
    assert "Syntax error occured" == error.message
  end
end
