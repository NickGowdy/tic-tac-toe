defmodule TicTacToe.TurnBucket do
  use Agent, restart: :temporary

  @doc """
  Starts a new turn bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Creates new grid and puts it into bucket
  """
  def create_grid(bucket, key) do
    dimensions = Enum.to_list(0..2)

    grid =
      Enum.flat_map(dimensions, fn x ->
        Enum.map(dimensions, fn y ->
          %{x: x, y: y, player: 0}
        end)
      end)

    Agent.update(bucket, &Map.put(&1, key, grid))
  end
end
