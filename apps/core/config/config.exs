use Mix.Config

config :core,
  namespace: Core,
  ecto_repos: [Core.Repo]

config :core, CoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q+R5xY3J1Amgi4FwviOREhJhwWEuBdweDaI6Rv11f8jomStRN7jDdyEIzJ73sCM9",
  render_errors: [view: CoreWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Core.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :money,
  default_currency: :UGX,
  separator: ".",
  delimeter: ",",
  symbol: false,
  symbol_on_right: false,
  symbol_space: false

import_config "#{Mix.env()}.exs"
