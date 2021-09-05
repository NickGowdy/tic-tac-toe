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
    new_state = update_state(state, player, x, y)
    {:noreply, new_state}
  end

  @impl true
  def handle_call({:get_turn, player}, _from, state) do
    IO.inspect(state)
    {:reply, Enum.filter(state, fn x -> x.player == player end), state}
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

  defp update_state(state, player, x, y) do
    Enum.map(state, fn e ->
      if e.x == x && e.y == y do
        %{e | player: player}
      else
        e
      end
    end)
  end
end
