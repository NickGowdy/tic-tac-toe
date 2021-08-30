defmodule TicTacToe.GameRegistryTest do
  use ExUnit.Case, async: true

  setup do
    game_registry = start_supervised!(TicTacToe.GameRegistry)
    %{game_registry: game_registry}
  end

  test "spawns turn bucket", %{game_registry: game_registry} do
    assert TicTacToe.GameRegistry.lookup(game_registry, "player 1") == :error

    TicTacToe.GameRegistry.create(game_registry, "player 1")
    assert {:ok, bucket} = TicTacToe.GameRegistry.lookup(game_registry, "player 1")

    TicTacToe.Bucket.put(bucket, "player 1", %{x: 0, y: 0})
    assert TicTacToe.Bucket.get(bucket, "player 1") == %{x: 0, y: 0}
  end

  test "removes turn buckets on exit", %{game_registry: game_registry} do
    TicTacToe.GameRegistry.create(game_registry, "player 1")
    {:ok, bucket} = TicTacToe.GameRegistry.lookup(game_registry, "player 1")
    Agent.stop(bucket)
    assert TicTacToe.GameRegistry.lookup(game_registry, "player 1") == :error
  end
end
