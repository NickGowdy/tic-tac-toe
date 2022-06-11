defmodule TicTacToe.GameServer do
  use GenServer
  alias TicTacToe.{Factory, Entities.Square, Entities.Game, GameEngine}

  # ~~~~~ Server ~~~~~
  @impl true
  def init(:ok) do
    game_id = UUID.uuid1()
    grid = Factory.build_grid()

    if Enum.member?(:ets.all(), :pid_reference) == false do
      :ets.new(:pid_reference, [:public, :named_table])
    end

    game = %Game{id: game_id, grid: grid, winner: nil}

    {:ok, game}
  end

  @impl true
  def handle_cast(
        {:take_turn, _square = %{"player" => player, "x" => x, "y" => y}},
        _state = %Game{id: game_id, grid: grid}
      ) do
    updated_grid =
      Enum.map(grid, fn e ->
        if e.x == x && e.y == y do
          %{e | player: player}
        else
          e
        end
      end)

    case GameEngine.is_winner(updated_grid, player) do
      true ->
        {:noreply, %Game{id: game_id, grid: updated_grid, winner: player}}

      false ->
        {:noreply, %Game{id: game_id, grid: updated_grid, winner: nil}}
    end
  end

  @impl true
  def handle_call(:get_grid, _from, state) do
    {:reply, state, state}
  end

  # ~~~~~ End of server ~~~~~

  # ~~~~~ Client ~~~~~
  def start_link(opts = []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_grid(pid) do
    GenServer.call(pid, :get_grid)
  end

  def get_pid(game_id) do
    case :ets.lookup(:pid_reference, game_id) do
      [{_, pid}] -> {:ok, pid}
      [] -> :error
    end
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
end
