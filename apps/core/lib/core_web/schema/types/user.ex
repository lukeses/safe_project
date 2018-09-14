defmodule CoreWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "A user"
  object :user do
    field(:id, :id)

    @desc "A first name"
    field(:first_name, :string)

    @desc "A second name"
    field(:second_name, :string)
  end
end
