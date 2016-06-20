class RemoveDefaultFromUsers < ActiveRecord::Migration
  def change
  	change_column_default(:users, :name, nil)
  end
end
