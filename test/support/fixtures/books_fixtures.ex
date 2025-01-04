defmodule LearnPhoenix.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LearnPhoenix.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> LearnPhoenix.Books.create_book()

    book
  end
end
