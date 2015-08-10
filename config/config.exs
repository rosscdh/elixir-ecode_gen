# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :ecode_gen, EcodeGen.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "P+iDyNAG9o1KOxiPjZAdTc2Su1Wiv8X3G9XPJXJuLbN9/zsvttOPOd+oJC1O8qCo",
  render_errors: [default_format: "html"],
  pubsub: [name: EcodeGen.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ecode_gen, EcodeGen.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "rosscdh",
  password: "",
  hostname: "localhost",
  database: "test_st_staging_eu"