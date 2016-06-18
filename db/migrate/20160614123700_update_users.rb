class UpdateUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :firstname
  	remove_column :users, :lastname
  	add_column :users, :name, :string, :default => "Société"
  end
end
