defmodule TTT.TurnBucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = TTT.TurnBucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert TTT.TurnBucket.get(bucket, "player 1") == nil
  end
end
