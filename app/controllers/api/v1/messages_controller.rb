class Api::V1::MessagesController < ApplicationController
  def index
    room = Room.find(params[:room_id])
    render json:room.messages
  end

  def show
    message = Message.find(params[:id])
    render json:message
  end

  def create
    message = Message.create(message_params)
    ActionCable.server.broadcast "room_#{message.room_id}", { title: 'New message', body: message }
    render json: message, status: 201
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id, :room_id, :userName, :icon)
  end
end
