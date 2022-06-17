defmodule TicTacToe.Factory do
  alias TicTacToe.Entities.Square

  @spec build_grid :: list
  @doc """
  Builds a 3x3 grid for Tic Tac Toe
  """
  def build_grid() do
    dimensions = [0, 1, 2]

    for x <- dimensions,
        y <- dimensions,
        do: %Square{x: x, y: y, player: 0}
  end
end
