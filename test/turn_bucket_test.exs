defmodule TTT.TurnBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = TTT.TurnBucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert TTT.TurnBucket.get(bucket, "player 1") == nil

    TTT.TurnBucket.put(bucket, "player 1", %{x: 0, y: 0})
    assert TTT.TurnBucket.get(bucket, "player 1") == %{x: 0, y: 0}
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(TTT.TurnBucket, []).restart == :temporary
  end
end
