defmodule CollavaWeb.Router do
  use CollavaWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", CollavaWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/users", UserController)
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
  schema: CollavaWeb.UserSchema,
  interface: :simple,
  context: %{pubsub: CollavaWeb.Endpoint}
  # Other scopes may use custom stacks.
  # scope "/api", CollavaWeb do
  #   pipe_through :api
  # end
end
