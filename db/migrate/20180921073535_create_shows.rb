class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.time :start_time
      t.time :end_time
      t.integer :total_seats
      t.integer :num_seats_sold
      t.float :cost_per_seat
      t.references :movie
      t.references :theatre

      t.timestamps
    end
  end
end
