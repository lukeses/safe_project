defmodule CoreWeb.Router do
  use CoreWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)

    plug(Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Poison
    )
  end

  forward("/api", Absinthe.Plug, schema: CoreWeb.Schema)

  forward(
    "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: CoreWeb.Schema,
    socket: CoreWeb.UserSocket,
    interface: :simple
  )
end
