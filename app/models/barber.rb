class Barber < ApplicationRecord
  belongs_to :shop
  has_many :appointments
  validates :age, presence: true
  validates :gender, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :avatar, presence: true
end
