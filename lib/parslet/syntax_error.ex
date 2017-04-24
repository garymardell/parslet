defmodule Parslet.SyntaxError do

  @type t :: %__MODULE__{
    line: non_neg_integer,
    col: non_neg_integer | Range.t,
    message: String.t
  }

  defstruct line: nil, col: nil, message: nil
end
