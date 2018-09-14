defmodule CoreWeb.Schema.Types.PromoCode do
  use Absinthe.Schema.Notation

  @desc "A promo code"
  object :promo_code do
    field(:id, :id)

    @desc "A event name"
    field(:event_name, :string)

    @desc "An expiration time"
    field(:expiration_datetime, :naive_datetime)

    @desc "An information if promo code is active"
    field(:is_active, :boolean)

    @desc "An radius in meters that limits promo code operation"
    field(:radius, :boolean)
  end
end
