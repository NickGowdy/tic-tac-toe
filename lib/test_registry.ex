defmodule TestRegistry do
  use GenServer
  alias TicTacToe.{GridFactory, Entities.Square}

  # Server
  @impl true
  def init(:ok) do
    grid = GridFactory.build()
    {:ok, grid}
  end

  @impl true
  def handle_cast({:take_turn, square = %Square{}}, state) do
    new_state = update_state(state, square)
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

  def take_turn(server, %Square{} = square) do
    GenServer.cast(server, {:take_turn, square})
  end

  # Helper functions
  defp update_state(state, square = %Square{}) do
    Enum.map(state, fn e ->
      if e.x == square.x && e.y == square.y do
        %{e | player: square.player}
      else
        e
      end
    end)
  end
end
