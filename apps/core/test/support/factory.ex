defmodule CoreWeb.Factory do
  use ExMachina.Ecto, repo: Core.Repo

  alias Core.Pricing.PromoCode

  def promo_code_factory do
    %PromoCode{
      event_name: "TEDx",
      expiration_datetime: "2018-09-15T15:53:00",
      is_active: true,
      radius: 200,
      amount: 123
    }
  end

  def not_expired(promo_code) do
    %{promo_code | expiration_datetime: NaiveDateTime.utc_now() |> NaiveDateTime.add(1000)}
  end

  def expired(promo_code) do
    %{promo_code | expiration_datetime: NaiveDateTime.utc_now() |> NaiveDateTime.add(-1000)}
  end
end
