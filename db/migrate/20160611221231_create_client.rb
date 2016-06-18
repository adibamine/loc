class CreateClient < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nom
      t.string :prenom
      t.string :cin
      t.integer :age
      t.string :ville
      t.string :telephone
      t.string :email
    end
  end
end
