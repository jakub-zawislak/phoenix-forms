defmodule App.ArticleWithoutEcto do
  use Vex.Struct

  defstruct [:title, :content, :hidden]

  validates :title, presence: true,
                    length: [min: 4]

end