defmodule EcodeGen.Version do
  use Ecto.Model

  schema "core_version" do
    field :uuid
    field :description, :string
    field :block_quantity, :integer
    field :block_densities, :string
    field :size_cell_in_pixels_QR, :integer
    field :size_pattern_in_cells, :integer
  end
end