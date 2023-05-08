defmodule TaupeSecret.Repo do
  use Ecto.Repo,
    otp_app: :taupe_secret,
    adapter: Ecto.Adapters.Postgres
end
