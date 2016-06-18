class AddUserIdToEmails < ActiveRecord::Migration
  def change
  	add_column :emails, :user_id, :integer, :default => 0
  	change_column :emails, :voiture_id, :integer, :default => 0
  end
end
