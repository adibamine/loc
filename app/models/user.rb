class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :terms_of_service, acceptance: true
  before_save { self.email = email.downcase }
  before_save { self.url = name.parameterize('_')}
  before_save :downcase_city, if: :city_changed?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  validates :name, presence: true, length: {maximum: 50}
  validates_uniqueness_of :name

  has_many :voitures
  has_many :reservations, through: :voitures
  has_many :reviews
  has_many :renouvellements, through: :voitures

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def downcase_city
    self.city = city.downcase
  end

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

  def voitures_views
    voitures.sum(:compteur)
  end

  def voitures_num_views
    voitures.sum(:compteur_num)
  end

  def voitures_msg_views
    voitures.sum(:compteur_msg)
  end

  def self.from_omniauth(auth)
 		user = User.where(email: auth.info.email).first
   	if user
   		return user
   	else
   		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
   		user.provider = auth.provider
   		user.uid = auth.uid
   		user.name = auth.info.name
   		user.email = auth.info.email
   		user.image = auth.info.image
   		user.password = Devise.friendly_token[0,20]
   		end
   	end
   end

end
