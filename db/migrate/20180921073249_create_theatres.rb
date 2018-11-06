class CreateTheatres < ActiveRecord::Migration[5.2]
  def change
    create_table :theatres do |t|
      t.string :name, :null => false, :limit => 50

      t.timestamps
    end
  end
end