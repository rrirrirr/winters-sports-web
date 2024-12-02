defmodule WintersportswebWeb.RegistrationController do
  use WintersportswebWeb, :controller

  alias Wintersportsweb.Registrations
  alias Wintersportsweb.Registrations.Registration

  def index(conn, _params) do
    registrations = Registrations.list_registrations()
    render(conn, :index, registrations: registrations)
  end

  def new(conn, _params) do
    changeset = Registrations.change_registration(%Registration{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"registration" => registration_params}) do
    case Registrations.create_registration(registration_params) do
      {:ok, registration} ->
        conn
        |> put_flash(:info, "Registration created successfully.")
        |> redirect(to: ~p"/registrations/#{registration}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    registration = Registrations.get_registration!(id)
    render(conn, :show, registration: registration)
  end

  def edit(conn, %{"id" => id}) do
    registration = Registrations.get_registration!(id)
    changeset = Registrations.change_registration(registration)
    render(conn, :edit, registration: registration, changeset: changeset)
  end

  def update(conn, %{"id" => id, "registration" => registration_params}) do
    registration = Registrations.get_registration!(id)

    case Registrations.update_registration(registration, registration_params) do
      {:ok, registration} ->
        conn
        |> put_flash(:info, "Registration updated successfully.")
        |> redirect(to: ~p"/registrations/#{registration}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, registration: registration, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    registration = Registrations.get_registration!(id)
    {:ok, _registration} = Registrations.delete_registration(registration)

    conn
    |> put_flash(:info, "Registration deleted successfully.")
    |> redirect(to: ~p"/registrations")
  end
end
