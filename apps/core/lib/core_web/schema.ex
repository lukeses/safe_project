defmodule CoreWeb.Schema do
  use Absinthe.Schema
  import_types(CoreWeb.Schema.Types.User)
  import_types(CoreWeb.Schema.Types.PromoCode)
  import_types(Absinthe.Type.Custom)

  query do
    field :users, list_of(:user) do
      resolve(&CoreWeb.Resolvers.UserResolver.all/2)
    end

    field :user, type: :user do
      arg(:id, non_null(:id))
      resolve(&CoreWeb.Resolvers.UserResolver.get/2)
    end

    field :promo_codes, list_of(:promo_code) do
      arg(:is_active, :boolean)

      resolve(&CoreWeb.Resolvers.PromoCodeResolver.list_promo_codes/3)
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

    @desc "Create a promo code"
    field :create_promo_code, type: :promo_code do
      arg(:event_name, non_null(:string))
      arg(:expiration_datetime, non_null(:naive_datetime))
      arg(:is_active, :boolean)
      arg(:radius, non_null(:integer))

      resolve(&CoreWeb.Resolvers.PromoCodeResolver.create_promo_code/2)
    end

    @desc "Deactivate a promo code"
    field :deactivate_promo_code, type: :promo_code do
      arg(:id, non_null(:id))

      resolve(&CoreWeb.Resolvers.PromoCodeResolver.deactivate_promo_code/2)
    end
  end
end
