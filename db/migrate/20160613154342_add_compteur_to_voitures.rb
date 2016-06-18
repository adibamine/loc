class AddCompteurToVoitures < ActiveRecord::Migration
  def change
  	add_column :voitures, :compteur, :integer, :default => 0
  end
end
