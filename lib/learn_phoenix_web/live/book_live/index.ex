defmodule LearnPhoenixWeb.BookLive.Index do
  use LearnPhoenixWeb, :live_view

  alias LearnPhoenix.Library
  alias LearnPhoenix.Library.Book
  alias LearnPhoenix.Library.AuthorBook

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :books, Library.list_books())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Book")
    |> assign(:book, Library.get_book!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Book")
    |> assign(:book, %Book{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Books")
    |> assign(:book, nil)
  end

  @impl true
  def handle_info({LearnPhoenixWeb.BookLive.FormComponent, {:saved, book}}, socket) do
    {:noreply, stream_insert(socket, :books, book)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    book = Library.get_book!(id)
    {:ok, _} = Library.delete_book(book)

    {:noreply, stream_delete(socket, :books, book)}
  end

  def update(%{book: book} = assigns, socket) do
    book_changeset = Library.change_book(book)

    socket =
      socket
      |> assign(assigns)
      |> assign_form(book_changeset)
      |> assign_authors()

    {:ok, socket}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    if Ecto.Changeset.get_field(changeset, :book_authors) == [] do
      book_author = %AuthorBook{}
      changeset = Ecto.Changeset.put_change(changeset, :book_authors, [book_author])
      assign(socket, :form, to_form(changeset))
    else
      assign(socket, :form, to_form(changeset))
    end
  end

  defp assign_authors(socket) do
    authors =
      Library.list_authors()
      |> Enum.map(&{&1.name, &1.id})

    assign(socket, :authors, authors)
  end
end
