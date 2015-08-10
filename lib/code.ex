defmodule EcodeGen.Code do
  defstruct dpi: nil,
            prefix: nil,
            initial_threshold: nil,
            code_type: nil,
            has_fingerprint: nil,
            has_params_in_image: nil,
            client_url: nil,
            tag1: nil,
            tag2: nil,
            tag3: nil,
            d_client_id: nil,
            d_product_id: nil,
            data: nil,
            message: nil,
            batch_id: nil,
            status: nil,
            seq_in_batch: nil
end