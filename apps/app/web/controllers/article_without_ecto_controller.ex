defmodule App.ArticleWithoutEctoController do
  use App.Web, :controller

  alias App.ArticleWithoutEcto
  alias App.ArticleWithoutEctoType

  def new(conn, %{}) do

    form = ArticleWithoutEctoType
    |> create_form(%ArticleWithoutEcto{})

    render(conn, "form.html", form: form)
  end

  def create(conn, %{"article" => article_params}) do

    ArticleWithoutEctoType
    |> create_form(%ArticleWithoutEcto{}, article_params, conn: conn)
    |> handle_form
    |> case do
      {:ok, article} ->
        # IO.inspect article
        conn
        |> put_flash(:info, "Success.")
        # |> render("index.html", form: form)
        |> redirect(to: article_without_ecto_path(conn, :new))
      {:error, form} ->
        render(conn, "form.html", form: form)
    end
  end
end
