defmodule LearnPhoenix.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearnPhoenix.Library` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        price: "120.5",
        publication_date: ~U[2025-01-04 00:54:00Z],
        title: "some title"
      })
      |> LearnPhoenix.Library.create_book()

    book
  end

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        birth_date: "some birth_date",
        gender: "some gender",
        name: "some name"
      })
      |> LearnPhoenix.Library.create_author()

    author
  end
end
