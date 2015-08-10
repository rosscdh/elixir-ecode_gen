defmodule EcodeGen.CodeGeneratorController do
  use EcodeGen.Web, :controller

  alias EcodeGen.Repo
  alias EcodeGen.Batch
  # alias EcodeGen.Code

  def index(conn, _params) do
    batches = Repo.all(Batch)
    json conn, batches: batches
  end
end
