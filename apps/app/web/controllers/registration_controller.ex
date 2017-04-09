defmodule App.RegistrationController do
  use App.Web, :controller

  alias App.Registration
  alias App.RegistrationType

  def index(conn, %{}) do

    form = RegistrationType
    |> create_form(%Registration{})

    render(conn, "index.html", form: form)
  end

  def register(conn, %{"registration" => registration_params}) do

    RegistrationType
    |> create_form(%Registration{}, registration_params)
    |> handle_form
    |> case do
      {:ok, registration} ->
        IO.inspect registration
        conn
        |> put_flash(:info, "Success.")
        # |> render("index.html", form: form)
        |> redirect(to: registration_path(conn, :index))
      {:error, form} ->
        render(conn, "index.html", form: form)
    end
  end
end
