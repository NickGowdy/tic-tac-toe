defmodule TicTacToe.GameService do
  alias TicTacToe.{GameServer}

  def start_game() do
    {:ok, pid} = GameServer.start_link([])

    grid = GameServer.get_grid(pid)
    id = convert_pid_to_id(pid)
    %{id: id, grid: grid}
  end

  defp convert_pid_to_id(pid) do
    :erlang.pid_to_list(pid) |> Enum.join() |> String.to_integer()
  end
end
