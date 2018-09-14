defmodule Core.PricingTest do
  use Core.DataCase

  alias Core.Pricing
  alias Core.Pricing.PromoCode

  @valid_attrs %{
    event_name: "TEDx",
    expiration_datetime: "2018-09-15T15:53:00",
    is_active: true,
    radius: 200
  }

  @invalid_attrs %{
    event_name: nil,
    expiration_datetime: nil,
    is_active: nil,
    radius: nil
  }

  describe "create_promo_code" do
    test "create_promo_code/1 with valid data creates a promo code" do
      assert {:ok, %PromoCode{} = promo_code} = Pricing.create_promo_code(@valid_attrs)
      assert promo_code.event_name == "TEDx"
      assert promo_code.expiration_datetime == ~N[2018-09-15 15:53:00]
      assert promo_code.is_active
      assert promo_code.radius == 200
    end

    test "create_promo_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pricing.create_promo_code(@invalid_attrs)
    end
  end
end
