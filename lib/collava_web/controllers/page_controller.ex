defmodule CollavaWeb.PageController do
  use CollavaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
