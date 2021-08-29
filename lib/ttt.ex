defmodule TTT do
  use Application

  @impl true
  def start(_type, _args) do
    TTT.GameSupervisor.start_link(name: TTT.GameSupervisor)
  end
end
