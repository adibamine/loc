class AddActiveToReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :active, :boolean, :default => true
  end
end
