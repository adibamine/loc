class AddNotNullToReviews < ActiveRecord::Migration
  def change
  	change_column :reviews, :name, :string, null: false
  	change_column :reviews, :comment, :text, null: false
  end
end
