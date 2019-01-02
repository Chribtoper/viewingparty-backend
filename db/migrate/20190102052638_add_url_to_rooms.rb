class AddUrlToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :url, :string, default: "https://cdn0.iconfinder.com/data/icons/seo-smart-pack/128/grey_new_seo2-36-512.png"
  end
end
