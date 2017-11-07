class AddUserToGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :user_id
    add_reference :games, :user, foreign_key: true
  end
end
