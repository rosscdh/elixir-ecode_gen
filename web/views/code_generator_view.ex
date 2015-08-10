defmodule EcodeGen.CodeGeneratorView do
  use EcodeGen.Web, :view

  def render("index.json", %{batches: batches}) do
    batches
  end
end