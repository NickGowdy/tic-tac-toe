defmodule TTT.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {DynamicSupervisor, name: TTT.BucketSupervisor, strategy: :one_for_one},
      {TTT.TurnRegistry, name: TTT.TurnRegistry}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
