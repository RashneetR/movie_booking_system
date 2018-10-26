class CreateMovieTheatre < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_theatres, :id => false do |t|
      t.references :movie
      t.references :theatre
    end
    add_index :movie_theatres, [ :movie_id, :theatre_id], :unique => true
  end
end
