defmodule TicTacToe.Entities.Square do
  @derive Jason.Encoder
  defstruct [:x, :y, :player]

  @type t :: %__MODULE__{
          x: non_neg_integer(),
          y: non_neg_integer(),
          player: non_neg_integer()
        }
end
