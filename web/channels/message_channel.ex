defmodule SimpleChat.MessageChannel do
  use SimpleChat.Web, :channel

  def join("messages:general", payload, socket) do
    if authorized?(payload) do
      send self, :after_join
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (messages:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_in("new_message", %{"body" => message}, socket) do
    new_message = %SimpleChat.Message{
      user_name: message["name"],
      text: message["text"]
    }
    Repo.insert! new_message
    send self, :send_message
    {:noreply, socket}
  end

  def handle_info(:after_join, socket) do
    messages = (from m in SimpleChat.Message) |> Repo.all
    push socket, "set_messages", %{messages: messages}
    {:noreply, socket}
  end

  def handle_info(:send_message, socket) do
    message = (from m in SimpleChat.Message,
               order_by: [desc: m.id], limit: 1) |> Repo.one
    broadcast socket, "new_message", %{message: message}
    {:noreply, socket}
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
