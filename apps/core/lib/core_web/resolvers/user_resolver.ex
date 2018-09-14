defmodule CoreWeb.Resolvers.UserResolver do
  def all(_args, _info) do
    {:ok, Core.Accounts.list_user()}
  end

  def create(args, _info) do
    Core.Accounts.create_user(args)
  end

  def update(%{id: id} = args, _info) do
    user = Core.Accounts.get_user!(id)
    Core.Accounts.update_user(user, args)
  end

  def get(%{id: id} = _args, _info) do
    {:ok, Core.Accounts.get_user!(id)}
  end
end
