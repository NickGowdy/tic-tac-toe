defmodule TicTacToe.Web.Repo do
  use Ecto.Repo,
    otp_app: :tictactoe,
    adapter: Ecto.Adapters.Postgres
end
