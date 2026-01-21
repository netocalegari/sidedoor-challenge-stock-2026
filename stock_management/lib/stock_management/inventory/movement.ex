defmodule StockManagement.Inventory.Movement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movements" do
    field :type, Ecto.Enum, values: [:entrada, :saida]
    field :quantity, :integer
    field :notes, :string
    belongs_to :product, StockManagement.Stock.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(movement, attrs) do
    movement
    |> cast(attrs, [:type, :quantity, :notes, :product_id])
    |> validate_required([:type, :quantity, :product_id], message: "Este campo é obrigatório")
    |> validate_number(:quantity,
      greater_than: 0,
      message: "A quantidade deve ser maior que zero"
    )
  end
end
