class AddUserIdToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :user_id, :integer
  end
end
