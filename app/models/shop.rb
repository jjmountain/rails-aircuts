class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :barbers, dependent: :destroy
  has_many :appointments, through: :barbers
  HOURS = Array(0..23)
  validates :shop_name, presence: true
  validates :owner_name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :open_at, presence: true, inclusion: { in: HOURS }
  validates :close_at, presence: true, inclusion: { in: HOURS }
end
