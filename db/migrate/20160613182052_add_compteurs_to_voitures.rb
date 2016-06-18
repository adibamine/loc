class AddCompteursToVoitures < ActiveRecord::Migration
  def change
  	rename_column :voitures, :compteur, :compteur_num
  	add_column :voitures, :compteur_msg, :integer, :default => 0
  end
end
