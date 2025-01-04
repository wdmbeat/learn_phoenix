defmodule LearnPhoenixWeb.AcstorFeatureHTML do
  use LearnPhoenixWeb, :html

  embed_templates "acstor_feature_html/*"

  @doc """
  Renders a acstor_feature form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def acstor_feature_form(assigns)
end
