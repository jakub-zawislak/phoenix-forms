defmodule App.RegistrationController do
  use App.Web, :controller

  alias App.Registration
  alias App.RegistrationType

  def index(conn, %{}) do

    form = RegistrationType
    |> Formex.Builder2.create_form(%Registration{addresses: [%App.Registration.Address{id: 1, street: "yyy"}]})

    render(conn, "index.html", form: form)
  end

  def register(conn, %{"registration" => registration_params}) do
# IO.inspect registration_params
    RegistrationType
    |> Formex.Builder2.create_form(%Registration{addresses: [%App.Registration.Address{id: 1, street: "yyy"}]}, registration_params, conn: conn)
    |> handle_form
    |> case do
      {:ok, registration} ->
        # IO.inspect registration
        conn
        |> put_flash(:info, "Success.")
        # |> render("index.html", form: form)
        |> redirect(to: registration_path(conn, :index))
      {:error, form} ->
        render(conn, "index.html", form: form, error: true)
    end
  end
end
