#ExUnit.start

defmodule EcodeGen.SecretSauceTest do
  use ExUnit.Case, async: true
  alias EcodeGen.SecretSauce

  @bits [10, 3, 3, 3, 3, 7, 10, 6]
  @args [1, 4.0, 4.0, 6.0, 6.0, 20, 8, 7]

  test "generate_message" do
    expected_result = "01IDH80G7"
    assert SecretSauce.generate_message(@bits, @args) == expected_result
  end

  test "format_field" do
  end

  test "chunks" do
  end

end
