#ExUnit.start

defmodule EcodeGen.CodeGeneration do
  use ExUnit.Case, async: false
  use Plug.Test

  @moduletag timeout: 3000000

  alias EcodeGen.Repo

  alias EcodeGen.Batch
  alias EcodeGen.Version
  alias EcodeGen.CodeMessageGenerator

  test "speed of generation" do
    batch = Repo.get Batch, 1
    version = Repo.get Version, batch.version_id
    batch = %{batch | quantity: 1000000}
    Repo.update!(batch)
    s = CodeMessageGenerator
    s.build batch
  end

end
