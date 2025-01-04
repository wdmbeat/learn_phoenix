defmodule LearnPhoenixWeb.StorageTypeHTML do
  use LearnPhoenixWeb, :html

  embed_templates "storage_type_html/*"

  @doc """
  Renders a storage_type form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def storage_type_form(assigns)
end
