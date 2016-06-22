class AddRankDateToVoitures < ActiveRecord::Migration
  def change
  	add_column :voitures, :rank_date, :datetime
  end
end
