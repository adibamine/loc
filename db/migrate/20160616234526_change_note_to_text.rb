class ChangeNoteToText < ActiveRecord::Migration
  def change
  	change_column :commandes, :note, :text
  end
end
