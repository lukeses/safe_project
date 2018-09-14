defmodule Core.Pricing do
  import Ecto.Query, warn: false
  alias Core.Repo

  alias Core.Pricing.{PromoCode, PromoCodeQueries}

  def list_promo_codes do
    Repo.all(PromoCode)
  end

  def list_promo_codes(%{filter: %{is_active: true}}) do
    PromoCode
    |> PromoCodeQueries.is_active_query()
    |> PromoCodeQueries.not_expired()
    |> Repo.all()
  end

  def get_promo_code(id), do: Repo.get(PromoCode, id)

  def create_promo_code(attrs \\ %{}) do
    %PromoCode{}
    |> PromoCode.changeset(attrs)
    |> Repo.insert()
  end

  def deactivate_promo_code(id) do
    with %PromoCode{} = promo_code <- get_promo_code(id),
         changeset <- PromoCode.changeset(promo_code, %{is_active: false}) do
      Repo.update(changeset)
    else
      nil -> {:error, :not_found}
    end
  end
end
