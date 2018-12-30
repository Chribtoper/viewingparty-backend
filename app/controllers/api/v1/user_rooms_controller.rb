class Api::V1::UserRoomsController < ApplicationController
  def index
    user_room = UserRoom.find(params[:])
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
    params.require(:user_room).permit(:user_id, :room_id)
  end
end
