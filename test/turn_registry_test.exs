defmodule TicTacToe.GameRegistryTest do
  use ExUnit.Case, async: true

  setup do
    turn_registry = start_supervised!(TicTacToe.GameRegistry)
    %{turn_registry: turn_registry}
  end

  test "spawns turn bucket", %{turn_registry: turn_registry} do
    assert TicTacToe.GameRegistry.lookup(turn_registry, "player 1") == :error

    TicTacToe.GameRegistry.create(turn_registry, "player 1")
    assert {:ok, turn_bucket} = TicTacToe.GameRegistry.lookup(turn_registry, "player 1")

    TicTacToe.TurnBucket.put(turn_bucket, "player 1", %{x: 0, y: 0})
    assert TicTacToe.TurnBucket.get(turn_bucket, "player 1") == %{x: 0, y: 0}
  end

  test "removes turn buckets on exit", %{turn_registry: turn_registry} do
    TicTacToe.GameRegistry.create(turn_registry, "player 1")
    {:ok, turn_bucket} = TicTacToe.GameRegistry.lookup(turn_registry, "player 1")
    Agent.stop(turn_bucket)
    assert TicTacToe.GameRegistry.lookup(turn_registry, "player 1") == :error
  end
end
