class Api::V1::UserRoomsController < ApplicationController
  def index
    room = Room.find(params[:room_id])
    render json:room.users
  end

  def show
    user_room = UserRoom.find(params[:id])
    render json:user_room
  end

  def create
    user_room = UserRoom.create(user_room_params)
    ActionCable.server.broadcast "user_room_#{user_room.room_id}", { title: 'New user room', body: user_room }
    render json: user_room, status: 201
  end

  def destroy
    room = UserRoom.find(params[:id])
    room.destroy
  end

  private
  def user_room_params
    params.require(:user_room).permit(:id, :user_id, :room_id)
  end
end
