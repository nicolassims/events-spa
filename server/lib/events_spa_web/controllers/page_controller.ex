defmodule EventsSpaWeb.PageController do
  use EventsSpaWeb, :controller

  alias EventsSpa.Photos

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def photo(conn, %{"hash" => hash}) do
    {:ok, _name, data} = Photos.load_photo(hash)
    conn
    |> put_resp_content_type("iamge/jpeg")
    |> send_resp(200, data)
  end
end
