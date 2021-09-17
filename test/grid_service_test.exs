defmodule GridServiceTest do
  use ExUnit.Case, async: true

  alias TicTacToe.{GridFactory, GridService}
  alias TicTacToe.Entities.Square

  test "Find winner when complete combination is vertical" do
    grid = [
      %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
      %TicTacToe.Entities.Square{player: nil, x: 0, y: 1},
      %TicTacToe.Entities.Square{player: 1, x: 0, y: 2},
      %TicTacToe.Entities.Square{player: nil, x: 1, y: 0},
      %TicTacToe.Entities.Square{player: nil, x: 1, y: 1},
      %TicTacToe.Entities.Square{player: nil, x: 1, y: 2},
      %TicTacToe.Entities.Square{player: nil, x: 2, y: 0},
      %TicTacToe.Entities.Square{player: nil, x: 2, y: 1},
      %TicTacToe.Entities.Square{player: nil, x: 2, y: 2}
    ]

    result = GridService.is_winner(grid, 1)
    assert result = true
  end
end
