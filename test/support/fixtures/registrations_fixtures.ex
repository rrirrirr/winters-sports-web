defmodule Wintersportsweb.RegistrationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Wintersportsweb.Registrations` context.
  """

  @doc """
  Generate a registration.
  """
  def registration_fixture(attrs \\ %{}) do
    {:ok, registration} =
      attrs
      |> Enum.into(%{
        comments: "some comments",
        name: "some name"
      })
      |> Wintersportsweb.Registrations.create_registration()

    registration
  end
end
