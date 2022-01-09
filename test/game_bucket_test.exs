defmodule TicTacToe.GameBucketTest do
  use ExUnit.Case, async: true

  alias TicTacToe.{GameBucket}

  setup do
    {:ok, bucket} = GameBucket.start_link([])
    %{bucket: bucket}
  end

  test "Stores value by key", %{bucket: bucket} do
    pid = :c.pid(0, 250, 0)
    test = :erlang.pid_to_list(pid) |> List.last() |> IO.inspect()
    guid = UUID.uuid1()
    assert GameBucket.get(bucket, GUID: guid) == nil

    GameBucket.put(bucket, guid, pid)
    assert GameBucket.get(bucket, guid) == pid
  end
end
