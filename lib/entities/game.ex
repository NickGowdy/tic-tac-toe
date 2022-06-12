defmodule TicTacToe.Entities.Game do
  @derive Jason.Encoder
  defstruct [:id, :grid, :winner]

  @type t :: %__MODULE__{
          id: UUID,
          grid: list(%TicTacToe.Entities.Square{}),
          winner: non_neg_integer()
        }
end
