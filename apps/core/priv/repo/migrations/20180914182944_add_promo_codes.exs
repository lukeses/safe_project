defmodule Core.Repo.Migrations.AddPromoCodes do
  use Ecto.Migration

  def change do
    create table(:promo_codes, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add :event_name, :string
      add :expiration_datetime, :naive_datetime
      add :is_active, :boolean
      add :radius, :integer

      timestamps()
    end

  end
end
