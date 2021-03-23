defmodule EventsSpaWeb.EventView do
  use EventsSpaWeb, :view
  alias EventsSpaWeb.EventView
  alias EventsSpaWeb.UserView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      body: event.body,
      name: event.name,
      guests: event.guests,
      date: event.date,
      user: render_one(event.user, UserView, "user.json")
    }
  end
end
