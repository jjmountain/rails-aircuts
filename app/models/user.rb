class User < ApplicationRecord
  GENDERS = ["Male", "Female", "Non-Binary"]
  has_many :appointments
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :languages, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
