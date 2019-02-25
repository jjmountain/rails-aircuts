class Appointment < ApplicationRecord
  STATES = ["Pending", "Accepted", "Rejected"]
  belongs_to :barber
  belongs_to :user
  validates :scheduled_at, presence: true
  validates :description, presence: true
  validates :state, presence: true
end
