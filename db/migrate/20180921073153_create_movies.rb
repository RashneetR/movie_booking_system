class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :summary
      t.integer :status

      t.timestamps
    end
  end
end
