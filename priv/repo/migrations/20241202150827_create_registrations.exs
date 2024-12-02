defmodule Wintersportsweb.Repo.Migrations.CreateRegistrations do
  use Ecto.Migration

  def change do
    create table(:registrations) do
      add :name, :string
      add :comments, :text

      timestamps(type: :utc_datetime)
    end
  end
end
