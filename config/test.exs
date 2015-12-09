use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tokaily_phoenix, TokailyPhoenix.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tokaily_phoenix, TokailyPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "vagrant",
  password: "vagrant",
  database: "tokaily_phoenix_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
