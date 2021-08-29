defmodule TTT do
  use Application

  @impl true
  def start(_type, _args) do
    TTT.Supervisor.start_link(name: TTT.Supervisor)
  end
end
