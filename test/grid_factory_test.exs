defmodule GridFactoryTest do
  use ExUnit.Case

  test "Function builds 3x3 grid for Tic Tac Toe" do
    assert TicTacToe.GridFactory.build() == [
             %{player: 0, x: 0, y: 0},
             %{player: 0, x: 0, y: 1},
             %{player: 0, x: 0, y: 2},
             %{player: 0, x: 1, y: 0},
             %{player: 0, x: 1, y: 1},
             %{player: 0, x: 1, y: 2},
             %{player: 0, x: 2, y: 0},
             %{player: 0, x: 2, y: 1},
             %{player: 0, x: 2, y: 2}
           ]
  end
end
