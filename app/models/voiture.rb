class Voiture < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations

  validates :annee, presence: true
  validates :marque, presence: true
  validates :modele, presence: true
  validates :kilometrage, presence: true
  validates :boite_vitesse, presence: true
  validates :energie, presence: true
  validates :consommation, presence: true
  validates :description, presence: true, length: {maximum: 1500}
  validates :ville, presence: true
  validates :prix, presence: true

def similaires(id_)
  return Voiture.where.not(active: false, id: id_).limit(3)
end

end
