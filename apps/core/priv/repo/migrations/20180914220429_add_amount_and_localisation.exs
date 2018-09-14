defmodule Core.Repo.Migrations.AddAmountAndLocalisation do
  use Ecto.Migration

  def change do
    alter table(:promo_codes) do
      add :longitude, :integer
      add :latitude, :integer
      add :amount, :integer
    end
  end
end
