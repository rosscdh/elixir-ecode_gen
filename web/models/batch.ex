defmodule EcodeGen.Batch do
  use Ecto.Model

  schema "core_batch" do
    has_one :version, EcodeGen.Version

    field :uuid
    field :code_dpi, :integer
    field :code_prefix, :string
    field :code_initial_threshold, :integer
    field :code_type, :integer
    field :code_has_fingerprint, :boolean
    field :code_has_params_in_image, :boolean
    field :code_tag1, :string
    field :code_tag2, :string
    field :code_tag3, :string
    field :code_client_url, :string
    field :name, :string
    field :reference, :string
    field :quantity, :integer
    #field :creation_date
    field :d_client_id, :integer
    field :product_id, :integer
    field :version_id, :integer
    field :status, :integer
    field :zipfile, :string
    field :nb_downloads, :integer
    #field :data, :string
  end
end