defmodule StockManagement.Repo.Migrations.CreateMovements do
  use Ecto.Migration

  def change do
    create table(:movements) do
      add :type, :string
      add :quantity, :integer
      add :notes, :text
      add :product_id, references(:products, on_delete: :nothing), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:movements, [:product_id])
  end
end
