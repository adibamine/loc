class RenameDefaultNameUsers < ActiveRecord::Migration
  def change
  	change_column :users, :name, :string, :default => 'Nom Agence'
  end
end
