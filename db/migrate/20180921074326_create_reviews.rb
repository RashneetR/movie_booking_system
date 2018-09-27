class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, :null => false
      t.text :comment, :limit => 140
      t.references :user
      t.references :movie

      t.timestamps
    end
    add_index :reviews, [:user_id, :movie_id], :unique => true 
  end
end
