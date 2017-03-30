defmodule App.DepartmentController do
  use App.Web, :controller

  alias App.Department

  def index(conn, _params) do
    departments = Repo.all(Department)
    render(conn, "index.html", departments: departments)
  end

  def new(conn, _params) do
    changeset = Department.changeset(%Department{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"department" => department_params}) do
    changeset = Department.changeset(%Department{}, department_params)

    case Repo.insert(changeset) do
      {:ok, _department} ->
        conn
        |> put_flash(:info, "Department created successfully.")
        |> redirect(to: department_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    department = Repo.get!(Department, id)
    render(conn, "show.html", department: department)
  end

  def edit(conn, %{"id" => id}) do
    department = Repo.get!(Department, id)
    changeset = Department.changeset(department)
    render(conn, "edit.html", department: department, changeset: changeset)
  end

  def update(conn, %{"id" => id, "department" => department_params}) do
    department = Repo.get!(Department, id)
    changeset = Department.changeset(department, department_params)

    case Repo.update(changeset) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department updated successfully.")
        |> redirect(to: department_path(conn, :show, department))
      {:error, changeset} ->
        render(conn, "edit.html", department: department, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    department = Repo.get!(Department, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(department)

    conn
    |> put_flash(:info, "Department deleted successfully.")
    |> redirect(to: department_path(conn, :index))
  end
end
