class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :barbers, dependent: :destroy
  has_many :appointments, through: :barbers
  validates :shop_name, presence: true
  validates :owner_name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :yelp_id, presence: true
end
