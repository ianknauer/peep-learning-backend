defmodule Peepchat.SessionController do
  use Peepchat.Web, :controller

  def index(conn, _params) do
    #returning some static JSon for now

    conn
    |> json(%{status: "Ok"})
  end
end
