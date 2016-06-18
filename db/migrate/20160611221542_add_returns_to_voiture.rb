class AddReturnsToVoiture < ActiveRecord::Migration
  def change
    add_column :voitures, :is_return_marrakech, :boolean
    add_column :voitures, :is_return_agadir, :boolean
    add_column :voitures, :is_return_casablanca, :boolean
    add_column :voitures, :is_return_kenitra, :boolean
    add_column :voitures, :is_return_laayoun, :boolean
    add_column :voitures, :is_return_fes, :boolean
    add_column :voitures, :is_return_rabat, :boolean
    add_column :voitures, :is_return_essaouira, :boolean
  end
end
