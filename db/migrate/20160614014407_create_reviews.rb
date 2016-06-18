class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.text :comment
      t.integer :star, default: 1
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
