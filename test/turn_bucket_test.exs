defmodule TicTacToe.TurnBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = TicTacToe.TurnBucket.start_link([])
    %{bucket: bucket}
  end

  test "creates new bucket by key", %{bucket: bucket} do
    TicTacToe.TurnBucket.create_grid(bucket, "test game")

    assert TicTacToe.TurnBucket.get(bucket, "test game") == [
             %{player: 0, x: 0, y: 0},
             %{player: 0, x: 0, y: 1},
             %{player: 0, x: 0, y: 2},
             %{player: 0, x: 1, y: 0},
             %{player: 0, x: 1, y: 1},
             %{player: 0, x: 1, y: 2},
             %{player: 0, x: 2, y: 0},
             %{player: 0, x: 2, y: 1},
             %{player: 0, x: 2, y: 2}
           ]
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
