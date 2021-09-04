defmodule TicTacToe.GridFactory do
  @spec build :: list
  @doc """
  Builds a 3x3 grid for Tic Tac Toe
  """
  def build() do
    dimensions = Enum.to_list(0..2)

    Enum.flat_map(dimensions, fn x ->
      Enum.map(dimensions, fn y ->
        %{x: x, y: y, player: "player 1"}
      end)
    end)
  end
end
