defmodule TestRegistry do
  use GenServer
  alias TicTacToe.{GridFactory}

  # Server

  @impl true
  def init(:ok) do
    grid = GridFactory.build()
    {:ok, grid}
  end

  @impl true
  def handle_cast({:take_turn, %{player: player, x: x, y: y}}, state) do
    Agent.update(state, &Map.put(&1, player, %{player: player, x: x, y: y}))
    {:noreply, state}
  end

  @impl true
  def handle_call({:get_turn, player}, from, grid) do
    player_positions = Enum.filter(grid, fn x -> x.player == player end)
    {:reply, from, player_positions}
  end

  # Client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_turn(server, player) do
    GenServer.call(server, {:get_turn, player})
  end

  def take_turn(player, x, y) do
    GenServer.cast(__MODULE__, {:take_turn, %{player: player, x: x, y: y}})
  end

  # defp get_position(position = %{player: player, x: _, y: _}, player) when position.player === player, do: position

  defp turn(player, x, y) do
    case negative_num_check(x) || negative_num_check(y) do
      true -> {:error, "cant be negative number"}
      false -> fn -> {:ok} end
    end
  end

  def negative_num_check(num) when num < 0, do: true

end
