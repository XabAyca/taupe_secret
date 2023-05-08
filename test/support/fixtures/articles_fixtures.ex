defmodule TaupeSecret.ArticlesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TaupeSecret.Articles` context.
  """

  @doc """
  Generate a article.
  """
  def article_fixture(attrs \\ %{}) do
    {:ok, article} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> TaupeSecret.Articles.create_article()

    article
  end
end
