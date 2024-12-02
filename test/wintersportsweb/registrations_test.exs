defmodule Wintersportsweb.RegistrationsTest do
  use Wintersportsweb.DataCase

  alias Wintersportsweb.Registrations

  describe "registrations" do
    alias Wintersportsweb.Registrations.Registration

    import Wintersportsweb.RegistrationsFixtures

    @invalid_attrs %{name: nil, comments: nil}

    test "list_registrations/0 returns all registrations" do
      registration = registration_fixture()
      assert Registrations.list_registrations() == [registration]
    end

    test "get_registration!/1 returns the registration with given id" do
      registration = registration_fixture()
      assert Registrations.get_registration!(registration.id) == registration
    end

    test "create_registration/1 with valid data creates a registration" do
      valid_attrs = %{name: "some name", comments: "some comments"}

      assert {:ok, %Registration{} = registration} = Registrations.create_registration(valid_attrs)
      assert registration.name == "some name"
      assert registration.comments == "some comments"
    end

    test "create_registration/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registrations.create_registration(@invalid_attrs)
    end

    test "update_registration/2 with valid data updates the registration" do
      registration = registration_fixture()
      update_attrs = %{name: "some updated name", comments: "some updated comments"}

      assert {:ok, %Registration{} = registration} = Registrations.update_registration(registration, update_attrs)
      assert registration.name == "some updated name"
      assert registration.comments == "some updated comments"
    end

    test "update_registration/2 with invalid data returns error changeset" do
      registration = registration_fixture()
      assert {:error, %Ecto.Changeset{}} = Registrations.update_registration(registration, @invalid_attrs)
      assert registration == Registrations.get_registration!(registration.id)
    end

    test "delete_registration/1 deletes the registration" do
      registration = registration_fixture()
      assert {:ok, %Registration{}} = Registrations.delete_registration(registration)
      assert_raise Ecto.NoResultsError, fn -> Registrations.get_registration!(registration.id) end
    end

    test "change_registration/1 returns a registration changeset" do
      registration = registration_fixture()
      assert %Ecto.Changeset{} = Registrations.change_registration(registration)
    end
  end
end
