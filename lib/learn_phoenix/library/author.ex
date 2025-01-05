defmodule LearnPhoenix.Library.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias LearnPhoenix.Library.AuthorBook

  schema "authors" do
    field :name, :string
    field :gender, :string
    field :bio, :string
    field :birth_date, :string

    timestamps(type: :utc_datetime)

    many_to_many :books, AuthorBook, join_through: "author_books"
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :gender, :bio, :birth_date])
    |> validate_required([:name, :gender, :bio, :birth_date])
  end
end
