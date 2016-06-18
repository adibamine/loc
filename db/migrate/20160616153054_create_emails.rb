class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :voiture_id
      t.string :nom
      t.string :email
      t.string :contenu
      t.string :telephone

      t.timestamps null: false
    end
  end
end
