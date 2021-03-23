defmodule BrambleEngineering.Repo do
  use Ecto.Repo,
    otp_app: :bramble_engineering,
    adapter: Ecto.Adapters.Postgres
end
