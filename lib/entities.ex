defmodule TicTacToe.Entities.Square do
  @derive Jason.Encoder
  defstruct [:x, :y, :player]

  @type t :: %__MODULE__{
          x: non_neg_integer(),
          y: non_neg_integer(),
          player: non_neg_integer()
        }
end

defmodule TicTacToe.Entities.Game do
  @derive Jason.Encoder
  defstruct [:id, :grid, :winner]

  @type t :: %__MODULE__{
          id: UUID,
          grid: list(%TicTacToe.Entities.Square{}),
          winner: non_neg_integer()
        }
end
