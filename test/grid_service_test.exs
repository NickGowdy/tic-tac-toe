defmodule GridServiceTest do
  use ExUnit.Case, async: true

  alias TicTacToe.{GridFactory, GridService}
  alias TicTacToe.Entities.Square

  # test "Return true when complete combination is vertical" do
  #   grid = [
  #     %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
  #     %TicTacToe.Entities.Square{player: 1, x: 0, y: 1},
  #     %TicTacToe.Entities.Square{player: 1, x: 0, y: 2}
  #   ]

  #   result = GridService.is_winner(grid, 1)
  #   assert result == true
  # end

  # test "Return false there is not a complete vertical combination" do
  #   grid = [
  #     %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
  #     %TicTacToe.Entities.Square{player: 1, x: 0, y: 1}
  #   ]

  #   result = GridService.is_winner(grid, 1)
  #   assert result == false
  # end

  # test "Return true when complete combination is horizontal" do
  #   grid = [
  #     %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
  #     %TicTacToe.Entities.Square{player: 1, x: 1, y: 0},
  #     %TicTacToe.Entities.Square{player: 1, x: 2, y: 0}
  #   ]

  #   result = GridService.is_winner(grid, 1)
  #   assert result == true
  # end

  # test "Return false there is not a complete horizontal combination" do
  #   grid = [
  #     %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
  #     %TicTacToe.Entities.Square{player: 1, x: 1, y: 0}
  #   ]

  #   result = GridService.is_winner(grid, 1)
  #   assert result == false
  # end

  test "Return true when complete combination is diagonal 1" do
    grid = [
      %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
      %TicTacToe.Entities.Square{player: 1, x: 1, y: 1},
      %TicTacToe.Entities.Square{player: 1, x: 2, y: 2}
    ]

    result = GridService.is_winner(grid, 1)
    assert result == true
  end

end
