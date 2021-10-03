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

  test "Only player 1 or 2 can take a turn", %{pid: pid} do
    assert TicTacToe.GameRegistry.take_turn(pid, %Square{x: 0, y: 0, player: 1}) === :ok
    assert TicTacToe.GameRegistry.take_turn(pid, %Square{x: 0, y: 0, player: 2}) === :ok

    assert TicTacToe.GameRegistry.take_turn(pid, %Square{x: 0, y: 0, player: 3}) ===
             {:error, "Player must be 1 or 2"}

    assert TicTacToe.GameRegistry.take_turn(pid, %Square{x: 0, y: 0, player: 0}) ===
             {:error, "Player must be 1 or 2"}

    assert TicTacToe.GameRegistry.take_turn(pid, %Square{x: 0, y: 0, player: -1}) ===
             {:error, "Player must be 1 or 2"}
  end
end
