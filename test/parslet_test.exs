defmodule ParsletTest do
  use ExUnit.Case
  doctest Parslet

  test "successful match for single match" do
    matcher = Parslet.match("i")

    {:ok, _} = matcher.("i")
  end

  test "successful match for chained match" do
    matcher = Parslet.match("h")
    |> Parslet.match("e")
    |> Parslet.match("l")
    |> Parslet.match("l")
    |> Parslet.match("o")

    {:ok, _} = matcher.("hello")
  end

  test "failure to match" do
    matcher = Parslet.match("i")

    {:error, _} = matcher.("x")
  end
end
