defmodule EventsSpa.EventsTest do
  use EventsSpa.DataCase

  alias EventsSpa.Events

  describe "events" do
    alias EventsSpa.Events.Event

    @valid_attrs %{body: "some body", date: ~N[2010-04-17 14:00:00], guests: "some guests", name: "some name"}
    @update_attrs %{body: "some updated body", date: ~N[2011-05-18 15:01:01], guests: "some updated guests", name: "some updated name"}
    @invalid_attrs %{body: nil, date: nil, guests: nil, name: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.body == "some body"
      assert event.date == ~N[2010-04-17 14:00:00]
      assert event.guests == "some guests"
      assert event.name == "some name"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Events.update_event(event, @update_attrs)
      assert event.body == "some updated body"
      assert event.date == ~N[2011-05-18 15:01:01]
      assert event.guests == "some updated guests"
      assert event.name == "some updated name"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end