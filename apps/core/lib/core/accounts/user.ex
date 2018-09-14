defmodule Core.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Core.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:first_name, :string)
    field(:second_name, :string)

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :second_name])
    |> validate_required([:first_name, :second_name])
  end
end
