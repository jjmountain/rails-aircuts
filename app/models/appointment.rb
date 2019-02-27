class Appointment < ApplicationRecord
  belongs_to :barber
  belongs_to :user
  validates :state, presence: true
  validates :scheduled_at, presence: true
end
