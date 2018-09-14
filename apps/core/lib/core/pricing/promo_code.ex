defmodule Core.Pricing.PromoCode do
  use Ecto.Schema
  import Ecto.Changeset
  alias Core.Pricing.PromoCode

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "promo_codes" do
    field(:event_name, :string)
    field(:expiration_datetime, :naive_datetime)
    field(:is_active, :boolean)
    field(:amount, Money.Ecto.Type)

    # value in meters
    field(:radius, :integer)

    timestamps()
  end

  def changeset(%PromoCode{} = promo_code, attrs) do
    promo_code
    |> cast(attrs, [:event_name, :expiration_datetime, :is_active, :radius, :amount])
    |> apply_money(Map.get(attrs, :amount))
    |> validate_required([:event_name, :expiration_datetime, :is_active, :radius])
  end

  defp apply_money(%PromoCode{amount: %Money{}} = promo_code, _), do: promo_code
  defp apply_money(promo_code, nil), do: promo_code

  defp apply_money(promo_code, amount) do
    change(promo_code, %{amount: Money.new(amount, :UGX)})
  end
end
