class YoutubeSerializer < ActiveModel::Serializer
  attributes :id, :room_id, :video_url, :current_time
end
