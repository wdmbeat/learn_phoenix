defmodule LearnPhoenix.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  schema "books" do
    field :title, :string
    field :genres, {:array, :string}, default: []
    timestamps(type: :utc_datetime)
  end

  @genres_options [
    "fantasy",
    "sci-fi",
    "dystopian",
    "adventure",
    "romance",
    "mystery",
    "horror",
    "thriller",
    "historical-fiction",
    "young-adult",
    "children-fiction",
    "autobiography",
    "biography",
    "cooking"
  ]

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :genres])
    |> validate_required([:title, :genres])
    |> clean_and_validate_array(:genres, @genres_options)
  end

  @doc """
  Clean and process the array values and validate the selected
  values against an approved list.
  """
  def clean_and_validate_array(changeset, field, valid_values, blank \\ "") do
    changeset
    |> trim_array(field, blank)
    |> sort_array(field)
    |> validate_array(field, valid_values)
    |> sort_array(field)
  end

  @doc """
  Validate that the array of string on the changeset are all in the
  set of valid values.
  It uses Ecto.Changeset.validate_change/3 to run our custom validation function only when the field value changes.
  The use of ^ ensures the function only runs for the certain field, not for any other fields in the changeset.
  """
  def validate_array(changeset, field, valid_values) do
    validate_change(changeset, field, fn ^field, new_values ->
      if Enum.all?(new_values, &(&1 in valid_values)) do
        []
      else
        unsupported = new_values -- valid_values
        [{field, "Only the defined values are allowed. Unsupported: #{inspect(unsupported)}"}]
      end
    end)
  end

  @doc """
  When working with a field that is an array of strings, this
  function sorts the values in the array.
  """
  def sort_array(changeset, field) do
    update_change(changeset, field, &Enum.sort(&1))
  end

  @doc """
  Remove the blank value from the array. So [""] becomes []
  """
  def trim_array(changeset, field, blank \\ "") do
    update_change(changeset, field, &Enum.reject(&1, fn item -> item == blank end))
  end
end
