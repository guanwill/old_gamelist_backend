class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|

      t.string :title
      t.string :genre
      t.string :platform
      t.date :release_date
      t.integer :progress
      t.integer :rating
      t.string :review
      t.string :comments
      t.integer :user_id

      t.timestamps
    end
  end
end
