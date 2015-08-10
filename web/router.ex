defmodule EcodeGen.Router do
  use EcodeGen.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EcodeGen do
    pipe_through :browser # Use the default browser stack

    get "/", CodeGeneratorController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", EcodeGen do
  #   pipe_through :api
  # end
end
