defmodule TicTacToe.GameService do
  alias TicTacToe.GameServer
  alias TicTacToe.Entities.Game

  def start_game() do
    {:ok, pid} = GameServer.start_link([])
    %Game{id: game_id, grid: tail} = GameServer.get_grid(pid)
    GameServer.link_game_id_pid(pid, game_id)
    %Game{id: game_id, grid: tail}
  end

  def get_game(id) do
    GameServer.get_pid(id)
    |> map_grid()
  end

  def update_game(id, square) do
    pid = GameServer.get_pid(id)

    case GameServer.take_turn(pid, square) do
      :ok ->
        map_grid(pid)

      {:error, msg} ->
        msg
    end
  end

  defp map_grid(pid) do
    %Game{id: game_id, grid: tail} = GameServer.get_grid(pid)
    %Game{id: game_id, grid: tail}
  end
end
