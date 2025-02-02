defmodule InvetHubWeb.Plugs.RequireAuth do
  @behaviour Plug
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]

  def init(_params) do
  end

  def call(conn, _params) do
    if get_session(conn, :current_user) do
      conn
    else
      conn
      |> put_flash(:error, "you must be logged in")
      |> redirect(to: InvetHubWeb.Router.Helpers.session_path(conn, :index))
      |> halt()
    end
  end
end
