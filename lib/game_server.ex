defmodule TicTacToe.GameServer do
  use GenServer
  alias TicTacToe.{Factory, Entities.Square, Entities.Game, GameEngine}

  # Server
  @impl true
  def init(:ok) do
    game_id = UUID.uuid1()
    grid = Factory.build_grid()

    if Enum.member?(:ets.all(), :pid_reference) == false do
      :ets.new(:pid_reference, [:public, :named_table])
    end

    game = %Game{id: game_id, grid: grid}

    {:ok, game}
  end

  @impl true
  def handle_cast({:take_turn, square = %Square{}}, state) do
    new_state = update_state(state, square)
    {:noreply, new_state}
  end

  # @impl true
  # def handle_call({:get_turn, player}, _from, state) do
  #   {:reply, Enum.filter(state, fn x -> x.player == player end), state}
  # end

  @impl true
  def handle_call(:get_grid, _from, state) do
    {:reply, state, state}
  end

  # Client
  def start_link(opts = []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_grid(pid) do
    IO.inspect(:get_grid)
    GenServer.call(pid, :get_grid)
  end


  def get_pid(game_id) do
    [{_, pid}] = :ets.lookup(:pid_reference, game_id)
    pid
  end

  def link_game_id_pid(pid, game_id) do
    :ets.insert(:pid_reference, {game_id, pid})
  end

  # def get_turn(pid, player) do
  #   GenServer.call(pid, {:get_turn, player})
  # end

  def take_turn(pid, square = %{"player" => player, "x" => _x, "y" => _y}) do
    if GameEngine.is_valid_player(player) do
      IO.inspect("Trying to talk to genserver....")
      GenServer.cast(pid, {:take_turn, square})
    else
      {:error, "Player must be 1 or 2"}
    end
  end

  # def maybe_winner(pid, player) do
  #   GenServer.call(pid, {:get_turn, player})
  #   |> GameEngine.is_winner(player)
  # end

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
