defmodule Parslet do
  def match(test) do
    fn input ->
      do_match(input, test)
    end
  end

  def match(chain, test) do
    fn input ->
      {:ok, remainder} = chain.(input)

      do_match(remainder, test)
    end
  end

  def do_match(input, test) do
    {head, tail} = String.split_at(input, 1)

    if head == test do
      {:ok, tail}
    else
      {:error, "error"}
    end
  end
end
