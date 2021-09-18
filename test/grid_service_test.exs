defmodule GridServiceTest do
  use ExUnit.Case, async: true

  alias TicTacToe.{GridFactory, GridService}
  alias TicTacToe.Entities.Square

  test "Return true when complete combination is vertical" do
    grid = [
      %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
      %TicTacToe.Entities.Square{player: 1, x: 0, y: 1},
      %TicTacToe.Entities.Square{player: 1, x: 0, y: 2},
    ]

    result = GridService.is_winner(grid, 1)
    assert result == true
  end

  test "Return false there is not a complete vertical combination" do
    grid = [
      %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
      %TicTacToe.Entities.Square{player: 1, x: 0, y: 1},
    ]

    result = GridService.is_winner(grid, 1)
    assert result == false
  end
end