class Api::V1::YoutubeController < ApplicationController
  def index
    room = Room.find(params[:room_id])
    render json:room.youtubes
  end

  def show
    youtube = Youtube.find(params[:id])
    render json:youtube
  end

  def create
    youtube = Youtube.create(youtube_params)
    ActionCable.server.broadcast "room_#{youtube.room_id}", { title: 'New youtube video', body: youtube }
    render json: youtube, status: 201
  end

  private
  def youtube_params
    params.permit(:room_id, :video_url, :current_time)
  end
end
