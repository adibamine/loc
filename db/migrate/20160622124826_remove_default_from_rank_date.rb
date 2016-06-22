class RemoveDefaultFromRankDate < ActiveRecord::Migration
  def change
  	change_column_default(:voitures, :rank_date, nil)
  end
end
