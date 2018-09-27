class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.time :start_time, :null => false
      t.time :end_time
      t.integer :total_seats, :default => 300, :null => false
      t.integer :num_seats_sold, :default => 0
      t.float :cost_per_seat, :default => 200, :null => false
      t.references :movie
      t.references :theatre

      t.timestamps
    end
  end
end
