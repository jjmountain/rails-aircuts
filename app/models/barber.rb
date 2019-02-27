class Barber < ApplicationRecord
  belongs_to :shop
  has_many :appointments, dependent: :destroy
  validates :age, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :avatar, presence: true
end
