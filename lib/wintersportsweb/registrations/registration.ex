defmodule Wintersportsweb.Registrations.Registration do
  use Ecto.Schema
  import Ecto.Changeset

  schema "registrations" do
    field :name, :string
    field :comments, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(registration, attrs) do
    registration
    |> cast(attrs, [:name, :comments])
    |> validate_required([:name, :comments])
  end
end
