defmodule TicTacToe.GameServerTest do
  use ExUnit.Case, async: true

  alias TicTacToe.Entities.{Square, Game}

  setup do
    %{pid: start_supervised!(TicTacToe.GameServer)}
  end

  test "Play game of Tic Tac Toe", %{pid: pid} do
    TicTacToe.GameServer.take_turn(pid, %Square{x: 0, y: 0, player: 1})
    TicTacToe.GameServer.take_turn(pid, %Square{x: 1, y: 1, player: 2})
    TicTacToe.GameServer.take_turn(pid, %Square{x: 1, y: 0, player: 1})
    TicTacToe.GameServer.take_turn(pid, %Square{x: 2, y: 2, player: 1})
    TicTacToe.GameServer.take_turn(pid, %Square{x: 2, y: 0, player: 1})

    assert %Game{winner: 1} = TicTacToe.GameServer.get_grid(pid)
  end

  test "Only player 1 or 2 can take a turn", %{pid: pid} do
    assert TicTacToe.GameServer.take_turn(pid, %Square{x: 0, y: 0, player: 1}) == :ok
    assert TicTacToe.GameServer.take_turn(pid, %Square{x: 0, y: 0, player: 2}) == :ok

    assert TicTacToe.GameServer.take_turn(pid, %Square{x: 0, y: 0, player: 3}) ==
             {:error, "Player must be 1 or 2"}

    assert TicTacToe.GameServer.take_turn(pid, %Square{x: 0, y: 0, player: 0}) ==
             {:error, "Player must be 1 or 2"}

    assert TicTacToe.GameServer.take_turn(pid, %Square{x: 0, y: 0, player: -1}) ==
             {:error, "Player must be 1 or 2"}
  end
end
