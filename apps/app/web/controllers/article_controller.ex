defmodule App.ArticleController do
  use App.Web, :controller

  alias App.Article

  def index(conn, _params) do
    articles = Repo.all(Article)
    render(conn, "index.html", articles: articles)
  end

  def new(conn, _params) do

    form = create_form(App.ArticleForm, %Article{})

    render(conn, "new.html", form: form)
  end

  def create(conn, %{"article" => article_params}) do
    App.ArticleForm
    |> create_form(%Article{}, article_params)
    |> insert_form_data
    |> case do
      {:ok, _article} ->
        conn
        |> put_flash(:info, "Article created successfully.")
        |> redirect(to: article_path(conn, :index))
      {:error, form} ->
        render(conn, "new.html", form: form)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Repo.get!(Article, id)
    render(conn, "show.html", article: article)
  end

  def edit(conn, %{"id" => id}) do
    article = Repo.get!(Article, id)

    form = create_form(App.ArticleForm, article)

    render(conn, "edit.html", article: article, form: form)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Repo.get!(Article, id)

    App.ArticleForm
    |> create_form(article, article_params)
    |> update_form_data
    |> case do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article updated successfully.")
        |> redirect(to: article_path(conn, :show, article))
      {:error, form} ->
        render(conn, "edit.html", article: article, form: form)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Repo.get!(Article, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(article)

    conn
    |> put_flash(:info, "Article deleted successfully.")
    |> redirect(to: article_path(conn, :index))
  end
end
