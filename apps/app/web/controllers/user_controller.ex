defmodule App.UserController do
  use App.Web, :controller

  alias App.User
  alias App.Country

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    form = create_form(App.UserType, %User{})
    render(conn, "new.html", form: form)
  end

  def create(conn, %{"user" => user_params}) do
    App.UserType
    |> create_form(%User{}, user_params)
    |> insert_form_data
    |> case do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :index))
      {:error, form} ->
        render(conn, "new.html", form: form)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    form = create_form(App.UserType, user)

    render(conn, "edit.html", user: user, form: form)

    # user = User
    # |> Repo.get!(id)
    # |> Repo.preload(:user_info)
    #
    # # user = put_in(user.user_info, %App.UserInfo{})
    #
    # changeset = User.changeset(user)
    # render(conn, "edit.html", user: user, form: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)

    App.UserType
    |> create_form(user, user_params)
    |> update_form_data
    |> case do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, form} ->
        render(conn, "edit.html", user: user, form: form)
    end

    # user = User
    # |> Repo.get!(id)
    # |> Repo.preload(:user_info)
    #
    # # jak to jest to myśli że chodzi o update
    # # user = put_in(user.user_info, %App.UserInfo{})
    #
    # changeset = User.changeset(user, user_params)
    #
    # IO.inspect changeset
    #
    # case Repo.update(changeset) do
    #   {:ok, user} ->
    #     conn
    #     |> put_flash(:info, "User updated successfully.")
    #     |> redirect(to: user_path(conn, :show, user))
    #   {:error, changeset} ->
    #     render(conn, "edit.html", user: user, form: changeset)
    # end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end

  def select_countries(conn, %{"q" => query}) do
    result = Country
    |> Country.by_name(query)
    |> Repo.all
    |> Enum.map(fn country -> %{
      "value" => country.id,
      "text"  => country.name
     } end)

    conn
    |> json(result)
  end
end
