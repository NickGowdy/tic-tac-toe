# TicTacToe

Tic-tac-toe, noughts and crosses, or Xs and Os is a paper-and-pencil game for two players who take turns marking the spaces in a three-by-three grid with X or O. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner. [Wikipedia](https://en.wikipedia.org/wiki/Tic-tac-toe)

## Installation

Run `mix deps.get` to download all dependencies and `mix compile` to compile the application. Unit tests can be run with `mix test` and the module can also be used with `iex -S mix` with the following example:

```
iex> grid = [
...> %TicTacToe.Entities.Square{player: 1, x: 0, y: 0},
...> %TicTacToe.Entities.Square{player: 1, x: 0, y: 1},
...> %TicTacToe.Entities.Square{player: 1, x: 0, y: 2}]
iex> TicTacToe.GameEngine.is_winner(grid, 1)
true
```
## Design

This module utilises GenServer to maintain a game of Tic-tac-toe for a process with OTP. Via this turns can be taken and retrieved for a player. 

The beginning state in the GenServer is the Tic-tac-toe grid which is built with `GridFactory.build()` this grid is maintained for the process in GenServer. Each grid is represented by a square with an x and y co-ordinate as shown below:

![Starting grid](./Designs/grid-positions.png "Starting grid")

The game engine is then able to calculate if there is a winner. It loops through the grid values and check for every possible winning combination for that player as shown in the image below:

![Game engine](./Designs/game-engine.png "Game engine")



