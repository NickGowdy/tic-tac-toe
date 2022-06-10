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
  def handle_cast({:take_turn, square}, state) do
    new_state = update_state(state, square) |> IO.inspect(label: "This is the new state.......")
    {:noreply, new_state}
  end

  @impl true
  def handle_call(:get_grid, _from, state) do
    {:reply, state, state}
  end

  # Client
  def start_link(opts = []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_grid(pid) do
    GenServer.call(pid, :get_grid)
  end

  def get_pid(game_id) do
    [{_, pid}] = :ets.lookup(:pid_reference, game_id)
    pid
  end

  def link_game_id_pid(pid, game_id) do
    :ets.insert(:pid_reference, {game_id, pid})
  end

  def take_turn(pid, square = %{"player" => player, "x" => _x, "y" => _y}) do
    case GameEngine.is_valid_player(player) do
      true ->
        GenServer.cast(pid, {:take_turn, square})

      false ->
        {:error, "Player must be 1 or 2"}
    end
  end

  # def maybe_winner(pid, player) do
  #   GenServer.call(pid, {:get_turn, player})
  #   |> GameEngine.is_winner(player)
  # end

  # Helper functions
  defp update_state(
         _state = %Game{id: game_id, grid: grid},
         _square = %{"player" => player, "x" => x, "y" => y}
       ) do
    updated_grid =
      Enum.map(grid, fn e ->
        if e.x == x && e.y == y do
          %{e | player: player}
        else
          e
        end
      end)

    %Game{id: game_id, grid: updated_grid}
  end
end
