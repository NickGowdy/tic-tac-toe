defmodule TicTacToe.GameRegistryTest do
  use ExUnit.Case, async: true

  alias TicTacToe.Entities.Square

  setup do
    %{pid: start_supervised!(TicTacToe.GameRegistry)}
  end

  test "Play game of Tic Tac Toe", %{pid: pid} do
    TicTacToe.GameRegistry.take_turn(pid, %Square{x: 0, y: 0, player: 1})
    TicTacToe.GameRegistry.take_turn(pid, %Square{x: 1, y: 1, player: 2})
    TicTacToe.GameRegistry.take_turn(pid, %Square{x: 1, y: 0, player: 1})
    TicTacToe.GameRegistry.take_turn(pid, %Square{x: 2, y: 2, player: 1})
    TicTacToe.GameRegistry.take_turn(pid, %Square{x: 2, y: 0, player: 1})

    assert TicTacToe.GameRegistry.maybe_winner(pid, 1) === true
  end
end
