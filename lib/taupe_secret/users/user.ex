defmodule TaupeSecret.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()
    has_many :articles, TaupeSecret.Articles.Article

    timestamps()
  end
end
