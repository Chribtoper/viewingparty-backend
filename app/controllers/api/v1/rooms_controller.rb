class Api::V1::RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json:rooms
  end

  def show
    room = Room.find(params[:id])
    render json:room
  end

  def create
    room = Room.create(room_params)
    ActionCable.server.broadcast "room_#{room.id}", { title: 'New room', body: room }
    render json: room, status: 201
  end

  private

  def room_params
    params.permit(:name)
  end
end
