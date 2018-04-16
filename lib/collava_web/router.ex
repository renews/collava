defmodule CollavaWeb.Router do
  use CollavaWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(Coherence.Authentication.Session)
  end

  pipeline :protected do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(Coherence.Authentication.Session, protected: true)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:browser)
    coherence_routes()
  end

  scope "/" do
    pipe_through(:protected)
    coherence_routes(:protected)
  end

  scope "/", CollavaWeb do
    pipe_through(:protected)
    # Add protected routes below
  end

  scope "/", CollavaWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/users", UserController)
  end

  forward(
    "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: CollavaWeb.UserSchema,
    interface: :simple,
    context: %{pubsub: CollavaWeb.Endpoint}
  )

  # Other scopes may use custom stacks.
  # scope "/api", CollavaWeb do
  #   pipe_through :api
  # end
end
