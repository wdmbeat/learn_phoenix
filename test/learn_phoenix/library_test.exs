defmodule LearnPhoenix.LibraryTest do
  use LearnPhoenix.DataCase

  alias LearnPhoenix.Library

  describe "books" do
    alias LearnPhoenix.Library.Book

    import LearnPhoenix.LibraryFixtures

    @invalid_attrs %{title: nil, price: nil, publication_date: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Library.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Library.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{title: "some title", price: "120.5", publication_date: ~U[2025-01-04 00:54:00Z]}

      assert {:ok, %Book{} = book} = Library.create_book(valid_attrs)
      assert book.title == "some title"
      assert book.price == Decimal.new("120.5")
      assert book.publication_date == ~U[2025-01-04 00:54:00Z]
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{title: "some updated title", price: "456.7", publication_date: ~U[2025-01-05 00:54:00Z]}

      assert {:ok, %Book{} = book} = Library.update_book(book, update_attrs)
      assert book.title == "some updated title"
      assert book.price == Decimal.new("456.7")
      assert book.publication_date == ~U[2025-01-05 00:54:00Z]
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book(book, @invalid_attrs)
      assert book == Library.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Library.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Library.change_book(book)
    end
  end

  describe "authors" do
    alias LearnPhoenix.Library.Author

    import LearnPhoenix.LibraryFixtures

    @invalid_attrs %{name: nil, gender: nil, bio: nil, birth_date: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Library.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Library.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{name: "some name", gender: "some gender", bio: "some bio", birth_date: "some birth_date"}

      assert {:ok, %Author{} = author} = Library.create_author(valid_attrs)
      assert author.name == "some name"
      assert author.gender == "some gender"
      assert author.bio == "some bio"
      assert author.birth_date == "some birth_date"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{name: "some updated name", gender: "some updated gender", bio: "some updated bio", birth_date: "some updated birth_date"}

      assert {:ok, %Author{} = author} = Library.update_author(author, update_attrs)
      assert author.name == "some updated name"
      assert author.gender == "some updated gender"
      assert author.bio == "some updated bio"
      assert author.birth_date == "some updated birth_date"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_author(author, @invalid_attrs)
      assert author == Library.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Library.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Library.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Library.change_author(author)
    end
  end
end
