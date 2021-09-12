defmodule TestRegistry do
  use GenServer
  alias TicTacToe.{GridFactory, Entities.Grid}

  # Server
  @impl true
  def init(:ok) do
    grid = GridFactory.build()
    {:ok, grid}
  end

  @impl true
  def handle_cast({:take_turn, grid = %Grid{}}, state) do
    new_state = update_state(state, grid)
    {:noreply, new_state}
  end

  @impl true
  def handle_call({:get_turn, player}, _from, state) do
    {:reply, Enum.filter(state, fn x -> x.player == player end), state}
  end

  # Client
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_turn(server, player) do
    GenServer.call(server, {:get_turn, player})
  end

  def take_turn(server, %Grid{} = grid) do
    GenServer.cast(server, {:take_turn, grid})
  end

  # Helper functions
  defp update_state(state, grid = %Grid{}) do
    Enum.map(state, fn e ->
      if e.x == grid.x && e.y == grid.y do
        %{e | player: grid.player}
      else
        e
      end
    end)
  end
end
