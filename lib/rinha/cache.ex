defmodule Rinha.Cache do
  use Nebulex.Cache,
    otp_app: :rinha,
    adapter: Nebulex.Adapters.Replicated,
    primary_storage_adapter: Nebulex.Adapters.Local
end
