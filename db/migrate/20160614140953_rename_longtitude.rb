class RenameLongtitude < ActiveRecord::Migration
	rename_column :users, :longtitude, :longitude
  def change
  end
end
