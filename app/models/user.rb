class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  GENDERS = ["Male", "Female", "Non-Binary"]
  has_many :appointments
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :languages, presence: true
end
