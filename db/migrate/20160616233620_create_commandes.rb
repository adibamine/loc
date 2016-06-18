class CreateCommandes < ActiveRecord::Migration
  def change
    create_table :commandes do |t|
      t.string :nom_societe
      t.string :email_societe
      t.string :tel_societe
      t.string :adresse_societe
      t.string :note
      t.string :plan

      t.timestamps null: false
    end
  end
end
