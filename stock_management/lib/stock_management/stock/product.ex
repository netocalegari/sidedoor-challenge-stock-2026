defmodule StockManagement.Stock.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :quantity, :integer
    field :price, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :quantity, :price])
    |> validate_required([:name, :quantity, :price])
    |> validate_length(:name, min: 3)
    |> validate_number(:quantity, greater_than_or_equal_to: 0)
    |> validate_number(:price, greater_than_or_equal_to: 0)
  end
end
