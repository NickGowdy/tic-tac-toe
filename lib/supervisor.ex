defmodule TicTacToe.Supervisor do
  use Supervisor

  alias TicTacToe.GameRegistry

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    Supervisor.init([GameRegistry], strategy: :one_for_one)
  end
end
