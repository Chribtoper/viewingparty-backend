class AddUserToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :userName, :string
  end
end
