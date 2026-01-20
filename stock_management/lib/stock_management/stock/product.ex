defmodule StockManagement.Stock.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :quantity, :integer, default: 0
    field :price, :decimal
    field :active, :boolean, default: true
    has_many :movements, StockManagement.Inventory.Movement

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :quantity, :price, :active])
    |> validate_required([:name, :quantity], message: "This field is required")
    |> validate_length(:name, min: 3, message: "Name must be at least 3 characters long")
    |> validate_number(:quantity,
      greater_than_or_equal_to: 0,
      message: "Quantity must be a non-negative number"
    )
    |> validate_number(:price,
      greater_than_or_equal_to: 0,
      message: "Price must be a non-negative number"
    )
  end
end
