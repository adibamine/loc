class AddUniqueToUrl < ActiveRecord::Migration
  def change
  	remove_column :users, :url
  	add_column :users, :url, :string, unique: true
  end
end
