defmodule TokailyPhoenix.Endpoint do
  use Phoenix.Endpoint, otp_app: :tokaily_phoenix

  socket "/socket", TokailyPhoenix.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :tokaily_phoenix, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: PlugSessionRedis.Store,
    key: "_tokaily_phoenix_key",
    table: :redis_sessions,
    signing_salt: "8T00XZPF",
    encryption_salt: "BHU00PRS",
    ttl: 3600

  plug TokailyPhoenix.Router
end
