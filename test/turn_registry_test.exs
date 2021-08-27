defmodule TTT.TurnRegistryTest do
  use ExUnit.Case, async: true

  setup do
    turn_registry = start_supervised!(TTT.TurnRegistry)
    %{turn_registry: turn_registry}
  end

  test "spawns turn bucket", %{turn_registry: turn_registry} do
    assert TTT.TurnRegistry.lookup(turn_registry, "player 1") == :error

    TTT.TurnRegistry.create(turn_registry, "player 1")
    assert {:ok, turn_bucket} = TTT.TurnRegistry.lookup(turn_registry, "player 1")

    TTT.TurnBucket.put(turn_bucket, "player 1", %{x: 0, y: 0})
    assert TTT.TurnBucket.get(turn_bucket, "player 1") == %{x: 0, y: 0}
  end

  test "removes turn buckets on exit", %{turn_registry: turn_registry} do
    TTT.TurnRegistry.create(turn_registry, "player 1")
    {:ok, turn_bucket} = TTT.TurnRegistry.lookup(turn_registry, "player 1")
    Agent.stop(turn_bucket)
    assert TTT.TurnRegistry.lookup(turn_registry, "player 1") == :error
  end
end
