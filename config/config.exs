# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :rinha, Rinha.Cache,
  primary: [
    gc_interval: 3_600_000,
    backend: :shards
  ],
  # When using :shards as backend
  backend: :shards,
  # GC interval for pushing new generation: 12 hrs
  gc_interval: :timer.hours(12),
  # Max 1 million entries in cache
  max_size: 1_000_000,
  # Max 200MB of memory
  allocated_memory: 200_000_000,
  # GC min timeout: 10 sec
  gc_cleanup_min_timeout: :timer.seconds(10),
  # GC max timeout: 10 min
  gc_cleanup_max_timeout: :timer.minutes(10)

config :libcluster,
  topologies: [
    default: [
      strategy: Cluster.Strategy.Epmd,
      config: [
        hosts: [
          :"app1@127.0.0.1",
          :"app2@127.0.0.1"
        ]
      ]
    ]
  ]

config :rinha,
  ecto_repos: [Rinha.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :rinha, RinhaWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: RinhaWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Rinha.PubSub,
  live_view: [signing_salt: "OSHb60Os"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
