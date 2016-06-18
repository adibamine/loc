class Client < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :reservations
  accepts_nested_attributes_for :reservations
end
