defmodule TicTacToe.GameService do
  alias TicTacToe.{GameServer}

  def start_game() do
    {:ok, pid} = GameServer.start_link([])

    grid = GameServer.get_grid(pid)
    id = convert_pid_to_id(pid)
    %{id: id, grid: grid}
  end

  def get_game(id) do
    pid = convert_id_to_pid(id)
    grid = GameServer.get_grid(pid)
    grid
  end

  defp convert_pid_to_id(pid) do
    :erlang.pid_to_list(pid) |> Enum.join() |> String.to_integer()
  end

  defp convert_id_to_pid(id) do
      String.split(id, "") |> :erlang.list_to_pid()
  end
end
