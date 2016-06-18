class AddCarsLimitToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :cars_limit, :integer, :default => 2
  end
end
