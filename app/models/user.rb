class User < ApplicationRecord
  has_many :user_rooms
  has_many :youtubes
  has_many :rooms,  through: :user_rooms
  validates :username, uniqueness: { case_sensitive: false }
  has_secure_password
end
