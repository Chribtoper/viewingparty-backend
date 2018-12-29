class AddIconToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :icon, :string
  end
end
