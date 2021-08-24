defmodule TTTTest do
  use ExUnit.Case
  doctest TTT

  test "greets the world" do
    assert TTT.hello() == :world
  end
end
