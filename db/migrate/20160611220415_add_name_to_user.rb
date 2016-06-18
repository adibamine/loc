class AddNameToUser < ActiveRecord::Migration
  def change
  	add_column :users, :firstname, :string
  	add_column :users, :lastname, :string
  	add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
  end
  def up
  	add_column :users, :confirmation_token, :string
  	add_column :users, :confirmed_at, :datetime
  	add_column :users, :confirmation_sent_at, :datetime

  	add_index :users, :confirmation_token, unique: true
  end

  def down
  	remove_column :users, :confirmation_token, :confirmed_at, confirmation_sent_at
  end
end
