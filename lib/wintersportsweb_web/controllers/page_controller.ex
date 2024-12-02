defmodule WintersportswebWeb.PageController do
  use WintersportswebWeb, :controller
  import Phoenix.Component

  alias Wintersportsweb.Registrations
  alias Wintersportsweb.Registrations.Registration

  def home(conn, _params) do
    form = %Registration{} |> Registrations.change_registration() |> to_form()
    render(conn, :home, form: form, layout: false)
  end

  def register(conn, %{"registration" => registration_params}) do
    case Registrations.create_registration(registration_params) do
      {:ok, _registration} ->
        conn
        |> put_flash(:info, "Successfully registered! YAY!")
        |> render(:home, form: to_form(%Registration{}))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Please check your information and try again")
        |> render(:home, form: to_form(changeset))
    end
  end
end
