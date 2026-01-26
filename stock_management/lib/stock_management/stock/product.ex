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
    |> validate_required([:name, :quantity], message: "Campo [name, quantity] obrigatório")
    |> validate_length(:name, min: 3, message: "Nome precisa conter ao menos 3 caracteres")
    |> validate_number(:quantity,
      greater_than_or_equal_to: 0,
      message: "Quantity precisa ser um número não negativo"
    )
    |> validate_number(:price,
      greater_than_or_equal_to: 0,
      message: "Price precisa ser um número não negativo"
    )
  end
end
