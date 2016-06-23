class AddallReturnsToVoiture < ActiveRecord::Migration
  def change
    add_column :voitures, :is_return_dakhla, :boolean
    add_column :voitures, :is_return_nador, :boolean
    add_column :voitures, :is_return_ouarzazate, :boolean
    add_column :voitures, :is_return_oujda, :boolean
    add_column :voitures, :is_return_tanger, :boolean
  end
end
