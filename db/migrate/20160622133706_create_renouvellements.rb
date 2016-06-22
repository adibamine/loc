class CreateRenouvellements < ActiveRecord::Migration
  def change
    create_table :renouvellements do |t|
      t.references :voiture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
