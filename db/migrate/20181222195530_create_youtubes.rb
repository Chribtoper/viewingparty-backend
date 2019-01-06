class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|
      t.string :video_url
      t.integer :current_time
      t.integer :user_id
      t.integer :room_id
      t.boolean :current_video
      t.boolean :paused

      t.timestamps
    end
  end
end
