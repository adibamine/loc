class Reservation < ActiveRecord::Base
  belongs_to :client
  belongs_to :voiture

  accepts_nested_attributes_for :client
end
