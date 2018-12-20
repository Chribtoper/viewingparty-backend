class UserSerializer < ActiveModel::Serializer
  attributes :name, :username, :avatar, :bio, :id
end
