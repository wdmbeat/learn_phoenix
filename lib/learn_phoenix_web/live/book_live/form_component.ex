defmodule LearnPhoenixWeb.BookLive.FormComponent do
  use LearnPhoenixWeb, :live_component

  alias LearnPhoenix.Library

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage book records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="book-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:price]} type="number" label="Price" step="any" />
        <.input field={@form[:publication_date]} type="datetime-local" label="Publication date" />

        <h1 class="text-md font-semibold leading-8 text-zinc-800">
          Authors
        </h1>
        <div id="authors" phx-hook="SortableInputsFor" class="space-y-2">
          <.inputs_for :let={b_author} field={@form[:book_authors]}>
            <div class="flex space-x-2 drag-item">
              <%!-- <.icon name="hero-bars-3" class="w-6 h-6 relative top-2" data-handle /> --%>
              <input type="hidden" name="book[authors_order][]" value={b_author.index} />
              <.input
                type="select"
                field={b_author[:author_id]}
                placeholder="Author"
                options={@authors}
              />
              <label>
                <input
                  type="checkbox"
                  name="book[authors_delete][]"
                  value={b_author.index}
                  class="hidden"
                />
                <.icon name="hero-x-mark" class="w-6 h-6 relative top-2" />
              </label>
            </div>
          </.inputs_for>
        </div>
        <:actions>
          <.button phx-disable-with="Saving...">Save Book</.button>
          <label class="block cursor-pointer">
            <input type="checkbox" name="book[authors_order][]" class="hidden" />
            <.icon name="hero-plus-circle" /> add more
          </label>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{book: book} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Library.change_book(book))
     end)}
  end

  @impl true
  def handle_event("validate", %{"book" => book_params}, socket) do
    changeset = Library.change_book(socket.assigns.book, book_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"book" => book_params}, socket) do
    save_book(socket, socket.assigns.action, book_params)
  end

  defp save_book(socket, :edit, book_params) do
    case Library.update_book(socket.assigns.book, book_params) do
      {:ok, book} ->
        notify_parent({:saved, book})

        {:noreply,
         socket
         |> put_flash(:info, "Book updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_book(socket, :new, book_params) do
    case Library.create_book(book_params) do
      {:ok, book} ->
        notify_parent({:saved, book})

        {:noreply,
         socket
         |> put_flash(:info, "Book created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
