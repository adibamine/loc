class RenameColumnTelephone < ActiveRecord::Migration
  def change
  	rename_column :emails, :telephone, :objet
  end
end
