defmodule Parslet do
  def str(test) do
    fn input ->
      do_str(input, test)
    end
  end

  def str(chain, test) do
    fn input ->
      {:ok, remainder} = chain.(input)

      do_str(remainder, test)
    end
  end

  def do_str(input, test) do
    {:ok, regex} = Regex.compile("\\A#{Regex.escape(test)}")

    case Regex.run(regex, input, capture: :first) do
      nil ->
        {:error, input}
      _ ->
        {_head, tail} = String.split_at(input, String.length(test))
        {:ok, tail}
    end
  end

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
    {:ok, regex} = Regex.compile(test)

    case Regex.run(regex, input, capture: :first) do
      nil ->
        {:error, input}
      _ ->
        {_head, tail} = String.split_at(input, String.length(test))
        {:ok, tail}
    end
  end

  def repeat(partial, opts \\ []) do
    do_repeat(partial)
  end

  def do_repeat(partial) do

  end
end
