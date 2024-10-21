import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :projeto_final, ProjetoFinal.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "projeto_final_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :projeto_final, ProjetoFinalWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "kh/yoBcjhxLOCPLC9aK5m0Hdaj8/JXgUQcHcUX7wkLNegKcTnsfpRHsFB7/Q9cgw",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
