class Shop < ApplicationRecord
  HOURS_OF_DAY = Array (0..24)
  has_many :barbers
  has_many :appointments, through: :barbers
  validates :shop_name, presence: true, uniqueness: true
  validates :owner_name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :open_at, presence: true, inclusion: { in: HOURS_OF_DAY }
  validates :close_at, presence: true, inclusion: { in: HOURS_OF_DAY }
end
