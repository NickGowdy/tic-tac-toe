defmodule TicTacToe.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = TicTacToe.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert TicTacToe.Bucket.get(bucket, "player 1") == nil

    TicTacToe.Bucket.put(bucket, "player 1", %{x: 0, y: 0})
    assert TicTacToe.Bucket.get(bucket, "player 1") == %{x: 0, y: 0}
  end

  test "are temporary workers" do
    assert Supervisor.child_spec(TicTacToe.Bucket, []).restart == :temporary
  end
end
