defmodule StockManagementWeb.MovementHTML do
  use StockManagementWeb, :html

  embed_templates "movement_html/*"

  @doc """
  Renders a movement form.

  The form is defined in the template at
  movement_html/movement_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :products, :list, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def movement_form(assigns)
end
