defmodule StockManagement.Repo.Migrations.AddActiveToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :active, :boolean, default: true, null: false
    end
  end
end
