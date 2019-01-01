class Api::V1::YoutubesController < ApplicationController
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
    the_user = User.find(youtube.user_id)
    ActionCable.server.broadcast "room_#{youtube.room_id}", { title: 'new_youtube_vid', body: { youtube: youtube, user: the_user} }
    render json: youtube, status: 201
  end

  def destroy
    youtube = Youtube.find(params[:id])
    room_id = youtube.room_id
    room = Room.find(room_id)
    youtube.destroy
    ActionCable.server.broadcast "room_#{room_id}", { title: 'receive_videos', body: room.youtubes }
  end

  private
  def youtube_params
    params.require(:youtube).permit(:room_id, :video_url, :user_id)
  end
end
