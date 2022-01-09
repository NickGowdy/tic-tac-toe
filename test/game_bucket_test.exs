defmodule TicTacToe.GameBucketTest do
  use ExUnit.Case, async: true

  alias TicTacToe.{GameBucket}

  setup do
    {:ok, bucket} = GameBucket.start_link([]) |> IO.inspect(label: "This is the game bucket")
    %{bucket: bucket}
  end

  test "Stores value by key", %{bucket: bucket}  do
    pid = :c.pid(0, 250, 0)
    guid = UUID.uuid1()
    assert GameBucket.get(bucket, GUID: guid) == nil

    GameBucket.put(bucket, guid, pid)
    assert GameBucket.get(bucket, guid) == pid
  end
end
