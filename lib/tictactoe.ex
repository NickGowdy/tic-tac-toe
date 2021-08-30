defmodule TicTacToe do
  use Application

  @impl true
  def start(_type, _args) do
    TicTacToe.Supervisor.start_link(name: TicTacToe.Supervisor)
  end
end
