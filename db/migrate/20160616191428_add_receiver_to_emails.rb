class AddReceiverToEmails < ActiveRecord::Migration
  def change
  	add_column :emails, :receiver_email, :string
  end
end
