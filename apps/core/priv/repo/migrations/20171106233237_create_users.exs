defmodule Core.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add :first_name, :string
      add :second_name, :string

      timestamps()
    end

  end
end
