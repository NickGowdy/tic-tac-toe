defmodule TicTacToe.TurnBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = TicTacToe.TurnBucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert TicTacToe.TurnBucket.get(bucket, "player 1") == nil

    TicTacToe.TurnBucket.put(bucket, "player 1", %{x: 0, y: 0})
    assert TicTacToe.TurnBucket.get(bucket, "player 1") == %{x: 0, y: 0}
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(TicTacToe.TurnBucket, []).restart == :temporary
  end
end
