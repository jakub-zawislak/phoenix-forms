# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :app,
  ecto_repos: [App.Repo]

# Configures the endpoint
config :app, App.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "osIUi/OYWTlKKvz55K+flQ23NprDcTje7SdsZS5jQdFhfd+NNY+kpwc52pbjB9rL",
  render_errors: [view: App.ErrorView, accepts: ~w(html json)],
  pubsub: [name: App.PubSub, adapter: Phoenix.PubSub.PG2],
  watchers: [npm: ["start", cd: Path.expand("../", __DIR__)]]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
