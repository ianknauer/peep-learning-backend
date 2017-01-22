defmodule Peepchat.ChangesetView do
  use Peepchat.Web, :view

  @doc """
  Trasverses and translates changeset errors

  see  `Ecto.Changeset.traverse_errors/2` and
  `Peepchat.ErrorHelpers.translate_error/1` for more details.
  """

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_errors/1)
  end

  def render("error.json", %{changeset: changeset}) do
    JaSerializer.EctoErrorSerializer.format(changeset)
  end
end
