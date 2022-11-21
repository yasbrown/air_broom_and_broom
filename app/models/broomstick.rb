class Broomstick < ApplicationRecord
  validates :name, presence: true
  validates :rating, presence: true
  has_many :users, through: :bookings
end
