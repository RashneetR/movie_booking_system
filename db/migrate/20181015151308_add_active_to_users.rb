class AddActiveToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :active, :integer, :default => 1, :null => false
  end
end
