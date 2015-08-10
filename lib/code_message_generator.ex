require IEx

# alias EcodeGen.Repo
# alias EcodeGen.Batch
# alias EcodeGen.Version
# alias EcodeGen.CodeMessageGenerator

# batch = Repo.get Batch, 1
# version = Repo.get Version, batch.version_id
# #batch = %{batch | quantity: 10000}
# #Repo.update!(batch)

# g = CodeMessageGenerator
# g.build batch

defmodule EcodeGen.CodeMessageGenerator do
  alias EcodeGen.Repo
  alias EcodeGen.Version
  alias EcodeGen.Code
  alias EcodeGen.SecretSauce

  def build(batch) do
    version = Repo.get Version, batch.version_id

    block_quantity = version.block_quantity
    block_densities = Poison.decode!(version.block_densities)
    block_densities = List.to_tuple(block_densities)

    density_0 = EcodeGen.CodeMessageGenerator.calc_density(0, block_quantity, block_densities)
    density_1 = EcodeGen.CodeMessageGenerator.calc_density(1, block_quantity, block_densities)
    density_2 = EcodeGen.CodeMessageGenerator.calc_density(2, block_quantity, block_densities)
    density_3 = EcodeGen.CodeMessageGenerator.calc_density(3, block_quantity, block_densities)

    for n <- 1..batch.quantity do
      message = gen_message(batch.code_initial_threshold,
                            density_0,
                            density_1,
                            density_2,
                            density_3,
                            version.size_cell_in_pixels_QR,
                            version.size_pattern_in_cells)

      code = %Code{dpi: batch.code_dpi,
                   prefix: batch.code_prefix,
                   initial_threshold: batch.code_initial_threshold,
                   code_type: batch.code_type,
                   has_fingerprint: batch.code_has_fingerprint,
                   has_params_in_image: batch.code_has_params_in_image,
                   client_url: batch.code_client_url,
                   tag1: batch.code_tag1,
                   tag2: batch.code_tag2,
                   tag3: batch.code_tag3,
                   d_client_id: batch.d_client_id,
                   d_product_id: batch.product_id,
                   data: {},
                   message: message,
                   batch_id: batch.id,
                   status: 2,
                   seq_in_batch: n}
    end

  end

  def calc_density(idx, block_quantity, block_densities) do
    if idx < 0 or idx >= block_quantity do
      nil
    else
      elem(block_densities, idx)
    end
  end

  def gen_message(initial_threshold, density_0, density_1, density_2, density_3, size_cell_in_pixels_QR, size_pattern_in_cells) do
    bits = [10, 3, 3, 3, 3, 7, 10, 6]
    args = [1, initial_threshold, density_0, density_1, density_2, density_3, size_cell_in_pixels_QR, size_pattern_in_cells]
    SecretSauce.generate_message(bits, args)
  end

  def gen_keys do
  end

  def gen_sub_keys do # _generate_keys
  end
end