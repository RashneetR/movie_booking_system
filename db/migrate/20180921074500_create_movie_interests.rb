class CreateMovieInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_interests do |t|
      t.references :user
      t.references :movie

      t.timestamps
    end
    add_index :movie_interests, [:movie_id, :user_id], :unique => true
  end
end