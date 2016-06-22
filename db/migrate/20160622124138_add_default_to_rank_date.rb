class AddDefaultToRankDate < ActiveRecord::Migration
  def change
  	change_column_default :voitures, :rank_date, DateTime.now
  end
end
