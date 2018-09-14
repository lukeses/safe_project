defmodule CoreWeb.Resolvers.PromoCodeResolver do
  def list_promo_codes(_, %{is_active: is_active}, info) do
    {:ok, Core.Pricing.list_promo_codes(%{filter: %{is_active: is_active}})}
  end

  def list_promo_codes(_, _, _) do
    {:ok, Core.Pricing.list_promo_codes()}
  end

  def create_promo_code(args, _info) do
    Core.Pricing.create_promo_code(args)
  end

  def deactivate_promo_code(%{id: id}, _info) do
    Core.Pricing.deactivate_promo_code(id)
  end
end
