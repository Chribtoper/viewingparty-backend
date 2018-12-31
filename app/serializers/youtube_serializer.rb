class YoutubeSerializer < ActiveModel::Serializer
  attributes :user_id, :room_id, :video_url
end
