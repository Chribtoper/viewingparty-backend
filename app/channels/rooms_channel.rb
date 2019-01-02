class RoomsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "room_#{params[:room_id]}"
    user_id = params[:user_id].to_i
    room_id = params[:room_id].to_i
    room = Room.find(room_id)
    user_room = UserRoom.create(user_id: user_id, room_id: room_id)
    room_users = room.users.map do |user|
      { id: user.id, bio: user.bio, username: user.username, avatar: user.avatar }
    end
    ActionCable.server.broadcast "room_#{user_room.room_id}", { title: 'User joined', body: User.find(user_room.user_id) }
    ActionCable.server.broadcast "room_#{room_id}", { title: 'All users', body: { users: room_users, videos: room.youtubes, messages: room.messages } }

  end

  def receive(data)
    ActionCable.server.broadcast "room_#{params[:room_id]}", data
  end

  def unsubscribed
    user_id = params[:user_id].to_i
    room_id = params[:room_id].to_i
    room = Room.find(room_id)
    room_users = room.users.map do |user|
      { id: user.id, bio: user.bio, username: user.username, avatar: user.avatar }
    end
    delete_room = UserRoom.find_by(user_id: user_id, room_id: room_id)
    UserRoom.delete(delete_room)
    # ActionCable.server.broadcast "room_#{room_id}", { title: 'All users', body: room.users }
    ActionCable.server.broadcast "room_#{room_id}", { title: 'host_change', body: room_users }
  end

end
