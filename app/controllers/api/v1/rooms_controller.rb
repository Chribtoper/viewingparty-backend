class Api::V1::RoomsController < ApplicationController
  def index
    rooms = Room.all.sort
    render json:rooms
  end

  def show
    room = Room.find(params[:id])
    render json:room
  end

  def create
    room = Room.create(room_params)
    render json: room, status: 201
  end

  def update
    room = Room.find(params[:id])
    room.update(room_params)
  end
  private

  def room_params
    params.require(:room).permit(:name, :url)
  end
end
