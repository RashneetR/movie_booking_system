class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name, :limit => 50, :null => false
      t.text :summary, :limit => 140, :null => false
      t.integer :status, :null => false 

      t.timestamps
    end
  end
end
