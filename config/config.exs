# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :collava,
  ecto_repos: [Collava.Repo],
  adapter: RethinkDB.Ecto

# Configures the endpoint
config :collava, CollavaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7Eq9g6aj713BlK+5lsDvDBBlpAYT+57nnSbX6N8MNFQdeD14VgOC3Ljhk+GvQ4H/",
  render_errors: [view: CollavaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Collava.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
