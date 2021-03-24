defmodule BrambleEngineeringWeb.FormValidator do
  defstruct [:label, :value]
  @types %{label: :string, value: :integer}

  alias BrambleEngineeringWeb.FormValidator
  import Ecto.Changeset

  def changeset(%FormValidator{} = form_data, attrs \\ %{}) do
    {form_data, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:label, :value])
  end
end
