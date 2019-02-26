class Appointment < ApplicationRecord
  belongs_to :barber
  belongs_to :user
  validates :state, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
