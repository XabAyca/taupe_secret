defmodule TaupeSecret.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :body, :string
    field :title, :string
    belongs_to :user, TaupeSecret.Users.User

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
