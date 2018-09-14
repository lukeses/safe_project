use Mix.Config

config :core, CoreWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :core, Core.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "core_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
