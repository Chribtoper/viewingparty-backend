class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room_id]}"
  end

  def receive(data)
    ActionCable.server.broadcast "room_#{params[:room_id]}", data
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
