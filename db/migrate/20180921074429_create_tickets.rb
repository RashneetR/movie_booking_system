class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :show
      t.float :total_cost
      t.references :user
      t.integer :num_seats_bought

      t.timestamps
    end
  end
end
