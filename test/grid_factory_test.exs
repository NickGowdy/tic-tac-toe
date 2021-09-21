defmodule GridFactoryTest do
  use ExUnit.Case

  alias TicTacToe.{GridFactory, Entities}

  test "Function builds 3x3 grid for Tic Tac Toe" do
    assert GridFactory.build() == [
             %Entities.Square{player: nil, x: 0, y: 0},
             %Entities.Square{player: nil, x: 0, y: 1},
             %Entities.Square{player: nil, x: 0, y: 2},
             %Entities.Square{player: nil, x: 1, y: 0},
             %Entities.Square{player: nil, x: 1, y: 1},
             %Entities.Square{player: nil, x: 1, y: 2},
             %Entities.Square{player: nil, x: 2, y: 0},
             %Entities.Square{player: nil, x: 2, y: 1},
             %Entities.Square{player: nil, x: 2, y: 2}
           ]
  end
end
