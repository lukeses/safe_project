defmodule Core.Pricing.PromoCode do
  use Ecto.Schema
  import Ecto.Changeset
  alias Core.Pricing.PromoCode

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "promo_codes" do
    field(:event_name, :string)
    field(:expiration_datetime, :naive_datetime)
    field(:is_active, :boolean)

    # value in meters
    field(:radius, :integer)

    timestamps()
  end

  def changeset(%PromoCode{} = promo_code, attrs) do
    promo_code
    |> cast(attrs, [:event_name, :expiration_datetime, :is_active, :radius])
    |> validate_required([:event_name, :expiration_datetime, :is_active, :radius])
  end
end
