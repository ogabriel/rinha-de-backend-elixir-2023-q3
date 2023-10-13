defmodule Rinha.Cache do
  use Nebulex.Cache,
    otp_app: :rinha,
    adapter: Nebulex.Adapters.Local
end
