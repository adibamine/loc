class RenameEmailsFields < ActiveRecord::Migration
  def change
  	rename_column :emails, :email, :sender_email
  end
end
