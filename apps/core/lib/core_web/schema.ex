defmodule CoreWeb.Schema do
  use Absinthe.Schema
  import_types(CoreWeb.Schema.Types.User)

  query do
    field :users, list_of(:user) do
      resolve(&CoreWeb.Resolvers.UserResolver.all/2)
    end

    field :user, type: :user do
      arg(:id, non_null(:id))
      resolve(&CoreWeb.Resolvers.UserResolver.get/2)
    end
  end

  mutation do
    @desc "Create a user"
    field :create_user, type: :user do
      arg(:first_name, non_null(:string))
      arg(:second_name, non_null(:string))

      resolve(&CoreWeb.Resolvers.UserResolver.create/2)
    end

    @desc "Update a user"
    field :update_user, type: :user do
      arg(:id, non_null(:id))
      arg(:first_name, non_null(:string))
      arg(:second_name, non_null(:string))

      resolve(&CoreWeb.Resolvers.UserResolver.update/2)
    end
  end
end
