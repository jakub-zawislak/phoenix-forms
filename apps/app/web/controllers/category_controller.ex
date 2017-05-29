defmodule App.CategoryController do
  use App.Web, :controller

  alias App.Category

  def index(conn, _params) do
    categories = Repo.all(Category)
    render(conn, "index.html", categories: categories)
  end

  def new(conn, _params) do
    form = App.CategoryType
    |> create_form(%Category{})

    render(conn, "new.html", form: form)
  end

  def create(conn, %{"category" => category_params}) do
    App.CategoryType
    |> create_form(%Category{}, category_params)
    |> insert_form_data
    |> case do
      {:ok, _category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: category_path(conn, :index))
      {:error, form} ->
        render(conn, "new.html", form: form)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    render(conn, "show.html", category: category)
  end

  def edit(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    form = create_form(App.CategoryType, category)
    IO.inspect form.changeset
    render(conn, "edit.html", category: category, form: form)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Repo.get!(Category, id)

    App.CategoryType
    |> create_form(category, category_params)
    |> update_form_data
    |> case do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category updated successfully.")
        |> redirect(to: category_path(conn, :show, category))
      {:error, form} ->
        render(conn, "edit.html", category: category, form: form)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: category_path(conn, :index))
  end
end
