defmodule TicTacToe.Factory do
  alias TicTacToe.Entities.{Square, Game}

  @spec build_grid :: list
  @doc """
  Builds a 3x3 grid for Tic Tac Toe
  """
  def build_grid() do
    dimensions = Enum.to_list(0..2)

    Enum.flat_map(dimensions, fn x ->
      Enum.map(dimensions, fn y ->
        %Square{x: x, y: y, player: nil}
      end)
    end)
  end

  @doc """
  Builds the game struct with UUID
  """
  def build_game(grid = [_ | _]) do
    %Game{
      grid: grid,
      id: UUID.uuid1()
    }
  end
end
