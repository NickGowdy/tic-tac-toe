defmodule GridFactoryTest do
  use ExUnit.Case

  alias TicTacToe.{Factory, Entities.Square}

  test "Function builds 3x3 grid for Tic Tac Toe" do
    assert Factory.build_grid() == [
             %Square{player: 0, x: 0, y: 0},
             %Square{player: 0, x: 0, y: 1},
             %Square{player: 0, x: 0, y: 2},
             %Square{player: 0, x: 1, y: 0},
             %Square{player: 0, x: 1, y: 1},
             %Square{player: 0, x: 1, y: 2},
             %Square{player: 0, x: 2, y: 0},
             %Square{player: 0, x: 2, y: 1},
             %Square{player: 0, x: 2, y: 2}
           ]
  end
end
