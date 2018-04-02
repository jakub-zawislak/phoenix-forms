defmodule App.ArticleController do
  use App.Web, :controller

  alias App.Article
  alias App.Category
  alias App.Tag

  def index(conn, _params) do
    articles = Repo.all(Article)
    render(conn, "index.html", articles: articles)
  end

  def new(conn, _params) do

    form = create_form(App.ArticleType, %Article{})

    render(conn, "new.html", form: form)
  end

  def create(conn, %{"article" => article_params}) do
    App.ArticleType
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

    # IO.inspect Ecto.Changeset.change(article).data.__meta__.state
    # IO.inspect Ecto.Changeset.change(%Article{}).data.__meta__.state

    form = create_form(App.ArticleType, article)

    render(conn, "edit.html", article: article, form: form)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Repo.get!(Article, id)

    App.ArticleType
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

  def select_categories(conn, %{"q" => query}) do
    result = create_form(App.ArticleType, %Article{})
    |> Formex.Ecto.CustomField.SelectAssoc.search(:category_id, query)
    |> Enum.map(fn {label, id} -> %{
      "value" => id,
      "text"  => label
     } end)

    conn
    |> json(result)
  end

  def select_tags(conn, %{"q" => query}) do
    result = create_form(App.ArticleType, %Article{})
    |> Formex.Ecto.CustomField.SelectAssoc.search(:tags, query)
    |> Enum.map(fn {label, id} -> %{
      "value" => id,
      "text"  => label
     } end)

    conn
    |> json(result)
  end
end
