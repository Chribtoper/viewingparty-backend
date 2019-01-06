class AddUsernamePasswordBioAvatar < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :bio, :string, default: "Hello, i'm a new ViewingParty Member who needs to edit their bio!"
    add_column :users, :avatar, :string
    add_column :users, :username, :string
  end
end
