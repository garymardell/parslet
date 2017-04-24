defmodule ParsletTest do
  use ExUnit.Case
  doctest Parslet

  test "successful str" do
    matcher = Parslet.str("i")

    {:ok, _} = matcher.("i")
  end

  test "failure str" do
    matcher = Parslet.str("i")

    {:error, _} = matcher.("j")
  end

  test "successful match for single match" do
    matcher = Parslet.match("i")

    {:ok, _} = matcher.("i")
  end

  test "successful match for pattern" do
    matcher = Parslet.match("[0-9]+")

    {:ok, _} = matcher.("456234")
  end

  test "successful match for chained pattern" do
    matcher = Parslet.match("[0-9]+")
    |> Parslet.match("hello")

    {:ok, _} = matcher.("456234hello")
  end

  test "successful match for chained match" do
    matcher = Parslet.match("h")
    |> Parslet.match("el")
    |> Parslet.match("l")
    |> Parslet.match("o")

    {:ok, _} = matcher.("hello")
  end

  test "failure to match" do
    matcher = Parslet.match("i")

    {:error, _} = matcher.("x")
  end

  # test "successful repeat" do
  #   matcher = Parslet.str("foo") |> Parslet.repeat
  #
  #   {:ok, _} = matcher.("foofoofoo")
  # end
  #
  # test "successful repeat chained" do
  #   matcher = Parslet.str("hello") |> (Parslet.str("foo") |> Parslet.repeat) |> Parslet.str("bar")
  # 
  #   {:ok, _} = matcher.("hellofoofoofoobar")
  # end
end
