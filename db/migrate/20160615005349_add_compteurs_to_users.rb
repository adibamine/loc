class AddCompteursToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :compteur_msg, :integer, :default => 0
  	add_column :users, :compteur_num, :integer, :default => 0
  end
end
