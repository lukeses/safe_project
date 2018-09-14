defmodule CoreWeb.Resolvers.PromoCodeResolver do
  def list_promo_code(_args, _info) do
    {:ok, Core.Pricing.list_promo_codes()}
  end

  def create_promo_code(args, _info) do
    Core.Pricing.create_promo_code(args)
  end

  def deactivate_promo_code(%{id: id}, _info) do
    Core.Pricing.deactivate_promo_code(id)
  end
end
