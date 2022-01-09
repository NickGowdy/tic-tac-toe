defmodule TicTacToe.GameService do
  alias TicTacToe.{GameServer}

  def start_game() do
    {:ok, pid} = GameServer.start_link([])
    GameServer.get_grid(pid)
  end
end
