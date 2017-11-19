defmodule App.ArticleWithoutEcto do
  use Vex.Struct

  defstruct [{:title, "title default"}, :content, :hidden]

  validates :title, presence: true,
                    length: [min: 4]

end
