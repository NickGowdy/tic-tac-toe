defmodule TicTacToe.GridService do

  alias TicTacToe.Entities.Square

  @spec is_valid_player(number) :: true
  def is_valid_player(player) when player == 1 do true end
  def is_valid_player(player) when player == 2 do true end

  def is_winner([%Square{}] = grid, player) do

    filtered_grid = Enum.filter(grid, fn square -> square.player == player end)

    case Enum.count(filtered_grid) < 3 do
      true -> false
      false ->
      #    is_winner =
      # grid
      #   |> check_vertical(player)
      #   |> check_horizontal()
      #   |> check_diagonal()

         end



  end

  defp check_vertical([%Square{}] = grid, player) do
    # Get dimensions for x vertice
    dimensions = Enum.to_list(0..2)

    Enum.each(dimensions, fn dimension ->
      #Split grid into list of 3 eg [[], [], []]
      filtered_grid = Enum.split_with(grid, fn square ->
        square.x == dimension
      end)

      IO.inspect(filtered_grid)

      end)
  end

  defp check_horizontal([%Square{}] = grid) do
 # Get dimensions for y vertice
 dimensions = Enum.to_list(0..2)

 Enum.each(dimensions, fn dimension ->
   #Split grid into list of 3 eg [[], [], []]
   filtered_grid = Enum.split_with(grid, fn square ->
     square.y == dimension
   end)

   IO.inspect(filtered_grid)

   end)
  end

  defp check_diagonal([%Square{}] = grid) do

  end

end
