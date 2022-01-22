defmodule TicTacToe.GameBucket do
  use Agent

  @doc """
    Starts the game bucket, used for storing GUIDS for games in progress
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
    Gets value from the game bucket
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
    Puts value from the game bucket
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end
end
